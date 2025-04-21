global class SFMCCallOutService {
    
    @Future (callout=true)
    public static void callSFMCEvent(String phoneNumber){
        SFMC_API_Event__mdt ups = SFMC_API_Event__mdt.getInstance('SFMRestAPI');// Use Custom setting to store your data & Credential
        String clientId = ups.ClientId__c;
        String clientSecret = ups.ClientSecret__c;
        String accountID = ups.accountID__c;
        String eventKey = ups.eventKey__c;
        String authURL = ups.AuthenticationBaseURI__c;
        String restBaseURL = ups.restBaseURL__c;
        
        System.debug('SFMC API Details ->'+ups);
        System.debug('SFMC clientId Details ->'+clientId);
        System.debug('SFMC clientSecret Details ->'+clientSecret);
        System.debug('SFMC accountID Details ->'+accountID);
        System.debug('SFMC eventKey Details ->'+eventKey);
        System.debug('SFMC authURL Details ->'+authURL);
        System.debug('SFMC restBaseURL Details ->'+restBaseURL);
         System.debug('phoneNumber ->'+phoneNumber);
        
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
        
        if(res.getStatusCode() == 200){
            accessToken = 'Bearer '+result.get('access_token').toString();
        }
        
        system.debug('accessToken---'+accessToken);
        Date checkIn;
        Date checkOut;
        String roomType;
        String subsKey;
        String conEmail;
        String conFname;
         String conLname;
        //======================================================================
        //String jsonDEBody = GetAccessTokenJsonBody(clientId, clientSecret,accountID).getAsString();
        Contact con = [SELECT Id,Name,Email,FirstName,LastName,MobilePhone FROM Contact WHERE MobilePhone=:phoneNumber LIMIT 1];
        if(con!=null){
            
            subsKey = con.Id;
            conEmail=con.Email;
            conFname = con.FirstName;
            conLname = con.LastName;
            
            Reservation__c currentReserv=[SELECT Id, Name, Contact__c, Check_in_Date__c, Check_out_Date__c,Room_Type__c  FROM Reservation__c 
                                          WHERE Check_in_Date__c <=TODAY AND Check_out_Date__c > TODAY AND Contact__c =:con.Id LIMIT 1];
            if(currentReserv!=null){
                 checkIn=currentReserv.Check_in_Date__c;
                 checkOut=currentReserv.Check_out_Date__c;
                 roomType=currentReserv.Room_Type__c;
            }
            
        }
        HttpRequest req1 = new HttpRequest();
        req1.setEndpoint(restBaseURL);
        req1.setMethod('POST');  // Use 'POST' for POST requests
        req1.setHeader('Authorization', accessToken ); // Use OAuth token if required
        req1.setHeader('Content-Type', 'application/json'); 
        
        String reqBody = getRequestBodyToSendEvent(subsKey,conEmail,restBaseURL,phoneNumber,checkIn,checkOut,roomType,conFname,conLname).getAsString();
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
    
    public static JSONGenerator getRequestBodyToSendEvent(String recordId, String email, String EventDefinitionKey,String phoneNumber,Date checkIn,Date CheckOut,String roomType,String conFname, String conLname) {
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField('ContactKey', recordId);
        gen.writeStringField('EventDefinitionKey','APIEvent-d6866b63-d91a-e5c7-43b2-7f970f39e1a9');
        
        gen.writeFieldName('Data');
        gen.writeStartObject();
        gen.writeStringField('SubscriberKey',recordId);
        gen.writeStringField('EmailAddress', email);
        gen.writeStringField('FirstName', conFname);
        gen.writeStringField('LastName', conLname);
        gen.writeStringField('Survey-URL', 'test.salesforce.com');
        gen.writeDateField('Check-In-Date',  checkIn);
        gen.writeDateField('Check-Out-Date',  CheckOut);
        gen.writeStringField('Room-Type', roomType);
        gen.writeStringField('PhoneNumber', phoneNumber);
        gen.writeStringField('LOCALE', 'IND');
        gen.writeEndObject();
        gen.writeEndObject();
        
        //system.debug('responseBody---'+gen.getAsString());
        return gen;
    }
    
}