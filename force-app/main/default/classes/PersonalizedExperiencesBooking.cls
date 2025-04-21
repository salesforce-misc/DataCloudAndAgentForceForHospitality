public class PersonalizedExperiencesBooking {
	// Make this method available for grounding
    // the Generate_Personalized_Schedule prompt template
    @InvocableMethod
    public static List<Response> getGuestExperienceBookings(List<Request> requests) {
        System.debug('## experiences requests = '+requests);
        Request input = requests[0];
        Contact contact = input.myContact;

        List<Booking__dlm> bookings = ExperienceController.getExperienceBookingsRecords(
            contact
        );
		System.debug('## bookings = '+bookings);
        // Create expected response
        List<Response> responses = new List<Response>();
        Response res = new Response();
        System.debug('## experiences serialize = '+JSON.serialize(bookings));
        res.prompt = JSON.serialize(bookings);
        responses.add(res);
        return responses;
    }

    // The variables in this class need to match the prompt template inputs,
    // that may be different on each prompt template
    public class Request {
        @InvocableVariable(required=true)
        public Contact myContact;
    }
    public class Response {
        @InvocableVariable
        public String Prompt;
    }
}