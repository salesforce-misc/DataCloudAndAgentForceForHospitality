/**
* @description : This is Test Class for SendEmail
* @date        : January 02, 2025
*/

@isTest
public class SendEmail_Test {


    @isTest
    static void testEmailSenderForBooking() {
        
          // Creating a stub for Experience_c__dlm object
        SoqlStubProvider stub = new ExperienceSoqlStub();
        Test.createSoqlStub(Experience_c__dlm.sObjectType, stub);
        System.debug('## SoqlStubProvider Created: ' + stub);
        Assert.isTrue(Test.isSoqlStubDefined(Experience_c__dlm.sObjectType),'SOQL Stub should be defined for Experience_c__dlm');

        
        // Creating a test contact
        Contact testContact = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            Email = 'john.doe@example.com'
        );
        insert testContact;
        System.debug('## Contact Created: ' + testContact);

        Datetime refTime = Datetime.newInstance(2024, 7, 19, 11, 0, 0);
        Datetime dayBefore = refTime.addDays(-1);
        Datetime dayAfter = refTime.addDays(1);        

        // Creating a test session (this is required for Booking__c)
        Session__c testSession = new Session__c(
            Date__c = dayAfter.date(),
            Start_Time__c = dayAfter.time()
        );
        insert testSession;
        System.debug('## Session Created: ' + testSession);

        // Creating a test booking record
        Booking__c testBooking = new Booking__c(
            Contact__c = testContact.Id,
            Session__c = testSession.Id
        );
        insert testBooking;
        System.debug('## Booking Created: ' + testBooking);
        
        // Retrieve the test contact and booking
        Contact testContact1 = [SELECT Id, Email FROM Contact WHERE Email = 'john.doe@example.com' LIMIT 1];
        System.debug('## Retrieved Contact: ' + testContact1);
        
        Booking__c testBooking1 = [SELECT Id, Name FROM Booking__c WHERE Contact__c = :testContact.Id LIMIT 1];
        System.debug('## Retrieved Booking: ' + testBooking1);

        // Creating a request with booking details
        SendEmail.Request request = new SendEmail.Request();
        request.contactId = testContact.Id;
        request.bookingId = testBooking.Id;
        System.debug('## Request Object for Booking: ' + request);

        List<SendEmail.Request> requests = new List<SendEmail.Request>{ request };

        // Mocking the send email call by asserting the results of the emailSender method
        Test.startTest();
        List<SendEmail.Response> responses = SendEmail.emailSender(requests);
        Test.stopTest();

        System.debug('## Email Sent Response: ' + responses);

        // Verify the response
        System.assertNotEquals(responses, null);
        System.assertNotEquals(responses[0].Prompt, 'Your booking for the Mountain Adventure experience on ' + Date.today().format() + ' has been successfully created. A confirmation email has been sent to you');
    }

    @isTest
    static void testEmailSenderForExperience() {
        
          // Creating a stub for Experience_c__dlm object
        SoqlStubProvider stub = new ExperienceSoqlStub();
        Test.createSoqlStub(Experience_c__dlm.sObjectType, stub);
        System.debug('## SoqlStubProvider Created: ' + stub);
        Assert.isTrue(Test.isSoqlStubDefined(Experience_c__dlm.sObjectType),'SOQL Stub should be defined for Experience_c__dlm');

        
        // Creating a test contact
        Contact testContact = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            Email = 'john.doe@example.com'
        );
        insert testContact;
        System.debug('## Contact Created: ' + testContact);

        Datetime refTime = Datetime.newInstance(2024, 7, 19, 11, 0, 0);
        Datetime dayBefore = refTime.addDays(-1);
        Datetime dayAfter = refTime.addDays(1);        

        // Creating a test session (this is required for Booking__c)
        Session__c testSession = new Session__c(
            Date__c = dayAfter.date(),
            Start_Time__c = dayAfter.time()
        );
        insert testSession;
        System.debug('## Session Created: ' + testSession);

        // Creating a test booking record
        Booking__c testBooking = new Booking__c(
            Contact__c = testContact.Id,
            Session__c = testSession.Id
        );
        insert testBooking;
        System.debug('## Booking Created: ' + testBooking);
        
        // Retrieve the test contact
        Contact testContact1 = [SELECT Id, Email FROM Contact WHERE Email = 'john.doe@example.com' LIMIT 1];
        System.debug('## Retrieved Contact for Experience: ' + testContact);

        // Creating a request with experience details
        SendEmail.Request request = new SendEmail.Request();
        request.contactId = testContact.Id;
        request.experienceName = new List<String>{ 'Mountain Adventure' };
        System.debug('## Request Object for Experience: ' + request);

        List<SendEmail.Request> requests = new List<SendEmail.Request>{ request };

        // Mocking the send email call by asserting the results of the emailSender method
        Test.startTest();
        List<SendEmail.Response> responses = SendEmail.emailSender(requests);
        Test.stopTest();

        System.debug('## Email Sent Response for Experience: ' + responses);

        // Verify the response
        System.assertNotEquals(responses, null);
        System.assertEquals(responses[0].Prompt, 'Recommended Experience has been sent to you');
    }

    @isTest
    static void testEmailSenderForExperienceWithNoExperienceRecords() {
        
          // Creating a stub for Experience_c__dlm object
        SoqlStubProvider stub = new ExperienceSoqlStub();
        Test.createSoqlStub(Experience_c__dlm.sObjectType, stub);
        System.debug('## SoqlStubProvider Created: ' + stub);
        Assert.isTrue(Test.isSoqlStubDefined(Experience_c__dlm.sObjectType),'SOQL Stub should be defined for Experience_c__dlm');

        
        // Creating a test contact
        Contact testContact = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            Email = 'john.doe@example.com'
        );
        insert testContact;
        System.debug('## Contact Created: ' + testContact);

        Datetime refTime = Datetime.newInstance(2024, 7, 19, 11, 0, 0);
        Datetime dayBefore = refTime.addDays(-1);
        Datetime dayAfter = refTime.addDays(1);        

        // Creating a test session (this is required for Booking__c)
        Session__c testSession = new Session__c(
            Date__c = dayAfter.date(),
            Start_Time__c = dayAfter.time()
        );
        insert testSession;
        System.debug('## Session Created: ' + testSession);

        // Creating a test booking record
        Booking__c testBooking = new Booking__c(
            Contact__c = testContact.Id,
            Session__c = testSession.Id
        );
        insert testBooking;
        System.debug('## Booking Created: ' + testBooking);
        
        // Retrieve the test contact
        Contact testContact1 = [SELECT Id, Email FROM Contact WHERE Email = 'john.doe@example.com' LIMIT 1];
        System.debug('## Retrieved Contact for No Experience: ' + testContact);

        // Creating a request with experience details (no experiences matching)
        SendEmail.Request request = new SendEmail.Request();
        request.contactId = testContact.Id;
        request.experienceName = new List<String>(); // No experiences provided
        System.debug('## Request Object for No Experience: ' + request);

        List<SendEmail.Request> requests = new List<SendEmail.Request>{ request };

        // Mocking the send email call by asserting the results of the emailSender method
        Test.startTest();
        List<SendEmail.Response> responses = SendEmail.emailSender(requests);
        Test.stopTest();

        System.debug('## Email Sent Response for No Experience: ' + responses);

        // Verify the response
        System.assertNotEquals(responses, null);
        System.assertEquals(responses[0].Prompt, 'Recommended Experience has been sent to you');
    }
    
    @isTest
    static void testSendEmail() {
        // Mock a call to send email and verify that it executes properly
        String recipientEmail = 'john.doe@example.com';
        String subject = 'Test Email Subject';
        String emailBody = 'Test Email Body';
        System.debug('## Preparing to Send Email with details: Recipient = ' + recipientEmail + ', Subject = ' + subject + ', Body = ' + emailBody);

        // Invoke the sendEmail method directly
        Test.startTest();
        String result = SendEmail.sendEmail(recipientEmail, subject, emailBody);
        Test.stopTest();

        System.debug('## Email Send Result: ' + result);

        // Verifying that the result is a success message
        System.assertEquals(result, 'Email Sent Succesfully');
    }

    class ExperienceSoqlStub extends SoqlStubProvider {
        public override List<sObject> handleSoqlQuery(sObjectType sot, string stubbedQuery, Map<string, object> bindVars) {
            
            Assert.areEqual(Experience_c__dlm.sObjectType, sot);
            System.debug('Handling SOQL Query: ' + stubbedQuery);
            
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