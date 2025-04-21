public class PersonalizedExperiencesSession {
// Make this method available for grounding
    // the Generate_Personalized_Schedule prompt template
    @InvocableMethod
    public static List<Response> getGuestExperiences(List<Request> requests) {
        System.debug('## sessions requests = '+requests);
        Request input = requests[0];
        Contact contact = input.myContact;
        System.debug('## sessions contact = '+contact);
		//List<Experience__c> experience = input.myExperience;
        //System.debug('## sessions experience = '+experience);
        List<Experience_Session__dlm> sessions = ExperienceController.getExperienceSessionRecordsForUpcoming(
            contact
        );
		System.debug('## sessions = '+sessions);
        // Create expected response
        List<Response> responses = new List<Response>();
        Response res = new Response();
        System.debug('## sessions serialize = '+JSON.serialize(sessions));
        res.prompt = JSON.serialize(sessions);
        responses.add(res);
        return responses;
    }

    // The variables in this class need to match the prompt template inputs,
    // that may be different on each prompt template
    public class Request {
        @InvocableVariable(required=true)
        //public Experience__c myExperience;
        public Contact myContact;
        //public String myExperience;
    }
    

    public class Response {
        @InvocableVariable
        public String Prompt;
    }
}