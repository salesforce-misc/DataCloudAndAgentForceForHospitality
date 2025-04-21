/**
 * @description       : THis is the Test class for SurveyController.
 * @last modified on  : 01-13-2025
**/
@isTest
private class SurveyController_Test {
  @testSetup
    static void setupTestData() {
        Survey_Response__c response = new Survey_Response__c(
            Response_Value__c = 'Neutral',
            Imporvement_Comments__c = 'Service could be faster',
            Name = 'Customer Feedback'
        );
        insert response;
    }
    @isTest
    static void testSaveSurvey() {
        SurveyController controller = new SurveyController();
        String satisfactionValue = 'Happy';
        String improvementComment = 'Great service!';
        String surveyFormName = 'Customer Survey Form';
         Test.startTest();
         Id surveyId = SurveyController.saveSurvey(satisfactionValue, improvementComment, surveyFormName);
        Test.stopTest();
        // Verify that a new response was created
        Survey_Response__c response = [SELECT Id, Response_Value__c, Imporvement_Comments__c, Name 
                                       FROM Survey_Response__c 
                                       WHERE Response_Value__c = 'Happy'
                                       LIMIT 1];
        System.assertEquals('Great service!', response.Imporvement_Comments__c, 'Improvement comment should match expected value');
        System.assertEquals('Customer Survey Form', response.Name, 'Survey form should match expected value');
    }

    }