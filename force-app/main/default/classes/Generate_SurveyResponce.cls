public class Generate_SurveyResponce {
    @InvocableMethod(label='Generate survey responce records' description='Generate records survey responce objects.')
    public static void generateSurveyResponce() {
        try{
    // Query inserted Contacts
        Map<String, Contact> contactMap = new Map<String, Contact>();
        for (Contact contact : [SELECT Id, FirstName, LastName FROM Contact WHERE Email LIKE '%dataclouddemo.com%' or Email = 'marjecroley@example.com']) {
            contactMap.put(contact.FirstName, contact);
        }
        System.debug(contactMap + ' Contact Map');

        List<Survey_Response__c> SurveyResponses = new List<Survey_Response__c>();
        
        Survey_Response__c SR01 = new Survey_Response__c(Name = 'Customer Survey Form', Response_Submitter__c = contactMap.get('Will').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR01);
        Survey_Response__c SR02 = new Survey_Response__c(Name = 'Overall Service', Response_Submitter__c = contactMap.get('Will').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR02);
        Survey_Response__c SR03 = new Survey_Response__c(Name = 'Housekeeping', Response_Submitter__c = contactMap.get('Will').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Neutral', Survey_Weight__c = 3, Rating_Value__c = 3); SurveyResponses.add(SR03);
        Survey_Response__c SR04 = new Survey_Response__c(Name = 'Check-in Experience', Response_Submitter__c = contactMap.get('Will').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR04);
        Survey_Response__c SR05 = new Survey_Response__c(Name = 'F&B', Response_Submitter__c = contactMap.get('Will').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR05);
        Survey_Response__c SR06 = new Survey_Response__c(Name = 'Amenities', Response_Submitter__c = contactMap.get('Will').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR06);
        Survey_Response__c SR07 = new Survey_Response__c(Name = 'Check-out Experience', Response_Submitter__c = contactMap.get('Will').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Neutral', Survey_Weight__c = 3, Rating_Value__c = 3); SurveyResponses.add(SR07);
        
        Survey_Response__c SR08 = new Survey_Response__c(Name = 'Customer Survey Form', Response_Submitter__c = contactMap.get('Pat').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Neutral', Survey_Weight__c = 3, Rating_Value__c = 3); SurveyResponses.add(SR08);
        Survey_Response__c SR09 = new Survey_Response__c(Name = 'Overall Service', Response_Submitter__c = contactMap.get('Pat').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR09);
        Survey_Response__c SR10 = new Survey_Response__c(Name = 'Housekeeping', Response_Submitter__c = contactMap.get('Pat').Id,  Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR10);
        Survey_Response__c SR11 = new Survey_Response__c(Name = 'Check-in Experience', Response_Submitter__c = contactMap.get('Pat').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR11);
        Survey_Response__c SR12 = new Survey_Response__c(Name = 'F&B', Response_Submitter__c = contactMap.get('Pat').Id,  Response_Value__c = 'Bad',Response_Date_Time__c=DateTime.now(), Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR12);
        Survey_Response__c SR13 = new Survey_Response__c(Name = 'Amenities', Response_Submitter__c = contactMap.get('Pat').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR13);
        Survey_Response__c SR14 = new Survey_Response__c(Name = 'Check-out Experience', Response_Submitter__c = contactMap.get('Pat').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR14);
        
        Survey_Response__c SR15 = new Survey_Response__c(Name = 'Customer Survey Form', Response_Submitter__c = contactMap.get('Jocelyn').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR15);
        Survey_Response__c SR16 = new Survey_Response__c(Name = 'Overall Service', Response_Submitter__c = contactMap.get('Jocelyn').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR16);
        Survey_Response__c SR17 = new Survey_Response__c(Name = 'Housekeeping', Response_Submitter__c = contactMap.get('Jocelyn').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Neutral', Survey_Weight__c = 3, Rating_Value__c = 3); SurveyResponses.add(SR17);
        Survey_Response__c SR18 = new Survey_Response__c(Name = 'Check-in Experience', Response_Submitter__c = contactMap.get('Jocelyn').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR18);
        Survey_Response__c SR19 = new Survey_Response__c(Name = 'F&B', Response_Submitter__c = contactMap.get('Jocelyn').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR19);
        Survey_Response__c SR20 = new Survey_Response__c(Name = 'Amenities', Response_Submitter__c = contactMap.get('Jocelyn').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR20);
        Survey_Response__c SR21 = new Survey_Response__c(Name = 'Check-out Experience', Response_Submitter__c = contactMap.get('Jocelyn').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Neutral', Survey_Weight__c = 3, Rating_Value__c = 3); SurveyResponses.add(SR21);
        
        Survey_Response__c SR22 = new Survey_Response__c(Name = 'Customer Survey Form', Response_Submitter__c = contactMap.get('Marco').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Neutral', Survey_Weight__c = 3, Rating_Value__c = 3); SurveyResponses.add(SR22);
        Survey_Response__c SR23 = new Survey_Response__c(Name = 'Overall Service', Response_Submitter__c = contactMap.get('Marco').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR23);
        Survey_Response__c SR24 = new Survey_Response__c(Name = 'Housekeeping', Response_Submitter__c = contactMap.get('Marco').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR24);
        Survey_Response__c SR25 = new Survey_Response__c(Name = 'Check-in Experience', Response_Submitter__c = contactMap.get('Marco').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR25);
        Survey_Response__c SR26 = new Survey_Response__c(Name = 'F&B', Response_Submitter__c = contactMap.get('Marco').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR26);
        Survey_Response__c SR27 = new Survey_Response__c(Name = 'Amenities', Response_Submitter__c = contactMap.get('Marco').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR27);
        Survey_Response__c SR28 = new Survey_Response__c(Name = 'Check-out Experience', Response_Submitter__c = contactMap.get('Marco').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR28);
        
        Survey_Response__c SR29 = new Survey_Response__c(Name = 'Customer Survey Form', Response_Submitter__c = contactMap.get('Azzie').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Neutral', Survey_Weight__c = 3, Rating_Value__c = 3); SurveyResponses.add(SR29);
        Survey_Response__c SR30 = new Survey_Response__c(Name = 'Overall Service', Response_Submitter__c = contactMap.get('Azzie').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR30);
        Survey_Response__c SR31 = new Survey_Response__c(Name = 'Housekeeping', Response_Submitter__c = contactMap.get('Azzie').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR31);
        Survey_Response__c SR32 = new Survey_Response__c(Name = 'Check-in Experience', Response_Submitter__c = contactMap.get('Azzie').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR32);
        Survey_Response__c SR33 = new Survey_Response__c(Name = 'F&B', Response_Submitter__c = contactMap.get('Azzie').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR33);
        Survey_Response__c SR34 = new Survey_Response__c(Name = 'Amenities', Response_Submitter__c = contactMap.get('Azzie').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR34);
        Survey_Response__c SR35 = new Survey_Response__c(Name = 'Check-out Experience', Response_Submitter__c = contactMap.get('Azzie').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Neutral', Survey_Weight__c = 3, Rating_Value__c = 3); SurveyResponses.add(SR35);
        
        Survey_Response__c SR36 = new Survey_Response__c(Name = 'Customer Survey Form', Response_Submitter__c = contactMap.get('Carl').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR36);
        Survey_Response__c SR37 = new Survey_Response__c(Name = 'Overall Service', Response_Submitter__c = contactMap.get('Carl').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR37);
        Survey_Response__c SR38 = new Survey_Response__c(Name = 'Housekeeping', Response_Submitter__c = contactMap.get('Carl').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR38);
        Survey_Response__c SR39 = new Survey_Response__c(Name = 'Check-in Experience', Response_Submitter__c = contactMap.get('Carl').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR39);
        Survey_Response__c SR40 = new Survey_Response__c(Name = 'F&B', Response_Submitter__c = contactMap.get('Carl').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR40);
        Survey_Response__c SR41 = new Survey_Response__c(Name = 'Amenities', Response_Submitter__c = contactMap.get('Carl').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR41);
        Survey_Response__c SR42 = new Survey_Response__c(Name = 'Check-out Experience', Response_Submitter__c = contactMap.get('Carl').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Neutral', Survey_Weight__c = 3, Rating_Value__c = 3); SurveyResponses.add(SR42);
        
        Survey_Response__c SR43 = new Survey_Response__c(Name = 'Customer Survey Form', Response_Submitter__c = contactMap.get('John').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR43);
        Survey_Response__c SR44 = new Survey_Response__c(Name = 'Overall Service', Response_Submitter__c = contactMap.get('John').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR44);
        Survey_Response__c SR45 = new Survey_Response__c(Name = 'Housekeeping', Response_Submitter__c = contactMap.get('John').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR45);
        Survey_Response__c SR46 = new Survey_Response__c(Name = 'Check-in Experience', Response_Submitter__c = contactMap.get('John').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR46);
        Survey_Response__c SR47 = new Survey_Response__c(Name = 'F&B', Response_Submitter__c = contactMap.get('John').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR47);
        Survey_Response__c SR48 = new Survey_Response__c(Name = 'Amenities', Response_Submitter__c = contactMap.get('John').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR48);
        Survey_Response__c SR49 = new Survey_Response__c(Name = 'Check-out Experience', Response_Submitter__c = contactMap.get('John').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Neutral', Survey_Weight__c = 3, Rating_Value__c = 3); SurveyResponses.add(SR49);
                
        Survey_Response__c SR50 = new Survey_Response__c(Name = 'Customer Survey Form', Response_Submitter__c = contactMap.get('Joceph').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR50);
        Survey_Response__c SR51 = new Survey_Response__c(Name = 'Overall Service', Response_Submitter__c = contactMap.get('Joceph').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR51);
        Survey_Response__c SR52 = new Survey_Response__c(Name = 'Housekeeping', Response_Submitter__c = contactMap.get('Joceph').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR52);
        Survey_Response__c SR53 = new Survey_Response__c(Name = 'Check-in Experience', Response_Submitter__c = contactMap.get('Joceph').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR53);
        Survey_Response__c SR54 = new Survey_Response__c(Name = 'F&B', Response_Submitter__c = contactMap.get('Joceph').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR54);
        Survey_Response__c SR55 = new Survey_Response__c(Name = 'Amenities', Response_Submitter__c = contactMap.get('Joceph').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR55);
        Survey_Response__c SR56 = new Survey_Response__c(Name = 'Check-out Experience', Response_Submitter__c = contactMap.get('Joceph').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Neutral', Survey_Weight__c = 3, Rating_Value__c = 3); SurveyResponses.add(SR56);
        

        Survey_Response__c SR60 = new Survey_Response__c(Name = 'Customer Survey Form', Response_Submitter__c = contactMap.get('Marje').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR60);
        Survey_Response__c SR61 = new Survey_Response__c(Name = 'Overall Service', Response_Submitter__c = contactMap.get('Marje').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR61);
        Survey_Response__c SR62 = new Survey_Response__c(Name = 'Housekeeping', Response_Submitter__c = contactMap.get('Marje').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR62);
        Survey_Response__c SR63 = new Survey_Response__c(Name = 'Check-in Experience', Response_Submitter__c = contactMap.get('Marje').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR63);
        Survey_Response__c SR64 = new Survey_Response__c(Name = 'F&B', Response_Submitter__c = contactMap.get('Marje').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Bad', Survey_Weight__c = 1, Rating_Value__c = 1); SurveyResponses.add(SR64);
        Survey_Response__c SR65 = new Survey_Response__c(Name = 'Amenities', Response_Submitter__c = contactMap.get('Marje').Id,  Response_Date_Time__c=DateTime.now(),Response_Value__c = 'Happy', Survey_Weight__c = 5, Rating_Value__c = 5); SurveyResponses.add(SR65);
        Survey_Response__c SR66 = new Survey_Response__c(Name = 'Check-out Experience', Response_Submitter__c = contactMap.get('Marje').Id, Response_Date_Time__c=DateTime.now(), Response_Value__c = 'Neutral', Survey_Weight__c = 3, Rating_Value__c = 3); SurveyResponses.add(SR66);
        
        Insert SurveyResponses;
            
            } catch(Exception e) {
            System.debug('Error: ' + e.getMessage());
            throw e;
        }
    }
}
