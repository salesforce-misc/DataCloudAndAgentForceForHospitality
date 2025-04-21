public class ObjectAndFieldLevelPermission {
    
    //Assign Custom object Access to Data Cloud Salesforce Connector
    //@AuraEnabled
    public static void callinsertObjLevelPerMethod(){
        List<String> objectsToUpdate = new List<String>{'Experience__c','Booking__c','Session__c','Survey_Response__c','Reservation__c'}; 
            ObjectAndFieldLevelPermission.insertObjectLevelPermission(objectsToUpdate); 
        assigndataCloudPermission();
        
    }
    public static void assigndataCloudPermission(){
        String currentUserId = UserInfo.getUserId(); 
        // Query the Permission Set
        PermissionSet pSet = [SELECT Id FROM PermissionSet WHERE Name ='GenieAdmin'  LIMIT 1];
        List<PermissionSetAssignment> perassignmnt=[SELECT Id, PermissionSetId, AssigneeId FROM PermissionSetAssignment WHERE AssigneeId =:currentUserId AND PermissionSetId =:pSet.Id];
        if(perassignmnt.isEmpty()){
            // Create the Permission Set Assignment
            PermissionSetAssignment permSetAssign = new PermissionSetAssignment(
                AssigneeId = currentUserId,
                PermissionSetId = pSet.Id
            );
            // Insert the Permission Set Assignment
            insert permSetAssign;
        }
    }
    
    //Assign Read Access to Custom Field to Data Cloud Salesforce Connector
    //@AuraEnabled
    public static void callinsertFieldLevelPermsssionMethod(){
        List<String> fieldsToUpdateforReservation = new List<String>{'Number_Of_Adults__c', 'Reservation_Status__c', 'Booking_Channel__c', 'Room_Type__c', 'Check_in_Date__c', 'Total_Amount__c', 'Special_Request__c', 'Check_out_Date__c', 'Payment_Status__c', 'Property_Name__c', 'Rate_Plan__c', 'Night__c', 'Room_Number__c', 'Number_Of_Children__c'}; 
            ObjectAndFieldLevelPermission.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Reservation__c',fieldsToUpdateforReservation); 
        List<String> fieldsToUpdateforBooking = new List<String>{'Activity_Level__c', 'Booking_Name__c', 'Date__c', 'End_Time__c', 'Experience_Name__c', 'Is_Canceled__c', 'Number_of_Guests__c', 'Start_Time__c', 'Status__c', 'Total_Price__c', 'Type__c'}; 
            ObjectAndFieldLevelPermission.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Booking__c',fieldsToUpdateforBooking); 
        List<String> fieldsToUpdateforExperince = new List<String>{'Default_Start_Time__c', 'Activity_Type__c', 'Price__c', 'Reviews_Summary__c', 'Description__c', 'Is_greater_12__c', 'Activity_Level__c', 'Capacity__c', 'Location__c', 'Picture_URL__c', 'Duration_Hours__c','Type__c', 'Packing_List__c', 'Rating__c', 'Sum_of_Guest_Reviews__c', 'Things_to_Carry__c', 'Total_Guest_Reviews__c'}; 
            ObjectAndFieldLevelPermission.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Experience__c',fieldsToUpdateforExperince); 
        List<String> fieldsToUpdateforSession = new List<String>{'Experience_Name__c', 'Booked_Slots__c','Capacity__c','Duration_Hours__c','Is_Canceled__c','Location__c','Percentage_Booked__c','Status__c', 'Experience__c', 'Date__c', 'Available_Slots__c', 'Start_Time__c', 'End_Time__c'}; 
            ObjectAndFieldLevelPermission.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Session__c',fieldsToUpdateforSession); 
        List<String> fieldsToUpdateforContact = new List<String>{'Lifetime_Value__c', 'Ext_Id__c', 'Preferred_Name__c','Preferred_Room_Type__c','Total_Room_Nights__c','Under_Age_Children__c', 'Lifetime_Reservations__c','Preferred_Room_Temperature__c','Lifetime_Experience_Bookings__c','Next_Check_in_Date__c','Number_of_Children__c','Preferred_Room_Category__c', 'Membership_Number__c','Anniversary__c','Customer_Class__c','Guest_Type__c','Interest1__c','Interest2__c','Interest3__c'}; 
            ObjectAndFieldLevelPermission.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Contact',fieldsToUpdateforContact); 
        List<String> fieldsToUpdateforSurveyResponse = new List<String>{'Imporvement_Comments__c', 'Survey_Weight__c', 'Response_Date_Time__c', 'Rating_Value__c', 'Response_Submitter__c', 'Response_Value__c'};   
            ObjectAndFieldLevelPermission.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Survey_Response__c',fieldsToUpdateforSurveyResponse); 
        /*List<String> fieldsToUpdateforCase = new List<String>{'ParentId'};  
ObjectAndFieldLevelPermission.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Case',fieldsToUpdateforCase); 
/*List<String> copyFieldAccess = new List<String>{'Customer_Class__c'};  
ObjectAndFieldLevelPermission.editAccesstoCustomer360('Customer 360 Data Platform Integration','Contact',copyFieldAccess); */
        
        // assignSunshineResortAppToCurrentUser();
    }
    public static void editAccesstoCustomer360(String permissionSetName, String objectName, List<String> fieldNames){
        PermissionSet permissionSetId = [Select Id from PermissionSet Where Label =: permissionSetName Limit 1];
        System.debug('## permissionSetId 360= '+permissionSetId);
        List<FieldPermissions> listOfFieldPermissions = new List<FieldPermissions>();
        for (String field : fieldNames) {
            FieldPermissions fieldPermission = new FieldPermissions();
            fieldPermission.Field = objectName + '.' + field;
            fieldPermission.SobjectType = objectName;
            fieldPermission.ParentId = permissionSetId.Id;
            fieldPermission.PermissionsEdit = true;
            fieldPermission.PermissionsRead = true;
            listOfFieldPermissions.add(fieldPermission);
        }
        if(!listOfFieldPermissions.isEmpty()){
            upsert listOfFieldPermissions;
            System.debug('## listOfFieldPermissions = '+listOfFieldPermissions);
        }
    }
    @future
    public static void assignProduct2FieldPErmission(){
        system.debug('inside product2 field access');
        List<String> fieldsToUpdateforProduct = new List<String>{'Kids_Activities__c', 'HotelName__c', 'Cancellation_Policy__c', 'TeenAge_Activity__c', 'Amenities__c', 'Activities__c', 'Pet_Policy__c', 'Location__c'}; 
            ObjectAndFieldLevelPermission.insertProduct2FieldLevelPermsssion('Data Cloud Salesforce Connector','Product2', fieldsToUpdateforProduct);
        
        List<String> fieldsToUpdateforCase = new List<String>{'ParentId'};  
            ObjectAndFieldLevelPermission.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Case',fieldsToUpdateforCase); 
        
        List<String> copyFieldAccess = new List<String>{'Customer_Class__c','Guest_Satisfaction_Score__c','Lifetime_Value__c','Total_Stays__c','Total_Room_Nights__c','Total_Spend__c','Avg_Nights_per_Stay__c'};  
            ObjectAndFieldLevelPermission.editAccesstoCustomer360('Customer 360 Data Platform Integration','Contact',copyFieldAccess);
    }
    
    
    public static void insertProduct2FieldLevelPermsssion(String permissionSetName, String objectName, List<String> fieldNames){
        PermissionSet permissionSetId = [Select Id from PermissionSet Where Label =: permissionSetName Limit 1];
        System.debug('## permissionSetId = '+permissionSetId);
        List<FieldPermissions> listOfFieldPermissions = new List<FieldPermissions>();
        for (String field : fieldNames) {
            FieldPermissions fieldPermission = new FieldPermissions();
            fieldPermission.Field = objectName + '.' + field;
            fieldPermission.SobjectType = objectName;
            fieldPermission.ParentId = permissionSetId.Id;
            fieldPermission.PermissionsEdit = false;
            fieldPermission.PermissionsRead = true;
            listOfFieldPermissions.add(fieldPermission);
        }
        if(!listOfFieldPermissions.isEmpty()){
            upsert listOfFieldPermissions;
            System.debug('## listOfFieldPermissions = '+listOfFieldPermissions);
        }
    }
    
    
    
    //Assign Sunshine_Trails_Hospitality permission set to current user
    /*public static void assignSunshineResortAppToCurrentUser(){
// Assign Data Cloud Admin Permission set to Current User
String currentUserId = UserInfo.getUserId();
// Query the Permission Set
PermissionSet pSet = [SELECT Id FROM PermissionSet WHERE Name ='Sunshine_Trails_Hospitality'  LIMIT 1];

// Create the Permission Set Assignment
PermissionSetAssignment permSetAssign = new PermissionSetAssignment(
AssigneeId = currentUserId,
PermissionSetId = pSet.Id
);
// Insert the Permission Set Assignment
insert permSetAssign;
}*/
    
    public static void insertObjectLevelPermission(List<String> objectNames) {
        if (objectNames.isEmpty()) {
            System.debug('## Error: No objects provided.');
            return;
        }
        // Fetch the permission set
        PermissionSet permissionSet;
        try {
            permissionSet = [SELECT Id FROM PermissionSet WHERE Label = 'Data Cloud Salesforce Connector' LIMIT 1];
        } catch (Exception e) {
            System.debug('## Error fetching PermissionSet: ' + e.getMessage());
            return;
        }
        if (permissionSet == null) {
            System.debug('## Error: PermissionSet not found.');
            return;
        }
        System.debug('## PermissionSet found: ' + permissionSet.Id);
        // Fetch existing object permissions
        Set<String> existingObjectPermissions = new Set<String>();
        for (ObjectPermissions op : [
            SELECT SObjectType FROM ObjectPermissions 
            WHERE ParentId = :permissionSet.Id AND SObjectType IN :objectNames
        ]) {
            existingObjectPermissions.add(op.SObjectType);
        }
        // Prepare new permissions only for missing objects
        List<ObjectPermissions> newPermissions = new List<ObjectPermissions>();
        for (String obj : objectNames) {
            if (!existingObjectPermissions.contains(obj)) {
                ObjectPermissions objectPM = new ObjectPermissions();
                objectPM.ParentId = permissionSet.Id;
                objectPM.SObjectType = obj;
                objectPM.PermissionsRead = true;
                objectPM.PermissionsViewAllRecords = true;
                newPermissions.add(objectPM);
            } else {
                System.debug('## Skipping: Permission already exists for ' + obj);
            }
        }
        // Insert only if there are new permissions to add
        if (!newPermissions.isEmpty()) {
            try {
                insert newPermissions;
                System.debug('## Inserted new object permissions: ' + newPermissions);
            } catch (Exception e) {
                System.debug('## Error inserting ObjectPermissions: ' + e.getMessage());
            }
        } else {
            System.debug('## No new permissions needed.');
        }
    }
    
    public static void insertFieldLevelPermsssion(String permissionSetName, String objectName, List<String> fieldNames){
        PermissionSet permissionSetId = [Select Id from PermissionSet Where Label =: permissionSetName Limit 1];
        System.debug('## permissionSetId = '+permissionSetId);
        List<FieldPermissions> listOfFieldPermissions = new List<FieldPermissions>();
        for (String field : fieldNames) {
            FieldPermissions fieldPermission = new FieldPermissions();
            fieldPermission.Field = objectName + '.' + field;
            fieldPermission.SobjectType = objectName;
            fieldPermission.ParentId = permissionSetId.Id;
            fieldPermission.PermissionsEdit = false;
            fieldPermission.PermissionsRead = true;
            listOfFieldPermissions.add(fieldPermission);//
        }
        if(!listOfFieldPermissions.isEmpty()){
            upsert listOfFieldPermissions;
            System.debug('## listOfFieldPermissions = '+listOfFieldPermissions);
        }
    }
    //Automation For Loyalty Tier , Assign read Access to loyalty object to Data Cloud Salesforce Connector
    @AuraEnabled
    public static void assignPermissionSetForLoyalty(){
        try {
            String permissionSetName = 'sfdc_a360_sfcrm_data_extract';
            // Fetch the Permission Set ID
            PermissionSet permSet = [SELECT Id FROM PermissionSet WHERE Name = :permissionSetName LIMIT 1];
            system.debug('permSet'+permSet);
            if (permSet == null) {
                System.debug('Permission Set not found: ' + permissionSetName);
                return;
            }
            // List of Objects (Modify as needed)
            List<String> objectNames = new List<String>{
                'LoyaltyLedger','LoyaltyMemberCurrency','LoyaltyMemberCurrency','LoyaltyMemberTier','ProductCatalog','ProductCategory','LoyaltyPartnerProduct',
                    'LoyaltyProgramCurrency','LoyaltyProgramMemberCase','LoyaltyProgramMbrPromotion','LoyaltyProgramMember','LoyaltyProgramPartner','LoyaltyProgram',
                    'LoyaltyTierBenefit','LoyaltyTierGroup','LoyaltyTier','MemberBenefit','PromotionLoyaltyPtnrProdt','PromotionMarketSegment','Promotion','TransactionJournal',
                    'Voucher','VoucherDefinition','JournalSubType','JournalType','Campaign','BenefitType','Benefit','LoyaltyAggrPointExprLedger','LoyaltyPgmEngmtAttrProm','LoyaltyPgmEngmtAttribute',
                    'LoyaltyPgmGroupMbrRlnsp','LoyaltyPgmMbrAttributeVal','LoyaltyPgmPartnerPromotion','LoyaltyProgramBadge','LoyaltyProgramMemberBadge','Segments','UnitOfMeasure'
                    };
                        system.debug('Object Name'+objectNames);
            // Fetch existing permissions for these objects under this Permission Set
            Map<String, ObjectPermissions> existingPerms = new Map<String, ObjectPermissions>();
            for (ObjectPermissions op : [SELECT Id, SObjectType 
                                         FROM ObjectPermissions 
                                         WHERE ParentId = :permSet.Id 
                                         AND SObjectType IN :objectNames]) {
                                             existingPerms.put(op.SObjectType, op);
                                         }
            // Prepare ObjectPermissions records to insert
            List<ObjectPermissions> objPermsToInsert = new List<ObjectPermissions>();
            for (String objectName : objectNames) {
                if (!existingPerms.containsKey(objectName)) {
                    ObjectPermissions objPerm = new ObjectPermissions(
                        ParentId = permSet.Id,
                        SObjectType = objectName,
                        PermissionsRead = true,
                        PermissionsViewAllRecords = true
                    );
                    System.debug('Object to insert'+objPerm);
                    objPermsToInsert.add(objPerm);
                } else {
                    System.debug('Skipping ' + objectName + ' - Permission already exists.');
                }
            } 
            
            // Insert only new permissions
            if (!objPermsToInsert.isEmpty()) {
                try {
                    insert objPermsToInsert;
                    System.debug('Object Permissions Assigned Successfully!');
                } catch (Exception e) {
                    System.debug('Error Assigning Permissions: ' + e.getMessage());
                }
            } else {
                System.debug('No new permissions needed - Everything is already assigned.');
            }
            
        } catch (Exception e) {
            System.debug('Error occurred:' + e.getMessage());
            throw new AuraHandledException('An Error Occured:' +e.getMessage());
            
        }
    }
    
    //Automation for Create an AgentUser
    @AuraEnabled
    public static void botUserForServiceAgent(){
        //to create Agent User
        try {
            String emailAddress = UserInfo.getUserEmail();
            String userName;
            if (Test.isRunningTest()){
                username= UserInfo.getUserName() +'.'+'sunshinebotuser1';
            }
            else{
                username= UserInfo.getUserName() +'.'+'sunshinebotuser';
            }
            
            List<UserLicense> ul=[SELECT Id, Status, MasterLabel, Name FROM UserLicense Where Name='Einstein Agent' LIMIT 1];
            if(!ul.isEmpty()){
                Profile prof = [SELECT Id, UserLicenseId FROM Profile WHERE Name='Einstein Agent User' AND UserLicenseId =: ul[0].Id limit 1];
                if(prof !=null){
                    User usr = new user();
                    usr.FirstName = 'Agent';
                    usr.LastName='User';
                    usr.Email = emailAddress;
                    usr.Alias = 'agtuser';
                    usr.Username = userName;
                    usr.LocaleSidKey = 'en_US';
                    usr.TimeZoneSidKey = 'GMT';
                    usr.ProfileID = prof.id;
                    usr.LanguageLocaleKey = 'en_US';
                    usr.EmailEncodingKey = 'UTF-8';
                    insert usr;
                }
                
                User agentUser = [SELECT Id FROM User WHERE FirstName='Agent' AND LastName ='User' LIMIT 1];
                
                List<PermissionSetAssignment> psa = [SELECT Id,AssigneeId,PermissionSetId FROM PermissionSetAssignment WHERE AssigneeId=:agentUser.Id];
                System.debug('psa -->'+psa);
                
                //Assign 'Agentforce Service Agent User' Permission Set License to Agent User
                PermissionSet permSet = [SELECT Id,Name FROM PermissionSet Where Name ='AgentforceServiceAgentUser'];
                PermissionSetLicense pslicense= [SELECT DeveloperName,Id,MasterLabel FROM PermissionSetLicense Where MasterLabel ='Agentforce Service Agent User' LIMIT 1];
                if(pslicense !=null && psa.isEmpty()){
                      System.debug('psa 1233-->'+psa);
                    PermissionSetLicenseAssign pslicnseAssignee = New PermissionSetLicenseAssign();
                    pslicnseAssignee.AssigneeId=agentUser.Id;
                    pslicnseAssignee.PermissionSetLicenseId =pslicense.Id;
                    Insert pslicnseAssignee;
                }
                if(permSet !=null && psa.isEmpty()){
                    PermissionSetAssignment permissionSetAssignment = new PermissionSetAssignment();
                    permissionSetAssignment.PermissionSetId = permSet.Id;
                    permissionSetAssignment.AssigneeId = agentUser.Id;
                    
                    insert permissionSetAssignment;
                }
            }
        }   catch (Exception e) {
            System.debug('Error occurred:' + e.getMessage());
            throw new AuraHandledException('An Error Occured:' +e.getMessage());
        }
        
    }
    
    //Automation for creating Custom Fields
    /*@AuraEnabled
public static void createCustomFields(){
try {
Boolean alreadyPresent=false;
String objectAPIName='Contact';
Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
Map<String, Schema.SObjectField> fieldMap = schemaMap.get(objectAPIName).getDescribe().fields.getMap();
for(String fieldName : fieldMap.keyset() )
{ 
if(fieldName =='External_ID__c'){
system.debug('fieldName->>'+fieldName); // This will give you the api name of the field name.
alreadyPresent=true;
break;
}

}
//to create Custom Field
System.debug('break executed'+alreadyPresent);

if(alreadyPresent!=false){
System.debug('present'+alreadyPresent);
}
else{
System.debug('not present'+alreadyPresent);
String fieldAPIName='External_Id__c';
String fieldDescription=''; 
String fieldLabel='External Id';
String metadata = '{"Metadata" : {"type" : "Text","description" : "'+fieldDescription+'", "inlineHelpText" : "","precision" : null,"label" : "'+fieldLabel+'","length" : 255,"required" : false}, "FullName" : "'+objectAPIName+'.'+fieldAPIName+'"}';

HttpRequest request = new HttpRequest();
request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
request.setHeader('Content-Type', 'application/json');
request.setEndpoint(URL.getOrgDomainUrl().toExternalForm()+'/services/data/v62.0/tooling/sobjects/CustomField');
request.setMethod('POST');
request.setBody(metadata);
Http http = new Http();
HTTPResponse res = http.send(request);
//return res.getBody();
}
} catch (Exception e) {
System.debug('Error occurred:' + e.getMessage());
throw new AuraHandledException('An Error Occured:' +e.getMessage());

}

}*/
    
    //Automation for assigning Permission Set to Integration User
    @AuraEnabled
    public static void assignIntegrationPermSet(){
        String permissionSetName='sfdc_a360';
        PermissionSet permSet = [SELECT Id FROM PermissionSet WHERE Name = :permissionSetName LIMIT 1];
        System.debug('Permission Set After Query ' + permSet);
        if (permSet == null) {
            System.debug('Permission Set not found: ' + permissionSetName);
            return;
        }
        String objectName = 'Contact';
        String objectAccount = 'Account';
        
        List<ObjectPermissions> existingPermAcc = [SELECT Id, SObjectType 
                                                   FROM ObjectPermissions 
                                                   WHERE ParentId = :permSet.Id 
                                                   AND SObjectType= :objectAccount  LIMIT 1 ];
        System.debug('Existing Permission Set Check'+existingPermAcc);
        if(existingPermAcc!=null){
            System.debug('Contact Permissions already exist-Skipping');
            delete existingPermAcc;
        }
        List<ObjectPermissions> existingPerm = [SELECT Id, SObjectType 
                                                FROM ObjectPermissions 
                                                WHERE ParentId = :permSet.Id 
                                                AND SObjectType= :objectName LIMIT 1 ];
        System.debug('Existing Permission Set Check'+existingPerm);
        if(existingPerm!=null){
            System.debug('Contact Permissions already exist-Skipping');
            delete existingPerm;
        }
        ObjectPermissions contactPerm = new ObjectPermissions(
            ParentId = permSet.Id,
            SObjectType = objectName,
            PermissionsDelete = true,
            PermissionsEdit=true,
            PermissionsModifyAllRecords=true,
            PermissionsRead = true,
            PermissionsViewAllRecords=true
        );
        
        ObjectPermissions accPerm = new ObjectPermissions(
            ParentId = permSet.Id,
            SObjectType = objectAccount,
            PermissionsDelete = true,
            PermissionsEdit=true,
            PermissionsModifyAllRecords=true,
            PermissionsRead = true,
            PermissionsViewAllRecords=true
        );
        try{
            insert contactPerm;
            insert accPerm;
            
            system.debug('Contact object Permission Set Assigned Successfully');
        }catch(Exception e){
            System.debug('Error Assigning Permissions'+e.getMessage());
        }
    }
    //Create Community User
    public static void createCustomerCommunityUser(){
        try {
            List<Contact> contactRecord = [SELECT Id, FirstName, Name, LastName, Email FROM Contact WHERE Name = 'John Smith' AND Email='john.0068@gmail.dataclouddemo.com' LIMIT 1];
            List<UserLicense> ul=[SELECT Id, Status, MasterLabel, Name FROM UserLicense Where Name='Customer Community Plus' LIMIT 1];
            List<Profile> profList = [SELECT Id, UserLicenseId FROM Profile Where Name = 'Sunshine Resort Profile' LIMIT 1];
            
            if (!contactRecord.isEmpty() && !profList.isEmpty()) {
                String emailAddress = contactRecord[0].Email;
                System.debug('community user email ->'+emailAddress);
                String userName = emailAddress +'.'+'customerUser'+System.now().format('ddMMyyyyHHmmss').substring(8,14);
                
                User usr = new user();
                usr.FirstName = 'john';
                usr.LastName='smith';
                usr.Email = emailAddress;
                usr.Alias = 'jsmit';
                usr.Username = userName;
                usr.LocaleSidKey = 'en_US';
                usr.TimeZoneSidKey = 'GMT';
                usr.ProfileID = profList[0].Id;
                usr.LanguageLocaleKey = 'en_US';
                usr.EmailEncodingKey = 'UTF-8';
                usr.ContactId = contactRecord[0].Id;
                //usr.IsPortalEnabled = true;
                insert usr;
                System.debug(usr + 'usr');
                
                User userRecord = [SELECT Id, IsPortalEnabled, ProfileId FROM User WHERE ContactId = :contactRecord[0].Id LIMIT 1]; 
                If(userRecord != NULL){
                    userRecord.IsPortalEnabled = true;
                    UPDATE userRecord;
                }
                List<PermissionSet> pSet = [SELECT Id FROM PermissionSet WHERE Name ='Customer_Community_Plus_Permissions'  LIMIT 1];
                System.debug('sunshime perm set'+pSet);
                // Create the Permission Set Assignment
                if(!pSet.isEmpty()){
                    System.debug('sunshime perm set 333'+pSet);
                    PermissionSetAssignment permSetAssign = new PermissionSetAssignment(
                        AssigneeId = usr.Id,
                        PermissionSetId = pSet[0].Id
                    );
                    // Insert the Permission Set Assignment
                    insert permSetAssign;
                }
                List<PermissionSet> permSet = [SELECT Id FROM PermissionSet WHERE Name ='B2BBuyer' LIMIT 1];
                
                if(!permSet.isEmpty()){
                    // Create the Permission Set Assignment
                    PermissionSetAssignment permSetAssign = new PermissionSetAssignment(
                        AssigneeId = usr.Id,
                        PermissionSetId = permSet[0].Id
                    );
                    // Insert the Permission Set Assignment
                    Insert permSetAssign;
                }                
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }
        //assign Sunshine Permission Set to Current User
        assignSunshineResortAppToCurrentUser();
    }
    
    // Assign Sunshine_Trails_Hospitality permission set to current user
    public static void assignSunshineResortAppToCurrentUser(){
        // Assign Data Cloud Admin Permission set to Current User
        String currentUserId = UserInfo.getUserId();
        // Query the Permission Set
        List<PermissionSet> pSet = [SELECT Id FROM PermissionSet WHERE Name ='Sunshine_Trails_Hospitality'  LIMIT 1];
        List<PermissionSet> einsteinsalespSet = [SELECT Id,Name FROM PermissionSet WHERE Name ='EinsteinGPTSalesEmails' LIMIT 1];

        System.debug('sunshime perm set'+pSet);
        System.debug('EinsteinGPTSalesEmails perm set'+einsteinsalespSet);
        
        if(!einsteinsalespSet.isEmpty()){
            System.debug('sunshime perm set 333'+pSet);
            PermissionSetAssignment salesEmailPs = new PermissionSetAssignment(
                AssigneeId = currentUserId,
                PermissionSetId = einsteinsalespSet[0].Id
            );
            // Insert the Permission Set Assignment
            insert salesEmailPs;
        }
        
        // Create the Permission Set Assignment
        if(!pSet.isEmpty()){
            System.debug('sunshime perm set 333'+pSet);
            PermissionSetAssignment permSetAssign = new PermissionSetAssignment(
                AssigneeId = currentUserId,
                PermissionSetId = pSet[0].Id
            );
            // Insert the Permission Set Assignment
            insert permSetAssign;
        }
    }
    
    //assign account buyer group
    @future
    public static void assignCommunityUserToBuyerGroup(){
        Id buyerGroupId = [SELECT Id, Name FROM BuyerGroup WHERE Name = 'Sunshine Resorts Buyer Group' LIMIT 1].Id; 
        List<Contact> con = [SELECT Id,AccountId,Email FROM Contact WHERE Email ='John.0068@gmail.dataclouddemo.com'];
        if(!con.isEmpty() && buyerGroupId != null){
            BuyerGroupMember buyerGroupMember = new BuyerGroupMember(BuyerId = con[0].AccountId,BuyerGroupId= buyerGroupId);
            insert buyerGroupMember;
        }
        
    }
    
    
    
}