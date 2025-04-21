public class NextWeekendDateCalculation {
    
     @InvocableMethod
    public static List<Response>  nextWeekendDates(){ 
		        
        List<Date> weekendDates =  new List<Date>();
        Date today = Date.today();
        /*Datetime dt = Datetime.newInstance(today.year(), today.month(), today.day());
        Integer dayOfWeek = Integer.valueOf(dt.format('u'));
        system.debug('dayOfWeek:'+dayOfWeek);
        system.debug('dt:'+dt);
        Integer daysUntilSaturday;
        if (dayOfWeek == 6) { daysUntilSaturday = 0; } else { daysUntilSaturday = 6 - dayOfWeek; }
        Date nextSaturday = today.addDays(daysUntilSaturday) + 7;
        Date nextSunday = nextSaturday.addDays(1);
        system.debug('daysUntilSaturday:'+daysUntilSaturday);
        system.debug('nextSaturday:'+nextSaturday);
        system.debug('nextSunday:'+nextSunday);
        weekendDates.add(nextSaturday);
         weekendDates.add(nextSunday);*/
        Integer dayOfWeeks = (today.toStartOfWeek().daysBetween(today) + 1);
        Integer daysToNextSaturday = (7 - dayOfWeeks) + 7;
        Date checkInDate = today.addDays(daysToNextSaturday);
        weekendDates.add(checkInDate);
        Date checkOutDate = checkInDate.addDays(1);
        weekendDates.add(checkOutDate);
        System.debug('## checkInDate = '+checkInDate);
        System.debug('## checkOutDate = '+checkOutDate);
        
        
         List<Response> responses = new List<Response>();
        Response res = new Response();
        System.debug('## Weekend date serialize = '+JSON.serialize(weekendDates));
        res.Prompt = JSON.serialize(weekendDates);
        responses.add(res);
        return responses;
        
       // return weekendDates;
    }
    
     public class Response {
        @InvocableVariable
        public String Prompt;
    }
}