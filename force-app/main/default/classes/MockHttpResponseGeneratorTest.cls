/*
Description: This testclass is used for code coverage of MockHttpResponseGenerator class
date       : January 01, 2025
*/

@IsTest
public class MockHttpResponseGeneratorTest {
	@IsTest
    static void testResponse(){
        // Mock class for successful response
        HttpResponse mockResponse = new HttpResponse();
        mockResponse.setStatusCode(200);
        mockResponse.setBody('{"message":"Success"}');
        MockHttpResponseGenerator mockGenerator = new MockHttpResponseGenerator(mockResponse);
        HttpRequest mockRequest = new HttpRequest();
        mockRequest.setEndpoint('https://test.com');
        mockRequest.setMethod('GET');
        HttpResponse returnedResponse = mockGenerator.respond(mockRequest);
        System.assertEquals(200,returnedResponse.getStatusCode());
        System.assertEquals('{"message":"Success"}',returnedResponse.getBody());
        
    }
}