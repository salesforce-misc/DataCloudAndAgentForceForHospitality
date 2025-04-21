import { LightningElement, track, api, wire } from "lwc";
import fetch from "@salesforce/apex/RTService.fetch";
import lookupObjectValues from "@salesforce/apex/DBService.lookupObjectValues";


const findValueByKey = (obj, targetKey) => {
  // Helper function to recursively search the object and collect values
  const search = (currentObj) => {
    let values = [];
    // Check if the current object is an object (and not null)
    if (currentObj && typeof currentObj === 'object') {
      // Iterate over the keys of the object
      for (const [key, value] of Object.entries(currentObj)) {
        // Check if this key matches the target key
        if (key === targetKey) {
          values = values.concat(value);
        }
        // Recursively search the value if it's an object or array
        const result = search(value);
        if (result.length > 0) {
          values = values.concat(result);
        }
      }
    }
    // Return the collected values
    return values;
  };
  // Start the search
  return search(obj);
};


export default class RealTimeActivity extends LightningElement {
  @api recordId;

  @track data;
  @track error;
  @track res;
  @track err;
  @track isLookupProcessingCompleted = false;

  @api widgetTitle = "Real Time Activity";
  @api personalizationPoint = undefined;
  @api graph = "RealtimeProfile";
  @api space = "default";
  @api lookup = "IndividualIdentityLink__dlm";
  @api dmoConfigString = "";
  @api lookupEntry = undefined;
  @api lookupValueField = undefined;

  dmoData = new Map();

  connectedCallback() {
    console.log('Record ID:', this.recordId);
    this.parseDmoConfigString();

    this.handleRefreshClick();
  }


  parseDmoConfigString() {
    if (!this.dmoConfigString) return;
    if (this.dmoConfigString.endsWith(';')) {
      this.dmoConfigString = this.dmoConfigString.slice(0, -1);
    }
    const configs = this.dmoConfigString.split(';');
    this.dmoConfigs = configs.map(config => {
      const parts = config.split(',').map(part => part.trim());
      const dmoConfig = {};
      parts.forEach(part => {
        const [key, value] = part.split('=').map(p => p.trim());
        if (key === 'field') {
          if (!dmoConfig.fields) {
            dmoConfig.fields = [];
          }
          dmoConfig.fields.push(value);
        } else {
          dmoConfig[key] = value;
        }
      });
      return dmoConfig;
    });
  }

  processData(dataBlock) {
    const unescapedDataBlock = dataBlock.replace(/&amp;/g, '&');
    const parsedResponse = JSON.parse(unescapedDataBlock);

    let jsonBlob = parsedResponse && parsedResponse.data;
    let largestJsonBlob = "";

    if (!parsedResponse || !parsedResponse.data) {
      console.log("No data was returned for the target profile, but no error occurred on the call.");
      this.data = undefined;

      return;
    }

    let allLengths = [];
    let longestBlobIndex = 0;
    for (let blobCounter = 0; blobCounter < jsonBlob.length; blobCounter++) {
      if (jsonBlob[blobCounter].json_blob__c) {
        allLengths.push(jsonBlob[blobCounter].json_blob__c.length)

        if (jsonBlob[blobCounter].json_blob__c.length > jsonBlob[longestBlobIndex].json_blob__c) {
          longestBlobIndex = blobCounter;
        }
      }
      else {
        allLengths.push(0);
      }
    }

    if (allLengths.length === 0) {
      console.log("No entries exist within the resultant data block; no data to display.");
      return;
    }

    console.log("Longest profile document found at index " + longestBlobIndex + ".  All lengths (" + allLengths.length + "): " + allLengths.join(', '));
    largestJsonBlob = jsonBlob[longestBlobIndex].json_blob__c;

    // Reassign the largest json blob back to jsonBlob variable
    jsonBlob = largestJsonBlob;

    // // Decode the HTML entities in the json_blob__c field
    const decodedJsonBlob = (jsonBlob || "").replace(/&quot;/g, '"');

    console.log("Realtime Profile Selected:\n" + decodedJsonBlob);

    // // Parse the decoded JSON blob to a JavaScript object
    const jsonBlobObject = decodedJsonBlob && JSON.parse(decodedJsonBlob);

    this.data = jsonBlobObject;
    this.filterDmoData();

    this.processLookupsInCurrentDmoData();

    this.error = undefined;
  }

  handleRefreshClick() {
    this.dmoConfigString = "";
    this.dmoData = new Map();
    const uniqueParam = new Date().getTime();

    fetch({ recordId: this.recordId, dataGraphName: this.graph, space: this.space, lookup: this.lookup, uniqueParam: uniqueParam, lookupValueField: this.lookupValueField})
      .then(result => this.processData(result));
  }

  filterDmoData() {
    if (!this.dmoConfigs) {
      return;
    }
    this.dmoConfigs.forEach(config => {
      const dmoName = config.dmo;
      if (this.dmoData.has(dmoName)) {
        this.dmoData.set(dmoName, this.dmoData.get(dmoName).push(findValueByKey(this.data, dmoName)));
      } else {
        this.dmoData.set(dmoName, findValueByKey(this.data, dmoName));
      }
    });
  }

  processLookupsInCurrentDmoData() {

    if (!this.lookupEntry || !this.dmoConfigs) {
      this.isLookupProcessingCompleted = true;
      return;
    }

    let dmosWithLookups = [];

    // Now, figure out which DMOs have the lookupEntryFlag set to true, because those are the only ones we're going to try
    // to perform lookups against
    this.dmoConfigs.forEach((configData) => {
      if (configData["lookupEntryFlag"]) {
        dmosWithLookups.push(configData.dmo);
      }
    });

    if (!dmosWithLookups || dmosWithLookups.length === 0) {
      this.isLookupProcessingCompleted = true;
      return;
    }

    let lookupEntrySplit = this.lookupEntry.split(',');

    let objectToFetch = lookupEntrySplit[0].trim();
    let fieldToFetch = lookupEntrySplit[1].trim();
    let fieldToReplace = lookupEntrySplit[2].trim();

    // Here's the idea.  Going to loop over all of the data currently stored in this.dmoData, and pull out a list of all object
    // IDs present based upon the lookup list that have to be translated server side.  Then, we'll make one imparative call against the
    // server to do the translation against a new APEX based service that will do the rendition via SOQL.  Once we have the resolved data
    // back from the server, we'll loop over our client side data again and update the appropriate fields.
    let valuesToLookupSet = new Set();

    dmosWithLookups.forEach((currentDmoName) => {
      let valuesArray = this.dmoData.get(currentDmoName);

      for (const currentDmoRow of valuesArray) {
        // If the field we're going to be replacing exists on this DMO row, then we'll add that value to the list for replacement
        if (currentDmoRow[fieldToReplace]) {
          let itemToAdd = currentDmoRow[fieldToReplace]
          valuesToLookupSet.add(itemToAdd);
        }
      }
    });

    let valuesToLookupArray = Array.from(valuesToLookupSet);

    // Now that we have our set of unique lookup values, time to resolve server side.
    try {
      console.log("Attempting to look up the following identifier values (" + valuesToLookupArray.length + "): " + valuesToLookupArray.join(','));

      //String objectName, String fieldName, List<String> objectIds
      let fieldLookupResponse = lookupObjectValues({ objectName: objectToFetch, fieldName: fieldToFetch, objectIds: valuesToLookupArray }).then((lookupResults) => {

        console.log("Lookup objects have been returned.  Size: " + lookupResults.length);
        
        // Now that we've got our set of data back from the server, we can go through the data we've stuffed into "this", and rewrite anything that needs rewriting.
        // This is essentially the same operation we performed at the outset extracting the identifiers to be looked up.
        dmosWithLookups.forEach((currentDmoName) => {
          let valuesArray = this.dmoData.get(currentDmoName);

          for (const currentDmoRow of valuesArray) {
            if (currentDmoRow[fieldToReplace]) {
              let valueToBeReplaced = currentDmoRow[fieldToReplace];
              let replacementValue = lookupResults[valueToBeReplaced];
              if (replacementValue) {
                currentDmoRow[fieldToReplace] = replacementValue;
              }
            }
          }
        });

        this.isLookupProcessingCompleted = true;
      });
    }
    catch (error) {
      console.log("Processing lookups failed! " + error);
    }
  }

  getTimestamp(item, dateField) {
    if (!item[dateField]) return "";
    const date = item[dateField];
    const now = new Date();
    const timeDiff = Math.floor((now - new Date(date)) / 1000); // Difference in seconds

    if (timeDiff < 60) {
      return `${timeDiff} second(s) ago`;
    } else if (timeDiff < 3600) { // Less than an hour
      return `${Math.floor(timeDiff / 60)} minute(s) ago`;
    } else if (timeDiff < 86400) { // Less than a day
      return `${Math.floor(timeDiff / 3600)} hour(s) ago`;
    } else {
      return `${Math.floor(timeDiff / 86400)} day(s) ago`;
    }
  }

  get transformedData() {
    if (!this.data || !this.dmoConfigs || !this.isLookupProcessingCompleted) {
      return [];
    }
    // Initialize an empty array to hold all data
    let combinedData = [];
    // Combine data from all models

    this.dmoConfigs.forEach(config => {
      const dmoName = config.dmo;
      if (dmoName && this.dmoData.has(dmoName)) {
        // Retrieve data and append it to combinedData array
        const data = this.dmoData.get(dmoName);
        // Ensure the data is in array form
        if (data && data.length > 0) {
          combinedData = combinedData.concat(data.map(item => ({
            ...item,
            dmoName: dmoName // Add the model name to each item
          })));
        }
      }
    });
    let key = 0;
    // Transform the combined data
    const transformedData = combinedData.map(item => {
      // Find the config that corresponds to the item
      const config = this.dmoConfigs.find(conf => item.dmoName === conf.dmo);
      // Retrieve fields for the identified config
      const fields = config.fields || [];
      const timestampField = config.timestamp;
      const icon = config.icon || "";

      // Create a transformed item
      const transformedItem = {
        key: key++,
        dmoName: item.dmoName,
        icon: icon,
        timestamp: timestampField ? this.getTimestamp(item, timestampField) : "",
        timestampFieldValue: item[timestampField]
      };
      // Add dynamic fields
      fields.forEach((field, index) => {
        transformedItem[`field${index + 1}`] = item[field] || "";
      });

      return transformedItem;
    });
    const newTransformedData = transformedData
      .sort((a, b) => new Date(b.timestampFieldValue) - new Date(a.timestampFieldValue)) // Sort by timestamp
      .slice(0, 100); // Get the latest 100 entries
    return newTransformedData;
  }

}