import { LightningElement, api, wire } from 'lwc';
import { getRecord } from "lightning/uiRecordApi";
import getIotTransactionRecords from "@salesforce/apex/ClsRelatedListController.getIotTransactionRecords";
const FIELDS = ["Contact.Ext_Id__c"];
const columns = [
    { label: 'Key Id', fieldName: 'keyid__c', sortable: "true" },
    { label: 'Date', fieldName: 'access_date__c', sortable: "true" },
    { label: 'Guest Name', fieldName: 'guestname__c', sortable: "true" },
    { label: 'Guest Id', fieldName: 'guestid__c', sortable: "true" },
    { label: 'Phone Number', fieldName: 'phonenumber__c' },
    { label: 'Room Number', fieldName: 'roomnumber__c', sortable: "true" },
];

export default class LwcIotTransactionRelatedList extends LightningElement {

    @api recordId;
    externalId;
    columns = columns;
    transactionCount;
    iotTransactions;
    defaultSortDirection = 'asc';
    sortedBy;
    sortDirection = 'asc';

    //get contact ext id
    @wire(getRecord, { recordId: "$recordId", fields: FIELDS })
    wiredContact({ data, error }) {
        if (data) {
            console.log(data)
            this.externalId = data.fields.Ext_Id__c.value;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contactData = undefined;
        }
    }

    @wire(getIotTransactionRecords, { ExternalId: '$externalId' })
    wiredIOTTransationData({ error, data }) {
        if (data) {
            console.log('data is ', data)
            // Extracting data from the response
            this.iotTransactions = data;
            this.transactionCount = data.length;
        } else if (error) {
            console.log('Error is')
            this.error = error.body.message;
            this.iotTransactions = undefined;
            this.itemNumber = 0
        } else {
            this.itemNumber = 0
        }
    }

    getFriendlyLabel(fieldName) {
        const fieldMap = {
            keyid__c: 'Key Id',
            access_date__c: 'Date',
            roomnumber__c: 'Room Number',
            guestid__c: 'Guest Id'
        };

        return fieldMap[fieldName] || fieldName;  // Return the field name if not found in the map
    }
    handleSort(event) {

        const { fieldName: sortedBy, sortDirection } = event.detail;
        const cloneData = [...this.iotTransactions];
        console.log(event.detail);

        cloneData.sort(this.sortData(sortedBy, sortDirection === 'asc' ? 1 : -1));
        this.iotTransactions = cloneData;
        this.sortDirection = sortDirection;
        this.sortedBy = sortedBy;
        this.sortData(this.sortedBy, this.sortDirection);
        this.sortedByLabel = this.getFriendlyLabel(this.sortedBy);
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