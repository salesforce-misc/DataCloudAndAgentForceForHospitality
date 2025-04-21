public class DisplayProductList {
    @InvocableMethod
    public static List<Response> getInputQuestion(List<Request> requests) {
        System.debug('## experiences requests = '+requests);
        Request input = requests[0];
        String user_Question = input.Question;
        
        if(user_Question.containsIgnoreCase('pets')){
            System.debug('user_Question contains pet = '+user_Question);
            Enable_Pet_Friendly_Comp__e  petEvt = New Enable_Pet_Friendly_Comp__e();
            petEvt.isVisible__c=True;
            petEvt.Input_Type__c='pet-allowed-hotel';
            EventBus.publish(petEvt);
            
           /* Enable_Hotel_Search_Comp__e  pe2 = New Enable_Hotel_Search_Comp__e();
            pe2.isVisible__c=false;
            pe2.isDisableHotelPopup__c=true;
            EventBus.publish(pe);*/
            /*Enable_Hotel_Search_Comp__e  pe = New Enable_Hotel_Search_Comp__e();
            pe.isVisible__c=True;
            pe.Input_Type__c='pet-allowed-hotel';
            EventBus.publish(pe);*/
        }
        else{
            system.debug('not pet related search delete custom setting values');
            Enable_Hotel_Search_Comp__e  pe = New Enable_Hotel_Search_Comp__e();
            pe.isVisible__c=True;
            pe.Input_Type__c='family-friendly';
            EventBus.publish(pe);
            
           /* Enable_Pet_Friendly_Comp__e  petEvt = New Enable_Pet_Friendly_Comp__e();
            petEvt.isVisible__c=True;
            petEvt.Input_Type__c='family-friendly';
            EventBus.publish(pe);*/
        }
        
        System.debug('##publIsh platform event After ##');

        List<Response> responses = new List<Response>();
        Response res = new Response();
        System.debug('## no response ');
        res.Prompt = '';
        responses.add(res);
        return responses;
    }
    
    // The variables in this class need to match the prompt template inputs,
    public class Request {
        @InvocableVariable(required=true)
        public String Question;
    }
    public class Response {
        @InvocableVariable
        public String Prompt;
    }
}