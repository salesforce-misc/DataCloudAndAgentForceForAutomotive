@isTest
public class Test_ClsAutomotiveSelfRegister {
    // Test method to create a community user, insert contact/account, and test the Init method
    @isTest
    static void testInitMethod() {
        Product2 prdt= new Product2(Name = 'Electra Model 3.1 - 2025',IsActive = TRUE,ProductCode ='EM3.1-2025',StockKeepingUnit='EV50001',Family='Product',Seat_Capacity__c = 5,
                                    Description='The Electra Model 3.1 2025 is an all-electric sedan offering a sleek design, top-tier performance, and an extended range of 350 miles per charge, Built for families who love the outdoors, this is a versatile SUV with all-wheel drive capabilities. It comfortably seats 5 people and offers a panoramic sunroof for a premium touch. With its robust safety features and spacious interiors, this vehicle is ideal for road trips and everyday commuting alike.');
        insert prdt;
        VehicleDefinition vdef= new VehicleDefinition(Name ='Electra Model 3.1 - 2025',ProductId = prdt.Id,TotalPower='110BHP', TopSpeed ='210', FuelTankCapacity = '42', AccelerationTime='4.2', BodyType='Sedan',
                                                      MaximumGrossWeight = '4500 pounds',  BatteryCapacity='100 kWh', MaximumTorque='113 NM', UrbanFuelEconomy='20', VehicleClass='EV Hybrid', ModelCode='645454', DoorCount=4, EmissionStandard='BS6', EngineName ='4 Cylinders',
                                                      MainBatteryType='lead acid battery (Wet Cell)',AuxiliaryBatteryType='lithium ion (Li-Ion) battery', MinimumBatteryRange ='50 miles', MaximumBatteryRange='200 miles', EngineCubicCapacity='2400 cc');
        insert vdef;
        
        // Instantiate the Pricebook2 record first, setting the Id
        
        Pricebook2 standardPricebook = new Pricebook2(
            
            Id = Test.getStandardPricebookId(),
            
            IsActive = true
            
        );
        
        // Run an update DML on the Pricebook2 record
        
        // This is the weird workaround that enables IsStandard to become true
        
        // on the PricebookEntry record
        
        update standardPricebook;
        
        // Re-Query for the Pricebook2 record, for debugging
        
        standardPricebook = [SELECT IsStandard FROM Pricebook2 WHERE Id = :standardPricebook.Id];
        
        // This should return true now
        
        system.assertEquals(true, standardPricebook.IsStandard, 'The Standard Pricebook should now return IsStandard = true');
        
        // Create the Product
        
        Product2 testProduct = new Product2(
            
            Name = 'Test Product', 
            
            IsActive = true
            
        );
        
        insert testProduct;
        
        // Create the PricebookEntry
        
        PricebookEntry testPbe = new PricebookEntry(
            
            Pricebook2Id = standardPricebook.Id,
            
            Product2Id = testProduct.Id,
            
            UnitPrice = 100,
            
            IsActive = true
            
        );
        
        insert testPbe;
        
        // Re-Query the PBE
        
        testPbe = [SELECT Id, Pricebook2.IsStandard FROM PricebookEntry];
        
        // Should also return true
        
        system.assertEquals(true, testPbe.Pricebook2.IsStandard, 'The Standard Pricebook should return true from the PBE as well.');
        
        System.runAs(new User(Id=UserInfo.getUserId())) {
            // Step 1: Create Test Data for Account and Contact
            Account testAccount = new Account(Name = 'Test Account', Type = 'Prospect');
            insert testAccount;
            
            Contact testContact = new Contact(
                FirstName = 'John',
                LastName = 'Doe',
                AccountId = testAccount.Id,
                Email = 'johndoe@test.com',
                MailingStreet = '1234 Elm Street',
                MailingCity = 'Test City',
                MailingState = 'CA',
                MailingPostalCode = '90001',
                MailingCountry = 'United States'
            );
            insert testContact;
            
        }
        Contact cn=[Select id,AccountId,LastName from contact where email='johndoe@test.com'];
        
        
        // Step 2: Create a Profile and Community User
        Profile p = [SELECT Id FROM Profile WHERE Name = 'AutoFolio Community User' LIMIT 1];
        
        User communityUser = new User(
            Alias = 'jdoe',
            Email = 'johndoe@test.com',
            Username = 'johndoe@test.com' + Math.random(),
            LastName='Doe',
            FirstName='John',
            ProfileId = p.Id,
            ContactId = cn.Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            
            IsActive = true
        );
        insert communityUser;
        
        
        // Step 3: Create the Set of UserIds to pass to the Init method
        Set<Id> userIds = new Set<Id>{communityUser.Id};
            
            // Step 4: Call the Init method
            Test.startTest();
        ClsAutomotiveSelfRegisterDataProvider.Init(userIds);  // Replace 'YourClassName' with the actual class name containing Init method
        Test.stopTest();
        
        // Step 5: Assert Statements to Verify the Results
        // Verify that the Contact's Mailing Information has been updated
        Contact updatedContact = [SELECT MailingStreet, MailingCity, MailingState, MailingPostalCode FROM Contact WHERE Id = :cn.Id];
        System.assertEquals('1234 Cañada Road', updatedContact.MailingStreet);
        System.assertEquals('Woodside', updatedContact.MailingCity);
        System.assertEquals('CA', updatedContact.MailingState);
        System.assertEquals('94062', updatedContact.MailingPostalCode);
        
        // Verify that the Opportunity has been created
        Opportunity createdOpportunity = [SELECT Id, Name, AccountId FROM Opportunity WHERE AccountId = :cn.AccountId LIMIT 1];
        System.assertNotEquals(null, createdOpportunity);
        System.assert(createdOpportunity.Name.contains('TMZ Dealership -'));
        
        // Verify that the Asset has been created
        Asset createdAsset = [SELECT Id, Name FROM Asset WHERE AccountId = :cn.AccountId  LIMIT 1];
        System.assertNotEquals(null, createdAsset);
        
        // Verify that a Vehicle has been created
        Vehicle createdVehicle = [SELECT Id, VehicleIdentificationNumber FROM Vehicle WHERE AssetId = :createdAsset.Id LIMIT 1];
        System.assertNotEquals(null, createdVehicle);
        System.assertNotEquals(null, createdVehicle.VehicleIdentificationNumber);
        
        // Verify that AssetContactParticipant has been created
        AssetContactParticipant createdParticipant = [SELECT Id FROM AssetContactParticipant WHERE ContactId = :cn.Id LIMIT 1];
        System.assertNotEquals(null, createdParticipant);
        
        // Verify that Asset Warranty has been created
        AssetWarranty createdWarranty = [SELECT Id, StartDate FROM AssetWarranty WHERE AssetId = :createdAsset.Id LIMIT 1];
        System.assertNotEquals(null, createdWarranty);
         
       
        
        // Verify that ServiceAppointment has been created
        ServiceAppointment createdAppointment = [SELECT Id, Status FROM ServiceAppointment WHERE ContactId = :cn.Id LIMIT 1];
        System.assertNotEquals(null, createdAppointment);
        
       
    }
    
}