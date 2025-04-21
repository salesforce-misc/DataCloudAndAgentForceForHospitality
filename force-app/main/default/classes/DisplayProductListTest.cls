/**
 * This is Test class of DisplayProductList Class
 */
@isTest
public class DisplayProductListTest {

    @isTest
    static void testGetInputQuestion_PetQuestion() {
        // Prepare the test request
        DisplayProductList.Request testRequest = new DisplayProductList.Request();
        testRequest.Question = 'Do you allow pets?';
        List<DisplayProductList.Request> requests = new List<DisplayProductList.Request>{testRequest};
        // Invoke the method
        Test.startTest();
        List<DisplayProductList.Response> responses = DisplayProductList.getInputQuestion(requests);
        Test.stopTest();
    }
    @isTest
    static void testGetInputQuestion_NonPetQuestion() {
        DisplayProductList.Request testRequest = new DisplayProductList.Request();
        testRequest.Question = 'Are there any beachfront hotels?';
        List<DisplayProductList.Request> requests = new List<DisplayProductList.Request>{testRequest};
        // Invoke the method
        
        Test.startTest();
        List<DisplayProductList.Response> responses = DisplayProductList.getInputQuestion(requests);
        Test.stopTest();
    }
}