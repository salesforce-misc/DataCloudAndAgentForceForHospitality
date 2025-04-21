/**
* @description : This class handles the logic for sending mails for Booking confirmation and Experiences.
* @date        : December 25, 2024
*/

public with sharing class SendEmail {
    
    // The invocable method
    @InvocableMethod(label='Send Email to Recipients')
    public static List<Response> emailSender(List<Request> requests) {
        System.debug('## requests = '+requests);
        String emailResponse = '';
        List<Response> responses = new List<Response>();
        Response res = new Response();
        if(requests != null && !requests.isEmpty()){
            if (requests[0].bookingId != null && requests[0].contactId != null) {
                emailResponse = setEmailForBooking(requests[0].bookingId, requests[0].contactId);               
            }
            if (requests[0].experienceName != null && requests[0].contactId != null && (requests[0].bookingId == '' || requests[0].bookingId == null)) {
                emailResponse = setEmailForExperience(requests[0].experienceName, requests[0].contactId);               
            }
        }
        res.Prompt = emailResponse;
        responses.add(res);
        return responses;
		        
    }   
    
    public static String sendEmail(String recipientEmail, String subject, String emailBody){
        System.debug('## recipientEmail = '+recipientEmail + ' ## subject = '+subject + ' ## emailBody = '+emailBody);
        OrgWideEmailAddress[] owea = [select Id,DisplayName from OrgWideEmailAddress where DisplayName = 'Default Email'];
        
        
        String response = '';
        List<String> recipientEmails = new List<String>();
        recipientEmails.add(recipientEmail);
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        if ( owea.size() > 0 ) {
            email.setOrgWideEmailAddressId(owea.get(0).Id);
        }
        // Set the recipient IDs (this assumes you have valid email addresses in recipientIds)
        email.setToAddresses(recipientEmails);
        // Set the subject of the email
        email.setSubject(subject);
        
        // Set the body of the email
        //email.setPlainTextBody(emailBody);
  		email.setHTMLBody(emailBody);
        // Send the email
        Messaging.sendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        
        for(Messaging.sendEmailResult result : results){
            if(result.isSuccess()){
                response = 'Email Sent Succesfully';
            }else{
                response = 'Failed to Send Email';
            }
        }
        return response;
    }
    
    // Method to handle Booking records and set the email body
    public static string setEmailForBooking(String bookingId,String contactId) {
        System.debug('## bookingId = '+bookingId + ' ## contactId = '+contactId);
        String response = '';
        List<Booking__c> bookingRecord = new List<Booking__c>();
       	bookingRecord = [Select Id,Experience_Name__c,Name,Date__c,End_Time__c,Start_Time__c,Contact__c,Contact__r.Email,Contact__r.Name from Booking__c Where Id=: bookingId and Contact__c=: contactId Order By CreatedDate DESC Limit 1]; //
        if(bookingRecord.isEmpty()){
            bookingRecord = [Select Id,Experience_Name__c,Name,Date__c,End_Time__c,Start_Time__c,Contact__c,Contact__r.Email,Contact__r.Name from Booking__c Where Contact__c=: contactId Order By CreatedDate DESC Limit 1];
        }
        System.debug('## bookingRecord = '+bookingRecord);
        if(!bookingRecord.isEmpty()){
			String bookingEmailBody = 'Hello ' + bookingRecord[0].Contact__r.Name + ',<br><br>';
            //bookingEmailBody += 'Your booking has been successfully created for '+ bookingRecord[0].Experience_Name__c + '.<br><br>';
            bookingEmailBody += 'Your booking has been successfully created.<br><br>';
            bookingEmailBody +=  'Booking Number: ' + bookingRecord[0].Name + '<br>';
			bookingEmailBody += 'Booking Date: ' + bookingRecord[0].Date__c +'<br>';
			bookingEmailBody += 'Start Time: ' + bookingRecord[0].Start_Time__c+ '<br>';
			bookingEmailBody += 'End Time: '+bookingRecord[0].End_Time__c +'<br><br>';
            bookingEmailBody += '<br>Thanks';
            System.debug('## bookingEmailBody = '+bookingEmailBody);
            // Add additional fields or formatting for Booking if needed
            if(bookingEmailBody != null){
                response = sendEmail(bookingRecord[0].Contact__r.Email, 'Your booking is successfully completed',bookingEmailBody);
            }
            if(response == 'Email Sent Succesfully'){
                DateTime myDateTime = DateTime.now(); 
				String formattedDateTime = myDateTime.format('yyyy-MM-dd');
                response = 'Your booking for the'+ bookingRecord[0].Experience_Name__c + ' experience on '+ formattedDateTime + 'has been successfully created. A confirmation email has been sent to you';
            }
        }
        return response;
    }
    
    // Method to handle Experience or other SObjects and set the email body
    public static String setEmailForExperience(List<String> experienceName,String contactId) {
        System.debug('## experienceName = '+experienceName + ' ## contactId = '+contactId);
        String response = '';
        Contact con = [Select Id,Name,Email,Interest1__c,Interest2__c,Interest3__c from Contact Where Id =: contactId];
        List<Experience_c__dlm> experienceRecords = new List<Experience_c__dlm>();
        if(experienceName != null){
            experienceRecords = [Select Id,Price_c__c,Name__c,Duration_Hours_c__c,Activity_Level_c__c,Type_c__c  from Experience_c__dlm Where Name__c IN: experienceName];
        }else{
        	//experienceRecords = [Select Id,Price_c__c,Name__c,Duration_Hours_c__c,Activity_Level_c__c,Type_c__c  from Experience_c__dlm Where Type_c__c =: con.Interest1__c or Type_c__c =: con.Interest2__c or Type_c__c =: con.Interest3__c];
        	experienceRecords = [Select Id,Price_c__c,Name__c,Duration_Hours_c__c,Activity_Level_c__c,Type_c__c  from Experience_c__dlm Where Type_c__c IN ('Adventure Activities')];
        }
        
        system.debug('Experience Records' + experienceRecords);
            if(!experienceRecords.isEmpty()){    
            String experinceEmailBody = 'Hello ' + con.Name + ',<br><br>';
            experinceEmailBody += 'Below are the experience details:-<br><br>';
            Integer index = 1;
            Map<String,String> slist = new Map<String,String>();
            slist.put('Coastal Kayak Excursion','https://www.acadiafun.com/');
            slist.put('Canyon Zip Line Excursion','https://www.zipthecanyons.com/');
            slist.put('Thermal Spring Rejuvenation','https://vandaracostarica.com/blog/healing-waters-hot-springs-benefits-for-the-mind-body-and-soul/');
            slist.put('White Water Rafting Rush','https://coloradowhitewaterrafting.com/top-10-reasons-whitewater-rafting-is-the-perfect-date/');
            slist.put('Beach Yoga Retreat','https://www.healthandfitnesstravel.com/blog/best-beach-retreats-for-yoga-lovers/');

            if(!experienceRecords.isEmpty()){
                for(Experience_c__dlm exp : experienceRecords){
                    //experinceEmailBody += index + '. '+ exp.Name__c + ': ' + exp.Price_c__c + '| ' + exp.Duration_Hours_c__c + '| ' + exp.Activity_Level_c__c +'\n\n';
                    String hotelURL = slist.get(exp.Name__c);
                    if(hotelURL == null){
                        hotelURL = slist.get('Coastal Kayak Excursion');
                    }
                    experinceEmailBody += index + '. '+ '<a href="'+hotelURL+'" target="_blank">'+exp.Name__c+ '</a>'+ ': $' + Integer.valueOf(exp.Price_c__c) + '.00 | ' + Integer.valueOf(exp.Duration_Hours_c__c) + ' hours | ' + exp.Activity_Level_c__c + + ' activity'+'<br><br>';
                	index++;
                }
            }
                
                 system.debug('Experience Email body before' + experinceEmailBody);
            if(experinceEmailBody != null){
                experinceEmailBody += '<br>Thanks';
            }
            System.debug('## experinceEmailBody = '+experinceEmailBody);
            if(experinceEmailBody != null){
                
                response = sendEmail(con.Email, 'Available Activities in the Hotel Area',experinceEmailBody);
            }
            if(response == 'Email Sent Succesfully'){                
                response = 'Recommended Experience has been sent to you';
            }
        }
        return response;
    }

    // Request class for Invocable Method to accept parameters from Flow
    public class Request {            
        @InvocableVariable(label='Contact')
        public String contactId;
        
        @InvocableVariable(label='Booking')
        public String bookingId;
        
        @InvocableVariable(label='Experience')
        public List<String> experienceName;
    }
    
    public class Response {
        @InvocableVariable
        public String Prompt;
    }
}