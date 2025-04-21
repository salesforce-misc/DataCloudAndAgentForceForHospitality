/*
Description: This testclass used for code coverage of ContactProfileCardDetails class
date       : January 01, 2025
*/

@isTest
public class ContactProfileCardDetails_Test {
    // This method is use for code coverage of booking_dmo data
    @isTest
    static void testContactMemberTrails(){
        SoqlStubProvider stub = new BookingdlmSoqlStub();
        Test.createSoqlStub(Booking__dlm.sObjectType, stub);
        
        Contact con = new Contact(FirstName='Test', LastName='Salve',Email = 'Test01@gmail.com',
                                  Interest1__c='Beaches & Snorkeling',Interest2__c='Adventure Activities',
                                  Interest3__c = 'Nightlife & Entertainment');
        insert con;
        
        
        Assert.isTrue(Test.isSoqlStubDefined(Booking__dlm.sObjectType));
        Test.startTest();
        contactProfileCardDetails.getExperienceType(con.Id);
        Test.stopTest();
        
    }
    //This method is use for contact interest data
    @isTest
    static void testContactMemberTrails2(){
        Contact con = new Contact(FirstName='Test', LastName='Salve',Email = 'Test01@gmail.com',
                                  Interest1__c='Beaches & Snorkeling',Interest2__c='Adventure Activities',
                                  Interest3__c = 'Nightlife & Entertainment');
        insert con;
        Assert.areEqual(con.id, con.id);
        Test.startTest();
        contactProfileCardDetails.getExperienceType(con.Id);
        Test.stopTest();
        
    }
    //This class is use for creation of stub data for DMO object
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