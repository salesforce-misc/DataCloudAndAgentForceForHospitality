import { LightningElement ,track, wire,api} from 'lwc';
import {getRecord, getFieldValue} from 'lightning/uiRecordApi';
import GetRecentBookings from '@salesforce/apex/ActivityFeedController.GetRecentBookings';
import GetDiningBookings from '@salesforce/apex/ActivityFeedController.GetDiningBookings';
import GetReservationCount from '@salesforce/apex/ActivityFeedController.GetReservationCount';
import { NavigationMixin } from 'lightning/navigation';
import CUSTOMER_CLASS from '@salesforce/schema/Contact.Customer_Class__c';

const fields = [ 
CUSTOMER_CLASS
];

export default class LwcActivityFeed extends NavigationMixin(LightningElement) {


/*@track ariaExpanded = false; 
@track ariaExpanded2 = false; 
@track sectionClass = 'slds-timeline__item_expandable slds-timeline__item_task'; // Dynamically changes SLDS class for open/closed
@track sectionClass2 = 'slds-timeline__item_expandable slds-timeline__item_task'; // Dynamically changes SLDS class for open/closed


handleToggleClick() {
    
    this.ariaExpanded = !this.ariaExpanded;

    this.sectionClass = this.ariaExpanded ? 'slds-timeline__item_expandable slds-timeline__item_task slds-is-open' : 'slds-timeline__item_expandable slds-timeline__item_task';

    
}
handleToggleClick2(){
    this.ariaExpanded = !this.ariaExpanded;

    this.sectionClass2 = this.ariaExpanded ? 'slds-timeline__item_expandable slds-timeline__item_task slds-is-open' : 'slds-timeline__item_expandable slds-timeline__item_task';

}*/ 
@api recordId;
@track bookings;           //stores experience bookings
@track Dinnerbookings;    //stores dinner bookings
@track error;
@track date;
@track name;
@track DinnerDate;
@track DinnerName;
@track DinnerId;
@track startTime;
@track endTime;
@track ExperienceId;

@track ariaExpanded = false;
@track ariaExpanded2 = false;
@track ariaExpanded3 = false;
@track sectionClass = 'slds-timeline__item_expandable slds-timeline__item_task'; // Section 1 class
@track sectionClass2 = 'slds-timeline__item_expandable slds-timeline__item_task'; // Section 2 class
@track sectionClass3 = 'slds-timeline__item_expandable slds-timeline__item_task';
@track message;
    @track customerClassification;

connectedCallback() {
    console.log('contact id', this.recordId);
    console.log('ariaExpanded', this.ariaExpanded);
    console.log('ariaExpanded2 ', this.ariaExpanded2);
    console.log('ariaExpanded3', this.ariaExpanded3);
    this.fetchBookings();
}

    @wire(getRecord, { recordId: '$recordId', fields })
    contact;
      

fetchBookings() {
    GetRecentBookings({ contactId: this.recordId })
        .then(result => {
            this.bookings = result;
            this.date= this.bookings[0].Booking_Date__c;
            this.name= this.bookings[0].Experience_Name__c;
            this.ExperienceId= this.bookings[0].Id;
            this.startTime= this.bookings[0].Start_Time__c;
            this.endTime= this.bookings[0].End_Time__c;
            console.log('fetched booking',JSON.stringify(this.bookings));
            this.error = undefined;
        })
        .catch(error => {
            this.error = error;
            this.bookings = undefined;
            console.error('Error retrieving bookings:', JSON.stringify(this.error));
        });
        GetDiningBookings({ contactId: this.recordId })
            .then(result => {
                this.Dinnerbookings = result;
                this.DinnerDate= this.Dinnerbookings[0].Booking_Date__c;
                this.DinnerName= this.Dinnerbookings[0].Experience_Name__c;
                this.DinnerId= this.Dinnerbookings[0].Id;
                console.log('fetched dinner booking',JSON.stringify(this.Dinnerbookings));
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.Dinnerbookings = undefined;
                console.error('Error retrieving dinner bookings:', JSON.stringify(this.error));
            });
        
}

// Handle toggle for the first section
handleToggleClick() {
    this.ariaExpanded = !this.ariaExpanded;

    this.sectionClass = this.ariaExpanded
        ? 'slds-timeline__item_expandable slds-timeline__item_task slds-is-open'
        : 'slds-timeline__item_expandable slds-timeline__item_task';


}

// Handle toggle for the second section
handleToggleClick2() {
    this.ariaExpanded2 = !this.ariaExpanded2;

    this.sectionClass2 = this.ariaExpanded2
        ? 'slds-timeline__item_expandable slds-timeline__item_task slds-is-open'
        : 'slds-timeline__item_expandable slds-timeline__item_task';
}

handleToggleClick3(){
    console.log('inside toggle 3');
    this.ariaExpanded3 = !this.ariaExpanded3;
    console.log('ariaExpanded3', this.ariaExpanded3);
    this.sectionClass3 = this.ariaExpanded3
        ? 'slds-timeline__item_expandable slds-timeline__item_task slds-is-open'
        : 'slds-timeline__item_expandable slds-timeline__item_task';

}

navigateToRecordPage(event) {
    const recordId = event.target.dataset.id;
    console.log('inside navigate');
    console.log('recordid',recordId);
    this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes: {
            recordId:recordId ,
            objectApiName: 'Booking__dlm',
            actionName: 'view'
        }
    });
}


get customerClassificationHTML() {
    const customerClassification = this.customerClassification;
    const classificationText = `<span class="slds-form-element__label" style="font-weight: normal; font-size: 16px">Customer Classification</span>`;
    if (customerClassification) {
        return `<div class="slds-col slds-size_1-of-1" style="margin-left: 0.5em;">
                    ${classificationText}
                    <span style="font-weight: bold; margin-left: 0.5em; background-color: rgb(3, 129, 62); color: white; padding: 0.2em 0.5em; border-radius: 5px; font-size: 16px; width: 150px; text-align: center;">
                        ${customerClassification}
                    </span>
                </div>`;
    } else {
        return `<div class="slds-col slds-size_1-of-1" style="margin-left: 0.5em;">
                    ${classificationText}
                </div>`;
    }
}

renderedCallback() {
    const container = this.template.querySelector('.customer-classification-container');
    if (container) {
        container.innerHTML = this.customerClassificationHTML;
    }
}

@wire(GetReservationCount, { contactId: '$recordId' })
wiredReservationCount({ error, data }) {
    console.log('Entering Inside the method');

    if (data > 0) {
        console.log('Count is greater than 1');
        this.message = 'Guest is currently staying at the Property';
    } else {
        console.log('Count is less than 0');
        this.message = 'Guest is not staying at the Property';
    }

    this.customerClassification = this.contact.data ? this.contact.data.fields.Customer_Class__c.value : null;

    this.renderedCallback();
}


}