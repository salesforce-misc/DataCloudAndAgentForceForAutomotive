@isTest
public class VehicleController_Test {
    @isTest
    public static void testGetSupplierDetails() {
        SoqlStubProvider stub = new VehicleControllerTestStubProvider();
         
        Test.createSoqlStub(ssot__Asset__dlm.sObjectType, stub);
        Test.createSoqlStub(Supplier_Home__dlm.sObjectType, stub);
        Test.createSoqlStub(ssot__AccountContact__dlm.sObjectType, stub);
        Test.createSoqlStub(ssot__Vehicle__dlm.sObjectType, stub);
        //Test.createSoqlStub(AssetContactParticipant_Home__dlm.sObjectType, stub);
        
        // Assert stubs are defined
        Assert.isTrue(Test.isSoqlStubDefined(ssot__Asset__dlm.sObjectType));
        Assert.isTrue(Test.isSoqlStubDefined(ssot__AccountContact__dlm.sObjectType));
        Assert.isTrue(Test.isSoqlStubDefined(Supplier_Home__dlm.sObjectType));
        Assert.isTrue(Test.isSoqlStubDefined(ssot__Vehicle__dlm.sObjectType));
       // Assert.isTrue(Test.isSoqlStubDefined(AssetContactParticipant_Home__dlm.sObjectType));
        
        // Create test Account and Contact
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
        Contact testContact = new Contact(LastName = 'Test Contact', AccountId = testAccount.Id);
        insert testContact;
        
        Test.startTest();
        Id contactId = testContact.id;
        
        // Call methods
        ssot__Asset__dlm result = VehicleController.getAsset(contactId);
        ssot__Vehicle__dlm result2 = VehicleController.getVehicle(contactId);
        ssot__AccountContact__dlm result3 = VehicleController.getContact(contactId);
        Supplier_Home__dlm result4 = VehicleController.getSupplierDetails(contactId);
        
        
        Test.stopTest();
    }
    
    class VehicleControllerTestStubProvider extends SoqlStubProvider {
        public override List<sObject> handleSoqlQuery(sObjectType sot, string stubbedQuery, Map<string, object> bindVars) {
            if (sot == ssot__Asset__dlm.sObjectType) {
                ssot__Asset__dlm assetDMO = (ssot__Asset__dlm)Test.createStubQueryRow(
                    sot,
                    new Map<String, Object> {
                        'ssot__PrimaryContactId__c' => bindVars.get('contactId'),
                        'ssot__VehicleId__c' => 'Vehicle123',
                        'ssot__AccountContactId__c' => 'acc123'
                    }
                );
                return new List<sObject> { assetDMO };
            }
            else if (sot == ssot__Vehicle__dlm.sObjectType) {
                ssot__Vehicle__dlm vehicleDMO = (ssot__Vehicle__dlm)Test.createStubQueryRow(
                    sot,
                    new Map<String, Object> {
                        'ssot__Name__c' => 'Electra model 3.1',
                        'ssot__ChassisNumber__c' => 'HMSYTYR3565',
                        'ssot__VehicleIdentificationNumber__c' => 'QUQTEGYFYFSUG123',
                        'Owner_Count__c' => '123',
                        'Connected_Car__c' => 'Active'
                    }
                );
                return new List<sObject> { vehicleDMO };
            }
            else if (sot == ssot__AccountContact__dlm.sObjectType) {
                ssot__AccountContact__dlm contactDMO = (ssot__AccountContact__dlm)Test.createStubQueryRow(
                    sot,
                    new Map<String, Object> {
                        'Last_Check_In_Date__c' => Date.newInstance(2025, 1, 20)
                    }
                );
                return new List<sObject> { contactDMO };
            }
            else if (sot == Supplier_Home__dlm.sObjectType) {
                Supplier_Home__dlm supplierDMO = (Supplier_Home__dlm)Test.createStubQueryRow(
                    sot,
                    new Map<String, Object> {
                        'AccountId__c' => 'Vehicle123',
                        'Name__c' => 'autofolio'
                    }
                ); 
                return new List<sObject> { supplierDMO };
            }
          /*  else if (sot == AssetContactParticipant_Home__dlm.sObjectType) {
                AssetContactParticipant_Home__dlm participantDMO = (AssetContactParticipant_Home__dlm)Test.createStubQueryRow(
                    sot,
                    new Map<String, Object> {
                        'VehicleId__c' => '43534543543',
                        'ContactId__c' => '23432424',
                        'AssetId__c' => 'asset213',    
                        'StakeholderRole__c' => 'Primary Driver'
                    }
                );
                return new List<sObject> { participantDMO };
            }*/
            return new List<sObject>();
        }
    }
}