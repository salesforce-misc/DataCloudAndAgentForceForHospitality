global class GenerateDailyReservationsBatch implements Database.Batchable<SObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Fetch only contacts where email contains '.dataclouddemo.com'
        return Database.getQueryLocator([
            Select Id,Name,Email from Contact Where Name like '%Marje Croley%'  or Ext_Id__c  = '10005760' Limit 1
        ]);
    }

    global void execute(Database.BatchableContext BC, List<Contact> contactList) {
        List<Reservation__c> reservationsToInsert = new List<Reservation__c>();
        List<Session__c> sessionsToInsert = new List<Session__c>();
        List<Booking__c> bookingsToInsert = new List<Booking__c>();
        Date today = Date.today();
        
        // Collect all Contact IDs
        Set<Id> contactIds = new Set<Id>();
        for (Contact con : contactList) {
            contactIds.add(con.Id);
        }

        // Fetch all existing reservations for these contacts
        Map<Id, Boolean> hasCurrentReservation = new Map<Id, Boolean>();
        Map<Id, Boolean> hasUpcomingReservation = new Map<Id, Boolean>();

        for (Reservation__c res : [
            SELECT Id, Contact__c, Check_In_Date__c, Check_Out_Date__c, Reservation_Status__c 
            FROM Reservation__c 
            WHERE Contact__c IN :contactIds
        ]) {
            if (res.Check_In_Date__c == today && res.Reservation_Status__c == 'Confirmed') {
                hasCurrentReservation.put(res.Contact__c, true);
            } else if (res.Check_In_Date__c > today && res.Reservation_Status__c == 'Pending') {
                hasUpcomingReservation.put(res.Contact__c, true);
            }
        }

        for (Contact con : contactList) {
            Boolean currentExists = hasCurrentReservation.containsKey(con.Id);
            Boolean upcomingExists = hasUpcomingReservation.containsKey(con.Id);

            // If at least one current reservation exists, skip creating new ones
            if (!currentExists) {
                reservationsToInsert.add(new Reservation__c(
                    Contact__c = con.Id,
                    Check_In_Date__c = today,
                    Check_Out_Date__c = today.addDays(2),
                    Reservation_Status__c = 'Pending',
                    Room_Number__c = '4324',
                    Room_Type__c = 'Standard',
                    Special_Request__c = 'Beach view',
                    Number_Of_Adults__c = '2',
                    Number_Of_Children__c = '1',
                    Payment_Status__c = 'Pending',
                    Total_Amount__c = Decimal.valueOf(2100),
                    Property_Name__c = 'Paradise Sands Resort'
                ));
                reservationsToInsert.add(new Reservation__c(
                    Contact__c = con.Id,
                    Check_In_Date__c = today,
                    Check_Out_Date__c = today.addDays(2),
                    Reservation_Status__c = 'Confirmed',
                    Room_Number__c = '4324',
                    Room_Type__c = 'Standard',
                    Special_Request__c = 'Beach view',
                    Number_Of_Adults__c = '2',
                    Number_Of_Children__c = '1',
                    Payment_Status__c = 'Pending',
                    Total_Amount__c = Decimal.valueOf(2100),
                    Property_Name__c = 'Paradise Sands Resort'
                ));                
            }

            // If at least one upcoming reservation exists, skip creating new ones
            if (!upcomingExists) {
                reservationsToInsert.add(new Reservation__c(
                    Contact__c = con.Id,
                    Check_In_Date__c = today.addDays(5),
                    Check_Out_Date__c = today.addDays(10),
                    Reservation_Status__c = 'Pending',
                    Room_Number__c = '4324',
                    Room_Type__c = 'Standard',
                    Special_Request__c = 'Beach view',
                    Number_Of_Adults__c = '2',
                    Number_Of_Children__c = '1',
                    Payment_Status__c = 'Pending',
                    Total_Amount__c = Decimal.valueOf(2100),
                    Property_Name__c = 'Paradise Sands Resort'
                ));
                reservationsToInsert.add(new Reservation__c(
                    Contact__c = con.Id,
                    Check_In_Date__c = today.addDays(6),
                    Check_Out_Date__c = today.addDays(11),
                    Reservation_Status__c = 'Pending',
                    Room_Number__c = '4324',
                    Room_Type__c = 'Standard',
                    Special_Request__c = 'Beach view',
                    Number_Of_Adults__c = '2',
                    Number_Of_Children__c = '1',
                    Payment_Status__c = 'Pending',
                    Total_Amount__c = Decimal.valueOf(2100),
                    Property_Name__c = 'Paradise Sands Resort'
                ));
                reservationsToInsert.add(new Reservation__c(
                    Contact__c = con.Id,
                    Check_In_Date__c = today.addDays(7),
                    Check_Out_Date__c = today.addDays(12),
                    Reservation_Status__c = 'Pending',
                    Room_Number__c = '4324',
                    Room_Type__c = 'Standard',
                    Special_Request__c = 'Beach view',
                    Number_Of_Adults__c = '2',
                    Number_Of_Children__c = '1',
                    Payment_Status__c = 'Pending',
                    Total_Amount__c = Decimal.valueOf(2100),
                    Property_Name__c = 'Paradise Sands Resort'
                ));
            }
        }

        if (!reservationsToInsert.isEmpty()) {
            insert reservationsToInsert;
        }
        
        List<Experience__c> experiences = [SELECT Id, Name FROM Experience__c];
        
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
            
            // Fetch existing sessions for today to determine how many to create
            Map<Id, Integer> existingSessionCount = new Map<Id, Integer>();
    
            for (AggregateResult ar : [
                SELECT Experience__c Id, COUNT(Id) sessionCount
                FROM Session__c 
                WHERE Date__c = :today
                GROUP BY Experience__c
            ]) {
                existingSessionCount.put((Id) ar.get('Id'), (Integer) ar.get('sessionCount'));
            }
    		List<Id> newlyInsertedSessionIds = new List<Id>();
            for (Experience__c exp : experiences) {
                Integer existingCount = existingSessionCount.containsKey(exp.Id) ? existingSessionCount.get(exp.Id) : 0;
                Integer sessionsToCreate = 0;
    
                // Determine how many sessions to create
                if (existingCount == 0) {
                    sessionsToCreate = 3; // No sessions exist, create 3
                } else if (existingCount == 1) {
                    sessionsToCreate = 2; // Only 1 exists, create 2 more
                } else if (existingCount == 2) {
                    sessionsToCreate = 1; // Only 2 exists, create 1 more
                } else {
                    continue; // 3 or more sessions exist, skip creation
                }
    
                Time baseStartTime = experienceStartTimes.containsKey(exp.Name) ? experienceStartTimes.get(exp.Name) : Time.newInstance(15, 30, 0, 0);
    
                for (Integer i = 0; i < sessionsToCreate; i++) {
                    Time sessionStartTime = baseStartTime.addSeconds(i * 3600); // 1-hour gap between sessions
                    
                    Session__c session = new Session__c();
                    session.Experience__c = exp.Id;
                    session.Start_Time__c = sessionStartTime;
                    session.Date__c = today;
    
                    sessionsToInsert.add(session);
                }
            }
    
            // Insert Sessions after Reservations
            if (!sessionsToInsert.isEmpty()) {
                insert sessionsToInsert;
                
                // Ensure sessions were actually inserted by querying them back from the database
    			List<Session__c> insertedSessions = [SELECT Id FROM Session__c WHERE Id IN :sessionsToInsert];
                if (!insertedSessions.isEmpty()) {
                    // Collect inserted session IDs
                    for (Session__c session : sessionsToInsert) {
                        newlyInsertedSessionIds.add(session.Id);
                    }
                }                
            }
        
        	// Fetch only the newly inserted sessions for booking
            if (!newlyInsertedSessionIds.isEmpty()) {
                List<Session__c> insertedSessions = [SELECT Id, Experience__c FROM Session__c WHERE Id IN :newlyInsertedSessionIds];
    
                if (!contactList.isEmpty() && !insertedSessions.isEmpty()) {
                    for (Contact con : contactList) {
                        for (Session__c session : insertedSessions) {
                            Booking__c booking = new Booking__c(
                                Session__c = session.Id,
                                Contact__c = con.Id,
                                Number_of_Guests__c = 2
                            );
                            bookingsToInsert.add(booking);
                        }
                    }
                }
            }
    
            // Insert Bookings
            if (!bookingsToInsert.isEmpty()) {
                insert bookingsToInsert;
            }
                
    }

    global void finish(Database.BatchableContext BC) {
        System.debug('Batch job completed');
    }
}
