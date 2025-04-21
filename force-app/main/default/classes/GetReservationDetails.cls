/**
* @description : This class handles the logic for displaying a list of current reservations.
* @date        : December 24, 2024
*/


public with sharing class GetReservationDetails {
    @InvocableMethod(label='Get reservation details')
    public static List<Response> getReservations(List<Request> requests) {
        /*Id userId = userInfo.getUserId();
        System.debug('## userId = '+userId);
        String userName = userInfo.getUserName();
        System.debug('## userName = '+userName);
        String userEmail = userInfo.getUserEmail();
        System.debug('## userEmail = '+userEmail);*/
        Request input = requests[0];
        String conid = input.contactId;
        List<Reservation__c> reservationRecords = new List<Reservation__c>();
        List<Reservation__dlm> reservationsDMORecored = new List<Reservation__dlm>();
        if (conid!=null){
            reservationsDMORecored = UpcomingReservationDMORecord(conid);
        }
        if(reservationsDMORecored.isEmpty()){
            reservationRecords = UpcomingReservationRecord(conid);
        }        
		System.debug('## reservationsDMORecored = '+reservationsDMORecored + ' ' + '## reservationRecords = '+reservationRecords);
        // Create expected response
        List<Response> responses = new List<Response>();
        Response res = new Response();
        if(!reservationsDMORecored.isEmpty() && reservationsDMORecored != null){
            res.prompt = JSON.serialize(reservationsDMORecored);
        }else if(!reservationRecords.isEmpty() && reservationRecords != null){
            res.prompt = JSON.serialize(reservationRecords);
        }        
        responses.add(res);
        System.debug('## responses = '+responses);
        return responses;
    }
     
    public static List<Reservation__dlm> UpcomingReservationDMORecord(String conid)
    {       
        List<Reservation__dlm> listOfReservations = [
            SELECT Id,Contact_c__c,Check_in_Date_c__c,Reservation_Status_c__c,Id__c,Name__c,Room_Type_c__c,
           	Check_out_Date_c__c,Payment_Status_c__c,Total_Amount_c__c,Special_Request_c__c
            FROM Reservation__dlm where Contact_c__c!=null and Contact_c__c=:conid and Reservation_Status_c__c!='Completed' and Reservation_Status_c__c!='Cancelled' and Reservation_Status_c__c!='Confirmed' and Check_in_Date_c__c=TODAY 
            ORDER BY CreatedDate__c DESC
            LIMIT 1
        ];        
        return listOfReservations;    
    } 
    
    public static List<Reservation__c> UpcomingReservationRecord(String conid)
    {      
        List<Reservation__c> listOfReservations = [
            SELECT Id,Contact__c,Check_in_Date__c,Reservation_Status__c,Name,Room_Type__c,
           	Check_out_Date__c,Payment_Status__c,Total_Amount__c,Special_Request__c
            FROM Reservation__c where Contact__c!=null and Contact__c=:conid and Reservation_Status__c!='Completed' and Reservation_Status__c!='Cancelled' and Reservation_Status__c!='Confirmed' and Check_in_Date__c=TODAY 
            ORDER BY CreatedDate DESC
            LIMIT 1
        ];
        return listOfReservations;      
    } 
    
    // The variables in this class need to match the prompt template inputs,
    // that may be different on each prompt template
    public class Request {
        @InvocableVariable
        public String contactId;         
    }

    public class Response {
        @InvocableVariable
        public String Prompt;
    }
    
      
}