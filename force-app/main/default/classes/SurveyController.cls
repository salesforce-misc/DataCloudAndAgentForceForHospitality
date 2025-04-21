/**
* @description       : 
* @author            :
* @group             : 
* @last modified on  : 12-02-2024
* @last modified by  : 
**/
public with sharing class SurveyController {
    /**
* Description: 
**/
    @AuraEnabled
    public static Id saveSurvey(String satisfactionValue, String improvementComment, String surveyFormName) {
        
        Survey_Response__c survey = new Survey_Response__c();
        survey.Response_Value__c = satisfactionValue;
        survey.Response_Date_Time__c = Datetime.now();
        
        survey.Name = 'Customer Survey Form'; //Which Survey User Filled
        
        User u = [select id, contactId from User where id = : UserInfo.getUserId()];
        
        Id getContactId = u.contactId;
        System.debug('Fetched User ContactID:'+ getContactId);
        survey.Response_Submitter__c=getContactId;
        
        // Check if improvementComment is provided and not blank
        if (String.isNotBlank(improvementComment)) {
            survey.Imporvement_Comments__c = improvementComment; 
        }
        
        //UserInfo.getUserId()
        if (Schema.sObjectType.Survey_Response__c.fields.Response_Value__c.isCreateable()&&
            Schema.sObjectType.Survey_Response__c.fields.Response_Date_Time__c.isCreateable() &&
            Schema.sObjectType.Survey_Response__c.fields.Name.isCreateable() &&
            Schema.sObjectType.Survey_Response__c.fields.Response_Submitter__c.isCreateable() && 
            Schema.sObjectType.Survey_Response__c.fields.Imporvement_Comments__c.isCreateable() ) {
                insert survey;
            }
        
        return survey.Id;
    }
}