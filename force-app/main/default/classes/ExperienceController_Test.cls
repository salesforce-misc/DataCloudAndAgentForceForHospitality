/*
Description: This testclass is used for code coverage of ExperienceController class
date       : January 01, 2025
*/

@isTest
private class ExperienceController_Test {
    @isTest
    static void getExperienceSessionsForDate_works() {
        // Create test experience record 
        Experience__c experience = new Experience__c(
            Name = 'Sample experience'
        );
        insert experience;

        Datetime refTime = Datetime.newInstance(2024, 7, 19, 11, 0, 0);
        Datetime dayBefore = refTime.addDays(-1);
        Datetime dayAfter = refTime.addDays(1);
        
        // Create test session records  
        List<Session__c> allSessions = new List<Session__c>{
            new Session__c(
                Experience__c = experience.Id,
                Date__c = dayBefore.date(),
                Start_Time__c = dayBefore.time()
            ),
            new Session__c(
                Experience__c = experience.Id,
                Date__c = refTime.date(),
                Start_Time__c = refTime.time()
            ),
            new Session__c(
                Experience__c = experience.Id,
                Date__c = dayAfter.date(),
                Start_Time__c = dayAfter.time()
            ),
            new Session__c(
                Experience__c = experience.Id,
                Date__c = refTime.date(),
                Start_Time__c = refTime.addHours(-2).time()
            )
        };
        insert allSessions;

        Test.startTest();
        List<Session__c> todaySessions = ExperienceController.getExperienceSessionsForDate(
            experience.Id,
            refTime.getTime()
        );
        Test.stopTest();
        Assert.areEqual(2, todaySessions.size());
        Assert.areEqual(
            allSessions[3].Id,
            todaySessions[0].Id,
            'Sessions are not ordered by start time'
        );
        Assert.areEqual(allSessions[1].Id, todaySessions[1].Id);
    }

    @isTest
    static void testGetExperienceSessionRecordsForPast(){
         // Create test Contact record
        Contact testCon = new Contact(
            LastName='Test Contact',
            Interest1__c ='Golf',
            Interest2__c='Swimming Pools',
            Interest3__c='Fitness & Exercise'
        );
        insert testCon;
        
        // Test method execution
        Test.startTest();
        List<Session__c> result = ExperienceController.getExperienceSessionRecordsForPast(testCon);
        List<Experience_Session__dlm> expForUpcoming = ExperienceController.getExperienceSessionRecordsForUpcoming(testCon);
        List<Experience_c__dlm> expExperienceRecords = ExperienceController.getExperienceRecords(testCon);
        List<Booking__dlm> bookingRecords = ExperienceController.getExperienceBookingsRecords(testCon);
        Test.stopTest();
       

        
        
       
    }
    @isTest
        static void testGetExperiences(){
            Experience__c exp1 = new Experience__c(
                Name = 'Experience',
                Type__c = 'Hiking'                
            );
            insert exp1;
            // Test method execution
            Test.startTest();
            ExperienceController.PagedResult response = ExperienceController.getExperiences('Hiking',1);
            Test.stopTest();
    
            }
        
}