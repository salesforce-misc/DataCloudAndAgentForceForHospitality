/**
 * @description       : 
 * @author            : Aman Patil
 * @group             : 
 * @last modified on  : 03-20-2025
 * @last modified by  : Aman Patil
**/
public without sharing class ClsRelatedListController {
    public ClsRelatedListController() {
 
    }
    @AuraEnabled(cacheable=true)
    public static List<POS_Transaction__dlm> getPOSTransactionRecords(String ExternalId) {
        // Query POS_Transaction__dlm and join with Contact based on Ext_id and CustomerId
        List<POS_Transaction__dlm> transactions = [
            SELECT itemname__c, transactionid__c, customerid__c, date__c, totalprice__c, 
            paymentmethod__c
            FROM POS_Transaction__dlm WHERE  customerid__c=:ExternalId
           
        ];

        return transactions;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Third_Party_Survey__dlm> getSurveyRecords(String email) {
        // Query Third_Party_Survey__dlm records where Email__c matches the provided email
        List<Third_Party_Survey__dlm> surveys = [
            SELECT Id, Email__c, Q2_Comment__c, Q1_Likely_to_Recommend__c 
            FROM Third_Party_Survey__dlm
            WHERE Email__c = :email
        ];

        return surveys;
    }
    
   @AuraEnabled(cacheable=true)
    public static List<IOT_Transaction__dlm> getIotTransactionRecords(String ExternalId){
        
        List<IOT_Transaction__dlm> iotTransactionsList = [Select guestid__c,guestname__c,phonenumber__c,roomnumber__c,keyid__c,access_date__c from
                                                     IOT_Transaction__dlm where guestid__c = :ExternalId];
        return iotTransactionsList;
    }
}
