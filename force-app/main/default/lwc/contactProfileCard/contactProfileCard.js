import { LightningElement, api, wire ,track} from 'lwc';
import { getRecord, getFieldValue} from 'lightning/uiRecordApi';
import getGuestCalculatedInsights from '@salesforce/apex/ContactProfileCardDetails.getGuestCalculatedInsights';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import MAILING_CITY_FIELD from '@salesforce/schema/Contact.MailingCity';
import MAILING_STATE_FIELD from '@salesforce/schema/Contact.MailingState';
import MAILING_POSTAL_CODE from '@salesforce/schema/Contact.MailingPostalCode';
import MAILING_STREET from '@salesforce/schema/Contact.MailingStreet';
import PHOTO_URL_FIELD from '@salesforce/schema/Contact.Photo_URL__c';
import INSIGHTS_LOGO from '@salesforce/resourceUrl/DataCloud';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';
import getExperienceType from '@salesforce/apex/ContactProfileCardDetails.getExperienceType';
import GUEST_STAY_METRICS from '@salesforce/schema/Contact.Total_Spend__c';
import SATISFACTION_SCORE from '@salesforce/schema/Contact.Guest_Satisfaction_Score__c';

const fields = [
    NAME_FIELD,
    MAILING_CITY_FIELD,
    MAILING_STATE_FIELD,
    MAILING_POSTAL_CODE,
    MAILING_STREET,
    PHOTO_URL_FIELD,
    GUEST_STAY_METRICS,
    SATISFACTION_SCORE
];

export default class ContactProfileCard extends LightningElement {
    @api recordId;
    @track error;

    //Calculated Insights Variable
    logoUrl = INSIGHTS_LOGO;        
    lifetimeValue ;
    totalSpend ;
    totalRoomNights ;
    guestSatisfactionScore ;
    totalStays ;
    averageNightsPerStay ;
    averageSpendPerVisit ;
    bookingExpierenceTypeValues;

    @wire(getRecord, { recordId: '$recordId', fields })
    contact;

    get hasData() {
        return this.contact?.data !== undefined;
    }

    get error() {
        return this.contact?.error;
    }

    get name() {
        return getFieldValue(this.contact.data, NAME_FIELD);
    }

    get mailingCity() {
        return getFieldValue(this.contact.data, MAILING_CITY_FIELD);
    }

    get mailingState() {
        return getFieldValue(this.contact.data, MAILING_STATE_FIELD);
    }

    get mailingPostalCode() {
        return getFieldValue(this.contact.data, MAILING_POSTAL_CODE);
    }

    get mailingStreet() {
        return getFieldValue(this.contact.data, MAILING_STREET);
    }
    get photoURL() {
        const photoURL = getFieldValue(this.contact.data, PHOTO_URL_FIELD);
        return photoURL
            ? photoURL
            : 'https://res.cloudinary.com/btahub/image/upload/v1708357811/ntbg5p1mwixury672dxy.png';
    }
    get guestAvgSpendPerVisit(){
        return getFieldValue(this.contact.data, GUEST_STAY_METRICS);
    }

    get satisfationScore(){
        return getFieldValue(this.contact.data, SATISFACTION_SCORE);
    }
    // Member Trait Changes Start
@wire(getExperienceType, {contactId: '$recordId'})
exprienceTypeValues({ error, data }){
    console.log('## Coming inside getExperienceType = '+ data);
    if(data){
        console.log('## Experience Type Found');
        this.bookingExpierenceTypeValues = data;
        //this.spiltvalues = this.bookingExpierenceTypeValues.split(',');
       // console.log('spiltvalues',spiltvalues);
        console.log('## this.bookingExpierenceTypeValues = '+this.bookingExpierenceTypeValues);
    }else if(error){
        this.error = error;
        console.log('error:',error);
    }
}
 // Member Trait Changes End

 //Calculated Insight value 
 @wire(getGuestCalculatedInsights,{contactId: '$recordId'})
 wiredContact({error,data}){
    if(data){
        this.lifetimeValue = data.Lifetime_Value__c;
        this.totalStays= data.Total_Stays__c;
        this.totalSpend = data.Total_Spend__c;
        this.averageNightsPerStay = data.Avg_Nights_per_Stay__c;
        //this.averageSpendPerVisit = 
        this.totalRoomNights = data.Total_Room_Nights__c;
        this.guestSatisfactionScore =  data.Lifetime_Reservations__c;
    }else{
        console.error('Error')
    }
 }
}