/*
Description: This testclass used for code coverage of GetReservationDetails class
date       : December 31, 2024
*/

@isTest
public class GetReservationDetails_Test {

    // Test for "Current" reservations
    @isTest
    static void testGetReservationsForCurrent() {
        // Step 1: Create test Contact record
        Contact testContact = new Contact(
            FirstName = 'Test',
            LastName = 'Contact',
            Email = 'test.contact@example.com'
        );
        insert testContact;
        System.debug('Test Contact created with ID for current: ' + testContact.Id);

        // Step 2: Prepare the Request object for "Current" reservations
        GetReservationDetails.Request request = new GetReservationDetails.Request();
        request.contactId = testContact.Id;
        System.debug('Request object created with Contact IDfor current: ' + request.contactId);

        // Step 3: Set up the SOQL stub to mock data for "Current" reservations
        SoqlStubProvider stub = new ReservationSoqlStub();
        Test.createSoqlStub(Reservation__dlm.sObjectType, stub);
        
        // Assert that the SOQL stub is defined for Reservation__dlm
        Assert.isTrue(Test.isSoqlStubDefined(Reservation__dlm.sObjectType), 'SOQL Stub should be defined for Reservation__dlm');
        
        // Step 4: Call the getReservations method
        Test.startTest();
        List<GetReservationDetails.Request> requests = new List<GetReservationDetails.Request>{request};
        List<GetReservationDetails.Response> responses = GetReservationDetails.getReservations(requests);
        List<Reservation__c> upcomingReserv = GetReservationDetails.UpcomingReservationRecord(testContact.Id);
        
        Test.stopTest();
        
        System.debug('getReservations method called. Number of responses for current: ' + responses.size());

        // Step 5: Assert the results for "Current" reservations
        System.assertEquals(responses.size(), 1, 'There should be one response for current reservations.');
        System.debug('First current response prompt: ' + responses[0].Prompt);

        // Assert that the prompt contains serialized reservation data
        System.assert(responses[0].Prompt.contains('Check_in_Date_c__c'), 'Prompt should contain check-in date information.');
    }

    // Define the SOQL stub class to mock the query for Reservation__dlm
    class ReservationSoqlStub extends SoqlStubProvider {
        public override List<sObject> handleSoqlQuery(sObjectType sot, string stubbedQuery, Map<string, object> bindVars) {
            // Ensure that the correct sObject type (Reservation__dlm) is being queried
            Assert.areEqual(Reservation__dlm.sObjectType, sot, 'The sObject type should be Reservation__dlm');
            System.debug('SOQL query being executed: ' + stubbedQuery);
            
            // Retrieve the Contact ID from the bindVars map
            String conId = (String)bindVars.get('tmpVar1');
            System.debug('bindvars debug' +bindVars);
            System.debug('Contact ID for reservation query: ' + conId);
            
            // Create mock data based on the 'ReservationFor' filter (Current)
            List<SObject> objs = new List<SObject>();
            
              
                // Mock data for "Current" reservations
                Map<String, Object> reservationMap = new Map<String, Object> {
                    
                    'Contact_c__c' => conId,
                    'Reservation_Status_c__c'=>'Pending',
                    'Check_in_Date_c__c' => Date.today().addDays(1)
                };
                Reservation__dlm reservation = (Reservation__dlm) Test.createStubQueryRow(sot, reservationMap);
                objs.add(reservation);
                System.debug('Mock reservation created for Contact ID ' + conId + ': ' + reservation);
                        
               
            return objs;
        }
    }
}