/**
* @description : This is Test Class for PersonalizedExperiences
* @date        : January 02, 2025
*/

@isTest
public class PersonalizedExperiences_Test {
    
    @IsTest
    public static void mockSoql() {
        
        SoqlStubProvider stub = new ExperienceSoqlStub();
        Test.createSoqlStub(Experience_c__dlm.sObjectType, stub);
        
        Assert.isTrue(Test.isSoqlStubDefined(Experience_c__dlm.sObjectType));
        
        Test.startTest();
        Contact con= New Contact(FirstName='Test3', LastName='Contact');
        insert con;
        
        PersonalizedExperiences.Request reqExp = new PersonalizedExperiences.Request();
        reqExp.myContact = con;
        // Add the request to a list
        List<PersonalizedExperiences.Request> requestList = new List<PersonalizedExperiences.Request>{ reqExp };
            
            List<PersonalizedExperiences.Response> members = PersonalizedExperiences.getGuestExperiences(requestList);
        
        Test.stopTest();
        
        Assert.areEqual(1, members.size());
    }
    
    class ExperienceSoqlStub extends SoqlStubProvider {
        public override List<sObject> handleSoqlQuery(sObjectType sot, string stubbedQuery, Map<string, object> bindVars) {
            
            Assert.areEqual(Experience_c__dlm.sObjectType, sot);
            
            // Stub assumes that the SOQL query is searching for a single record by company id
            
          /*  string conId = '0034W00003ZIRIiQAP';
            if(bindVars.containsKey('tmpVar1')) {
                conId = (string)bindVars.get('tmpVar1');
            }*/
            
            List<SObject> objs = new List<SObject>();
            Map<String, Object> ExperiencesMap = new Map<String, Object> {
                'Type_c__c' => 'Beaches & Snorkeling',
                    'Name__c' => 'Sunset Beach Walk',
                    'Price_c__c' => 50,
                    'Activity_Level_c__c' => 'Medium',
                    'Duration_Hours_c__c' => 3,
                    'Capacity_c__c' => 30
                    };             
             Experience_c__dlm obj = (Experience_c__dlm) Test.createStubQueryRow(sot, ExperiencesMap);
            objs.add(obj);
            system.debug('obj'+obj);
            return objs;  
            
        }
    }
    
}