public class Generate_Demodata {
    @InvocableMethod(label='Generate Accounts,Contacts, Loyalty data records' description='Generate records for Accounts, Contacts and Loyalty management objects.')
    public static void generateDemoData() {
        try{

            List<Account> Accounts= new List<Account>();

            Account acc01= new Account(Name = 'Will '); Accounts.add(acc01);
            Account acc02= new Account(Name = 'Pat'); Accounts.add(acc02);
            Account acc03= new Account(Name = 'Jocelyn'); Accounts.add(acc03);
            Account acc04= new Account(Name = 'Marco'); Accounts.add(acc04);
            Account acc05= new Account(Name = 'Azzie'); Accounts.add(acc05);
            Account acc06= new Account(Name = 'Carl'); Accounts.add(acc06); 
            Account acc07= new Account(Name = 'John'); Accounts.add(acc07); 
            Account acc08= new Account(Name = 'Joceph'); Accounts.add(acc08);
            Account acc09= new Account(Name = 'Sunshine Experience'); Accounts.add(acc09);

            Insert Accounts;
                system.debug(Accounts + 'Accounts');
            // Query inserted Accounts  
            Map<String, Account> accountMap = new Map<String, Account>();
                for (Account acc : [SELECT Id, Name FROM Account WHERE Name LIKE '%Sunshine Experience' OR Name LIKE '%Will' OR Name LIKE '%Pat'  OR Name LIKE '%Jocelyn'  OR Name LIKE '%Marco' OR Name LIKE '%Will' OR Name LIKE '%Azzie' OR Name LIKE '%Carl' OR Name LIKE '%John' OR Name LIKE '%Joceph']) {
                    accountMap.put(acc.Name, acc);
                }

            List<Contact> contacts = new List<Contact>();
                        
                Date currentDate1 = Date.today();
                Integer currentDay = currentDate1.day();
                Integer currentMonth = currentDate1.month();
                Integer year = 1991; // Replace this with the desired year
                
                Date birthDate = Date.newInstance(year, currentMonth, currentDay);
                Date anniverseryDate = Date.newInstance(1997, currentMonth, currentDay);
                System.debug('Birthdate: ' + birthDate);

                contacts.add(new Contact(FirstName = 'Will',Number_of_Children__c = 2, Under_Age_Children__c = 1, Ext_Id__c = '10007435', Interest1__c = 'Water Sports', Interest2__c = 'Spa & Wellness', Interest3__c = 'Adventure Activities', LastName = 'Stevenson', AccountId = accountMap.get('Will').Id, Email = 'WSTEVENSON.10000.0054@hotmail.dataclouddemo.com', Birthdate = birthDate, MobilePhone = '+268051899', MailingStreet = '75 Darwin Center', MailingCity = 'Bellevue', MailingCountry = 'United States', MailingState = 'Washington', MailingPostalCode = '98008', Preferred_Name__c = 'Will', Anniversary__c = Date.newInstance(1990, 1, 1)));
                contacts.add(new Contact(FirstName = 'Pat', Number_of_Children__c = 2, Under_Age_Children__c = 1, Ext_Id__c = '10007421', Interest1__c = 'Water Sports', Interest2__c = 'Spa & Wellness', Interest3__c = 'Adventure Activities', LastName = 'Coats', AccountId = accountMap.get('Pat').Id, Email = 'PCOATS.10000.0061@yahoo.dataclouddemo.com', Birthdate = birthDate, MobilePhone = '+99468051899', MailingStreet = '75 Darwin Center', MailingCity = 'Bellevue', MailingCountry = 'United States', MailingState = 'Washington', MailingPostalCode = '98008', Preferred_Name__c = 'Pat', Anniversary__c = Date.newInstance(1994, 1, 1)));
                contacts.add(new Contact(FirstName = 'Jocelyn',Number_of_Children__c = 2, Under_Age_Children__c = 1,  Ext_Id__c = '10001407', Interest1__c = 'Water Sports', Interest2__c = 'Spa & Wellness', Interest3__c = 'Adventure Activities', LastName = 'Vega', AccountId = accountMap.get('Jocelyn').Id, Email = 'JVEGA.10000.0065@hotmail.dataclouddemo.com', Birthdate = birthDate, MobilePhone = '+299946805', MailingStreet = '75 Darwin Center', MailingCity = 'Bellevue', MailingCountry = 'United States', MailingState = 'Washington', MailingPostalCode = '98008', Preferred_Name__c = 'Jocelyn', Anniversary__c = Date.newInstance(1996, 1, 1)));
                contacts.add(new Contact(FirstName = 'Marco', Number_of_Children__c = 2, Under_Age_Children__c = 1, Ext_Id__c = '10005491', Interest1__c = 'Water Sports', Interest2__c = 'Spa & Wellness', Interest3__c = 'Adventure Activities', LastName = 'Blanchette', AccountId = accountMap.get('Marco').Id, Email = 'MBLANCHETTE.10000.0066@yahoo.dataclouddemo.com', Birthdate = birthDate, MobilePhone = '+2999468051899', MailingStreet = '75 Darwin Center', MailingCity = 'Bellevue', MailingCountry = 'United States', MailingState = 'Washington', MailingPostalCode = '98008', Preferred_Name__c = 'Marco', Anniversary__c = Date.newInstance(1998, 1, 1)));
                contacts.add(new Contact(FirstName = 'Azzie', Number_of_Children__c = 2, Under_Age_Children__c = 1, Ext_Id__c = '10006952', Interest1__c = 'Water Sports', Interest2__c = 'Spa & Wellness', Interest3__c = 'Adventure Activities', LastName = 'Neely', AccountId = accountMap.get('Azzie').Id, Email = 'ANEELY.10000.0067@yahoo.dataclouddemo.com', Birthdate = birthDate, MobilePhone = '+2345678', MailingStreet = '75 Darwin Center', MailingCity = 'Bellevue', MailingCountry = 'United States', MailingState = 'Washington', MailingPostalCode = '98008', Preferred_Name__c = 'Azzie', Anniversary__c = Date.newInstance(2000, 1, 1)));
                contacts.add(new Contact(FirstName = 'Carl', Number_of_Children__c = 2, Under_Age_Children__c = 1, Ext_Id__c = '10003671', Interest1__c = 'Water Sports', Interest2__c = 'Spa & Wellness', Interest3__c = 'Adventure Activities', LastName = 'Stevenson', AccountId = accountMap.get('Carl').Id, Email = 'KSTEVENSON.10000.0068@gmail.dataclouddemo.com', Birthdate = birthDate, MobilePhone = '+876543', MailingStreet = '75 Darwin Center', MailingCity = 'Bellevue', MailingCountry = 'United States', MailingState = 'Washington', MailingPostalCode = '98008', Preferred_Name__c = 'Carl', Anniversary__c = Date.newInstance(2022, 1, 1)));
                contacts.add(new Contact(FirstName = 'John', Number_of_Children__c = 2, Under_Age_Children__c = 1, Ext_Id__c = '10005760', Interest1__c = 'Water Sports', Interest2__c = 'Spa & Wellness', Interest3__c = 'Adventure Activities', LastName = 'Smith', AccountId = accountMap.get('John').Id, Email = 'John.0068@gmail.dataclouddemo.com', Birthdate = birthDate, MobilePhone = '+277552222', MailingStreet = '75 Darwin Center', MailingCity = 'Bellevue', MailingCountry = 'United States', MailingState = 'Washington', MailingPostalCode = '98008', Preferred_Name__c = 'John', Anniversary__c = Date.newInstance(2024, 1, 1)));
                contacts.add(new Contact(FirstName = 'Joceph', Number_of_Children__c = 2, Under_Age_Children__c = 1, Ext_Id__c = '10003702', Interest1__c = 'Water Sports', Interest2__c = 'Spa & Wellness', Interest3__c = 'Adventure Activities', LastName = 'Stevenson', AccountId = accountMap.get('Joceph').Id, Email = 'Joceph.10000@gmail.dataclouddemo.com', Birthdate = birthDate, MobilePhone = '+9995500333', MailingStreet = '75 Darwin Center', MailingCity = 'Bellevue', MailingCountry = 'United States', MailingState = 'Washington', MailingPostalCode = '98008', Preferred_Name__c = 'Joceph', Anniversary__c = Date.newInstance(2026, 1, 1)));
				contacts.add(new Contact(FirstName = 'Marje', Number_of_Children__c = 2, Under_Age_Children__c = 1, Ext_Id__c = '10005760', Interest1__c = 'Water Sports', Interest2__c = 'Spa & Wellness', Interest3__c = 'Adventure Activities', LastName = 'Croley', AccountId = accountMap.get('Sunshine Experience').Id, Email = 'marjecroley@example.com', Birthdate = birthDate, MobilePhone = '+1275312849', MailingStreet = '75 Darwin Center', MailingCity = 'Bellevue', MailingCountry = 'United States', MailingState = 'Washington', MailingPostalCode = '98008', Preferred_Name__c = 'Joceph', Anniversary__c = Date.newInstance(2026, 1, 13), LeadSource = 'Partner', Guest_Type__c = 'Romance Retreaters', Preferred_Room_Type__c = 'Ocean/Sea View Room'));

                insert contacts;

                Map<String, Contact> contactMap1 = new Map<String, Contact>();
                for (Contact contact : [SELECT Id, FirstName, LastName FROM Contact WHERE Email LIKE '%.dataclouddemo.com%' or Email = 'marjecroley@example.com']) {
                    contactMap1.put(contact.FirstName, contact);
                }
                System.debug(contactMap1 + 'Contact Map1');
                List<Reservation__c> Reservations = New List<Reservation__c>();
                Date currentDate = Date.today(); 
                Date CheckOut = currentDate.addDays(2);

                Date upcomingCheckInDate = Date.today().addDays(7); 
                Date upcomingCheckOutDate = upcomingCheckInDate.addDays(2);

                Date pastCheckInDate = Date.today().addYears(-2);
                Date pastCheckOutDate = pastCheckInDate.addDays(3);
                
                
                Reservation__c R0171092 = new Reservation__c(Contact__c = contactMap1.get('Marje').Id, Booking_Channel__c = 'Web', Check_in_Date__c = currentDate, Check_out_Date__c = CheckOut, Reservation_Status__c = 'Pending', Room_Number__c = '4326', Room_Type__c = 'Standard',Special_Request__c = 'High Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('3300'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0171092); 
                Reservation__c R0171091 = new Reservation__c(Contact__c = contactMap1.get('Marje').Id, Booking_Channel__c = 'Web', Check_in_Date__c = upcomingCheckInDate, Check_out_Date__c = upcomingCheckOutDate, Reservation_Status__c = 'Confirmed', Room_Number__c = '4326', Room_Type__c = 'Standard',Special_Request__c = 'High Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('3400'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0171091);  
                Reservation__c R0171093 = new Reservation__c(Contact__c = contactMap1.get('Marje').Id, Booking_Channel__c = 'Web', Check_in_Date__c = pastCheckInDate, Check_out_Date__c = pastCheckOutDate, Reservation_Status__c = 'Pending', Room_Number__c = '4326', Room_Type__c = 'Standard',Special_Request__c = 'High Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('3300'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0171093); 
                Reservation__c R001 = new Reservation__c(Contact__c = contactMap1.get('Will').Id, Booking_Channel__c = 'Web', Check_in_Date__c = currentDate, Check_out_Date__c = CheckOut, Reservation_Status__c = 'Pending', Room_Number__c = '4321', Room_Type__c = 'Standard', Special_Request__c = 'Top Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2000'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R001); 
                Reservation__c R0011 = new Reservation__c(Contact__c = contactMap1.get('Will').Id, Booking_Channel__c = 'Web', Check_in_Date__c = upcomingCheckInDate, Check_out_Date__c = upcomingCheckOutDate, Reservation_Status__c = 'Confirmed', Room_Number__c = '4321', Room_Type__c = 'Standard', Special_Request__c = 'Top Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('4000'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0011); 
                Reservation__c R002 = new Reservation__c(Contact__c = contactMap1.get('Pat').Id, Booking_Channel__c = 'Web', Check_in_Date__c = currentDate, Check_out_Date__c = CheckOut, Reservation_Status__c = 'Pending', Room_Number__c = '4322', Room_Type__c = 'Standard', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('5000'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R002);    
                Reservation__c R0022 = new Reservation__c(Contact__c = contactMap1.get('Pat').Id, Booking_Channel__c = 'Web', Check_in_Date__c = upcomingCheckInDate, Check_out_Date__c = upcomingCheckOutDate, Reservation_Status__c = 'Confirmed', Room_Number__c = '4322', Room_Type__c = 'Standard', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2500'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0022);    
                Reservation__c R003 = new Reservation__c(Contact__c = contactMap1.get('Jocelyn').Id, Booking_Channel__c = 'Web', Check_in_Date__c = currentDate, Check_out_Date__c = CheckOut, Reservation_Status__c = 'Pending', Room_Number__c = '4323', Room_Type__c = 'Standard', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2700'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R003);    
                Reservation__c R0033 = new Reservation__c(Contact__c = contactMap1.get('Jocelyn').Id, Booking_Channel__c = 'Web', Check_in_Date__c = upcomingCheckInDate, Check_out_Date__c = upcomingCheckOutDate, Reservation_Status__c = 'Confirmed', Room_Number__c = '4323', Room_Type__c = 'Standard', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2800'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0033);    
                Reservation__c R004 = new Reservation__c(Contact__c = contactMap1.get('Marco').Id, Booking_Channel__c = 'Web', Check_in_Date__c = currentDate, Check_out_Date__c = CheckOut, Reservation_Status__c = 'Pending', Room_Number__c = '4324', Room_Type__c = 'Standard',Special_Request__c = 'Beach view', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2900'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R004);    
                Reservation__c R0044 = new Reservation__c(Contact__c = contactMap1.get('Marco').Id, Booking_Channel__c = 'Web', Check_in_Date__c = upcomingCheckInDate, Check_out_Date__c = upcomingCheckOutDate, Reservation_Status__c = 'Confirmed', Room_Number__c = '4324', Room_Type__c = 'Standard',Special_Request__c = 'Beach view', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2100'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0044);    
                Reservation__c R005 = new Reservation__c(Contact__c = contactMap1.get('Azzie').Id, Booking_Channel__c = 'Web', Check_in_Date__c = currentDate, Check_out_Date__c = CheckOut, Reservation_Status__c = 'Pending', Room_Number__c = '4325', Room_Type__c = 'Standard', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2200'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R005);  
                Reservation__c R0055 = new Reservation__c(Contact__c = contactMap1.get('Azzie').Id, Booking_Channel__c = 'Web', Check_in_Date__c = upcomingCheckInDate, Check_out_Date__c = upcomingCheckOutDate, Reservation_Status__c = 'Confirmed', Room_Number__c = '4325', Room_Type__c = 'Standard', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2300'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0055);  
                Reservation__c R006 = new Reservation__c(Contact__c = contactMap1.get('Carl').Id, Booking_Channel__c = 'Web', Check_in_Date__c = currentDate, Check_out_Date__c = CheckOut, Reservation_Status__c = 'Pending', Room_Number__c = '4326', Room_Type__c = 'Standard',Special_Request__c = 'High Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2400'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R006); 
                Reservation__c R0066 = new Reservation__c(Contact__c = contactMap1.get('Carl').Id, Booking_Channel__c = 'Web', Check_in_Date__c = upcomingCheckInDate, Check_out_Date__c = upcomingCheckOutDate, Reservation_Status__c = 'Pending', Room_Number__c = '4326', Room_Type__c = 'Standard',Special_Request__c = 'High Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('3200'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0066);   
                Reservation__c R007 = new Reservation__c(Contact__c = contactMap1.get('John').Id, Booking_Channel__c = 'Web', Check_in_Date__c = currentDate, Check_out_Date__c = CheckOut, Reservation_Status__c = 'Pending', Room_Number__c = '4326', Room_Type__c = 'Standard',Special_Request__c = 'High Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('3300'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R007); 
                Reservation__c R0077 = new Reservation__c(Contact__c = contactMap1.get('John').Id, Booking_Channel__c = 'Web', Check_in_Date__c = upcomingCheckInDate, Check_out_Date__c = upcomingCheckOutDate, Reservation_Status__c = 'Confirmed', Room_Number__c = '4326', Room_Type__c = 'Standard',Special_Request__c = 'High Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('3400'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0077); 
                Reservation__c R008 = new Reservation__c(Contact__c = contactMap1.get('Joceph').Id, Booking_Channel__c = 'Web', Check_in_Date__c = currentDate, Check_out_Date__c = CheckOut, Reservation_Status__c = 'Pending', Room_Number__c = '4326', Room_Type__c = 'Standard',Special_Request__c = 'High Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('3500'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R008);   
                Reservation__c R0088 = new Reservation__c(Contact__c = contactMap1.get('Joceph').Id, Booking_Channel__c = 'Web', Check_in_Date__c = upcomingCheckInDate, Check_out_Date__c = upcomingCheckOutDate, Reservation_Status__c = 'Pending', Room_Number__c = '4326', Room_Type__c = 'Standard',Special_Request__c = 'High Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('3600'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0088);
                
                Reservation__c R0991 = new Reservation__c(Contact__c = contactMap1.get('Will').Id, Booking_Channel__c = 'Web', Check_in_Date__c = pastCheckInDate, Check_out_Date__c = pastCheckOutDate, Reservation_Status__c = 'Pending', Room_Number__c = '4321', Room_Type__c = 'Standard', Special_Request__c = 'Top Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2000'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0991);       
                Reservation__c R0992 = new Reservation__c(Contact__c = contactMap1.get('Pat').Id, Booking_Channel__c = 'Web', Check_in_Date__c = pastCheckInDate, Check_out_Date__c = pastCheckOutDate, Reservation_Status__c = 'Pending', Room_Number__c = '4322', Room_Type__c = 'Standard', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('5000'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0992);          
                Reservation__c R0993 = new Reservation__c(Contact__c = contactMap1.get('Jocelyn').Id, Booking_Channel__c = 'Web', Check_in_Date__c = pastCheckInDate, Check_out_Date__c = pastCheckOutDate, Reservation_Status__c = 'Pending', Room_Number__c = '4323', Room_Type__c = 'Standard', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2700'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0993);      
                Reservation__c R0994 = new Reservation__c(Contact__c = contactMap1.get('Marco').Id, Booking_Channel__c = 'Web', Check_in_Date__c = pastCheckInDate, Check_out_Date__c = pastCheckOutDate, Reservation_Status__c = 'Pending', Room_Number__c = '4324', Room_Type__c = 'Standard',Special_Request__c = 'Beach view', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2900'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0994);          
                Reservation__c R0995 = new Reservation__c(Contact__c = contactMap1.get('Azzie').Id, Booking_Channel__c = 'Web', Check_in_Date__c = pastCheckInDate, Check_out_Date__c = pastCheckOutDate, Reservation_Status__c = 'Pending', Room_Number__c = '4325', Room_Type__c = 'Standard', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2200'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0995);    
                Reservation__c R0996 = new Reservation__c(Contact__c = contactMap1.get('Carl').Id, Booking_Channel__c = 'Web', Check_in_Date__c = pastCheckInDate, Check_out_Date__c = pastCheckOutDate, Reservation_Status__c = 'Pending', Room_Number__c = '4326', Room_Type__c = 'Standard',Special_Request__c = 'High Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('2400'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0996);   
                Reservation__c R0997 = new Reservation__c(Contact__c = contactMap1.get('John').Id, Booking_Channel__c = 'Web', Check_in_Date__c = pastCheckInDate, Check_out_Date__c = pastCheckOutDate, Reservation_Status__c = 'Pending', Room_Number__c = '4326', Room_Type__c = 'Standard',Special_Request__c = 'High Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('3300'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0997);   
                Reservation__c R0998 = new Reservation__c(Contact__c = contactMap1.get('Joceph').Id, Booking_Channel__c = 'Web', Check_in_Date__c = pastCheckInDate, Check_out_Date__c = pastCheckOutDate, Reservation_Status__c = 'Pending', Room_Number__c = '4326', Room_Type__c = 'Standard',Special_Request__c = 'High Floor', Number_Of_Adults__c = '2', Number_Of_Children__c = '1', Payment_Status__c = 'Pending', Total_Amount__c = Decimal.valueOf('3500'),  Property_Name__c ='Paradise Sands Resort'); Reservations.add(R0998);      
                        
                Insert Reservations;
                system.debug(Reservations + 'Reservations'); 
                        
                // Call generateLoyaltyData 
                generateDemoLoyaltyData();            
        } catch(Exception e) {
            System.debug('Error: ' + e.getMessage());
            throw e;
        }
    }
    
    public static void generateDemoLoyaltyData() {
        try{
            // Query inserted Contacts
            Map<String, Contact> contactMap = new Map<String, Contact>();
            for (Contact contact : [SELECT Id, FirstName, LastName FROM Contact WHERE Email LIKE '%.dataclouddemo.com%' or Email = 'marjecroley@example.com']) {
                contactMap.put(contact.FirstName, contact);
            }
                System.debug(contactMap + ' Contact Map');
        
            List<LoyaltyProgram> LoyaltyPrograms = new List<LoyaltyProgram>();
            LoyaltyPrograms.add(new LoyaltyProgram(Name = 'Cumulus Insider', Status = 'Active'));
            LoyaltyPrograms.add(new LoyaltyProgram(Name = 'NTO Loyalty Program', Status = 'Active'));
            LoyaltyPrograms.add(new LoyaltyProgram(Name = 'NTO Referral Program', Status = 'Active'));
            insert LoyaltyPrograms;
            System.debug(LoyaltyPrograms + ' Loyalty Programs');

            // Query inserted Loyalty Programs to get their IDs
            Map<String, LoyaltyProgram> loyaltyProgramMap = new Map<String, LoyaltyProgram>();
            for (LoyaltyProgram lp : [SELECT Id, Name FROM LoyaltyProgram WHERE Name LIKE '%Cumulus%' OR Name LIKE '%NTO%']) {
                loyaltyProgramMap.put(lp.Name, lp);
            }
            System.debug(loyaltyProgramMap + ' Loyalty Program Map');

            // Insert Loyalty Tier Groups with referenced LoyaltyProgramId
            List<LoyaltyTierGroup> LoyaltyTierGroups = new List<LoyaltyTierGroup>();
            Date ResetDate = Date.newInstance(2025, 12, 31);

            LoyaltyTierGroups.add(new LoyaltyTierGroup(Name = 'Cumulus Insider', TierModel = 'Fixed', IsActive = TRUE, TierPeriodQuantity = 60, TierPeriodUnit = 'Months', ExtendExpiration = 'None', LoyaltyProgramId = loyaltyProgramMap.get('Cumulus Insider').Id, QpResetPeriod = 'Years', QpResetDate = ResetDate, QpResetFrequency = 1));
            LoyaltyTierGroups.add(new LoyaltyTierGroup(Name = 'NTO Loyalty Program', TierModel = 'Fixed', IsActive = TRUE, TierPeriodQuantity = 60, TierPeriodUnit = 'Months', ExtendExpiration = 'None', LoyaltyProgramId = loyaltyProgramMap.get('NTO Loyalty Program').Id, QpResetPeriod = 'Years', QpResetDate = ResetDate, QpResetFrequency = 1));
            LoyaltyTierGroups.add(new LoyaltyTierGroup(Name = 'NTO Referral Program', TierModel = 'Fixed', IsActive = TRUE, TierPeriodQuantity = 60, TierPeriodUnit = 'Months', ExtendExpiration = 'None', LoyaltyProgramId = loyaltyProgramMap.get('NTO Referral Program').Id, QpResetPeriod = 'Years', QpResetDate = ResetDate, QpResetFrequency = 1));
            insert LoyaltyTierGroups;
            System.debug(LoyaltyTierGroups + ' Loyalty Tier Groups');              

            Map<String, LoyaltyTierGroup> loyaltyTierGroupMap = new Map<String, LoyaltyTierGroup>();
            for (LoyaltyTierGroup ltg : [SELECT Id, Name FROM LoyaltyTierGroup WHERE Name LIKE '%Cumulus%' OR Name LIKE '%NTO%']) {
                loyaltyTierGroupMap.put(ltg.Name, ltg);
            }
            System.debug(loyaltyTierGroupMap + ' Loyalty Tier Group Map');

            // Insert Loyalty Tiers with referenced LoyaltyTierGroupId
            List<LoyaltyTier> LoyaltyTiers = new List<LoyaltyTier>();
            LoyaltyTiers.add(new LoyaltyTier(Name = 'Silver', LoyaltyTierGroupId = loyaltyTierGroupMap.get('Cumulus Insider').Id, SequenceNumber = 1));
            LoyaltyTiers.add(new LoyaltyTier(Name = 'Silver', LoyaltyTierGroupId = loyaltyTierGroupMap.get('NTO Loyalty Program').Id, SequenceNumber = 1));
            LoyaltyTiers.add(new LoyaltyTier(Name = 'Silver', LoyaltyTierGroupId = loyaltyTierGroupMap.get('NTO Referral Program').Id, SequenceNumber = 1));
            LoyaltyTiers.add(new LoyaltyTier(Name = 'Gold', LoyaltyTierGroupId = loyaltyTierGroupMap.get('Cumulus Insider').Id, SequenceNumber = 2));
            LoyaltyTiers.add(new LoyaltyTier(Name = 'Gold', LoyaltyTierGroupId = loyaltyTierGroupMap.get('NTO Loyalty Program').Id, SequenceNumber = 2));
            LoyaltyTiers.add(new LoyaltyTier(Name = 'Gold', LoyaltyTierGroupId = loyaltyTierGroupMap.get('NTO Referral Program').Id, SequenceNumber = 2));
            LoyaltyTiers.add(new LoyaltyTier(Name = 'Platinum', LoyaltyTierGroupId = loyaltyTierGroupMap.get('Cumulus Insider').Id, SequenceNumber = 3));
            LoyaltyTiers.add(new LoyaltyTier(Name = 'Platinum', LoyaltyTierGroupId = loyaltyTierGroupMap.get('NTO Loyalty Program').Id, SequenceNumber = 3));
            LoyaltyTiers.add(new LoyaltyTier(Name = 'Platinum', LoyaltyTierGroupId = loyaltyTierGroupMap.get('NTO Referral Program').Id, SequenceNumber = 3));
            insert LoyaltyTiers;
            System.debug(LoyaltyTiers + ' Loyalty Tiers');  
        
            // Insert Loyalty Program Members
            List<LoyaltyProgramMember> loyaltyProgramMembers = new List<LoyaltyProgramMember>();
            loyaltyProgramMembers.add(new LoyaltyProgramMember(MemberType = 'Individual', ProgramId = loyaltyProgramMap.get('Cumulus Insider').Id, ContactId = contactMap.get('Will').Id, MembershipNumber = '100010', EnrollmentDate = Date.TODAY(), MemberStatus = 'Active', IsEligibleForTierAssessment = Boolean.valueOf(false)));
            loyaltyProgramMembers.add(new LoyaltyProgramMember(MemberType = 'Individual', ProgramId = loyaltyProgramMap.get('NTO Loyalty Program').Id, ContactId = contactMap.get('Pat').Id, MembershipNumber = '100011', EnrollmentDate = Date.TODAY(), MemberStatus = 'Active', IsEligibleForTierAssessment = Boolean.valueOf(false)));
            loyaltyProgramMembers.add(new LoyaltyProgramMember(MemberType = 'Individual', ProgramId = loyaltyProgramMap.get('NTO Referral Program').Id, ContactId = contactMap.get('Jocelyn').Id, MembershipNumber = '100012', EnrollmentDate = Date.TODAY(), MemberStatus = 'Active', IsEligibleForTierAssessment = Boolean.valueOf(false)));
            loyaltyProgramMembers.add(new LoyaltyProgramMember(MemberType = 'Individual', ProgramId = loyaltyProgramMap.get('Cumulus Insider').Id, ContactId = contactMap.get('Marco').Id, MembershipNumber = '100013', EnrollmentDate = Date.TODAY(), MemberStatus = 'Active', IsEligibleForTierAssessment = Boolean.valueOf(false)));
            loyaltyProgramMembers.add(new LoyaltyProgramMember(MemberType = 'Individual', ProgramId = loyaltyProgramMap.get('NTO Loyalty Program').Id, ContactId = contactMap.get('Azzie').Id, MembershipNumber = '100014', EnrollmentDate = Date.TODAY(), MemberStatus = 'Active', IsEligibleForTierAssessment = Boolean.valueOf(false)));
            loyaltyProgramMembers.add(new LoyaltyProgramMember(MemberType = 'Individual', ProgramId = loyaltyProgramMap.get('NTO Referral Program').Id, ContactId = contactMap.get('Carl').Id, MembershipNumber = '100015', EnrollmentDate = Date.TODAY(), MemberStatus = 'Active', IsEligibleForTierAssessment = Boolean.valueOf(false)));
            loyaltyProgramMembers.add(new LoyaltyProgramMember(MemberType = 'Individual', ProgramId = loyaltyProgramMap.get('Cumulus Insider').Id, ContactId = contactMap.get('Joceph').Id, MembershipNumber = '100016', EnrollmentDate = Date.TODAY(), MemberStatus = 'Active', IsEligibleForTierAssessment = Boolean.valueOf(false)));
            loyaltyProgramMembers.add(new LoyaltyProgramMember(MemberType = 'Individual', ProgramId = loyaltyProgramMap.get('Cumulus Insider').Id, ContactId = contactMap.get('John').Id, MembershipNumber = '100017', EnrollmentDate = Date.TODAY(), MemberStatus = 'Active', IsEligibleForTierAssessment = Boolean.valueOf(false)));
            loyaltyProgramMembers.add(new LoyaltyProgramMember(MemberType = 'Individual', ProgramId = loyaltyProgramMap.get('Cumulus Insider').Id, ContactId = contactMap.get('Marje').Id, MembershipNumber = '100019', EnrollmentDate = Date.TODAY(), MemberStatus = 'Active', IsEligibleForTierAssessment = Boolean.valueOf(false)));
            insert loyaltyProgramMembers;
            System.debug(loyaltyProgramMembers + ' Loyalty Program Members');
            
            //Insert LoyaltyProgramCurrency
            List<LoyaltyProgramCurrency> LoyaltyProgramCurrencies = new List<LoyaltyProgramCurrency>();

            LoyaltyProgramCurrencies.add(new LoyaltyProgramCurrency(Name = 'Cumulus Insider', CurrencyType = 'Qualifying', LoyaltyProgramId = loyaltyProgramMap.get('Cumulus Insider').Id, IsActive = TRUE, LoyaltyTierGroupId = loyaltyTierGroupMap.get('Cumulus Insider').Id));
            LoyaltyProgramCurrencies.add(new LoyaltyProgramCurrency(Name = 'NTO Loyalty Program', CurrencyType = 'Qualifying', LoyaltyProgramId = loyaltyProgramMap.get('NTO Loyalty Program').Id, IsActive = TRUE, LoyaltyTierGroupId = loyaltyTierGroupMap.get('NTO Loyalty Program').Id));
            LoyaltyProgramCurrencies.add(new LoyaltyProgramCurrency(Name = 'NTO Referral Program', CurrencyType = 'Qualifying', LoyaltyProgramId = loyaltyProgramMap.get('NTO Referral Program').Id, IsActive = TRUE, LoyaltyTierGroupId = loyaltyTierGroupMap.get('NTO Referral Program').Id));
            LoyaltyProgramCurrencies.add(new LoyaltyProgramCurrency(Name = 'Cumulus Insider1', CurrencyType = 'Qualifying', LoyaltyProgramId = loyaltyProgramMap.get('Cumulus Insider').Id, IsActive = TRUE, LoyaltyTierGroupId = loyaltyTierGroupMap.get('Cumulus Insider').Id));
            LoyaltyProgramCurrencies.add(new LoyaltyProgramCurrency(Name = 'NTO Loyalty Program1', CurrencyType = 'Qualifying', LoyaltyProgramId = loyaltyProgramMap.get('NTO Loyalty Program').Id, IsActive = TRUE, LoyaltyTierGroupId = loyaltyTierGroupMap.get('NTO Loyalty Program').Id));
            LoyaltyProgramCurrencies.add(new LoyaltyProgramCurrency(Name = 'NTO Referral Program1', CurrencyType = 'Qualifying', LoyaltyProgramId = loyaltyProgramMap.get('NTO Referral Program').Id, IsActive = TRUE, LoyaltyTierGroupId = loyaltyTierGroupMap.get('NTO Referral Program').Id));
            
            Insert LoyaltyProgramCurrencies;
            system.debug(LoyaltyProgramCurrencies + 'LoyaltyProgramCurrencies');        
            
            
            // Query inserted Loyalty Program Members
            Map<Id, LoyaltyProgramMember> loyaltyProgramMemberMap = new Map<Id, LoyaltyProgramMember>([SELECT Id, ProgramId, ContactId FROM LoyaltyProgramMember WHERE ProgramId IN :loyaltyProgramMap.values()]);
            System.debug(loyaltyProgramMemberMap + ' loyaltyProgramMemberMap');
                
            Map<String, LoyaltyProgramCurrency> LoyaltyProgramCurrencyMap = new Map<String, LoyaltyProgramCurrency>();
            for (LoyaltyProgramCurrency lp : [SELECT Id, Name FROM LoyaltyProgramCurrency ]) {
                LoyaltyProgramCurrencyMap.put(lp.Name, lp);
            }
            System.debug(LoyaltyProgramCurrencyMap + ' Loyalty ProgramCurrency Map');    
                
            
                
            // Insert Loyalty Member Currencies with referenced LoyaltyMemberId
            List<LoyaltyMemberCurrency> loyaltyMemberCurrencies = new List<LoyaltyMemberCurrency>();
            loyaltyMemberCurrencies.add(new LoyaltyMemberCurrency(Name = 'Tier Point', LoyaltyMemberId = loyaltyProgramMemberMap.values()[0].Id, TotalPointsAccrued = 500, LoyaltyProgramCurrencyId = LoyaltyProgramCurrencyMap.values()[0].Id));
            loyaltyMemberCurrencies.add(new LoyaltyMemberCurrency(Name = 'Tier Point', LoyaltyMemberId = loyaltyProgramMemberMap.values()[1].Id, TotalPointsAccrued = 4800, LoyaltyProgramCurrencyId = LoyaltyProgramCurrencyMap.values()[1].Id));
            loyaltyMemberCurrencies.add(new LoyaltyMemberCurrency(Name = 'Tier Point', LoyaltyMemberId = loyaltyProgramMemberMap.values()[2].Id, TotalPointsAccrued = 7457, LoyaltyProgramCurrencyId = LoyaltyProgramCurrencyMap.values()[2].Id));
            loyaltyMemberCurrencies.add(new LoyaltyMemberCurrency(Name = 'Tier Point', LoyaltyMemberId = loyaltyProgramMemberMap.values()[3].Id, TotalPointsAccrued = 18812, LoyaltyProgramCurrencyId = LoyaltyProgramCurrencyMap.values()[3].Id));
            loyaltyMemberCurrencies.add(new LoyaltyMemberCurrency(Name = 'Tier Point', LoyaltyMemberId = loyaltyProgramMemberMap.values()[4].Id, TotalPointsAccrued = 6123, LoyaltyProgramCurrencyId = LoyaltyProgramCurrencyMap.values()[4].Id));
            loyaltyMemberCurrencies.add(new LoyaltyMemberCurrency(Name = 'Tier Point', LoyaltyMemberId = loyaltyProgramMemberMap.values()[5].Id, TotalPointsAccrued = 7956, LoyaltyProgramCurrencyId = LoyaltyProgramCurrencyMap.values()[5].Id));          
            loyaltyMemberCurrencies.add(new LoyaltyMemberCurrency(Name = 'Tier Point', LoyaltyMemberId = loyaltyProgramMemberMap.values()[6].Id, TotalPointsAccrued = 5432, LoyaltyProgramCurrencyId = LoyaltyProgramCurrencyMap.values()[5].Id));
            loyaltyMemberCurrencies.add(new LoyaltyMemberCurrency(Name = 'Tier Point', LoyaltyMemberId = loyaltyProgramMemberMap.values()[7].Id, TotalPointsAccrued = 6890, LoyaltyProgramCurrencyId = LoyaltyProgramCurrencyMap.values()[5].Id));
            loyaltyMemberCurrencies.add(new LoyaltyMemberCurrency(Name = 'Tier Point', LoyaltyMemberId = loyaltyProgramMemberMap.values()[8].Id, TotalPointsAccrued = 8545, LoyaltyProgramCurrencyId = LoyaltyProgramCurrencyMap.values()[5].Id));
            
            insert loyaltyMemberCurrencies;
            System.debug(loyaltyMemberCurrencies + ' Loyalty Member Currencies');
            
            
            
            system.debug(LoyaltyProgramCurrencies + 'LoyaltyProgramCurrencies');
                
                Map<String, Reservation__c> RevMap = new Map<String, Reservation__c>();
                
                for (Reservation__c Rev : [SELECT Id, Reservation_Status__c, Contact__c, Contact__r.Name, Contact__r.FirstName FROM Reservation__c WHERE Reservation_Status__c = 'Pending' AND Payment_Status__c = 'Pending']) {
                RevMap.put(Rev.Contact__r.FirstName, Rev);
            }
                System.debug(RevMap + 'RevMap');
                System.debug(contactMap.get('Will').Id + 'contactMap.get 1');
                System.debug(contactMap.get('Pat').Id + 'contactMap.get 2');
                
            List<Promotion> Promotions = new List<Promotion>();

            Promotion p01 = new Promotion(Contact__c = contactMap.get('Will').Id, Reservation__c = RevMap.get('Will').Id, Name = 'Upgrade to Deluxe Room', Description = 'Book a Standard Room and get an exclusive upgrade to a Deluxe Room at no additional cost!', StartDate =Date.TODAY()); Promotions.add(p01);    
            Promotion p02 = new Promotion(Contact__c = contactMap.get('Pat').Id, Reservation__c = RevMap.get('Pat').Id,Name = 'One Night Free', Description = 'Stay three nights and get the fourth night free! Extend your vacation without extending your budget.', StartDate =Date.TODAY()); Promotions.add(p02);    
            Promotion p03 = new Promotion(Contact__c = contactMap.get('Jocelyn').Id, Reservation__c = RevMap.get('Jocelyn').Id,Name = 'Anniversary Dinner', Description = 'Celebrate love with a complimentary anniversary dinner at our gourmet restaurant when you book a suite.', StartDate =Date.TODAY()); Promotions.add(p03); 
            Promotion p04 = new Promotion(Contact__c = contactMap.get('Marco').Id, Reservation__c = RevMap.get('Marco').Id,Name = 'Upgrade to an Ocean View Room for $25/night', Description = 'Enhance your stay with a stunning ocean view for just an additional $25 per night!', StartDate =Date.TODAY()); Promotions.add(p04);
            Promotion p05 = new Promotion(Contact__c = contactMap.get('Azzie').Id, Reservation__c = RevMap.get('Azzie').Id,Name = 'Free Activities/Experiences', Description = 'Unlock free experiences such as local excursions, cooking classes, and cultural shows as part of our guest package.', StartDate =Date.TODAY()); Promotions.add(p05);
            Promotion p06 = new Promotion(Contact__c = contactMap.get('Carl').Id, Reservation__c = RevMap.get('Carl').Id,Name = 'Birthday promotion', Description = 'Celebrate your special day with our fantastic Birthday Promotion.', StartDate =Date.TODAY()); Promotions.add(p06); 
            Promotion p14 = new Promotion(Contact__c = contactMap.get('Joceph').Id, Reservation__c = RevMap.get('Joceph').Id,Name = 'Birthday promotion', Description = 'Celebrate your special day with our fantastic Birthday Promotion.', StartDate =Date.TODAY()); Promotions.add(p14); 
            Promotion p07 = new Promotion(Contact__c = contactMap.get('John').Id, Reservation__c = RevMap.get('John').Id,Name = 'Free Activities/Experiences', Description = 'Unlock free experiences such as local excursions, cooking classes, and cultural shows as part of our guest package.', StartDate =Date.TODAY()); Promotions.add(p07);
            Promotion p08 = new Promotion(Contact__c = contactMap.get('John').Id, Reservation__c = RevMap.get('John').Id,Name = 'Spa Discount', Description = 'Relax and rejuvenate with our exclusive Spa Discount Promotion.', StartDate =Date.TODAY()); Promotions.add(p08);
            Promotion p09 = new Promotion(Contact__c = contactMap.get('John').Id, Reservation__c = RevMap.get('John').Id,Name = 'One Night Free', Description = 'Reward your loyalty with our exclusive One Free Night Promotion!.', StartDate =Date.TODAY()); Promotions.add(p09);
            Promotion p10 = new Promotion(Contact__c = contactMap.get('John').Id, Reservation__c = RevMap.get('John').Id,Name = 'Anniversary Dinner', Description = 'Celebrate love with our exclusive Anniversary Dinner Promotion.', StartDate =Date.TODAY()); Promotions.add(p10);
            Promotion p11 = new Promotion(Contact__c = contactMap.get('John').Id, Reservation__c = RevMap.get('John').Id,Name = 'One Free nights based on loyalty points', Description = 'Reward your loyalty with our exclusive One Free Night Promotion.', StartDate =Date.TODAY()); Promotions.add(p11);
            Promotion p12 = new Promotion(Contact__c = contactMap.get('John').Id, Reservation__c = RevMap.get('John').Id,Name = 'Anniversary Dinner', Description = 'Celebrate love with our exclusive Anniversary Dinner Promotion.', StartDate =Date.TODAY()); Promotions.add(p12);
            Promotion p13 = new Promotion(Contact__c = contactMap.get('John').Id, Reservation__c = RevMap.get('John').Id,Name = 'Birthday promotion', Description = 'Celebrate your special day with our fantastic Birthday Promotion.', StartDate =Date.TODAY()); Promotions.add(p13); 
            Promotion p071 = new Promotion(Contact__c = contactMap.get('Will').Id, Reservation__c = RevMap.get('Will').Id,Name = 'Free Activities/Experiences', Description = 'Unlock free experiences such as local excursions, cooking classes, and cultural shows as part of our guest package.', StartDate =Date.TODAY()); Promotions.add(p071);
            Promotion p081 = new Promotion(Contact__c = contactMap.get('Will').Id, Reservation__c = RevMap.get('Will').Id,Name = 'Spa Discount', Description = 'Relax and rejuvenate with our exclusive Spa Discount Promotion.', StartDate =Date.TODAY()); Promotions.add(p081);
            Promotion p091 = new Promotion(Contact__c = contactMap.get('Will').Id, Reservation__c = RevMap.get('Will').Id,Name = 'One Night Free', Description = 'Reward your loyalty with our exclusive One Free Night Promotion!.', StartDate =Date.TODAY()); Promotions.add(p091);
            Promotion p101 = new Promotion(Contact__c = contactMap.get('Will').Id, Reservation__c = RevMap.get('Will').Id,Name = 'Anniversary Dinner', Description = 'Celebrate love with our exclusive Anniversary Dinner Promotion.', StartDate =Date.TODAY()); Promotions.add(p101);
            Promotion p112 = new Promotion(Contact__c = contactMap.get('Will').Id, Reservation__c = RevMap.get('Will').Id,Name = 'One Free nights based on loyalty points', Description = 'Reward your loyalty with our exclusive One Free Night Promotion.', StartDate =Date.TODAY()); Promotions.add(p112);
            Promotion p123 = new Promotion(Contact__c = contactMap.get('Will').Id, Reservation__c = RevMap.get('Will').Id,Name = 'Anniversary Dinner', Description = 'Celebrate love with our exclusive Anniversary Dinner Promotion.', StartDate =Date.TODAY()); Promotions.add(p123);
            Promotion p134 = new Promotion(Contact__c = contactMap.get('Will').Id, Reservation__c = RevMap.get('Will').Id,Name = 'Birthday promotion', Description = 'Celebrate your special day with our fantastic Birthday Promotion.', StartDate =Date.TODAY()); Promotions.add(p134);   
            Promotion p070 = new Promotion(Contact__c = contactMap.get('Pat').Id, Reservation__c = RevMap.get('Pat').Id,Name = 'Free Activities/Experiences', Description = 'Unlock free experiences such as local excursions, cooking classes, and cultural shows as part of our guest package.', StartDate =Date.TODAY()); Promotions.add(p070);
            Promotion p080 = new Promotion(Contact__c = contactMap.get('Pat').Id, Reservation__c = RevMap.get('Pat').Id,Name = 'Spa Discount', Description = 'Relax and rejuvenate with our exclusive Spa Discount Promotion.', StartDate =Date.TODAY()); Promotions.add(p080);    
            Promotion p100 = new Promotion(Contact__c = contactMap.get('Pat').Id, Reservation__c = RevMap.get('Pat').Id,Name = 'Anniversary Dinner', Description = 'Celebrate love with our exclusive Anniversary Dinner Promotion.', StartDate =Date.TODAY()); Promotions.add(p100);
            Promotion p110 = new Promotion(Contact__c = contactMap.get('Pat').Id, Reservation__c = RevMap.get('Pat').Id,Name = 'One Free nights based on loyalty points', Description = 'Reward your loyalty with our exclusive One Free Night Promotion.', StartDate =Date.TODAY()); Promotions.add(p110);
            Promotion p120 = new Promotion(Contact__c = contactMap.get('Pat').Id, Reservation__c = RevMap.get('Pat').Id,Name = 'Anniversary Dinner', Description = 'Celebrate love with our exclusive Anniversary Dinner Promotion.', StartDate =Date.TODAY()); Promotions.add(p120);
            Promotion p130 = new Promotion(Contact__c = contactMap.get('Pat').Id, Reservation__c = RevMap.get('Pat').Id,Name = 'Birthday promotion', Description = 'Celebrate your special day with our fantastic Birthday Promotion.', StartDate =Date.TODAY()); Promotions.add(p130); 
            Promotion p0791 = new Promotion(Contact__c = contactMap.get('Jocelyn').Id, Reservation__c = RevMap.get('Jocelyn').Id,Name = 'Free Activities/Experiences', Description = 'Unlock free experiences such as local excursions, cooking classes, and cultural shows as part of our guest package.', StartDate =Date.TODAY()); Promotions.add(p0791);
            Promotion p0892 = new Promotion(Contact__c = contactMap.get('Jocelyn').Id, Reservation__c = RevMap.get('Jocelyn').Id,Name = 'Spa Discount', Description = 'Relax and rejuvenate with our exclusive Spa Discount Promotion.', StartDate =Date.TODAY()); Promotions.add(p0892);
            Promotion p0993 = new Promotion(Contact__c = contactMap.get('Jocelyn').Id, Reservation__c = RevMap.get('Jocelyn').Id,Name = 'One Night Free', Description = 'Reward your loyalty with our exclusive One Free Night Promotion!.', StartDate =Date.TODAY()); Promotions.add(p0993);    
            Promotion p1194 = new Promotion(Contact__c = contactMap.get('Jocelyn').Id, Reservation__c = RevMap.get('Jocelyn').Id,Name = 'One Free nights based on loyalty points', Description = 'Reward your loyalty with our exclusive One Free Night Promotion.', StartDate =Date.TODAY()); Promotions.add(p1194);    
            Promotion p1395 = new Promotion(Contact__c = contactMap.get('Jocelyn').Id, Reservation__c = RevMap.get('Jocelyn').Id,Name = 'Birthday promotion', Description = 'Celebrate your special day with our fantastic Birthday Promotion.', StartDate =Date.TODAY()); Promotions.add(p1395);   
            Promotion p07881 = new Promotion(Contact__c = contactMap.get('Marco').Id, Reservation__c = RevMap.get('Marco').Id,Name = 'Free Activities/Experiences', Description = 'Unlock free experiences such as local excursions, cooking classes, and cultural shows as part of our guest package.', StartDate =Date.TODAY()); Promotions.add(p07881);
            Promotion p08882 = new Promotion(Contact__c = contactMap.get('Marco').Id, Reservation__c = RevMap.get('Marco').Id,Name = 'Spa Discount', Description = 'Relax and rejuvenate with our exclusive Spa Discount Promotion.', StartDate =Date.TODAY()); Promotions.add(p08882);
            Promotion p09883 = new Promotion(Contact__c = contactMap.get('Marco').Id, Reservation__c = RevMap.get('Marco').Id,Name = 'One Night Free', Description = 'Reward your loyalty with our exclusive One Free Night Promotion!.', StartDate =Date.TODAY()); Promotions.add(p09883);
            Promotion p10884 = new Promotion(Contact__c = contactMap.get('Marco').Id, Reservation__c = RevMap.get('Marco').Id,Name = 'Anniversary Dinner', Description = 'Celebrate love with our exclusive Anniversary Dinner Promotion.', StartDate =Date.TODAY()); Promotions.add(p10884);
            Promotion p11885 = new Promotion(Contact__c = contactMap.get('Marco').Id, Reservation__c = RevMap.get('Marco').Id,Name = 'One Free nights based on loyalty points', Description = 'Reward your loyalty with our exclusive One Free Night Promotion.', StartDate =Date.TODAY()); Promotions.add(p11885);
            Promotion p12886 = new Promotion(Contact__c = contactMap.get('Marco').Id, Reservation__c = RevMap.get('Marco').Id,Name = 'Anniversary Dinner', Description = 'Celebrate love with our exclusive Anniversary Dinner Promotion.', StartDate =Date.TODAY()); Promotions.add(p12886);
            Promotion p13887 = new Promotion(Contact__c = contactMap.get('Marco').Id, Reservation__c = RevMap.get('Marco').Id,Name = 'Birthday promotion', Description = 'Celebrate your special day with our fantastic Birthday Promotion.', StartDate =Date.TODAY()); Promotions.add(p13887); 
            Promotion p01992 = new Promotion(Contact__c = contactMap.get('Marje').Id, Reservation__c = RevMap.get('Marje').Id,Name = 'Free Activities/Experiences', Description = 'Unlock free experiences such as local excursions, cooking classes, and cultural shows as part of our guest package.', StartDate =Date.TODAY()); Promotions.add(p01992);
            Promotion p01993 = new Promotion(Contact__c = contactMap.get('Marje').Id, Reservation__c = RevMap.get('Marje').Id,Name = 'Spa Discount', Description = 'Relax and rejuvenate with our exclusive Spa Discount Promotion.', StartDate =Date.TODAY()); Promotions.add(p01993);
            Promotion p01994 = new Promotion(Contact__c = contactMap.get('Marje').Id, Reservation__c = RevMap.get('Marje').Id,Name = 'One Night Free', Description = 'Reward your loyalty with our exclusive One Free Night Promotion!.', StartDate =Date.TODAY()); Promotions.add(p01994);
            Promotion p01995 = new Promotion(Contact__c = contactMap.get('Marje').Id, Reservation__c = RevMap.get('Marje').Id,Name = 'Anniversary Dinner', Description = 'Celebrate love with our exclusive Anniversary Dinner Promotion.', StartDate =Date.TODAY()); Promotions.add(p01995);
            Promotion p01996 = new Promotion(Contact__c = contactMap.get('Marje').Id, Reservation__c = RevMap.get('Marje').Id,Name = 'One Free nights based on loyalty points', Description = 'Reward your loyalty with our exclusive One Free Night Promotion.', StartDate =Date.TODAY()); Promotions.add(p01996);
            Promotion p01997 = new Promotion(Contact__c = contactMap.get('Marje').Id, Reservation__c = RevMap.get('Marje').Id,Name = 'Anniversary Dinner', Description = 'Celebrate love with our exclusive Anniversary Dinner Promotion.', StartDate =Date.TODAY()); Promotions.add(p01997);
            Promotion p01998 = new Promotion(Contact__c = contactMap.get('Marje').Id, Reservation__c = RevMap.get('Marje').Id,Name = 'Birthday promotion', Description = 'Celebrate your special day with our fantastic Birthday Promotion.', StartDate =Date.TODAY()); Promotions.add(p01998); 
        
            Insert Promotions;
            system.debug(Promotions + 'Promotions');          
             
               assignSunshinePSToBotUser();     
        } catch(Exception e) {
            System.debug('Error: ' + e.getMessage());
            throw e;
        }
    }
    
    @future
      public static void assignSunshinePSToBotUser(){
        String username = UserInfo.getUserName() +'.'+'sunshinebotuser';
        User agentUser = [SELECT Id FROM User WHERE FirstName='Agent' AND LastName ='User' and UserName =:username LIMIT 1];
        List<PermissionSet> permSet = [SELECT Id,Name FROM PermissionSet Where Name IN ('Sunshine_Community_Agent')];
        List<PermissionSetAssignment> psa = [SELECT Id,AssigneeId,PermissionSetId FROM PermissionSetAssignment WHERE AssigneeId=:agentUser.Id and PermissionSetId=:permSet[0].Id];
        System.debug('psa -->'+psa);
        
        //Assign 'Agentforce Service Agent User' Permission Set License to Agent User
        
        if(!permSet.isEmpty() && psa.isEmpty()){
              System.debug('psa 1233-->'+psa);
            PermissionSetAssignment psAssignee = New PermissionSetAssignment();
            psAssignee.AssigneeId=agentUser.Id;
            psAssignee.PermissionSetId =permSet[0].Id;
            if(!Test.isRunningTest()){
                Insert psAssignee;
            }
        }
    }
}
