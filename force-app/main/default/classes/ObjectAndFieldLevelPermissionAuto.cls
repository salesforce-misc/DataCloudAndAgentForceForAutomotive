public class ObjectAndFieldLevelPermissionAuto {

    //Assign Custom object Access to Data Cloud Salesforce Connector
    //@AuraEnabled
   /* public static void callinsertObjLevelPerMethod(){
        List<String> objectsToUpdate = new List<String>{'Experience__c','Booking__c','Session__c','Survey_Response__c','Reservation__c'}; 
            ObjectAndFieldLevelPermission.insertObjectLevelPermission(objectsToUpdate); 
        assigndataCloudPermission();
        
    }*/
    
    public static void assigndataCloudPermission(){
        String currentUserId = UserInfo.getUserId(); 
        // Query the Permission Set
        PermissionSet pSet = [SELECT Id FROM PermissionSet WHERE Name ='GenieAdmin'  LIMIT 1];
        List<PermissionSetAssignment> perassignmnt=[SELECT Id, PermissionSetId, AssigneeId FROM PermissionSetAssignment WHERE AssigneeId =:currentUserId AND PermissionSetId =:pSet.Id];
        if(perassignmnt.isEmpty()){
            system.debug('perassignmnt'+perassignmnt);
            // Create the Permission Set Assignment
            PermissionSetAssignment permSetAssign = new PermissionSetAssignment(
                AssigneeId = currentUserId,
                PermissionSetId = pSet.Id
            );
            // Insert the Permission Set Assignment
            insert permSetAssign;
            system.debug('permSetAssign1'+permSetAssign);
        }
    }
    
    //Partner lead management-
     public static void assigndataPartnerLeadPermission(){
        String currentUserId = UserInfo.getUserId(); 
        // Query the Permission Set
        PermissionSet pSet = [SELECT Id FROM PermissionSet WHERE Name ='ManufacturingPartnerLeadMgmtPsl' limit 1];
        List<PermissionSetAssignment> perassignmnt=[SELECT Id, PermissionSetId, AssigneeId FROM PermissionSetAssignment WHERE AssigneeId =:currentUserId AND PermissionSetId =:pSet.Id];
        if(perassignmnt.isEmpty()){
            system.debug('perassignmnt'+perassignmnt);
            PermissionSetAssignment permSetAssign = new PermissionSetAssignment(
                AssigneeId = currentUserId,
                PermissionSetId = pSet.Id
            );
            insert permSetAssign;
            system.debug('permSetAssign2'+permSetAssign); 
        }
    }
    
    //Vehicle and asset finance VehicleAndAssetFinanceFndtnPsl
     public static void assigndatavehicleassetfinance() {
        String currentUserId = UserInfo.getUserId();
    
        // Query the Permission Sets
        List<PermissionSet> pSets = [SELECT Id FROM PermissionSet WHERE Name IN ('VehicleAndAssetFinanceFndtnPsl', 'LightningOrderManagementAgent', 'LightningOrderManagementOperationsManager')
        ];
    
        // Get existing assignments for this user
        Set<Id> existingPermissionSetIds = new Set<Id>();
        for (PermissionSetAssignment psa : [
            SELECT PermissionSetId 
            FROM PermissionSetAssignment 
            WHERE AssigneeId = :currentUserId AND PermissionSetId IN :pSets
        ]) {
            existingPermissionSetIds.add(psa.PermissionSetId);
        }
    
        // Filter out permission sets already assigned
        List<PermissionSetAssignment> psToAssign = new List<PermissionSetAssignment>();
        for (PermissionSet ps : pSets) {
            if (!existingPermissionSetIds.contains(ps.Id)) {
                psToAssign.add(new PermissionSetAssignment(
                    PermissionSetId = ps.Id,
                    AssigneeId = currentUserId
                ));
            }
        }
    
        if (!psToAssign.isEmpty() && !Test.isRunningTest()) {
            insert psToAssign;
        }
}

    
    //Assign Read Access to Custom Field to Data Cloud Salesforce Connector
    //@AuraEnabled
    public static void callinsertFieldLevelPermsssionMethod(){
        List<String> fieldsToUpdateforAsset = new List<String>{'Service_Perks_Available__c','Type_of_use__c','ManufactureDate','Last_Service_Date__c','DigitalAssetStatus','Entitlement_Status__c','Warranty_End_Date__c','Asset_Warranty_Status__c'}; 
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Asset',fieldsToUpdateforAsset); 
        
        List<String> fieldsToUpdateforOpportunity = new List<String>{'Number_of_Past_Interactions__c', 'Recency_of_Interactions__c', 'Test_Drive_Date__c', 'Test_Drive_Status__c', 'Customer_Response_to_Past_Interactions__c', 'Engagement_Level__c','After_Completing_a_Test_Drive_status__c','Car_Model__c','Primary_Contact__c','SDO_Sales_Primary_Contact__c'}; 
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Opportunity',fieldsToUpdateforOpportunity); 
         
        List<String> fieldsToUpdateforContact = new List<String>{'Lifetime_Value__c','Likelihood_of_Purchas__c','Photo_URL__c','Last_Check_in_Date__c','Customer_Satisfaction_Score__c','External_ID__c','SDO_Cust360_Id__c','Ext_Id__c'}; 
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Contact',fieldsToUpdateforContact);         
        List<String> fieldsToUpdateforAssetTitle = new List<String>{'OwnerCount__c','IsActive','IssuePlaceId','FinancialAccountId','VehicleIdentificationNumber','EffectiveEndDate','VehicleId','EffectiveStartDate'};   
           ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','AssetTitle',fieldsToUpdateforAssetTitle);
       
        List<String> fieldsToUpdateforAssetTitleParty = new List<String>{'EffectiveEndDate','IsActive','PartyAddressId','Count__c'};   
           ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','AssetTitleParty',fieldsToUpdateforAssetTitleParty);
        
        //Vehicle
        List<String> fieldsToUpdateforVehicle = new List<String>{'Owner_Count__c','RearPassenger__c','FrontDriver__c','FrontPassenger__c','RearDriver__c','VIN__c','ManufacturerWarrantyStartDt','MarketPriceDate','SteeringType',
            'ManufacturedDate','CylinderCount','ActiveRecallCount','HeadUnitSecurityCode','FrontTireSize','AverageMarketValue','LowestMarketValue','RearRimSize','InteriorColor','RearTireSize','LastOdometerReading','MarketPrice',
            'LastServiceDate','GearBoxType','Description__c','OdometerReadingDate','MarketPriceSource','ManufacturerWarrantyEndDate','Connected_Car__c','RegistrationValidityDate','IsTelematicsServiceActive','Status','ExteriorColor','IgnitionKeyCode','UpholsteryType',
            'FrontRimSize','ManufacturingPlantName','CurrentOwnerId','ManufacturingBatchNumber','UpholsteryColor','HighestMarketValue','ConditionType','IsRecallOpen','Last_Check_in_Date__c','Seat_Capacity__c'};   
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Vehicle',fieldsToUpdateforVehicle);
        //VehicleDefinition
        List<String> fieldsToUpdateforVehicleDefinition = new List<String>{'ModelCode','BatteryCapacity','AuxiliaryBatteryType','TopSpeed','CombinedFuelEconomy','BodyType','ExtraUrbanFuelEconomy','MaximumGrossWeight','Height',
             'Width','FuelTankCapacity','DoorStyleType','MaximumTorque','VariantName','EngineName','TotalPower','DoorCount','AccelerationTime','Length','TransmissionType'};   
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','VehicleDefinition',fieldsToUpdateforVehicleDefinition);
        
        List<String> fieldsToUpdateforServiceAppointment = new List<String>{'Delay__c'};   
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','ServiceAppointment',fieldsToUpdateforServiceAppointment);
        
        List<String> fieldsToUpdateforProduct = new List<String>{'Seat_Capacity__c'};   
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Product2',fieldsToUpdateforProduct);
        
        List<String> fieldsToUpdateforMessagingSession = new List<String>{'UsersId__c','User_Email__c','User__c','Contact__c','cookieId__c'};   
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','MessagingSession',fieldsToUpdateforMessagingSession);
        
        List<String> fieldsToUpdateforPromotion = new List<String>{'Vehicle__c'};   
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Promotion',fieldsToUpdateforPromotion);
        
         List<String> fieldsToUpdateforLead = new List<String>{'Intrested_In__c','CookieId__c'};   
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Lead',fieldsToUpdateforLead);
        
        List<String> fieldsToUpdateforUser = new List<String>{'Account_Id_Formula__c'};   
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','User',fieldsToUpdateforUser);
        
         List<String> fieldsToUpdateforAssetContactParticipant = new List<String>{'Vehicle_Picture__c','VehicleId'};   
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','AssetContactParticipant',fieldsToUpdateforAssetContactParticipant);
        
        List<String> fieldsToUpdateforAssetMilestone = new List<String>{'Description','StageComment','ExpiredDate'};   
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','AssetMilestone',fieldsToUpdateforAssetMilestone);
        List<String> fieldsToUpdateforOrder = new List<String>{'Contact__c'};   
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','Order',fieldsToUpdateforOrder);
        List<String> fieldsToUpdateforAssetWarranty = new List<String>{'Perks_Available__c'};   
            ObjectAndFieldLevelPermissionAuto.insertFieldLevelPermsssion('Data Cloud Salesforce Connector','AssetWarranty',fieldsToUpdateforAssetWarranty);
        
       // List<String> copyFieldAccess = new List<String>{'Lifetime_Value__c','Customer_Satisfaction_Score__c'};  
            //ObjectAndFieldLevelPermissionAuto.editAccesstoCustomer360('Customer 360 Data Platform Integration','Contact',copyFieldAccess); VehicleDefinition
        
		system.debug('Inside method callinsertFieldLevelPermsssionMethod'); 
        assigndataCloudPermission(); 
        assigndataPartnerLeadPermission();
        assigndatavehicleassetfinance();
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
    public static void assignCopyFieldPErmission(){
        
         List<String> copyFieldAccess = new List<String>{'Lifetime_Value__c','Customer_Satisfaction_Score__c'};  
            ObjectAndFieldLevelPermissionAuto.editAccesstoCustomer360('Customer 360 Data Platform Integration','Contact',copyFieldAccess);
    }
 
    
    
   /* public static void insertProduct2FieldLevelPermsssion(String permissionSetName, String objectName, List<String> fieldNames){
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
    }*/
    
  
   /* public static void insertObjectLevelPermission(List<String> objectNames) {
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
    }*/
    
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
        if(!listOfFieldPermissions.isEmpty() && !Test.isrunningTest()){
            upsert listOfFieldPermissions;
            System.debug('## listOfFieldPermissions = '+listOfFieldPermissions);
        }
    }
    
    //Automation For automotive standard object , Assign read Access to automotive object to Data Cloud Salesforce Connector
    @AuraEnabled
    public static void assignPermissionSetForAutomotive(){
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
                 'Vehicle','Asset','AssetContactParticipant','AssetTitle','AssetTitleParty','AssetMilestone','WarrantyTerm','AssetWarranty','Supplier'};
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
            
            // Query permiaaion set 
            String currentUserId = UserInfo.getUserId(); 
            List<PermissionSet> autoMotivePS = [Select id, Name from PermissionSet where Name = 'AutomotiveFoundationUserPsl' limit 1];    
            List<PermissionSetAssignment> loyaltyPSetAssignmnt =  [SELECT Id,AssigneeId,PermissionSetId FROM PermissionSetAssignment WHERE  PermissionSetId =:autoMotivePS[0].Id AND AssigneeId =:currentUserId LIMIT 1];
			
            system.debug('automotive PS'+autoMotivePS);
            
            if(!autoMotivePS.isEmpty() && loyaltyPSetAssignmnt.isEmpty()){
            PermissionSetAssignment autoMAdmin = new PermissionSetAssignment(
                AssigneeId = currentUserId,
                PermissionSetId = autoMotivePS[0].Id
            );
            // Insert the Permission Set Assignment
            insert autoMAdmin;
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
                userName= UserInfo.getUserName() +'.'+'Automotivebotuser1';
            }
            else{
                username= UserInfo.getUserName() +'.'+'agentuser1';
                system.debug('username'+username);
            }
            
            List<UserLicense> ul=[SELECT Id, Status, MasterLabel, Name FROM UserLicense Where Name='Einstein Agent' LIMIT 1];
            system.debug('ul'+ul);
            if(!ul.isEmpty()){
                Profile prof = [SELECT Id, UserLicenseId FROM Profile WHERE Name='Einstein Agent User' AND UserLicenseId =: ul[0].Id limit 1];
                system.debug('prof'+prof);
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
                    system.debug('insert user'+usr);
                }
                map<string,string> mapOfPSwithAgentUser = new map<string,string>();
                
                User agentUser = [SELECT Id FROM User WHERE FirstName='Agent' AND LastName ='User' LIMIT 1];
                List<PermissionSet> permSet = [SELECT Id,Name FROM PermissionSet Where Name IN ('AgentforceServiceAgentUser', 'Automotive_Service_Agent', 'CopilotSalesforceUser','GenieUserEnhancedSecurity')];//3
                List<PermissionSetLicense> pslicense= [SELECT DeveloperName,Id,MasterLabel FROM PermissionSetLicense Where MasterLabel ='Agentforce Service Agent User' LIMIT 1];
                List<PermissionSetAssignment> listOfPSA = [SELECT Id,AssigneeId,PermissionSetId FROM PermissionSetAssignment WHERE AssigneeId=:agentUser.Id and PermissionSetId IN:permSet];
                if(listOfPSA.size()>0){
                    for(PermissionSetAssignment psaRec:listOfPSA){
                         System.debug('psaRec -->'+psaRec);
                        mapOfPSwithAgentUser.put(psaRec.PermissionSetId,psaRec.AssigneeId);
                    } 
                }
                List<PermissionSetLicenseAssign> listOfPSLwithAgent = [SELECT id,AssigneeId,PermissionSetLicenseId FROM PermissionSetLicenseAssign 
                                                                       WHERE AssigneeId=:agentUser.id AND PermissionSetLicenseId=:pslicense[0].id];
               
                
                //Assign 'Agentforce Service Agent User' Permission Set License to Agent User
                
                if(listOfPSLwithAgent.isEmpty() && !pslicense.isEmpty()){
                    
                    PermissionSetLicenseAssign pslicnseAssignee = New PermissionSetLicenseAssign();
                    pslicnseAssignee.AssigneeId=agentUser.Id;
                    pslicnseAssignee.PermissionSetLicenseId =pslicense[0].Id;
                    if(!Test.isRunningTest()){
                        Insert pslicnseAssignee;
                         System.debug('pslicnseAssignee -->'+pslicnseAssignee);
                    }
                    
                }
                List<PermissionSetAssignment> psToAssign = new List<PermissionSetAssignment>();
                if(!permSet.isEmpty()){
                    for(PermissionSet ps : permSet){
                        if(!mapOfPSwithAgentUser.containskey(ps.id)){                           
                            PermissionSetAssignment permissionSetAssignment = new PermissionSetAssignment();
                            permissionSetAssignment.PermissionSetId = ps.Id;
                            permissionSetAssignment.AssigneeId = agentUser.Id;
                            psToAssign.add(permissionSetAssignment);
                        }
                        
                    }
                    
                    if(!psToAssign.isEmpty() && !Test.isRunningTest()){
                        insert psToAssign;
                    }       
                }
            }
        }   catch (Exception e) {
            System.debug('Error occurred:' + e.getMessage());
            throw new AuraHandledException('An Error Occured:' +e.getMessage());
        }
        
    }
    
    
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
            List<Contact> contactRecord = [SELECT Id, FirstName, Name, LastName, Email FROM Contact WHERE Name = 'John Smith' AND Email='autofolio@salesforce.com.dc' LIMIT 1];
            List<UserLicense> ul=[SELECT Id, Status, MasterLabel, Name FROM UserLicense Where Name='Customer Community Plus' LIMIT 1];
            List<Profile> profList = [SELECT Id, UserLicenseId FROM Profile Where Name = 'AutoFolio Community User' LIMIT 1];
            
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
                 List<PermissionSet> pSet = [SELECT Id FROM PermissionSet WHERE Name ='Commerce_Shopper' LIMIT 1];
                
                //List<PermissionSet> pSet = [SELECT Id FROM PermissionSet WHERE Name ='SDO_Community_Customer_Community_Plus_Permissions' LIMIT 1];//Need to check
                System.debug('Automotive perm set'+pSet);
                // Create the Permission Set Assignment
                if(!pSet.isEmpty()){
                    System.debug('AutoFolio perm set 333'+pSet);
                    PermissionSetAssignment permSetAssign = new PermissionSetAssignment(
                        AssigneeId = usr.Id,
                        PermissionSetId = pSet[0].Id
                    );
                    // Insert the Permission Set Assignment
                    insert permSetAssign;
                }
                List<PermissionSet> permSet = [SELECT Id FROM PermissionSet WHERE Name ='B2BBuyer' LIMIT 1]; //Need to check
                
                if(!permSet.isEmpty()){
                    // Create the Permission Set Assignment
                    PermissionSetAssignment permSetAssign = new PermissionSetAssignment(
                        AssigneeId = usr.Id,
                        PermissionSetId = permSet[0].Id
                    );
                    // Insert the Permission Set Assignment
                    Insert permSetAssign;
                }
              //System.setPassword(usr.Id,'A$tr0ngPW');                
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }
       
    }
      
    
    //assign account buyer group
    @future
    public static void assignCommunityUserToBuyerGroup(){
        Id buyerGroupId = [SELECT Id, Name FROM BuyerGroup WHERE Name = 'AutoFolio Buyer Group' LIMIT 1].Id; 
        system.debug('buyerGroupId'+buyerGroupId);
        List<Contact> con = [SELECT Id,AccountId,Email FROM Contact WHERE Email ='autofolio@salesforce.com.dc'];
        system.debug('con'+con[0].AccountId);
        if(!con.isEmpty() && buyerGroupId != null){
            BuyerGroupMember buyerGroupMember = new BuyerGroupMember(BuyerId = con[0].AccountId,BuyerGroupId= buyerGroupId);
            insert buyerGroupMember;
        }
        
    }
    
}
