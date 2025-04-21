public class Generate_Experiences {
    
    @InvocableMethod(label='Generate experience records' description='Generate records for Experience__c objects.')
  	public static void generateExperiences() { 
        try{
        
			// Create a list to hold Experience records
			List<Experience__c> Experiences = new List<Experience__c>();
			
			// Create a new Experience record with specified fields
			Experience__c Exp01 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = '', Capacity__c = 25,  Description__c = 'Discover the mysteries of subterranean caves with our expert speleologists.', Duration_Hours__c = 5, Location__c = 'Subterranean Caves', Name = 'Underground Cave Exploration',  Price__c = 150, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Adventure Activities'); Experiences.add(Exp01);
			Experience__c Exp02 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 45,  Description__c = 'Stroll along the shoreline as the sun sets, painting the sky in hues of orange and pink.', Duration_Hours__c = 5, Location__c = 'Beach Shoreline', Name = 'Sunset Beach Walk', Price__c = 45, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Beaches & Snorkeling'); Experiences.add(Exp02);
			Experience__c Exp03 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 30,  Description__c = 'Join us for a night of music, dance, and bonfires on the beach under the full moon.', Duration_Hours__c = 2, Location__c = 'Beach', Name = 'Full Moon Beach Party', Price__c = 25, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Beaches & Snorkeling'); Experiences.add(Exp03);
			Experience__c Exp04 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = '', Capacity__c = 20,  Description__c = 'Catch your first wave with confidence in our beginner-friendly surf lessons.', Duration_Hours__c = 1, Location__c = 'Surfing Areas', Name = 'Surfs Up Lesson', Price__c = 149, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Beaches & Snorkeling'); Experiences.add(Exp04);
			Experience__c Exp05 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = 'Outdoor', Capacity__c = 55,  Description__c = 'Find your zen with morning yoga sessions on our pristine sandy beach.', Duration_Hours__c = 2, Location__c = 'Beach', Name = 'Beach Yoga Retreat', Price__c = 50, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Beaches & Snorkeling'); Experiences.add(Exp05);
			Experience__c Exp06 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 30,  Description__c = 'Savor the flavors of the region with a culinary tour highlighting traditional dishes and ingredients.', Duration_Hours__c = 1, Location__c = 'Local Eateries', Name = 'Culinary Heritage Experience', Price__c = 199, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Cultural Tours & Workshops'); Experiences.add(Exp06);
			Experience__c Exp07 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 20,  Description__c = 'Immerse yourself in the local culture with a night of traditional music and dance performances.', Duration_Hours__c = 1, Location__c = 'Cultural Venues', Name = 'Local Music and Dance', Price__c = 150, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Cultural Tours & Workshops'); Experiences.add(Exp07);
			Experience__c Exp08 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 55,  Description__c = 'Learn the art of crafting traditional garments with the guidance of skilled tailors.', Duration_Hours__c = 1, Location__c = 'Workshop Locations', Name = 'Crafting Traditional Garments', Price__c = 199, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Cultural Tours & Workshops'); Experiences.add(Exp08);
			Experience__c Exp09 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 25,  Description__c = 'Journey through time as you visit historical landmarks and learn about the local heritage.', Duration_Hours__c = 1, Location__c = 'Historical Sites', Name = 'Historical Landmarks Tour', Price__c = 55, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Cultural Tours & Workshops'); Experiences.add(Exp09);
			Experience__c Exp10 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 25,  Description__c = 'An exclusive dinner featuring a multi-course menu prepared by our renowned chef, served on our private beach.', Duration_Hours__c = 3, Location__c = 'Private Beach', Name = 'Seaside Gourmet Dinner', Price__c = 55, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Dining Experiences'); Experiences.add(Exp10);
			Experience__c Exp11 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 45,  Description__c = 'Join our head chef for a culinary adventure as you taste innovative dishes made from locally-sourced ingredients.', Duration_Hours__c = 2.5, Location__c = 'Resort Kitchen', Name = 'Chefs Table Culinary Journey', Price__c = 250, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Dining Experiences'); Experiences.add(Exp11);
			Experience__c Exp12 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 30,  Description__c = 'Sample a selection of our finest wines paired with artisan cheeses as you tour our scenic vineyard.', Duration_Hours__c = 1, Location__c = 'Resort Vineyard', Name = 'Vineyard Wine Tasting Tour', Price__c = 150, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Dining Experiences'); Experiences.add(Exp12);
			Experience__c Exp13 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 20,  Description__c = 'Learn how to mix the perfect cocktail with our expert mixologists as the sun dips below the horizon.', Duration_Hours__c = 2, Location__c = 'Beachside Bar', Name = 'Sunset Cocktail Workshop', Price__c = 45, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Dining Experiences'); Experiences.add(Exp13);
			Experience__c Exp14 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = '', Capacity__c = 55,  Description__c = 'Take part in a cooking class where you&39;ll harvest fresh ingredients from our organic garden and learn to cook a delicious meal.', Duration_Hours__c = 3, Location__c = 'Organic Garden', Name = 'Farm-to-Table Cooking Class', Price__c = 25, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Dining Experiences'); Experiences.add(Exp14);
			Experience__c Exp15 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = 'Indoor', Capacity__c = 45,  Description__c = 'Create your own masterpiece in workshops led by local artisans, from pottery to painting.', Duration_Hours__c = 1, Location__c = 'Local Artisan Shops', Name = 'Artisan Workshop Series', Price__c = 75, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Cultural Tours & Workshops'); Experiences.add(Exp15);
			Experience__c Exp16 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = '', Capacity__c = 25,  Description__c = 'Paddle along the pristine coastline, exploring hidden coves and spotting marine wildlife with our kayak guides.', Duration_Hours__c = 1, Location__c = 'Coastal Waters', Name = 'Coastal Kayak Excursion', Price__c = 55, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Nature & Eco Tours'); Experiences.add(Exp16);
			Experience__c Exp17 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = '', Capacity__c = 25,  Description__c = 'Embark on a fun-filled scavenger hunt around the resort, solving puzzles and challenges as a family.', Duration_Hours__c = 1, Location__c = 'Resort Grounds', Name = 'Family Adventure Quest', Price__c = 149, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Family & Kids Activities'); Experiences.add(Exp17);
			Experience__c Exp18 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 45,  Description__c = 'Children can explore marine life with hands-on activities at our interactive oceanography center.', Duration_Hours__c = 4, Location__c = 'Oceanography Center', Name = 'Kids Marine Discovery', Price__c = 50, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Family & Kids Activities'); Experiences.add(Exp18);
			Experience__c Exp19 = new Experience__c(Activity_Level__c = 'High', Activity_Type__c = '', Capacity__c = 30,  Description__c = 'Teenagers will love our wilderness camp, where they can learn survival skills and enjoy outdoor adventures.', Duration_Hours__c = 2, Location__c = 'Wilderness Area', Name = 'Teens Wilderness Camp', Price__c = 55, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Family & Kids Activities'); Experiences.add(Exp19);
			Experience__c Exp20 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = '', Capacity__c = 80,  Description__c = 'Discover the nocturnal creatures of our nature reserve on a guided night tour under the stars.', Duration_Hours__c = 2, Location__c = 'Nature Reserve', Name = 'Starlight Wildlife Tour', Price__c = 75, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Nature & Eco Tours'); Experiences.add(Exp20);
			Experience__c Exp21 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 20,  Description__c = 'A baking class for kids where they&39;ll learn to make and decorate cupcakes and cookies.', Duration_Hours__c = 1, Location__c = 'Resort Kitchen', Name = 'Little Chefs Baking Workshop', Price__c = 75, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Family & Kids Activities'); Experiences.add(Exp21);
			Experience__c Exp22 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 55,  Description__c = 'Enjoy a family movie night outdoors with our pop-up cinema on the lawn, complete with popcorn and blankets.', Duration_Hours__c = 1, Location__c = 'Outdoor Cinema', Name = 'Family Movie Night Under the Stars', Price__c = 199, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Family & Kids Activities'); Experiences.add(Exp22);
			Experience__c Exp23 = new Experience__c(Activity_Level__c = 'High', Activity_Type__c = 'Outdoor', Capacity__c = 25,  Description__c = 'Kickstart your day with a high-intensity bootcamp workout on the beach, led by our certified fitness trainers.', Duration_Hours__c = 4, Location__c = 'Beachfront', Name = 'Beach Bootcamp Challenge', Price__c = 150, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Fitness & Exercise'); Experiences.add(Exp23);
			Experience__c Exp24 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 45,  Description__c = 'Experience yoga at sunrise atop our scenic overlook, with panoramic views to inspire tranquility and balance.', Duration_Hours__c = 6, Location__c = 'Mountain Overlook', Name = 'Sunrise Mountain Yoga', Price__c = 199, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Fitness & Exercise'); Experiences.add(Exp24);
			Experience__c Exp25 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = 'Outdoor', Capacity__c = 30,  Description__c = 'Join our aqua fitness class in the pool, a refreshing way to improve strength and flexibility in a tropical setting.', Duration_Hours__c = 3, Location__c = 'Resort Pool', Name = 'Aqua Fitness in Paradise', Price__c = 55, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Fitness & Exercise'); Experiences.add(Exp25);
			Experience__c Exp26 = new Experience__c(Activity_Level__c = 'High', Activity_Type__c = '', Capacity__c = 20,  Description__c = 'Hit the trails with our guided running sessions, exploring the natural beauty of the surrounding landscape.', Duration_Hours__c = 1, Location__c = 'Nature Trails', Name = 'Trail Running Adventure', Price__c = 250, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Fitness & Exercise'); Experiences.add(Exp26);
			Experience__c Exp27 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = '', Capacity__c = 55,  Description__c = 'Paddle out for a kayak excursion that doubles as a workout, exploring the coastline and hidden coves.', Duration_Hours__c = 6, Location__c = 'Coastal Waters', Name = 'Ocean Kayak Fitness Expedition', Price__c = 150, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Fitness & Exercise'); Experiences.add(Exp27);
			Experience__c Exp28 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = '', Capacity__c = 35,  Description__c = 'Enjoy an evening round of golf on our signature course, designed to challenge players of all levels as the sun sets.', Duration_Hours__c = 2, Location__c = 'Signature Golf Course', Name = 'Sunset Golf Challenge', Price__c = 45, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Golf'); Experiences.add(Exp28);
			Experience__c Exp29 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 55,  Description__c = 'Learn from a PGA-certified golf pro in a personalized session focused on improving your swing and strategy.', Duration_Hours__c = 1, Location__c = 'Golf Academy', Name = 'Golf Pro Masterclass', Price__c = 25, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Golf'); Experiences.add(Exp29);
			Experience__c Exp30 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 80,  Description__c = 'A fun and engaging mini-golf experience for the whole family, featuring unique obstacles and themes.', Duration_Hours__c = 6, Location__c = 'Mini-Golf Course', Name = 'Family Fun Putt-Putt', Price__c = 149, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Golf'); Experiences.add(Exp30);
			Experience__c Exp31 = new Experience__c(Activity_Level__c = 'High', Activity_Type__c = '', Capacity__c = 50,  Description__c = 'Explore the lush rainforest on a guided hike, learning about the local flora and fauna from our expert guides.', Duration_Hours__c = 2, Location__c = 'Rainforest Reserve', Name = 'Rainforest Discovery Hike', Price__c = 50, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Nature & Eco Tours'); Experiences.add(Exp31);
			Experience__c Exp32 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 200,  Description__c = 'Dance the night away at our beach party, featuring live music from popular local bands and DJs.', Duration_Hours__c = 2, Location__c = 'Resort Beach', Name = 'Live Music Beach Party', Price__c = 199, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Nightlife & Entertainment'); Experiences.add(Exp32);
			Experience__c Exp33 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 55,  Description__c = 'Sip on tropical cocktails during a scenic sunset cruise, offering stunning ocean views and a relaxing atmosphere.', Duration_Hours__c = 1, Location__c = 'Ocean Cruise', Name = 'Sunset Cocktail Cruise', Price__c = 150, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Nightlife & Entertainment'); Experiences.add(Exp33);
			Experience__c Exp34 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 25,  Description__c = '<p>Add Description</p>', Duration_Hours__c = 4, Location__c = 'Coral Reef', Name = 'Tropical Snorkel Adventure', Price__c = 199, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Beaches & Snorkeling'); Experiences.add(Exp34);
			Experience__c Exp35 = new Experience__c(Activity_Level__c = 'High', Activity_Type__c = 'Outdoor', Capacity__c = 45,  Description__c = 'Soar over deep canyons and lush forest canopies on our thrilling zip line tour.', Duration_Hours__c = 3.5, Location__c = 'Canyons & Forests', Name = 'Canyon Zip Line Excursion', Price__c = 150, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Adventure Activities'); Experiences.add(Exp35);
			Experience__c Exp36 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 30,  Description__c = 'Join our guided meditation sessions in the tranquil serenity garden, designed to promote peace and mindfulness.', Duration_Hours__c = 2, Location__c = 'Serenity Garden', Name = 'Serenity Garden Meditation', Price__c = 55, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Relaxation & Quiet Zones'); Experiences.add(Exp36);
			Experience__c Exp37 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 100,  Description__c = 'Enjoy classic films and latest blockbusters at our outdoor cinema, complete with gourmet popcorn and cozy seating.', Duration_Hours__c = 6, Location__c = 'Outdoor Cinema Area', Name = 'Outdoor Movie Night',Price__c = 199, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Nightlife & Entertainment'); Experiences.add(Exp37);
			Experience__c Exp38 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 20,  Description__c = 'Escape with a book in our oceanview reading nooks, offering a quiet space to relax with stunning views.', Duration_Hours__c = 3, Location__c = 'Library Overlooking the Ocean', Name = 'Oceanview Reading Nook', Price__c = 250, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Relaxation & Quiet Zones'); Experiences.add(Exp38);
			Experience__c Exp39 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 55,  Description__c = 'Greet the day with Tai Chi, a gentle exercise focusing on relaxation, held on our peaceful beachfront at sunrise.', Duration_Hours__c = 1, Location__c = 'Beachfront', Name = 'Sunrise Tai Chi', Price__c = 150, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Relaxation & Quiet Zones'); Experiences.add(Exp39);
			Experience__c Exp40 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 35,  Description__c = 'Soak in our natural thermal springs, known for their healing properties and a perfect way to rejuvenate body and mind.', Duration_Hours__c = 5, Location__c = 'Thermal Springs Area', Name = 'Thermal Spring Rejuvenation', Price__c = 45, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Spa & Wellness'); Experiences.add(Exp40);
			Experience__c Exp41 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 55,  Description__c = 'Experience a day of pampering with treatments that blend modern techniques with traditional holistic practices.', Duration_Hours__c = 1, Location__c = 'Resort Spa', Name = 'Holistic Spa Retreat', Price__c = 25, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Spa & Wellness'); Experiences.add(Exp41);
			Experience__c Exp42 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = 'Indoor', Capacity__c = 80,  Description__c = 'Participate in workshops focusing on wellness topics, from nutrition to stress management, led by expert practitioners.', Duration_Hours__c = 3, Location__c = 'Wellness Center', Name = 'Wellness Workshops', Price__c = 149, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Spa & Wellness'); Experiences.add(Exp42);
			Experience__c Exp43 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 50,  Description__c = 'Relax in our infinity pool that merges seamlessly with the horizon, featuring underwater music and poolside service.', Duration_Hours__c = 1, Location__c = 'Infinity Pool', Name = 'Infinity Pool Lounge', Price__c = 50, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Swimming Pools'); Experiences.add(Exp43);
			Experience__c Exp44 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = 'Outdoor', Capacity__c = 25,  Description__c = 'Join our high-energy aquatic aerobics class, a great way to stay fit and have fun in the water.', Duration_Hours__c = 5, Location__c = 'Main Pool', Name = 'Aquatic Aerobics', Price__c = 55, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Swimming Pools'); Experiences.add(Exp44);
			Experience__c Exp45 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 80,  Description__c = 'Enjoy an enchanting night swim experience illuminated by a spectacular underwater light show.', Duration_Hours__c = 1, Location__c = 'Resort Pool', Name = 'Night Swim & Light Show', Price__c = 75, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Swimming Pools'); Experiences.add(Exp45);
			Experience__c Exp46 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = '', Capacity__c = 200,  Description__c = 'Compete in our tennis tournament, open to all skill levels, held on our championship courts.', Duration_Hours__c = 1, Location__c = 'Tennis Center', Name = 'Championship Tennis Tournament', Price__c = 99, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Tennis & Pickleball'); Experiences.add(Exp46);
			Experience__c Exp47 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 55,  Description__c = 'Meet fellow guests and enjoy friendly rounds of pickleball at our social mixer event, complete with refreshments.', Duration_Hours__c = 3, Location__c = 'Pickleball Courts', Name = 'Pickleball Social Mixer', Price__c = 55, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Tennis & Pickleball'); Experiences.add(Exp47);
			Experience__c Exp48 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = '', Capacity__c = 100,  Description__c = 'Start your day with a doubles tennis match at sunrise, offering cool temperatures and a fresh start to the morning.', Duration_Hours__c = 2, Location__c = 'Outdoor Tennis Courts', Name = 'Sunrise Doubles Challenge', Price__c = 55, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Tennis & Pickleball'); Experiences.add(Exp48);
			Experience__c Exp49 = new Experience__c(Activity_Level__c = 'Low', Activity_Type__c = '', Capacity__c = 25,  Description__c = 'Explore the coastline on a stand-up paddleboard, guided by our instructors who will lead you to hidden coves and beaches.', Duration_Hours__c = 2, Location__c = 'Coastal Waters', Name = 'Stand-Up Paddleboard Tour', Price__c = 99, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Water Sports'); Experiences.add(Exp49);
			Experience__c Exp50 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = 'Outdoor', Capacity__c = 50,  Description__c = 'Catch the wind and waves with our windsurfing classes, perfect for beginners and advanced surfers alike.', Duration_Hours__c = 3, Location__c = 'Beach Water Sports Center', Name = 'Windsurfing Adventure', Price__c = 155, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Water Sports'); Experiences.add(Exp50);
			Experience__c Exp51 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = '', Capacity__c = 30,  Description__c = 'Venture into the deep sea on our fishing expedition, seeking out the biggest catches and enjoying the thrill of the hunt.', Duration_Hours__c = 3, Location__c = 'Open Ocean', Name = 'Deep-Sea Fishing Expedition', Price__c = 55, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Water Sports'); Experiences.add(Exp51);
			Experience__c Exp52 = new Experience__c(Activity_Level__c = 'Medium', Activity_Type__c = '', Capacity__c = 30,  Description__c = 'Board our 4x4 vehicles for an adventurous off-road journey through the jungle&39;s heart.', Duration_Hours__c = 4, Location__c = 'Jungle Trails', Name = 'Off-Road Jungle Safari', Price__c = 199, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Adventure Activities'); Experiences.add(Exp52);
			Experience__c Exp53 = new Experience__c(Activity_Level__c = 'High', Activity_Type__c = '', Capacity__c = 20,  Description__c = 'Conquer the peaks with our mountain climbing adventure, guided by expert climbers.', Duration_Hours__c = 6, Location__c = 'Mountain Peaks', Name = 'Mountain Climbing Challenge', Price__c = 55, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Adventure Activities'); Experiences.add(Exp53);
			Experience__c Exp54 = new Experience__c(Activity_Level__c = 'High', Activity_Type__c = 'Outdoor', Capacity__c = 55,  Description__c = 'Experience the rush of navigating through raging rapids in this white water rafting adventure.', Duration_Hours__c = 1, Location__c = 'Rivers', Name = 'White Water Rafting Rush', Price__c = 250, Reviews_Summary__c = '', Things_to_Carry__c = '', Type__c = 'Adventure Activities'); Experiences.add(Exp54);
			
			// Convert list to set to remove duplicates
			Set<Experience__c> mySet = new Set<Experience__c>(Experiences);
			
			// Convert set back to list
			Experiences.clear();
			Experiences.addAll(mySet);
			if(!Experiences.isEmpty()){
				Insert Experiences;
			}		
			
			// Create a list to hold session records
			List<Session__c> Sessions = new List<Session__c>();
			
			// Create a Time object for 9 AM
			Time StartTime = Time.newInstance(10, 0, 0, 0);
			Time StartTime1 = Time.newInstance(12, 0, 0, 0);
			
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
			
			// Create a new Session record with specified fields
			
			if(!Experiences.isEmpty()){
				for (Experience__c exp : Experiences) {
					Time sessionStartTime = experienceStartTimes.get(exp.Name);
					 if (sessionStartTime == null) {
						 sessionStartTime = Time.newInstance(15, 30, 0, 0);
					}
					for (Integer i = 0; i < 15; i++) {
						Session__c session = new Session__c();
						session.Experience__c = exp.Id; 				
						session.Start_Time__c = sessionStartTime;
						session.Date__c = Date.today().addDays(i);
						Sessions.add(session);
					}
				}
			
				if (!Sessions.isEmpty()) {
					insert Sessions;
				}
			}  

			List<Contact> contactList = [SELECT Id, FirstName, LastName FROM Contact WHERE Email LIKE '%.dataclouddemo.com%' or Email = 'marjecroley@example.com'];
			List<Booking__c> bookings = new List<Booking__c>();
			if(!contactList.isEmpty() && !Sessions.isEmpty()){
				for(Contact con : contactList){
					for(Session__c session : Sessions){
						Booking__c booking = new Booking__c(Session__c = session.Id, Contact__c = con.Id, Number_of_Guests__c = 2);
						bookings.add(booking);
					}
				}
				if (!bookings.isEmpty()) {
					insert bookings;
				}
			}        
			system.Debug(bookings +'bookings');
		}catch(Exception e) {
				System.debug('Error: ' + e.getMessage());
				throw e;
		}
	}
}