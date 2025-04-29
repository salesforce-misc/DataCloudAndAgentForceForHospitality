import { LightningElement, wire, track,api } from 'lwc';
import getPetFriendlyProductList from '@salesforce/apex/ProductController.getPetFriendlyProductList';
import sendEmail from '@salesforce/apex/ProductController.sendEmail';
import publishHotelSearchEvent from '@salesforce/apex/ProductController.publishHotelSearchEvent';
import disableProdListCmp from '@salesforce/apex/ProductController.disableProdListCmp';
import { getRecord } from 'lightning/uiRecordApi';
import getCommunityUserId from '@salesforce/apex/CommunityUserController.getCommunityUserId';
import EMAIL_FIELD from '@salesforce/schema/User.Email';
import LightningAlert from 'lightning/alert';

const fields = [EMAIL_FIELD];
const columns = [
    { 
        label:'Name',
        fieldName: 'prodLink',
        type:'url',
        typeAttributes: {
            label: { 
                fieldName: 'hotelName'
            },
            target : '_self'
        }
    }
];
export default class ChildModal extends LightningElement {
    @track columns = columns
    @track products ;
    @track ifPetFrndlyAllowed = false;
    // products ;
     //userEmail;

    // userId = USER_ID;
     userEmail;
     @api promptResponse;


    connectedCallback(){
        console.log('inside beach front family friendly resort pet');
        console.log('allproduct list pets->');
        getPetFriendlyProductList({promptResponse: this.promptResponse})
                .then((data)=> {
                    console.log('allproduct list pet->'+JSON.stringify(data));
                    let prodLink;
                    //this.products = data;
                    if (Object.keys(data).length === 0) {
                        console.log('empty product -->');
                    }
                    else{
                    console.log('allproduct true pet->'+JSON.stringify(data[0].isPetFrndProd));
                    //this.isShowFrndlyHotel = data[0].isVisibleProd;
                    this.ifPetFrndlyAllowed = data[0].isPetFrndProd;
                    console.log('showProdList true pet->'+this.ifPetFrndlyAllowed);
        
                    this.products = data.map(row => { 
                        return {
                            ...row,
                            prodLink: "/SunshineResorts/product/" + row.prodId
                        };
                    })
                }
                })
                .catch(error => {
                    //this.error = error;
                })
    
    }

     @wire(getCommunityUserId) userDataHandler({data, error}) {
            if(data) {
                console.error('User data retrieved:', data);
                this.userEmail = data.Email;
            }
        else if (error) {
            console.error('Error retrieving user data:', error);
        }
    } 


    // Handle email sending
    handleSendEmail() {
        const productNames = this.products.join(', ');
        console.log('Email'+this.userEmail);
        console.log('product name'+this.products);
        console.log('product name'+JSON.stringify(this.products));

        sendEmail({ emailAddress: this.userEmail, productNames:this.products })
            .then(() => {
                console.log('Email sent successfully');
                 LightningAlert.open({
                    message: 'Email sent successfully',
                    theme: 'success', // a red theme intended for error states
                    label: 'success!', // this is the header text
                });
                
            })
            .catch(error => {
                console.error('Error sending email:', error);
                console.log('Failed to send email');
            });
    }
    hideModalBox() {  
        console.log('click on cancel');
        this.ifPetFrndlyAllowed=false;
          disableProdListCmp()
                .then(()=> {
                })
                .catch(error => {
                    this.error = error;
                })
    }
    handleClickRow(event){
        console.log('onclick row-189');
        publishHotelSearchEvent({ htlSearchKey:'pet-allowed'})
                .then(()=> {
                })
                .catch(error => {
                    this.error = error;
                })
    }
}