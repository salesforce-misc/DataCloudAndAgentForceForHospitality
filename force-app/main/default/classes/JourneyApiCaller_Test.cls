/**
* @description : This is Test Class of JourneyApiCaller
* @date        : December 06, 2024
*/
@IsTest
public class JourneyApiCaller_Test {
    @IsTest
    static void testMakeCallout() {
        // Set up the mock response
        HttpResponse mockResponse = new HttpResponse();
        mockResponse.setHeader('Content-Type', 'application/json');
        mockResponse.setBody('{"key":"value"}');
        mockResponse.setStatusCode(200);
        
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(mockResponse));
        
        // Create a request object to pass to the Invocable Method
        JourneyApiCaller.FlowInputs flowinp = new JourneyApiCaller.FlowInputs();
        flowinp.phoneNumber = '17652679045';
        flowinp.EmailAddress = 'abc@example.com';
        // Add the request to a list
        List<JourneyApiCaller.FlowInputs> requestList = new List<JourneyApiCaller.FlowInputs>{ flowinp };
        // Call the method to test
        Test.startTest();
        JourneyApiCaller.callJourneyApi(requestList);
        Test.stopTest();

       Assert.areEqual('17652679045',flowinp.phoneNumber );
    }
}