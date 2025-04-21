/*
Description: This testclass is used for code coverage of ActivityFeedController class
date       : January 01, 2025
*/

@isTest
public class ActivityFeedController_Test {

    @isTest
    public static void testGetRecentBookings() {
        // Set up the SOQL Stub
        SoqlStubProvider stub = new BookingdlmSoqlStub();
        Test.createSoqlStub(Booking__dlm.sObjectType, stub);
        
        // Assert that the SOQL stub is defined for the Booking__dlm sObject
        System.debug('Checking if the SOQL Stub is defined for Booking__dlm...');
        Assert.isTrue(Test.isSoqlStubDefined(Booking__dlm.sObjectType), 'SOQL Stub should be defined for Booking__dlm');
        
        // Start the test context
        Test.startTest();
        
        // Create and insert a test Contact record
        Contact con = new Contact(LastName = 'TestContact');
        insert con;
        System.debug('Inserted Contact ID: ' + con.Id);
        
        // Call the method to get recent bookings for the inserted contact
        System.debug('Calling ActivityFeedController.GetRecentBookings with Contact ID: ' + con.Id);
        List<Booking__dlm> recentBookings = ActivityFeedController.GetRecentBookings(con.Id);
        
        // End the test context
        Test.stopTest();
        
        // Assert that the method returned the expected number of results
        System.debug('Number of recent bookings returned: ' + recentBookings.size());
        Assert.areEqual(1, recentBookings.size(), 'There should be exactly one recent booking returned.');
        
        // Assert the values in the mock result
        System.debug('Recent booking Experience Name: ' + recentBookings[0].Experience_Name__c);
        Assert.areEqual('White Water Rafting Rush', recentBookings[0].Experience_Name__c, 'The experience name should match.');
        
        System.debug('End of testGetRecentBookings');
    }
    
    @isTest
    public static void testGetDiningBookings() {
        // Set up the SOQL Stub
        SoqlStubProvider stub = new BookingdlmSoqlStub();
        Test.createSoqlStub(Booking__dlm.sObjectType, stub);
        
        // Assert that the SOQL stub is defined for the Booking__dlm sObject
        System.debug('Checking if the SOQL Stub is defined for Booking__dlm...');
        Assert.isTrue(Test.isSoqlStubDefined(Booking__dlm.sObjectType), 'SOQL Stub should be defined for Booking__dlm');
        
        // Start the test context
        Test.startTest();
        
        // Create and insert a test Contact record
        Contact con = new Contact(LastName = 'TestContact');
        insert con;
        System.debug('Inserted Contact ID: ' + con.Id);
        
        // Call the method to get dining bookings for the inserted contact
        System.debug('Calling ActivityFeedController.GetDiningBookings with Contact ID: ' + con.Id);
        List<Booking__dlm> diningBookings = ActivityFeedController.GetDiningBookings(con.Id);
        
        // End the test context
        Test.stopTest();
        
        // Assert that the method returned the expected number of results
        System.debug('Number of dining bookings returned: ' + diningBookings.size());
        Assert.areEqual(1, diningBookings.size(), 'There should be exactly one dining booking returned.');
        
        // Assert the values in the mock result
        System.debug('Dining booking Experience Name: ' + diningBookings[0].Experience_Name__c);
        Assert.areEqual('Dining Experience', diningBookings[0].Experience_Name__c, 'The experience name should match the mock data.');
        
        System.debug('End of testGetDiningBookings');
    }

    // Define the SOQL stub class to mock the query for Booking__dlm
    class BookingdlmSoqlStub extends SoqlStubProvider {
        public override List<sObject> handleSoqlQuery(sObjectType sot, string stubbedQuery, Map<string, object> bindVars) {
            System.debug('Handling SOQL Query: ' + stubbedQuery);
            
            // Ensure that the correct sObject type (Booking__dlm) is being queried
            Assert.areEqual(Booking__dlm.sObjectType, sot, 'The sObject type should be Booking__dlm');
            System.debug('Querying Booking__dlm with the bind variable: ' + bindVars);
            
            // Retrieve the Contact ID from the bindVars map (for GetRecentBookings and GetDiningBookings)
            String conId = (String)bindVars.get('tmpVar1');
            System.debug('Contact ID from bindVars: ' + conId);
            
            if (String.isEmpty(conId)) {
                // Default to a known contact ID if no binding variable is passed
                conId = '0034W00003ZIRIiQAP'; // Use a valid Salesforce contact ID or mock ID
                System.debug('Using default Contact ID: ' + conId);
            }
            
            // Create mock Booking__dlm records based on the stubbed query type
            List<SObject> objs = new List<SObject>();
            
            // Mock data for dining booking (assuming Type__c = 'Dining Experiences')
            if (stubbedQuery.contains('AND Type__c = \'Dining Experiences\'')) {
                System.debug('Creating mock data for dining booking...');
                Map<String, Object> bookingMap = new Map<String, Object> {
                    'Experience_Name__c' => 'Dining Experience',
                    'Contact__c' => conId,
                    'Type__c' => 'Dining Experiences',
                    'Booking_Date__c' => Date.today().addDays(-1)
                };
                Booking__dlm obj = (Booking__dlm) Test.createStubQueryRow(sot, bookingMap);
                objs.add(obj);
                System.debug('Mocked dining booking added: ' + obj);
            }
            else{
                System.debug('Creating mock data for recent booking...');
                Map<String, Object> bookingMap = new Map<String, Object> {
                    'Experience_Name__c' => 'White Water Rafting Rush',
                    'Contact__c' => conId,
                    'Type__c' => 'Adventure Activities',
                    'Booking_Date__c' => Date.today().addDays(-1)
                   // 'Start_Time__c' => Time.newInstance(10, 0, 0, 0),
                   // 'End_Time__c' => Time.newInstance(12, 0, 0, 0)
                };
                Booking__dlm obj = (Booking__dlm) Test.createStubQueryRow(sot, bookingMap);
                objs.add(obj);
                System.debug('Mocked recent booking added: ' + obj);
            }
            
            
            System.debug('Returning mocked data: ' + objs);
            return objs;  
        }
    }
}