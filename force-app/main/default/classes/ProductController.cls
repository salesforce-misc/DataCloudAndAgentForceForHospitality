public with sharing class ProductController {
    public static Boolean isVisibleProdcmp;
    // The variables in this class need to match the prompt template inputs,
    // that may be different on each prompt template
    public class Request {
        @InvocableVariable
        public Boolean showProductListComp;
    }
    
    // AuraEnabled method to get a list of products based on a description filter
    @AuraEnabled(cacheable=true)
    public static List<ProductListWrapper> getProductList() {
        List<ProductListWrapper> prodWrapperList = new List<ProductListWrapper>();
        List<ssot__Product__dlm> prodlist = New List<ssot__Product__dlm>();
        Boolean showPetFriendlyHotel=false;
        Boolean showBeachfrontHotel=false;
        System.debug('Inside getProductList method');
        String searchKey1 = 'family-friendly';
        String searchKey2 = 'familyfriendly';
        String searchKey3 = 'family friendly';
        String petFriendlySKey = 'Pets not allowed.';
        String activeProduct ='true';
        
        String query = 'SELECT ssot__Id__c,ssot__Name__c, ssot__Description__c FROM ssot__Product__dlm';
        query += ' WHERE (ssot__Description__c LIKE \'%' + searchKey1 + '%\' OR ssot__Description__c  LIKE \'%' + searchKey2 + '%\' OR ssot__Description__c  LIKE \'%' + searchKey3 + '%\') AND IsActive__c=:activeProduct';
        
        System.debug('dynamic query -->'+ query); 
        prodlist = Database.query(query);
        
        System.debug('All Product List: ' + prodlist);
        //Integer hotelPrice=550;
        if(!prodlist.isEmpty() || prodlist!=null){
            for(ssot__Product__dlm prod : prodList){
                ProductListWrapper prodWrapper = new ProductListWrapper();
                prodWrapper.hotelName = prod.ssot__Name__c;
                prodWrapper.hotelDescription = prod.ssot__Description__c;
                prodWrapper.prodId = prod.ssot__Id__c;
                prodWrapper.isVisibleProd = true;
                prodWrapper.isPetFrndProd = false;
                prodWrapper.isProdURL='/SunshineResorts/product/'+prod.ssot__Id__c;
                prodWrapper.expediaPrice=getExpediaPrice(prod.ssot__Name__c);
                prodWrapper.productPrice=getProductPrice(prod.ssot__Name__c);
                prodWrapperList.add(prodWrapper);
                //hotelPrice=hotelPrice+80;
            }
        }
        System.debug('prodWrapperList: ' + prodWrapperList);
        return prodWrapperList;
        //return prodlist;
    }
    
    @AuraEnabled
    public static List<ProductListWrapper> getPetFriendlyProductList() {
        List<ProductListWrapper> prodWrapperList = new List<ProductListWrapper>();
        List<ssot__Product__dlm> prodlist = New List<ssot__Product__dlm>();
        Boolean showPetFriendlyHotel=false;
        Boolean showBeachfrontHotel=false;
        System.debug('Inside getProductList method');
        String searchKey1 = 'family-friendly';
        String searchKey2 = 'familyfriendly';
        String searchKey3 = 'family friendly';
        String petFriendlySKey = 'Pets not allowed.';
        String activeProduct ='true';
        
        String query = 'SELECT ssot__Id__c,ssot__Name__c, ssot__Description__c FROM ssot__Product__dlm';
        query += ' WHERE (ssot__Description__c LIKE \'%' + searchKey1 + '%\' OR ssot__Description__c  LIKE \'%' + searchKey2 + '%\' OR ssot__Description__c  LIKE \'%' + searchKey3 + '%\') AND Pet_Policy__c !=:petFriendlySKey AND IsActive__c=:activeProduct';
        
        System.debug('dynamic query pet-->'+ query); 
        prodlist = Database.query(query);
        
        System.debug('dynamic query pet--> ' + prodlist);
        // Integer hotelPrice=550;
        if(!prodlist.isEmpty() || prodlist!=null){
            for(ssot__Product__dlm prod : prodList){
                ProductListWrapper prodWrapper = new ProductListWrapper();
                prodWrapper.hotelName = prod.ssot__Name__c;
                prodWrapper.hotelDescription = prod.ssot__Description__c;
                prodWrapper.prodId = prod.ssot__Id__c;
                prodWrapper.isVisibleProd = false;
                prodWrapper.isPetFrndProd = true;
                prodWrapper.isProdURL='/SunshineResorts/product/'+prod.ssot__Id__c;
                prodWrapper.expediaPrice=getExpediaPrice(prod.ssot__Name__c);
                prodWrapper.productPrice=getProductPrice(prod.ssot__Name__c);
                prodWrapperList.add(prodWrapper);
                // hotelPrice=hotelPrice+80;
            }
        }
        System.debug('prodWrapperList:pet ' + prodWrapperList);
        return prodWrapperList;
        //return prodlist;
    }
    
    public static Integer getProductPrice(String hotelName){
        System.debug('\n hotel name 12-->'+hotelName);
        Integer prodPrice;
        List<PricebookEntry> pe= [SELECT Name,Pricebook2Id, Pricebook2.Name,Product2.Name, Product2Id,ProductCode,UnitPrice,UseStandardPrice FROM PricebookEntry WHERE Pricebook2.Name ='Sunshine Resorts Price Book' AND Product2.Name =:hotelName LIMIT 1];
        System.debug('price book entry --> '+pe);
        if(!pe.isEmpty()){
            System.debug('price book entry --> '+pe[0].UnitPrice);
            prodPrice=Integer.valueOf(pe[0].UnitPrice);
        }
        return prodPrice;
    }
    
    public static Integer getExpediaPrice(String hotelName){
        System.debug('\n hotel name -->'+hotelName);
        Integer expprodPrice;
        List<Mulesoft_Ingestion_API_Order_60F7B25__dlm> expediaHotelList= [SELECT hotel_name__c,cost__c FROM Mulesoft_Ingestion_API_Order_60F7B25__dlm WHERE hotel_name__c=:hotelName LIMIT 1];
        System.debug('expedia  price entry --> '+expediaHotelList);
        if(!expediaHotelList.isEmpty()){
            System.debug('expedia price--> '+expediaHotelList[0].cost__c);
            expprodPrice=Integer.valueOf(expediaHotelList[0].cost__c);
        }
        return expprodPrice;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<ProductListWrapper> getProductList2() {
        List<ProductListWrapper> prodWrapperList = new List<ProductListWrapper>();
        List<ssot__Product__dlm> prodlist = New List<ssot__Product__dlm>();
        Boolean showPetFriendlyHotel=false;
        Boolean showBeachfrontHotel=false;
        System.debug('Inside getProductList method 12312');
        String searchKey1 = 'family-friendly';
        String searchKey2 = 'familyfriendly';
        String searchKey3 = 'family friendly';
        String petFriendlySKey = 'Pets not allowed.';
        String activeProduct ='true';
        Hotel_Search_Key__c pfhs = Hotel_Search_Key__c.getInstance();
        System.debug('pfhs Custom Setting Value:123 ' + pfhs.Search_Key__c);
        
        if(pfhs.Search_Key__c !=null){
            String query = 'SELECT ssot__Id__c,ssot__Name__c, ssot__Description__c FROM ssot__Product__dlm';
            
            
            if(pfhs.Search_Key__c == 'family-friendly'){
                System.debug('Custom Setting Value hotel11: ' + pfhs.Search_Key__c);
                showBeachfrontHotel=true;
                query += ' WHERE (ssot__Description__c LIKE \'%' + searchKey1 + '%\' OR ssot__Description__c  LIKE \'%' + searchKey2 + '%\' OR ssot__Description__c  LIKE \'%' + searchKey3 + '%\')'; 
            }
            else if(pfhs.Search_Key__c == 'pet-allowed'){
                showPetFriendlyHotel=true;
                query += ' WHERE (ssot__Description__c LIKE \'%' + searchKey1 + '%\' OR ssot__Description__c  LIKE \'%' + searchKey2 + '%\' OR ssot__Description__c  LIKE \'%' + searchKey3 + '%\') AND Pet_Policy__c !=:petFriendlySKey';
            }
            System.debug('dynamic query -->'+ query); 
            
            prodlist = Database.query(query);
            System.debug('All Product List: ' + prodlist);
            
            //Integer hotelPrice=550;
            if(!prodlist.isEmpty() || prodlist!=null){
                for(ssot__Product__dlm prod : prodList){
                    ProductListWrapper prodWrapper = new ProductListWrapper();
                    prodWrapper.hotelName = prod.ssot__Name__c;
                    prodWrapper.hotelDescription = prod.ssot__Description__c;
                    prodWrapper.prodId = prod.ssot__Id__c;
                    prodWrapper.isVisibleProd = showBeachfrontHotel;
                    prodWrapper.isPetFrndProd = showPetFriendlyHotel;
                    prodWrapper.isProdURL='/SunshineResorts/product/'+prod.ssot__Id__c;
                    prodWrapper.expediaPrice=getExpediaPrice(prod.ssot__Name__c);
                    prodWrapper.productPrice=getProductPrice(prod.ssot__Name__c);
                    prodWrapperList.add(prodWrapper);
                    //hotelPrice=hotelPrice+80;
                }
            }
            System.debug('prodWrapperList: ' + prodWrapperList);
        }
        return prodWrapperList;
        //return prodlist;
    }
    
    @AuraEnabled( cacheable=true )
    public static String fetchSessionId() {
        return UserInfo.getSessionId();
    }
    
    @AuraEnabled
    public static void publishHotelSearchEvent(String htlSearchKey){
        system.debug('delete publishHotelSearchEvent');
        // Define the custom setting object
        // 
        Hotel_Search_Key__c customSettingRecord = Hotel_Search_Key__c.getInstance();
        system.debug('delete publishHotelSearchEvent'+customSettingRecord.Search_Key__c);
        if(customSettingRecord.Search_Key__c !=null){
            Hotel_Search_Key__c phtl = [SELECT Id FROM Hotel_Search_Key__c WHERE Search_Key__c != null LIMIT 1]; 
            System.debug('phtl-->'+phtl);
            delete phtl;
            //delete customSettingRecord;
            
            Hotel_Search_Key__c custmstng = new Hotel_Search_Key__c();
            custmstng.Search_Key__c = htlSearchKey;
            insert custmstng;
        }
        else{
            Hotel_Search_Key__c custmstng = new Hotel_Search_Key__c();
            custmstng.Search_Key__c = htlSearchKey;
            insert custmstng;
        }
        
    }
    
    // Method to send an email with the product names
    @AuraEnabled
    public static void sendEmail(String emailAddress, Object productNames) {
        List<String> recipientEmails = new List<String>();
        String serializedStr=JSON.Serialize(productNames);
        List<Object> fieldList = (List<Object>)JSON.deserializeUntyped(serializedStr);
        
        OrgWideEmailAddress[] owea = [select Id,DisplayName from OrgWideEmailAddress where DisplayName = 'Default Email'];
        // Validate the email address
        if (String.isBlank(emailAddress) || !isValidEmail(emailAddress)) {
            throw new AuraHandledException('Invalid email address');
        }
        
        System.debug('productNames-->'+productNames);
        System.debug('emailAddress-->'+emailAddress);
        recipientEmails.add(emailAddress);// Set the recipient IDs (this assumes you have valid email addresses in recipientIds)
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        if ( owea.size() > 0 ) {
            email.setOrgWideEmailAddressId(owea.get(0).Id);
        }
        
        email.setToAddresses(recipientEmails);
        
        email.setSubject('Product Information'); // Set the subject of the email
        
        String searchEmailBody = 'Here are the products you requested :-\n\n';
        if(fieldList.size() >0){
            for (Object fld : fieldList) {
                Map<String, Object> data = (Map<String, Object>)fld;
                System.debug(data.get('hotelDescription')); 
                System.debug(data.get('hotelName'));
                searchEmailBody += data.get('hotelName') + ' ::: '+ data.get('hotelDescription') + '\n\n';
            }
        }
        
        // Set the body of the email
        email.setPlainTextBody(searchEmailBody);
        
        // Send the email
        Messaging.sendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        
         }
    
    // Helper method to validate email format
    private static Boolean isValidEmail(String email) {
        String emailPattern = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';
        Pattern p = Pattern.compile(emailPattern);
        Matcher m = p.matcher(email);
        return m.matches();
    }
    
    @AuraEnabled
    public static void disableProdListCmp(){
        Hotel_Search_Key__c customSettingRecord = Hotel_Search_Key__c.getInstance();
        system.debug('delete publishHotelSearchEvent'+customSettingRecord.Search_Key__c);
        if(customSettingRecord.Search_Key__c !=null){
            Hotel_Search_Key__c phtl = [SELECT Id FROM Hotel_Search_Key__c WHERE Search_Key__c != null LIMIT 1]; 
            System.debug('phtl deleted-->'+phtl);
            delete phtl;
            //delete customSettingRecord;
        }
    }
    
    public class ProductListWrapper{
        @AuraEnabled
        public String hotelName{get;set;}
        @AuraEnabled
        public String hotelDescription{get;set;}
        @AuraEnabled
        public Boolean isVisibleProd{get;set;}
        @AuraEnabled
        public Boolean isPetFrndProd{get;set;}
        @AuraEnabled
        public String prodId{get;set;}
        @AuraEnabled
        public String isProdURL{get;set;}
        @AuraEnabled
        public Integer expediaPrice{get;set;}
        @AuraEnabled
        public Integer productPrice{get;set;}
    }
}