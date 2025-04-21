public with sharing class ExperienceController {
    static Integer PAGE_SIZE = 9;
    
    public static List<Experience_c__dlm> getExperienceRecords(Contact contact) {
        System.debug('## contact Exp = '+contact);       
        List<Experience_c__dlm> listOfExperiences = new List<Experience_c__dlm>();
        if(contact != NULL){
            String intrest1 =   contact.Interest1__c;
            String intrest2 =   contact.Interest2__c;
            String intrest3 =   contact.Interest3__c;
            if(intrest1 == NULL && intrest2 == NULL && intrest3 == NULL){
                intrest1 = 'Adventure Activities';
            }
            listOfExperiences = [
                SELECT
                Id__c,
                Name__c,
                Type_c__c,
                Price_c__c,
                Picture_URL_c__c,
                Activity_Level_c__c,
                Duration_Hours_c__c,
                Capacity_c__c
                FROM Experience_c__dlm Where  Type_c__c IN (:intrest1, :intrest2, :intrest3) 
                ORDER BY CreatedDate__c DESC
                LIMIT 100
            ];
            System.debug('## listOfExperiences = '+listOfExperiences);
            System.debug('## listOfExperiences size = '+listOfExperiences.size());            
        }
        return listOfExperiences;
    }
    
    public static List<Booking__dlm> getExperienceBookingsRecords(Contact contact) {
        System.debug('## contact Exp = '+contact); 
        List<Booking__dlm> listOfBookings = new List<Booking__dlm>();
        if(contact != NULL){
            String intrest1 =   contact.Interest1__c;
            String intrest2 =   contact.Interest2__c;
            String intrest3 =   contact.Interest3__c; 
            if(intrest1 == NULL && intrest2 == NULL && intrest3 == NULL){
                intrest1 = 'Adventure Activities';
            }
            List<Experience_c__dlm> listOfExperiences = [
                SELECT
                Id__c,
                Name__c,
                Type_c__c,
                Price_c__c,
                Picture_URL_c__c,
                Activity_Level_c__c,
                Duration_Hours_c__c,
                Capacity_c__c
                FROM Experience_c__dlm Where  Type_c__c IN (:intrest1, :intrest2, :intrest3)
                ORDER BY CreatedDate__c DESC
                LIMIT 20
            ];
            Set<String> setOfExpName = new Set<String>();
            If(!listOfExperiences.isEmpty()){
                for(Experience_c__dlm exp : listOfExperiences){
                    setOfExpName.add(exp.Name__c);
                }
            }else{
                setOfExpName.add('White Water Rafting Rush');
            }
            System.debug('## setOfExpName = '+setOfExpName);  
            
            
            listOfBookings = [
                Select Id__c,Session_c__c,Activity_Level__c,Number_of_Guests__c,Experience_Name__c,Type__c,
                Total_Price__c
                from Booking__dlm Where 
                Contact_c__c =:  contact.Id and Experience_Name__c IN : setOfExpName  
                ORDER BY CreatedDate__c DESC
                LIMIT 20
            ];
            System.debug('## listOfBookings = '+listOfBookings);
            System.debug('## listOfBookings size = '+listOfBookings.size());
    	}
        return listOfBookings;
    }
    
    public static List<Experience_Session__dlm> getExperienceSessionRecordsForUpcoming(Contact contact) {
        System.debug('## contact Sess = '+contact);
		String intrest1 =   contact.Interest1__c;
        String intrest2 =   contact.Interest2__c;
        String intrest3 =   contact.Interest3__c;
        List<Experience_c__dlm> listOfExperiences = [
            SELECT
            Id__c,
            Name__c,
            Type_c__c,
            Price_c__c,
            Picture_URL_c__c,
            Activity_Level_c__c,
            Duration_Hours_c__c,
            Capacity_c__c
            FROM Experience_c__dlm Where  Type_c__c IN (:intrest1, :intrest2, :intrest3)
            ORDER BY CreatedDate__c DESC
            LIMIT 100
        ];
        Set<Id> idOfExp = new Set<Id>();
        If(!listOfExperiences.isEmpty()){
            for(Experience_c__dlm exp : listOfExperiences){
                idOfExp.add(exp.Id__c);
            }
        }
        System.debug('## idOfExp = '+idOfExp);        
        List<Experience_Session__dlm> listOfSessions = new List<Experience_Session__dlm>();
        if(idOfExp != null){
            listOfSessions = [
                Select Id,Id__c,Name__c,Date__c,Start_Time__c,End_Time__c,
                Experience__c
                from Experience_Session__dlm Where Experience__c IN : idOfExp and Date__c = Today 
                ORDER BY Date__c DESC
                LIMIT 50
        	];
        }         
        System.debug('## listOfSessions Sess = '+listOfSessions);
        System.debug('## listOfSessions Sess size = '+listOfSessions.size());
        return listOfSessions;
    }
    
    public static List<Session__c> getExperienceSessionRecordsForPast(Contact contact) {
        System.debug('## contact Sess = '+contact);
        List<Experience__c> listOfExperiences = [
            SELECT
            Id,
            Name,
            Type__c,
            Price__c,
            Activity_Level__c,
            Default_Start_Time__c,
            Capacity__c
            FROM Experience__c
            WHERE
            (Type__c = :contact.Interest1__c
             OR Type__c = :contact.Interest2__c
             OR Type__c = :contact.Interest3__c)
            WITH USER_MODE
            ORDER BY CreatedDate DESC
            LIMIT 100
        ];
        Set<Id> idOfExp = new Set<Id>();
        If(!listOfExperiences.isEmpty()){
            for(Experience__c exp : listOfExperiences){
                idOfExp.add(exp.Id);
            }
        }
        System.debug('## idOfExp = '+idOfExp);
        List<Session__c> listOfSessions = new List<Session__c>();
        if(idOfExp != null){
            listOfSessions = [
                Select Id,Name,Date__c,Start_Time__c,
                End_Time__c,Available_Slots__c,Percentage_Booked__c,Experience__c,Experience__r.Name
                from Session__c Where Experience__c IN : idOfExp and Date__c < Today
                WITH USER_MODE
                ORDER BY CreatedDate DESC
                LIMIT 100
        	];
        }         
        System.debug('## listOfSessions Sess = '+listOfSessions);
        System.debug('## listOfSessions Sess size = '+listOfSessions.size());
        return listOfSessions;
    }

    /**
     * Endpoint that retrieves the sessions associated with an experience and a date
     * @param experienceId Experience ID
     * @param timestamp Timestamp representing the date on which the sessions take place
     * @return List of Session__c records
     */
    @AuraEnabled(cacheable=true scope='global')
    public static List<Session__c> getExperienceSessionsForDate(
        Id experienceId,
        Long timestamp
    ) {
        Date dateFilter = Datetime.newInstance(timestamp).date();
        List<Session__c> sessions = [
            SELECT
                Id,
                Booked_Slots__c,
                Capacity__c,
                End_Time__c,
                Percentage_Booked__c,
                Start_Time__c,
                Status__c,
                Experience__r.Price__c
            FROM Session__c
            WHERE Experience__c = :experienceId AND Date__c = :dateFilter
            WITH SECURITY_ENFORCED
            ORDER BY Start_Time__c ASC
            LIMIT 10
        ];
        return sessions;
    }

    @AuraEnabled(Cacheable=true scope='global')
    public static PagedResult getExperiences(String type, Integer pageNumber) {
        String whereClause = '';
        if (type != null || type != '') {
            whereClause = 'WHERE Type__c = :type';
        }
        Integer pageSize = ExperienceController.PAGE_SIZE;
        Integer offset = (pageNumber - 1) * pageSize;
        PagedResult result = new PagedResult();
        result.pageSize = pageSize;
        result.pageNumber = pageNumber;
        result.totalItemCount = Database.countQuery(
            'SELECT count() FROM Experience__c ' + whereClause
        );
        result.records = Database.query(
            'SELECT Id, Name, Description__c, Rating__c, Picture_URL__c FROM Experience__c ' +
                whereClause +
                ' WITH SECURITY_ENFORCED' +
                ' ORDER BY Name LIMIT :pageSize OFFSET :offset'
        );
        return result;
    }

    public with sharing class PagedResult {
        @AuraEnabled
        public Integer pageSize { get; set; }
    
        @AuraEnabled
        public Integer pageNumber { get; set; }
    
        @AuraEnabled
        public Integer totalItemCount { get; set; }
    
        @AuraEnabled
        public Object[] records { get; set; }
    }
    
}