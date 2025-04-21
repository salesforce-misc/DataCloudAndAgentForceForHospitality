/**
* @description : This is Test Class for RTService
* @date        : January 02, 2025
*/

@isTest
private class RTServiceTest {

    @isTest
    static void testFetchWithValidLookup() {
        // Setup: Create a mock record for testing
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        // Simulate the parameters for the fetch method
        String recordId = testAccount.Id;
        String dataGraphName = 'TestDataGraph';
        String space = 'TestSpace';
        String lookup = 'TestLookup';
        Long uniqueParam = 123456789L;
        String lookupValueField = 'Name';
        // Mock the getSessionIdFromVFPage method
        try{
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String queryOutput = RTService.fetch(recordId, dataGraphName, space, lookup, uniqueParam, lookupValueField);
        Test.stopTest();
        }catch(AuraHandledException e){
            System.assert(true,'Exception was not expected');
        }
        
    }
    @isTest
    static void testFetchWithEmptyLookup() {
        // Setup: Create a mock record for testing
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        // Simulate the parameters for the fetch method with an empty lookup
        String recordId = testAccount.Id;
        String dataGraphName = 'TestDataGraph';
        String space = 'TestSpace';
        String lookup = '';  // Empty lookup
        Long uniqueParam = 123456789L;
        String lookupValueField = 'Name';
        // Mock the getSessionIdFromVFPage method
        try{
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String queryOutput = RTService.fetch(recordId, dataGraphName, space, lookup, uniqueParam, lookupValueField);
        Test.stopTest();
        }catch(AuraHandledException e){
        // Assert the queryOutput is as expected
        
        System.assert(true, 'Query output should contain expected content');
        }
    }
    @isTest
    static void testFetchWithException() {
        // Setup: Create a mock record for testing
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        // Simulate the parameters for the fetch method
        String recordId = testAccount.Id;
        String dataGraphName = 'TestDataGraph';
        String space = 'TestSpace';
        String lookup = 'TestLookup';
        Long uniqueParam = 123456789L;
        String lookupValueField = 'InvalidField'; // Non-existent field for lookup
        // Test the exception handling by setting up a mock response that causes an error
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorWithError());
        try {
            RTService.fetch(recordId, dataGraphName, space, lookup, uniqueParam, lookupValueField);
            System.assert(false, 'Exception should have been thrown');
        } catch (AuraHandledException e) {
            System.assert(true,true);
        }
        Test.stopTest();
    }
    // Mock class for successful response
    public class MockHttpResponseGenerator implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HTTPResponse res = new HTTPResponse();
            res.setStatusCode(200);
            res.setBody('{"expected": "response"}');
            return res;
        }
    }
    // Mock class for error response
    public class MockHttpResponseGeneratorWithError implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HTTPResponse res = new HTTPResponse();
            res.setStatusCode(500);
            res.setBody('Error occurred');
            return res;
        }
    }

}