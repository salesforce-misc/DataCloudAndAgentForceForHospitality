@isTest
public class PersonalizedExperiencesSession_Test {

     @IsTest
    public static void mockSoql() {
        SoqlStubProvider stub = new ExperienceSessionSoqlStub();
          Test.createSoqlStub(Experience_Session__dlm.sObjectType, stub);
        
        Assert.isTrue(Test.isSoqlStubDefined(Experience_Session__dlm.sObjectType));
        
        Test.startTest();
        Contact con= New Contact(FirstName='Test1', LastName='Salve',Email = 'Test01@gmail.com');
        insert con;
        
        PersonalizedExperiencesSession.Request req = new PersonalizedExperiencesSession.Request();
        req.myContact = con;
        // Add the request to a list
        List<PersonalizedExperiencesSession.Request> requestList = new List<PersonalizedExperiencesSession.Request>{ req };
            
        List<PersonalizedExperiencesSession.Response> members = PersonalizedExperiencesSession.getGuestExperiences(requestList);
        
        //
        GetSessionDetails.Request req1 = new GetSessionDetails.Request();
        req1.contactId = con.Id;
        req1.experienceName = 'Outdoor Movie Night';
        // Add the request to a list
        List<GetSessionDetails.Request> requestList1 = new List<GetSessionDetails.Request>{ req1 };
            
        List<GetSessionDetails.Response> members1 = GetSessionDetails.getSessions(requestList1);
        
        Test.stopTest();
        
        Assert.areEqual(1, members.size());
        
    }
    
     class ExperienceSessionSoqlStub extends SoqlStubProvider {
        public override List<sObject> handleSoqlQuery(sObjectType sot, string stubbedQuery, Map<string, object> bindVars) {
      
            Assert.areEqual(Experience_Session__dlm.sObjectType, sot);
             string expId = 'a044W00000wtXSuQAM';
            
            List<SObject> objs = new List<SObject>();
            
            Map<String, Object> ExperienceSessionMap = new Map<String, Object> {
                'Name__c' => 'S-00004428',
                'Date__c' => system.today(),
                'Start_Time__c' => '03:15:00.000Z',
                'End_Time__c' =>  '05:15:00.000Z',
                'Experience__c' => expId
            }; 
            
             Experience_Session__dlm expSession = (Experience_Session__dlm) Test.createStubQueryRow(sot, ExperienceSessionMap);
            objs.add(expSession);
            return objs;  
            
        }
    }
}