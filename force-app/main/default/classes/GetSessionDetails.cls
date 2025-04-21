public class GetSessionDetails {
	@InvocableMethod(label='Get Session details')
    public static List<Response> getSessions(List<Request> requests) {
      
        Request input = requests[0];
        String conid = input.contactId;
        String expName = input.experienceName;
        List<Experience_Session__dlm> sessionRecords = new List<Experience_Session__dlm>();
        List<Session__c> currentSessionRecords = new List<Session__c>();
        if(expName != NULL && !Test.isRunningTest()){
            sessionRecords = [Select Name__c, Experience_Name__c ,Date__c ,Start_Time__c ,End_Time__c ,Available_Slots__c  from Experience_Session__dlm Where Experience_Name__c =: expName and Date__c = Today Order By CreatedDate__c DESC Limit 3 ];
        }
        System.debug('## sessionRecords = '+sessionRecords);
        if(sessionRecords.isEmpty()){
            Map<String, Time> experienceStartTimes = new Map<String, Time>{
				'White Water Rafting Rush' => Time.newInstance(15, 30, 0, 0), 
				'Mountain Climbing Challenge' => Time.newInstance(13, 0, 0, 0),
				'Off-Road Jungle Safari' => Time.newInstance(13, 0, 0, 0), 
				'Windsurfing Adventure' => Time.newInstance(14, 30, 0, 0),
				'Deep-Sea Fishing Expedition' => Time.newInstance(10, 0, 0, 0),
				'Stand-Up Paddleboard Tour' => Time.newInstance(15, 0, 0, 0),
				'Sunrise Doubles Challenge' => Time.newInstance(10, 0, 0, 0),
				'Pickleball Social Mixer' => Time.newInstance(16, 30, 0, 0),
				'Championship Tennis Tournament' => Time.newInstance(13, 0, 0, 0),
				'Night Swim & Light Show' => Time.newInstance(21, 0, 0, 0),
				'Aquatic Aerobics' => Time.newInstance(15, 0, 0, 0),
				'Infinity Pool Lounge' => Time.newInstance(12, 0, 0, 0),
				'Wellness Workshops' => Time.newInstance(14, 0, 0, 0),
				'Holistic Spa Retreat' => Time.newInstance(16, 30, 0, 0),
				'Thermal Spring Rejuvenation' => Time.newInstance(17, 0, 0, 0),
				'Sunrise Tai Chi' => Time.newInstance(10, 30, 0, 0),
				'Oceanview Reading Nook' => Time.newInstance(16, 0, 0, 0),
				'Underground Cave Exploration' => Time.newInstance(10, 0, 0, 0),
				'Sunset Beach Walk' => Time.newInstance(10, 0, 0, 0),
				'Full Moon Beach Party' => Time.newInstance(22, 0, 0, 0),
				'Surfs Up Lesson' => Time.newInstance(09, 0, 0, 0),
				'Beach Yoga Retreat' => Time.newInstance(10, 0, 0, 0),
				'Culinary Heritage Experience' => Time.newInstance(10, 0, 0, 0),
				'Local Music and Dance' => Time.newInstance(19, 0, 0, 0),
				'Crafting Traditional Garments' => Time.newInstance(16, 0, 0, 0),
				'Historical Landmarks Tour' => Time.newInstance(09, 0, 0, 0),
				'Seaside Gourmet Dinner' => Time.newInstance(23, 0, 0, 0),
				'Chefs Table Culinary Journey' => Time.newInstance(09, 0, 0, 0),
				'Vineyard Wine Tasting Tour' => Time.newInstance(17, 0, 0, 0),
				'Sunset Cocktail Workshop' => Time.newInstance(20, 30, 0, 0),
				'Farm-to-Table Cooking Class' => Time.newInstance(15, 0, 0, 0),
				'Artisan Workshop Series' => Time.newInstance(16, 30, 0, 0),
				'Coastal Kayak Excursion' => Time.newInstance(14, 30, 0, 0),
				'Family Adventure Quest' => Time.newInstance(16, 0, 0, 0),
				'Kids Marine Discovery' => Time.newInstance(09, 0, 0, 0),
				'Teens Wilderness Camp' => Time.newInstance(10, 0, 0, 0),
				'Starlight Wildlife Tour' => Time.newInstance(22, 30, 0, 0),
				'Little Chefs Baking Workshop' => Time.newInstance(10, 0, 0, 0),
				'Family Movie Night Under the Stars' => Time.newInstance(21, 0, 0, 0),
				'Beach Bootcamp Challenge' => Time.newInstance(12, 0, 0, 0),
				'Sunrise Mountain Yoga' => Time.newInstance(10, 30, 0, 0),
				'Aqua Fitness in Paradise' => Time.newInstance(14, 0, 0, 0),
				'Trail Running Adventure' => Time.newInstance(13, 0, 0, 0),
				'Ocean Kayak Fitness Expedition' => Time.newInstance(15, 30, 0, 0),
				'Sunset Golf Challenge' => Time.newInstance(20, 0, 0, 0),
				'Golf Pro Masterclass' => Time.newInstance(14, 0, 0, 0),
				'Family Fun Putt-Putt' => Time.newInstance(16, 0, 0, 0),
				'Rainforest Discovery Hike' => Time.newInstance(15, 0, 0, 0),
				'Live Music Beach Party' => Time.newInstance(19, 0, 0, 0),
				'Sunset Cocktail Cruise' => Time.newInstance(20, 0, 0, 0),
				'Tropical Snorkel Adventure' => Time.newInstance(16, 0, 0, 0),
				'Canyon Zip Line Excursion' => Time.newInstance(13, 0, 0, 0),
				'Serenity Garden Meditation' => Time.newInstance(10, 0, 0, 0),
				'Outdoor Movie Night' => Time.newInstance(21, 0, 0, 0)
			};
            List<Experience__c> exp = [Select Id,Name from Experience__c Where Name =: expName Limit 1]; 
            System.debug('## exp = '+exp);
            if(!exp.isEmpty()){
                Time baseStartTime = experienceStartTimes.containsKey(exp[0].Name) ? experienceStartTimes.get(exp[0].Name) : Time.newInstance(15, 30, 0, 0);
                System.debug('## baseStartTime = '+baseStartTime);
                List<Session__c> sessionsToInsert = new List<Session__c>();            
                Date today = Date.today();
                for (Integer i = 0; i < 4; i++) { 
                    Time sessionStartTime = baseStartTime.addSeconds(i * 3600); // 1-hour gap between sessions
                    Session__c session = new Session__c();
                    session.Experience__c = exp[0].Id;
                    session.Start_Time__c = sessionStartTime;
                    session.Date__c = today;                
                    sessionsToInsert.add(session);
                }
                System.debug('## sessionsToInsert = '+sessionsToInsert);
                insert sessionsToInsert;
                Set<Id> sessionIdSet = new Set<Id>();
                if(!sessionsToInsert.isEmpty()){
                    for(Session__c session : sessionsToInsert){
                        sessionIdSet.add(session.Id);
                    }
                }
                System.debug('## sessionIdSet = '+sessionIdSet);
                if(sessionIdSet != NULL){
                  currentSessionRecords = [Select Name, Experience_Name__c  ,Date__c  ,Start_Time__c ,End_Time__c  ,Available_Slots__c from Session__c Where Id IN: sessionIdSet];  
                  System.debug('## currentSessionRecords = '+currentSessionRecords);
                }
            }
            
        }
        
        // Create expected response
        List<Response> responses = new List<Response>();
        Response res = new Response();
        if(!sessionRecords.isEmpty() && sessionRecords != null){
            res.prompt = JSON.serialize(sessionRecords);
        } 
        if(sessionRecords.isEmpty() && !currentSessionRecords.isEmpty()){
            res.prompt = JSON.serialize(currentSessionRecords);
        } 
        responses.add(res);
        System.debug('## responses = '+responses);
        return responses;
    }
     
    
    
    // The variables in this class need to match the prompt template inputs,
    // that may be different on each prompt template
    public class Request {
        @InvocableVariable
        public String contactId;          
        @InvocableVariable
        public String experienceName; 
    }

    public class Response {
        @InvocableVariable
        public String Prompt;
    }
}