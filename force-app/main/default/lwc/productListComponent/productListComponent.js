import { LightningElement, wire, track,api } from 'lwc';
import getProductList from '@salesforce/apex/ProductController.getProductList';
import sendEmail from '@salesforce/apex/ProductController.sendEmail';
import disableProdListCmp from '@salesforce/apex/ProductController.disableProdListCmp';
import { getRecord } from 'lightning/uiRecordApi';
import EMAIL_FIELD from '@salesforce/schema/User.Email';
import { RefreshEvent } from 'lightning/refresh';
import { loadScript } from "lightning/platformResourceLoader";
import CometD from "@salesforce/resourceUrl/CometD";
import fetchSessionId from '@salesforce/apex/ProductController.fetchSessionId';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
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

export default class ProductListComponent extends LightningElement {
    @track columns = columns
    @track isShowModal = false;
    @api userClicked=false;
    @api isVisible; 
    //@track modalpopup = false;
    sessionId;
    @track isShowPetModal = false;
    @track promptResponse;

    connectedCallback() {
        console.log('## Page URL List = '+window.location.href);
      }
    
    @wire( fetchSessionId )
    wiredSessionId( { error, data } ) {
        if ( data ) {
            this.sessionId = data;
            this.error = undefined;
            console.log('sessionid ->'+this.sessionId);
            
            loadScript( this, CometD )
            .then( () => {
                let cometDLib = new window.org.cometd.CometD();
                cometDLib.configure( {
                    url: window.location.protocol + 
                        '//' + window.location.hostname
                        + '/cometd/40.0/',
                    requestHeaders: { 
                        Authorization: 'OAuth ' + 
                        this.sessionId 
                    },
                    appendMessageTypeToURL : false,
                    logLevel: 'debug'
                } );
                cometDLib.websocketEnabled = false;
                var lwcThisContext = this;
                cometDLib.handshake( function( status ) {      
                    console.log( 'Status is',  JSON.stringify(   status     )
                    );
                    if ( status.successful ) {
                        var subsrip = cometDLib.subscribe( '/event/Enable_Hotel_Search_Comp__e', function( message ) {
                        console.log('message 00->'+JSON.stringify(message));
                          
                        if(message.data.payload.Input_Type__c=='family-friendly'){
                            console.log('message 00 3445->'+JSON.stringify(message.data.payload.Input_Type__c));
                            console.log('## PromptResponse For Family Friendly = '+JSON.stringify(message.data.payload.PromptResponse__c));
                            lwcThisContext.promptResponse = message.data.payload.PromptResponse__c;
                            //lwcThisContext.modalpopup = true;
                            lwcThisContext.isShowPetModal = false;
                            setTimeout(function(){
                                lwcThisContext.isShowModal = true;
                              }, 8000);
                        } 
                        /*if(message.data.payload.Input_Type__c=='pet-allowed-hotel'){
                            console.log('message pets->'+JSON.stringify(message.data.payload.Input_Type__c));
                            //lwcThisContext.modalpopup = false;
                            lwcThisContext.isShowModal = false;
                            //setTimeout(function(){
                             //   lwcThisContext.isShowModal = true;
                             // }, 10000);
                        } */ 
                        // lwcThisContext.isShowModal = false;
                        });
                        //cometDLib.unsubscribe(subsrip);
                        cometDLib.subscribe( '/event/Enable_Pet_Friendly_Comp__e', function( message ) {
                            console.log('message 00 123->'+JSON.stringify(message));
                           // lwcThisContext.modalpopup1 = true;
                            ///alert('123message 00->'+ lwcThisContext.modalpopup);
                            
                            if(message.data.payload.Input_Type__c=='pet-allowed-hotel'){
                               // lwcThisContext.modalpopup = false;
                              // lwcThisContext.isShowPetModal = false;
                              console.log('message do you allow pets->'+JSON.stringify(message.data.payload.Input_Type__c));
                              console.log('## PromptResponse For Pet Friendly = '+JSON.stringify(message.data.payload.PromptResponse__c));
                              lwcThisContext.promptResponse = message.data.payload.PromptResponse__c;
                              //lwcThisContext.modalpopup = false;
                              lwcThisContext.isShowModal = false;
                              setTimeout(function(){
                                lwcThisContext.isShowPetModal = true;
                              }, 5000);
                             }  
                             
                            });

                    } else {
                        console.error(
                            'Error in handshaking:', 
                            JSON.stringify(
                                status
                            )
                        );
                    }

                } );
                
            } );

        } else if ( error ) {
            console.log('Error occurred in loading script');
            console.log(JSON.stringify(error) );
            this.sessionId = undefined;
        }
    }
}