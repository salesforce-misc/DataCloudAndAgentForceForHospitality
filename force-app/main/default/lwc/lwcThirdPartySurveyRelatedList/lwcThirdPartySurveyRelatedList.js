import { LightningElement, api, wire } from 'lwc';
import { getRecord } from "lightning/uiRecordApi";
import getSurveyRecords from "@salesforce/apex/ClsRelatedListController.getSurveyRecords";
const FIELDS = ["Contact.Email"];
const columns = [
   
    { label: 'Q2 Comment', fieldName: 'Q2_Comment__c',sortable: "true" },
    { label: 'Likely to Recommend', fieldName: 'Q1_Likely_to_Recommend__c',sortable: "true"}
];
export default class LwcThirdPartySurveyRelatedList extends LightningElement {
    @api recordId;
    email;
    surveys;
    columns=columns;
    itemNumber;
    defaultSortDirection = 'asc';
    sortedBy;
     sortDirection ='asc';

    @wire(getRecord, { recordId: "$recordId", fields: FIELDS })
    wiredContact({ data, error }) { // Destructure the result
        if (data) {
            console.log('Third party survey',data)
            this.email = data.fields.Email.value;
            this.error = undefined; // Clear previous errors
        } else if (error) {
            console.log(error)
            this.error = error;
            this.contactData = undefined; // Clear previous data
        }
    }

     @wire(getSurveyRecords, { email: '$email' })
            wiredSurveyTransationData({ error, data }) {
                if (data) {
                    console.log('data is ',data)
                    // Extracting data from the response
                    this.surveys = data;
                    this.itemNumber=data.length
                    
                } else if (error) {
                    console.log('Error is')
                    this.error = error.body.message;
                    this.surveys = undefined;
                    this.itemNumber=0;
                }else{
                    this.itemNumber=0;
                    console.log(' Nothing here')
                }
            }

             handleSort(event) {

                const { fieldName: sortedBy, sortDirection } = event.detail;
                const cloneData = [...this.surveys];
                console.log(event.detail);
        
                cloneData.sort(this.sortData(sortedBy, sortDirection === 'asc' ? 1 : -1));
                this.surveys = cloneData;
                  this.sortDirection = sortDirection;
                this.sortedBy = sortedBy;
               this.sortData(this.sortedBy, this.sortDirection);
            }
     
            sortData(field, reverse, primer) {
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
