import { LightningElement, wire, track,api } from 'lwc';
import getProductList2 from '@salesforce/apex/ProductController.getProductList2';
import sendEmail from '@salesforce/apex/ProductController.sendEmail';
import { getRecord } from 'lightning/uiRecordApi';
import getCommunityUserId from '@salesforce/apex/CommunityUserController.getCommunityUserId';
import EMAIL_FIELD from '@salesforce/schema/User.Email';
import LightningAlert from 'lightning/alert';
import disableProdListCmp from '@salesforce/apex/ProductController.disableProdListCmp';

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

export default class DisplayHotelPopup extends LightningElement {
    @track columns = columns
    @track products ;
    @track isShowFrndlyHotel = false;
    @track ifPetFrndlyAllowed = false;

    // userId = USER_ID;
     userEmail;


    connectedCallback(){
        console.log('inside beach front family friendly resort on home page');
        console.log('allproduct list ->');
    }

    @wire(getProductList2)
    wiredProducts({ error, data }) {
        if (data) {
            console.log('allproduct list ->'+JSON.stringify(data));
            let prodLink;
            //this.products = data;
            if (Object.keys(data).length === 0) {
                console.log('empty product -->');
            }
            else{
            console.log('allproduct true ->'+JSON.stringify(data[0].isVisibleProd));
            this.isShowFrndlyHotel = data[0].isVisibleProd;
            this.ifPetFrndlyAllowed = data[0].isPetFrndProd;
            console.log('showProdList true ->'+this.ifPetFrndlyAllowed);

            this.products = data.map(row => { 
                return {
                    ...row,
                    prodLink: "/SunshineResorts/product/" + row.prodId
                };
            })
        }
        } else if (error) {
            console.error('Error fetching products:', error);
        }
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
    hideModalBox1(){
        console.log('click on cancel pet');
        this.ifPetFrndlyAllowed = false;
        disableProdListCmp()
            .then(()=> {
            })
            .catch(error => {
                this.error = error;
            })
    }
    hideModalBox() {  
        console.log('click on cancel');
        this.isShowFrndlyHotel = false;
         disableProdListCmp()
            .then(()=> {
            })
            .catch(error => {
                this.error = error;
            })
    }
    handleClickRow(event){
        console.log('123onclick row 456');
        
    }
}