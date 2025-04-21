import { LightningElement, api, wire } from 'lwc';
import { getRecord } from "lightning/uiRecordApi";
import getPOSTransactionRecords from "@salesforce/apex/ClsRelatedListController.getPOSTransactionRecords";
const FIELDS = ["Contact.Ext_Id__c"];
const columns = [
    { label: 'TransactionID', fieldName: 'transactionid__c', sortable: true },
    { label: 'Date', fieldName: 'date__c', type: 'date', sortable: true },
    { label: 'Item Name', fieldName: 'itemname__c' },
    { label: 'Total Price', fieldName: 'totalprice__c', type: 'currency', sortable: true },
    { label: 'Payment Method', fieldName: 'paymentmethod__c' }
];

export default class LwcPOSTransactionRelatedList extends LightningElement {
    @api recordId;
    externalId;
    transactions
    columns = columns;
    itemNumber;
    defaultSortDirection = 'asc';
    sortDirection = 'asc';
    sortedBy;
    sortedByLabel;


    @wire(getRecord, { recordId: "$recordId", fields: FIELDS })
    wiredContact({ data, error }) { // Destructure the result
        if (data) {
            console.log(data)
            this.externalId = data.fields.Ext_Id__c.value;
            this.error = undefined; // Clear previous errors
        } else if (error) {
            this.error = error;
            this.contactData = undefined; // Clear previous data
        }
    }

    @wire(getPOSTransactionRecords, { ExternalId: '$externalId' })
    wiredPOSTransationData({ error, data }) {
        if (data) {
            console.log('data is ', data)
            // Extracting data from the response
            this.transactions = data;
            this.itemNumber = data.length

        } else if (error) {
            console.log('Error is')
            this.error = error.body.message;
            this.loyaltyData = undefined;
            this.itemNumber=0
        } else {
            this.itemNumber=0
            console.log(' Nothing here')
        }
    }
    getFriendlyLabel(fieldName) {
        const fieldMap = {
            transactionid__c: 'TransactionID',
            date__c: 'Date',
            totalprice__c: 'Total Price'
            
        };
    
        return fieldMap[fieldName] || fieldName;  // Return the field name if not found in the map
    }
    onHandleSort(event) {
     
        const { fieldName: sortedBy, sortDirection } = event.detail;
        const cloneData = [...this.transactions];
        console.log(event.detail);

        cloneData.sort(this.sortBy(sortedBy, sortDirection === 'asc' ? 1 : -1));
        this.transactions = cloneData;
        this.sortDirection = sortDirection;
        this.sortedBy = sortedBy;
        this.sortedByLabel=this.getFriendlyLabel(this.sortedBy)

    }
    sortBy(field, reverse, primer) {
        const key = primer
            ? function (x) {
                  return primer(x[field]);
              }
            : function (x) {
                  return x[field];
              };
              

        return function (a, b) {
            a = key(a);
            b = key(b);
            return reverse * ((a > b) - (b > a));
        };
    }

}