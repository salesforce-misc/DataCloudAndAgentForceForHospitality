import { LightningElement, wire, track,api } from 'lwc';
import getProductList from '@salesforce/apex/ProductController.getProductList';
import sendEmail from '@salesforce/apex/ProductController.sendEmail';
import publishHotelSearchEvent from '@salesforce/apex/ProductController.publishHotelSearchEvent';
import disableProdListCmp from '@salesforce/apex/ProductController.disableProdListCmp';
import { getRecord } from 'lightning/uiRecordApi';
import getCommunityUserId from '@salesforce/apex/CommunityUserController.getCommunityUserId';
import EMAIL_FIELD from '@salesforce/schema/User.Email';
import LightningAlert from 'lightning/alert';
import { refreshApex } from '@salesforce/apex';
import { publish, MessageContext } from 'lightning/messageService';

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
export default class DisplayFriendlyHotel extends LightningElement {
    @track columns = columns
    @track products ;
    @track isShowFrndlyHotel = false;
    @track keepModalOpen = false;
    //@api openfamilyfrindlymodal;
     //userId = USER_ID;
     userEmail;


    connectedCallback(){
        console.log('inside beach front family friendly resort');
        console.log('allproduct list ->');
    }

    @wire(getProductList)
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
           //this.ifPetFrndlyAllowed = data[0].isPetFrndProd;
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
              //  alert('Email sent successfully');
                //this.isShowModal = false;
                
            })
            .catch(error => {
                console.error('Error sending email:', error);
                console.log('Failed to send email');
            });
    }
    hideModalBox() {  
        console.log('click on cancel');
        //this.disconnectedCallback();
        this.isShowFrndlyHotel = false;
       // this.ifPetFrndlyAllowed=false;
        disableProdListCmp()
		.then(()=> {
		})
		.catch(error => {
			this.error = error;
		})
    }
    handleClickRow(event){
        console.log('123onclick row 456');
        //this.openfamilyfrindlymodal = true;
        var searchKey='family-friendly';
       publishHotelSearchEvent({ htlSearchKey:'family-friendly'})
		.then(()=> {
		})
		.catch(error => {
			this.error = error;
		})
    }
}