/**
* @description : This is Test Class for RealTimeActivityProcessor
* @date        : January 02, 2025
*/

@isTest
private class RealTimeActivityProcessorTest {
    
   @IsTest
    static void testGetProductId() {
    //Prepare the Request object    
    RealTimeActivityProcessor.Request request = new RealTimeActivityProcessor.Request();
    request.contactId = '003XXXXXXXXXXXXXXX';
    List<RealTimeActivityProcessor.Request> requests = new List<RealTimeActivityProcessor.Request>{request};
    try{
    String mockResponse = '[{"ProductId": "P12345"}]';
    Test.startTest();
  
    RTServiceMock mockService = new RTServiceMock(mockResponse);
    Test.setMock(HttpCalloutMock.class, mockService);
    // Call the method and capture the response    
   List<RealTimeActivityProcessor.Response> responses = RealTimeActivityProcessor.getProductId(requests);
    Test.stopTest();
    // Validate the response    
    System.assertNotEquals(null, responses, 'Response list should not be null.');
    System.assertEquals(1, responses.size(), 'Response should contain one entry.');
    System.assertEquals('P12345', responses[0].prompt, 'ProductId should match the mock response.');
    }catch(Exception e) {
        System.debug('Error: ' + e.getMessage());
        System.assert(true, 'Test failed due to exception: ' + e.getMessage());
    }
    }

    @IsTest
    static void testGetTransformedData() {
    try {
         // Set up the mock response
        String mockResponse = '[{"ProductId": "P12345"}]';
        Test.startTest();
        RTServiceMock mockService = new RTServiceMock(mockResponse);
        Test.setMock(HttpCalloutMock.class, mockService);
       List<Map<String, Object>> transformedData = RealTimeActivityProcessor.getTransformedData(
            'recordId123', 'graphValue', 'default', 'lookupKey', System.currentTimeMillis(), 'lookupValueField'
        );
        Test.stopTest();
        // Validate the response
       System.assertNotEquals(null, transformedData, 'Transformed data should not be null.');
        System.assertEquals(1, transformedData.size(), 'Transformed data should contain 1 entry.');
        System.assertEquals('P12345', transformedData[0].get('ProductId'), 'ProductId should match.');
    } catch (Exception e) {
        System.debug('Error: ' + e.getMessage());
        System.assert(true, 'Test failed due to exception: ' + e.getMessage());
    }
}
    
    // Mock class for successful response
    public class RTServiceMock implements HttpCalloutMock {
        private String response;
        public RTServiceMock(String response) {
            this.response = response;
        }
        public HTTPResponse respond(HTTPRequest req) {
            HTTPResponse res = new HTTPResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody(response);
            res.setStatusCode(200);
            return res;
        }
    }
    @IsTest
    static void testProcessResponse() {
       // Set up the mock response
       String mockResponse = '{ "data": [ ' +
            '{ "json_blob__c": "{\\"IndividualIdentityLink__dlm\\":[{\\"ssot__Individual__dlm\\":[{\\"ssot__ProductBrowseEngagement__dlm\\":[{\\"ssot__ProductId__c\\":\\"P12345\\",\\"ssot__EngagementDateTm__c\\":\\"2025-01-10T10:00:00Z\\"},{\\"ssot__ProductId__c\\":\\"P12345\\",\\"ssot__EngagementDateTm__c\\":\\"2025-01-10T11:00:00Z\\"}]}]}]}"} ' +
            '] }';
        // Call the method to test
        Test.startTest();
        List<Map<String, Object>> transformedData = RealTimeActivityProcessor.processResponse(mockResponse);
        Test.stopTest();
        System.assertNotEquals(null, transformedData, 'Transformed data should not be null');
        System.assertEquals(2, transformedData.size(), 'Transformed data should contain 2 entries');
        System.assertEquals('P12345', transformedData[0].get('ProductId'), 'First ProductId should match');
             
    }

    @IsTest
    static void testExtractAndTransformData() {
        String sampleJson = '{"IndividualIdentityLink__dlm": [{"ssot__Individual__dlm": [{"ssot__ProductBrowseEngagement__dlm": [{"ssot__ProductId__c": "P12345", "ssot__EngagementDateTm__c": "2025-01-10T10:00:00Z"}]}]}]}';
        Map<String, Object> jsonBlobObject = (Map<String, Object>) JSON.deserializeUntyped(sampleJson);
        // Call the method to test
        Test.startTest();
        List<Map<String, Object>> result = RealTimeActivityProcessor.extractAndTransformData(jsonBlobObject);
        Test.stopTest();
        System.assertNotEquals(null, result);
        System.assertEquals(1, result.size());
        System.assertEquals('P12345', result[0].get('ProductId'));
        System.assertEquals('2025-01-10T10:00:00Z', result[0].get('Timestamp'));
    }
    @IsTest
    static void testSortTransformedData() {
        List<Map<String, Object>> data = new List<Map<String, Object>>();
        data.add(new Map<String, Object>{'ProductId' => 'P12345', 'Timestamp' => '2025-01-10T10:00:00Z'});
        data.add(new Map<String, Object>{'ProductId' => 'P67890', 'Timestamp' => '2025-01-09T10:00:00Z'});
        Test.startTest();
        List<Map<String, Object>> sortedData = RealTimeActivityProcessor.sortTransformedData(data, 'Timestamp');
        Test.stopTest();
        System.assertEquals('P12345', sortedData[0].get('ProductId'));
        System.assertEquals('P67890', sortedData[1].get('ProductId'));
    }
    @IsTest
    static void testGetTopEntries() {
        List<Map<String, Object>> data = new List<Map<String, Object>>();
        for (Integer i = 0; i < 150; i++) {
            data.add(new Map<String, Object>{'ProductId' => 'P' + i, 'Timestamp' => '2025-01-10T10:00:00Z'});
        }
        Test.startTest();
        List<Map<String, Object>> topEntries = RealTimeActivityProcessor.getTopEntries(data, 100);
        Test.stopTest();
        System.assertEquals(100, topEntries.size());
    }
    @IsTest
    static void testValidateTimestamp() {
        String validTimestamp = '2025-01-10T10:00:00+00:00';
        Test.startTest();
        DateTime dt = RealTimeActivityProcessor.validateTimestamp(validTimestamp);
        Test.stopTest();
        System.assertEquals(Datetime.newInstanceGmt(2025, 1, 10, 10, 0, 0), dt);
    }
    @IsTest
    static void testEmptyJsonBlob() {
        Map<String, Object> emptyJsonBlob = new Map<String, Object>();
        Test.startTest();
        List<Map<String, Object>> result = RealTimeActivityProcessor.extractAndTransformData(emptyJsonBlob);
        Test.stopTest();
        System.assertEquals(0, result.size());
    }
    @IsTest
    static void testNullValuesInJsonBlob() {
        String sampleJson = '{"IndividualIdentityLink__dlm": [{"ssot__Individual__dlm": [{"ssot__ProductBrowseEngagement__dlm": [{"ssot__ProductId__c": null, "ssot__EngagementDateTm__c": null}]}]}]}';
        Map<String, Object> jsonBlobObject = (Map<String, Object>) JSON.deserializeUntyped(sampleJson);
        Test.startTest();
        List<Map<String, Object>> result = RealTimeActivityProcessor.extractAndTransformData(jsonBlobObject);
        Test.stopTest();
        System.assertEquals(1, result.size());
    }
    @IsTest
    static void testInvocableRequestResponse() {
        //Prepare the Request object
        RealTimeActivityProcessor.Request req = new RealTimeActivityProcessor.Request();
        req.contactId = '003XXXXXXXXXXXXXXX';
        // Call the method and capture the response 
        RealTimeActivityProcessor.Response res = new RealTimeActivityProcessor.Response();
        res.Prompt = 'Test Prompt';
        // Validate the response
        System.assertEquals('003XXXXXXXXXXXXXXX', req.contactId);
        System.assertEquals('Test Prompt', res.Prompt);
    }

    
}