/**
* @description : This is Test Class for PersonalizedExperiencesBooking
* @date        : January 01, 2025
*/
@isTest
public class PersonalizedExperiencesBooking_Test {
    @IsTest
    public static void mockSoql() {
        
        //SoqlStubProvider stub = new UnifiedIndividualSoqlStub();
        SoqlStubProvider stub = new BookingdlmSoqlStub();
        Test.createSoqlStub(Booking__dlm.sObjectType, stub);
        
        //SObjectType type = queryIssueUtil.getSObjectTypeForDynamicSoql('GithubIssues__x');
        //Test.createSoqlStub(type, new IssueStubProvider());
        
        Assert.isTrue(Test.isSoqlStubDefined(Booking__dlm.sObjectType));
        
        Test.startTest();
        Contact con= New Contact(LastName='TestContact');
        insert con;
        
        PersonalizedExperiencesBooking.Request flowinp = new PersonalizedExperiencesBooking.Request();
        flowinp.myContact = con;
        // Add the request to a list
        List<PersonalizedExperiencesBooking.Request> requestList = new List<PersonalizedExperiencesBooking.Request>{ flowinp };
            
            List<PersonalizedExperiencesBooking.Response> members = PersonalizedExperiencesBooking.getGuestExperienceBookings(requestList);
        
        Test.stopTest();
        
        Assert.areEqual(1, members.size());
        
        //SkyMilesMember member = members[0];
        
        //Assert.areEqual(companyId, member.CompanyId);
        //Assert.areEqual(5000, member.SkyMilesBalance);
    }
    
    class BookingdlmSoqlStub extends SoqlStubProvider {
        public override List<sObject> handleSoqlQuery(sObjectType sot, string stubbedQuery, Map<string, object> bindVars) {
            
            Assert.areEqual(Booking__dlm.sObjectType, sot);
            
            // Stub assumes that the SOQL query is searching for a single record by company id
            //Contact con= New Contact(LastName='TestContact1');
            //insert con;
            
            string conId = '0034W00003ZIRIiQAP';
            if(bindVars.containsKey('tmpVar1')) {
                conId = (string)bindVars.get('tmpVar1');
            }
            
            List<SObject> objs = new List<SObject>();
            Map<String, Object> bookingMap = new Map<String, Object> {
                'Experience_Name__c' => 'White Water Rafting Rush',
                    'Contact_c__c' => conId,
                    'Type__c' => 'Adventure Activities'
                    };
                        
            Booking__dlm obj = (Booking__dlm) Test.createStubQueryRow(sot, bookingMap);
            objs.add(obj);
            return objs;  
            
        }
    }
}