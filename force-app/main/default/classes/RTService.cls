public with sharing class RTService {
    public static String getSessionIdFromVFPage(){
        PageReference visualforcePage = Page.EPSessionIdHelper;
        String content = visualforcePage.getContent().toString();
        Integer s = content.indexOf('Start_Of_Session_Id') + 'Start_Of_Session_Id'.length(),
                e = content.indexOf('End_Of_Session_Id');
        return content.substring(s, e);
    }
    public static final String CREDENTIALS_ERROR = 'CREDENTIALS_ERROR';

    @AuraEnabled(cacheable=true)
    public static String fetch(String recordId, String dataGraphName, String space, String lookup, Long uniqueParam, String lookupValueField) {
        String queryOutput = null;
        String t;

        String finalRecordIdValue = recordId;

        try {
            // If we're passed a lookup value field, we need to, well, look up that field's value to use as our key to pass to the profile
            // fetch call, rather than just using what was passed as lookup.  Note that we *always* use the lookup as the ID  of a record.
            if (!String.isEmpty(lookupValueField)) {
                System.debug('Attempting to pull field: ' + lookupValueField + 'to perform lookup as an alternative.');

                Id recId = (Id)recordId;

                try {
                    String objectQuery = 'SELECT Id, ' + lookupValueField + ' FROM ' + recId.getSObjectType() + ' WHERE Id = :recordId';
                    

                    SObject loadedObject = Database.query(String.escapeSingleQuotes(objectQuery));

                    finalRecordIdValue = (String)loadedObject.get(lookupValueField);
                }
                catch(Exception e) {
                    System.debug('Unable to load record for dereference.  ' + e.getMessage());
                }
            }

            // Construct the endpoint URL using the Named Credential
            String lookupKeys = '[' + lookup +'.SourceRecordId__c=' + finalRecordIdValue + ']';

            String orgURL = System.URL.getOrgDomainUrl().toExternalForm();
            String dataGraphEntityName = dataGraphName;
            String k = '1';
            String a = '1';
            String b = '1';
            String c = '1';
            String d = '1';
            String e = '1';
            String f = '1';

            // Set the endpoint to call based upon whether or not a "valid" lookup DMO field is specified.  If the lookup field is empty or comically short,
            //   assume that the caller wants a direct fetch by record ID, rather than a lookup, and use the appropriate endpoint.
            String endpoint = '';
            if (String.isEmpty(lookup) || lookup.length() < 2) {
                endpoint = orgURL + '/services/data/v61.0/ssot/data-graphs/data/' + dataGraphEntityName + '/' + recordId;
            }
            else {
                endpoint = orgURL + '/services/data/v61.0/ssot/data-graphs/data/' + dataGraphEntityName + '?lookupKeys=' + EncodingUtil.urlEncode(lookupKeys, 'UTF-8') + '&dataspace=' + space;
            }
			System.debug('## endpoint = '+endpoint);
            // Create the HTTP request
            HttpRequest req = new HttpRequest();
            req.setHeader('Content-Type', 'application/json');
            req.setEndpoint(endpoint);
            req.setMethod('GET');
            System.debug('Endpoint ' + endpoint);

            // Create the HTTP client
            Http http = new Http();
            req.setHeader('Authorization', 'Bearer ' + getSessionIdFromVFPage());
            HttpResponse res = http.send(req);
            // Check the response status
            if (res.getStatusCode() == 200) {
                // Return the response body
                queryOutput = res.getBody();
            } else {
                // Handle non-200 status codes
                throw new AuraHandledException('Error occurred while querying profile data123 ' + endpoint);
            }
        } catch (Exception e) {
            // Handle any exceptions that occur during the HTTP request
            throw new AuraHandledException('Error while fetching profile data graph' + ' - ' + dataGraphName);
        }
        System.debug('## queryOutput = '+queryOutput);
        return queryOutput;
    }
}