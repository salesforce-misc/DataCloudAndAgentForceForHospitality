/**
* @description : This is Test Class for NextWeekendDateCalculation
* @date        : January 01, 2025
*/

@isTest
private class NextWeekendDateCalculationTest {

    @isTest
    public static void testNextWeekendDates() {
        // Start test execution
        Test.startTest();
        
        // Call the method and capture the response
        List<NextWeekendDateCalculation.Response> responses = NextWeekendDateCalculation.nextWeekendDates();
        
        // Verify the response is not null and contains data
        System.assertNotEquals(null, responses, 'The response should not be null.');
        System.assert(responses.size() > 0, 'The response should have at least one entry.');
        
        // Parse the serialized weekend dates from the response
        List<Date> weekendDates = (List<Date>) JSON.deserialize(responses[0].Prompt, List<Date>.class);
        
        // Verify the list contains exactly two dates (Saturday and Sunday)
        System.assertEquals(2, weekendDates.size(), 'There should be two weekend dates.');
        
        // Verify the first date is a Saturday
        Datetime firstDateTime = Datetime.newInstance(weekendDates[0].year(), weekendDates[0].month(), weekendDates[0].day());
        Integer firstDayOfWeek = Integer.valueOf(firstDateTime.format('u'));
        System.assertEquals(6, firstDayOfWeek, 'The first date should be a Saturday.');
        
        // Verify the second date is a Sunday
        Datetime secondDateTime = Datetime.newInstance(weekendDates[1].year(), weekendDates[1].month(), weekendDates[1].day());
        Integer secondDayOfWeek = Integer.valueOf(secondDateTime.format('u'));
        System.assertEquals(7, secondDayOfWeek, 'The second date should be a Sunday.');
        
        // End test execution
        Test.stopTest();
    }

}