/**
 * @description : This class handles the logic to call SFMC Journey builder
 * 				   using HTTP REST Callout when IOT date gets inserted into Data cloud.
 * @date        : December 06, 2024
 * @version     : 1.0
 * @author      : Infosys
 */
public with sharing class JourneyApiCaller {
    // Method to call the Journey API
    @InvocableMethod(label='Call Journey API' description='Call Journey API')
    public static void callJourneyApi(List<FlowInputs> request) {
        String phone_Number = request[0].phoneNumber;
        String email_Address = request[0].EmailAddress;
        system.debug('\n phone number ->'+phone_Number);
        SFMC_API_Event__mdt ups = SFMC_API_Event__mdt.getInstance('SFMCEventDetails');
        if(email_Address != NULL && ups != NULL && ups.ClientId__c != NULL && ups.ClientSecret__c != NULL && ups.eventKey__c != NULL){ 
            callSFMCEvent(phone_Number,email_Address);
        }        
    }
     
    public static void callSFMCEvent(String phoneNumber, String emailAddress){
        SFMC_API_Event__mdt ups = SFMC_API_Event__mdt.getInstance('SFMCEventDetails');// Use Custom setting to store your data & Credential
        if(ups != NULL && ups.ClientId__c != NULL && ups.ClientSecret__c != NULL && ups.eventKey__c != NULL){    
            String clientId = ups.ClientId__c;
            String clientSecret = ups.ClientSecret__c;
            String accountID = ups.accountID__c;
            String eventKey = ups.eventKey__c;
            String authURL = ups.AuthenticationBaseURI__c;
            String restBaseURL = ups.restBaseURL__c;
            
            String jsonBody = GetAccessTokenJsonBody(clientId, clientSecret,accountID).getAsString();
            //String authURL = ups.AuthenticationBaseURI__c;
            String accessToken;
            system.debug('jsonBody---'+jsonBody);
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(authURL);
            req.setHeader('Content-Type', 'application/json');
            req.setMethod('POST');
            req.setBody(jsonBody);
            
            
            HttpResponse res = h.send(req);
            String responseBody = res.getBody();
            system.debug('responseBody---'+responseBody);
            Map<String, Object> result = (Map<String, Object>)JSON.deserializeUntyped(responseBody);
            
            if(!Test.isRunningTest() && res.getStatusCode() == 200){
                accessToken = 'Bearer '+result.get('access_token').toString();
            }
            if(Test.isRunningTest() && res.getStatusCode() == 200){
                system.debug('Test.isRunningTest()---'+Test.isRunningTest());
                accessToken='Bearer dummytoken';
            }
            
            system.debug('accessToken---'+accessToken);
            
            String subsKey='0001';
            HttpRequest req1 = new HttpRequest();
            req1.setEndpoint(restBaseURL);
            req1.setMethod('POST');  // Use 'POST' for POST requests
            req1.setHeader('Authorization', accessToken ); // Use OAuth token if required
            req1.setHeader('Content-Type', 'application/json'); 
            
            String reqBody = getRequestBodyToSendEvent(subsKey,restBaseURL,phoneNumber,eventKey,emailAddress).getAsString();
            System.debug('\n Request Body --> '+reqBody);
            
            req1.setBody(reqBody);
            
            // Create the HTTP object
            Http http1 = new Http();
            HttpResponse res2;
            
            try {
                // Send the request and capture the response
                res2 = http1.send(req1);
                if (res2.getStatusCode() == 200) {
                    // Success - process the response body
                    String resp2Body = res2.getBody();
                    System.debug('API Response: ' + resp2Body);
                    
                } else {
                    // Handle errors if the response code is not 200
                    System.debug('Error: ' + res2.getStatusCode() + ' - ' + res2.getStatus());
                }
            } catch (Exception e) {
                // Handle any exceptions that occur during the HTTP request
                System.debug('Exception: ' + e.getMessage());
            }
        }        
    }
    
     public class FlowInputs {
        @InvocableVariable public String phoneNumber;
        @InvocableVariable public String EmailAddress;
    }
    
     public static JSONGenerator GetAccessTokenJsonBody(String clientID, String clientSecret,String accountID){
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField('grant_type', 'client_credentials');
        gen.writeStringField('client_id', clientID);
        gen.writeStringField('client_secret', clientSecret);
        gen.writeStringField('account_id', accountID);
        gen.writeEndObject();
        return gen;
    }
    
    public static JSONGenerator getRequestBodyToSendEvent(String recordId,String EventDefinitionKey,String phoneNumber, String eventKey, String emailAddress) {
        String surveyURL ='https://d4w000009dlq7uak.my.site.com/SunshineResorts/survey';
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField('ContactKey', recordId);
        gen.writeStringField('EventDefinitionKey',eventKey);
        //gen.writeStringField('EventDefinitionKey','APIEvent-d6866b63-d91a-e5c7-43b2-7f970f39e1a9');
        
        gen.writeFieldName('Data');
        gen.writeStartObject();
        gen.writeStringField('SubscriberKey',recordId);
        gen.writeStringField('EmailAddress', emailAddress);
        //gen.writeStringField('EmailAddress', 'gdevadoss@salesforce.com');
        //gen.writeStringField('FirstName', conFname);
        //gen.writeStringField('LastName', conLname);
        //gen.writeStringField('Survey-URL', surveyURL);
        //gen.writeDateField('Check-In-Date',  checkIn);
        //gen.writeDateField('Check-Out-Date',  CheckOut);
        //gen.writeStringField('Room-Type', roomType);
        gen.writeStringField('PhoneNumber', phoneNumber);
        gen.writeStringField('LOCALE', 'US');
        gen.writeEndObject();
        gen.writeEndObject();
        
        //system.debug('responseBody---'+gen.getAsString());
        return gen;
    }
    
}