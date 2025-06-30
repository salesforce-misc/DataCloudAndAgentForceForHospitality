/*
Description: This class is used to fetch details from contacts intrest and booking type which is backend controller of ConactCard Lwc Component
*/
public with sharing  class ContactProfileCardDetails {
  //This method is used for displaying member traits on ui
    @AuraEnabled(cacheable=true)
    public static List<String> getExperienceType(Id contactId){
        Set<String> bookingExpSet = new Set<String>();
        List<String> bookingTypeSetToList = new List<String>();
        
        // Fix: Use a for-loop to avoid "too many rows" exception
    	for (Booking__dlm b : [SELECT Id__c, Type__c, Contact_c__c FROM Booking__dlm WHERE Contact_c__c = :contactId]) {
        	if (b.Type__c != null && b.Type__c != '') {
            	bookingExpSet.add(b.Type__c);
        	}
    	}
        system.debug('booking filtered set'+bookingExpSet);
        /*List<Booking__dlm> bookingTypeList = [Select Id__c,Type__c,Contact_c__c from Booking__dlm where Contact_c__c =:contactId];
        system.debug('booking type list:'+bookingTypeList);
        if(bookingTypeList !=null){
            for(Booking__dlm b:bookingTypeList){
                if(b.Type__c != null || b.Type__c != ''){
                    bookingExpSet.add(b.Type__c);
                }
            }
            system.debug('booking filtered set'+bookingExpSet);
        } */
        
        List<Contact> contactIntrestList = [Select id,Interest1__c,Interest2__c,Interest3__c from Contact where id =:contactId];
        system.debug('contactIntrestList:'+contactIntrestList);
        if(contactIntrestList != null)
        {
            for(Contact c:contactIntrestList){
                if(c.Interest1__c != null || c.Interest1__c != ''){
                    bookingExpSet.add(c.Interest1__c);
                }
                 if(c.Interest2__c != null || c.Interest2__c != ''){
                    bookingExpSet.add(c.Interest2__c);
                }
                 if(c.Interest3__c != null || c.Interest3__c != ''){
                    bookingExpSet.add(c.Interest3__c);
                }
            }
        }
        if(!bookingExpSet.isEmpty()){
            bookingTypeSetToList.addAll(bookingExpSet); 
        }
        system.debug('Booking Type Set to List:'+bookingTypeSetToList);
        return bookingTypeSetToList;
    }
    

    //Method for getting Calculated insight value
    @AuraEnabled(cacheable=true)
    public static Contact getGuestCalculatedInsights(Id contactId){
        try {
            Contact  con = [SELECT FirstName,LastName,Customer_Class__c,Lifetime_Value__c,Total_Stays__c,Total_Room_Nights__c,Total_Spend__c,Avg_Nights_per_Stay__c,Lifetime_Reservations__c FROM Contact WHERE Id=:contactId LIMIT 1] ;
            return con;
        }catch(Exception e){
            system.debug('Error:'+e.getMessage());
            return null;
        }
         

    }

}
