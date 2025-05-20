public class ClsAutomotiveSelfRegisterDataProvider {
    
    @future
    //@InvocableMethod(label='Create Self-Register Data' description='Create the Self Register Data')
    public static void Init(Set<Id> UserIds){
        //4) Update the contacts Address
        //5) Create Opportunity
        //6) Query Product, Query Vehicle Definitation
        //7) Create Asset with the Product Id
        //8) Query Asset
        //9) Query the Metadata get all the VIN numbers 
        //10) See if Any Vin number is Assigned to any Vehicle if not then
        //11) Create Vehicle and Assign the Vin number and assign Asset Id= Asset and Vehicle Defination queried from Above query
        //12) Create AssetContactParticipants
        
        
        // String calculatedVin= '1J8GA591X8L'+String.valueOf(Math.round((Math.random() * (900000) + 100000)));
        String calulatedChassisNumber = 'JK265H98'+String.valueOf(Math.round((Math.random() * (900000) + 100000)));
        String calculatedEngineNumber ='CK'+ String.valueOf(Math.round((Math.random() * (90000) + 10000))) + '-EV';
        List<String> vinNumbers= new List<String>();
        
        // Fetch the User record by the given userId
        User communityUser = [SELECT Id, ContactId FROM User WHERE Id IN:UserIds LIMIT 1];
        system.debug('communityUser:'+communityUser);
        
        // If the User has an associated Contact
        if (communityUser.ContactId != null) {
            
            
            // Retrieve the Contact associated with this User
            Contact associatedContact = [SELECT Id,AccountId,Name, MailingLatitude, MailingLongitude, MailingStreet, MailingCity, MailingState, MailingPostalCode,Last_Check_in_Date__c,Phone,MobilePhone
                                         FROM Contact  WHERE Id = :communityUser.ContactId LIMIT 1];
            
            
            associatedContact.MailingStreet ='1234 Cañada Road';
            associatedContact.MailingCity = 'Woodside';
            associatedContact.MailingState = 'CA';
            associatedContact.MailingPostalCode ='94062';
            associatedContact.MailingCountry ='United States';
            associatedContact.MailingLatitude=37.8052631;
            associatedContact.MailingLongitude=-122.2700501;
            associatedContact.Last_Check_in_Date__c = Date.today();
            associatedContact.MobilePhone = associatedContact.Phone;
            
            
            // Get the Account
            Account previousAccount = [Select id,name,Type from Account where id =:associatedContact.AccountId Limit 1];
            
            //Check if teh Account has Same Name as the Contact
            if(previousAccount.Name == associatedContact.name){
                
                Account acct = [Select id,name,Type from Account where name ='TMZ Dealership' Limit 1];
                associatedContact.AccountId=acct.Id;
                //delete previousAccount;
           
            //  Update the contacts Address
            update associatedContact;
            System.debug('associatedContact'+associatedContact);
            
            
            //Create Opportunity
            String oppName = 'TMZ Dealership -' +associatedContact.Name ;
            Opportunity opp = new Opportunity(Name = oppName,StageName='Negotiation',CloseDate= Date.today().addYears(2),Amount=3500,Type='Add-On Business',
                                              Test_Drive_Date__c= Date.today().addMonths(1),After_Completing_a_Test_Drive_status__c='No',ForecastCategoryName='Commit',
                                              Number_of_Past_Interactions__c='10',Recency_of_Interactions__c='1 week ago',Car_Model__c='Electra Model 3.1 -2025',
                                              AccountId= associatedContact.AccountId,Primary_Contact__c= associatedContact.Id);
            
            if(opp != null){
                insert opp;
            }
            System.debug('op'+opp);
            
            
            //Query Product, Query Vehicle Definitation
            Product2 prod=[SELECT Id, Name FROM Product2 WHERE Name IN ('Electra Model 3.1 - 2025') LIMIT 1 ];
            System.debug('prod'+prod);
            
            // Query Vehicle Defination Object
            VehicleDefinition vehicleDefinationDetails = [SELECT Id, Name,ProductId FROM VehicleDefinition WHERE Name IN ('Electra Model 3.1 - 2025') AND ProductId =:prod.id Limit 1 ];
            System.debug('vehicleDefinationDetails'+vehicleDefinationDetails);
            
            String assetName = 'Electra Model 3.1 2025 -' +calulatedChassisNumber;
            // Create Asset with the Product Id
            Asset assets = new Asset(Name =  assetName,Product2Id= prod.Id,SerialNumber = '56789XYZ',Status = 'Purchased',
                                     PurchaseDate = Date.today(),Type_of_use__c = 'Personal',Service_Perks_Available__c = 'Free Oil Change (every 12 months), Free Tire Rotation (every 12 months)',
                                     Last_Service_Date__c = Date.newInstance(2025, 2, 18),AccountId = associatedContact.AccountId,ContactId =associatedContact.Id,
                                    Asset_Warranty_Status__c = 'In Warranty');
            if(assets != null){
                Insert assets;
            }
            system.debug('assets'+assets);
            
            //Query Asset
            Asset ast=[Select id,name,Product2Id,VehicleId from  Asset where name = :assetName limit 1];
            system.debug('recently fetched asset:'+ast);
            
            //fetch unit of measure
            UnitOfMeasure unitMesure = [Select id,name from UnitOfMeasure where name ='Miles' limit 1];
              system.debug('unitMesure:'+unitMesure);
            
            //Query Vehcile for all the Vin Assigned
            for(Vehicle veh:[SELECT Id, Name, AssetId,VehicleIdentificationNumber FROM Vehicle where VehicleIdentificationNumber!=null]){
                
                vinNumbers.add(veh.VehicleIdentificationNumber);
                
            }
            system.debug('vinNumbers:'+vinNumbers);
            //Get Vin number that are not assigned
            Vehicle_Identfiication_numbers__mdt vinMetadata=[Select VIN__c from Vehicle_Identfiication_numbers__mdt where VIN__c NOT IN :vinNumbers LIMIT 1];
            system.debug('vinMetadata:'+vinMetadata);
            
            
            //Create Vehicle and Assign the Vin number and assign Asset Id= Asset and Vehicle Defination queried from Above query
            Vehicle vehicleRecentlyCreatedList =  new Vehicle(Name = 'Electra Model 3.1 - 2025',CurrentOwnerId = associatedContact.AccountId,Status = 'At Dealer Location',
                                                              VehicleIdentificationNumber = vinMetadata.VIN__c, AssetId=  ast.Id,VehicleDefinitionId = vehicleDefinationDetails.Id,OdometerReadingUomId =unitMesure.id,
                                                              ChassisNumber= calulatedChassisNumber,EngineNumber=calculatedEngineNumber,MarketPrice=34699,MarketPriceSource='National Automobile Dealers Association',
                                                              ExteriorColor='Transparent - Black',InteriorColor='Black',LastOdometerReading=8000.00,IsTelematicsServiceActive=TRUE,LocationStreet='D-80',LocationCity='New York',LocationState='New York',
                                                              LocationPostalCode='1232',LocationCountry='US',FrontDriver__c = false,FrontPassenger__c = false,RearDriver__c = false,RearPassenger__c = false,Connected_Car__c ='Active',
                                                              Description__c='Built for families who love the outdoors, this is a versatile SUV with all-wheel drive capabilities. It comfortably seats 5 people and offers a panoramic sunroof for a premium touch. With its robust safety features and spacious interiors, this vehicle is ideal for road trips and everyday commuting alike.');
            
            if(vehicleRecentlyCreatedList != null){
                insert vehicleRecentlyCreatedList;
            }
            
            system.debug('vehicleRecentlyCreatedList:'+vehicleRecentlyCreatedList);
            
            
            // Create AssetContactParticipants
            AssetContactParticipant assetContactParticipants = new AssetContactParticipant(Name =associatedContact.Name,ContactId = associatedContact.Id,VehicleId = vehicleRecentlyCreatedList.Id,
                                                                                           AssetId = ast.id,IsActive = TRUE,StakeholderRole='Primary Driver',EffectiveStartDate= Date.today(), UsageType = 'Automotive');
            
            if(assetContactParticipants != null){
                Insert assetContactParticipants;  
            }
            system.debug('assetContactParticipants'+assetContactParticipants);
            
            //Create Asset Warranty
            AssetWarranty assetWarranty = new AssetWarranty(AssetId = ast.Id, StartDate = Date.today(),EndDate = Date.today().addYears(5),
                                                            Perks_Available__c = 'Free Oil Change, Free Tire Rotation',ExchangeType='Advance Exchange',WarrantyType='Standard');
            
            if(assetWarranty != null){
                insert assetWarranty;
            }
            system.debug('assetWarranty'+assetWarranty);
            
            String astMilestoneName = 'Oil Change for' +calulatedChassisNumber;
            //create asset milestone
            AssetMilestone astMilestone = new AssetMilestone(Name = astMilestoneName,VehicleId = vehicleRecentlyCreatedList.Id,AssetId = vehicleRecentlyCreatedList.AssetId,
                                                             MilestoneDate=Date.today(),MilestoneType = 'Delivered',UsageType='Automotive',Stage='Expired');
            
            if(astMilestone != null){
                insert astMilestone;
            }
            system.debug('astMilestone'+astMilestone);
            
            //create worktype
            WorkType  wrkType = new WorkType(Name = 'Reclamation for Car',DurationType ='Minutes',EstimatedDuration=60);
            
            if(wrkType != null){
                insert wrkType; 
            }
            system.debug('wrkType'+wrkType);
            
            //create workOrder
            WorkOrder  wrkOrder = new WorkOrder(WorkTypeId = wrkType.Id, Status = 'New',Subject='Reclamation for new car');
            
            if(wrkOrder != null){
                insert wrkOrder; 
            }
            system.debug('wrkOrder'+wrkOrder);
            
            
            String serviceAptSubjectTitle = 'Vehicle Service of Electra Model 3.1 2025 -' +calulatedChassisNumber;
            List<ServiceAppointment> ServiceAppointmentList = new List<ServiceAppointment>();
            //create service appoinment for Copilot
            ServiceAppointmentList.add(new ServiceAppointment(ParentRecordId= vehicleRecentlyCreatedList.AssetId,Status='In Progress',Subject = serviceAptSubjectTitle,
                                                              ContactId = associatedContact.Id, EarliestStartTime =  Datetime.now(), ActualStartTime = Datetime.now().addDays(-1),ActualEndTime = Datetime.now().addDays(5),
                                                              DueDate = Datetime.now().addDays(3),AppointmentType='Vehicle Service',SchedStartTime = Datetime.now().addDays(1),SchedEndTime= Datetime.now().addDays(3)));
            
            //create service appoinment for Tablue UI and LWC
            ServiceAppointmentList.add(new ServiceAppointment(ParentRecordId= wrkOrder.Id,Status='In progress',Subject ='New Reclamation',
                                                              ContactId = associatedContact.Id, EarliestStartTime = Datetime.now(), ActualStartTime = Datetime.now().addDays(1),ActualEndTime = Datetime.now().addDays(5),
                                                              DueDate = Datetime.now().addDays(3),AppointmentType='Vehicle Service',SchedStartTime= Datetime.now().addDays(1),SchedEndTime= Datetime.now().addDays(3)));
            
            ServiceAppointmentList.add(new ServiceAppointment(ParentRecordId= wrkOrder.Id,Status='In progress',Subject ='Reclamation Vehicle',ActualStartTime = Datetime.now().addDays(-1),ActualEndTime = Datetime.now().addDays(-1),
                                                              ContactId = associatedContact.Id, EarliestStartTime =  Datetime.now().addDays(-1),
                                                              DueDate = Datetime.now().addDays(-1),AppointmentType='Vehicle Service',SchedStartTime = Datetime.now().addDays(-1),SchedEndTime= Datetime.now().addDays(-1)));
            
            
            if(ServiceAppointmentList != null){
                insert ServiceAppointmentList;
            }
            system.debug('ServiceAppointmentList'+ServiceAppointmentList);
            
            //create Asset title
            AssetTitle astTitle = new AssetTitle(AssetId = ast.Id,TitleNumber ='1234567890',EffectiveStartDate =  Date.today(), EffectiveEndDate = Date.today().addYears(2) , IsActive = true, LienStatus = 'Released', IssueFormat = 'Electronic',
                                                 Type='Clear');
            
            if(astTitle != null){
                insert astTitle; 
            }
            system.debug('astTitle'+astTitle);
            
            //create Asset Title Parties
            AssetTitleParty astTitleParty = new AssetTitleParty(PartyId=associatedContact.Id,PartyRole='Lien Holder',EffectiveStartDate= Date.today(),
                                                                EffectiveEndDate = Date.today().addYears(2),TitleId=astTitle.Id,IsActive=TRUE);  
            if(astTitleParty != null){
                insert astTitleParty; 
            }
            system.debug('astTitleParty'+astTitleParty);
            
            //create supplier if its not already existed
            List<Supplier> existingSupplier = [Select id,name,AccountId from Supplier where AccountId=:associatedContact.AccountId];
            
            if(existingSupplier.size() == 0){
                Supplier supplierData= new Supplier(Name = 'TMZ Dealership autofolio suppliier', AccountId =  associatedContact.AccountId, CompanyRelationshipType = 'Value Chain Supplier');
                if(supplierData != null){
                    insert supplierData; 
                }
                system.debug('supplierData'+supplierData);
            }
            
            if (Test.isRunningTest()) {
                 ClsAutomotiveSelfRegisterDataProvider.getStdPriceBook();
                
            } else{
                //fetch pricebook
                Pricebook2 autoFolioPriceBookData = [SELECT Id,IsStandard,Name FROM Pricebook2 where Name = 'AutoFolio Price Book' LIMIT 1];
                system.debug('autoFolioPriceBookData:'+autoFolioPriceBookData);
                
                //fetch pricebook entry
                PricebookEntry autopricebookEntry = [Select id,Product2.Name,UnitPrice,Pricebook2Id,Product2Id from PricebookEntry
                                                     where Product2Id =:prod.Id AND Pricebook2Id =:autoFolioPriceBookData.Id];   
                system.debug('autopricebookEntry:'+autopricebookEntry);
                
                //create order
                String orderName = 'Electra Model 3.1 2025 -' +calulatedChassisNumber + 'order1';
                Order orderData = new Order(Name = orderName, AccountId = associatedContact.AccountId,EffectiveDate = Date.today(),
                                            Status ='Draft',Contact__c = associatedContact.Id,Pricebook2Id = autoFolioPriceBookData.Id);
                
                if(orderData != null){
                    insert orderData;
                }
                system.debug('orderData:'+orderData);
                
                //order item creation
                OrderItem orderItemData =new OrderItem(Product2Id =  prod.Id,Quantity = 2,OrderId = orderData.Id, PricebookEntryId = autopricebookEntry.Id,UnitPrice = autopricebookEntry.UnitPrice);
                if(orderItemData != null){
                    insert orderItemData;
                }
                system.debug('orderItemData:'+orderItemData);
            }
                 }
            
        }
    }
    private static Pricebook2 stdPriceBook; 
    
    public static Pricebook2 getStdPriceBook () {
        if (stdPriceBook == null) 
            stdPriceBook    = [select id, name from Pricebook2 where isStandard = true limit 1];
        return stdPriceBook;    
    }
    

    
}