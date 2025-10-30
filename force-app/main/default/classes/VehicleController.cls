public with sharing class VehicleController {

    @AuraEnabled(cacheable=true) 
    public static Supplier_Home__dlm getSupplierDetails(Id contactId){
        try {
            //ssot__Asset__dlm Assetsupplier = [Select ssot__Id__c, ssot__PrimaryContactId__c, ssot__AccountContactId__c, ssot__VehicleId__c from ssot__Asset__dlm Where ssot__PrimaryContactId__c =: contactId and ssot__VehicleId__c != ' '  limit 1];
            List<ssot__Asset__dlm> Assetsupplier = [Select ssot__Id__c, ssot__PrimaryContactId__c, ssot__AccountContactId__c, ssot__VehicleId__c from ssot__Asset__dlm Where ssot__PrimaryContactId__c  =: contactId and ssot__VehicleId__c != '' AND ssot__VehicleId__c  != null AND ssot__VehicleId__c != ' ' and ssot__VehicleId__c <> '' and ssot__VehicleId__c <> ' '];
            System.debug('## Assetsupplier = '+Assetsupplier);
            Set<String> accountContactId = new Set<String>();
            for(ssot__Asset__dlm sdc : Assetsupplier){
                System.debug('## sdc.ssot__Id__c = '+sdc.ssot__Id__c);
                System.debug('## sdc.ssot__VehicleId__c = '+sdc.ssot__VehicleId__c);
                if(sdc.ssot__VehicleId__c != NULL && sdc.ssot__VehicleId__c != '' && sdc.ssot__PrimaryContactId__c != NULL && sdc.ssot__PrimaryContactId__c != ''){
                    System.debug('## Coming inside if when ssot__VehicleId__c Found');
                    accountContactId.add(sdc.ssot__AccountContactId__c);
                    break;
                }
            }
            System.debug('## accountContactId = '+accountContactId);

            return [
                Select Id__c, AccountId__c, Name__c from Supplier_Home__dlm where AccountId__c =: accountContactId limit 1
            ];
        } catch (Exception e) {throw new AuraHandledException('An error occurred while fetching supplier details.');
        }
    }
    
    @AuraEnabled(cacheable=true)
    public static ssot__AccountContact__dlm getContact(Id contactId) {
            return [
                SELECT ssot__Id__c, Last_Check_In_Date__c
                FROM ssot__AccountContact__dlm 
                WHERE ssot__Id__c = :contactId LIMIT 1
            ];
    }

    @AuraEnabled(cacheable=true)   
    public static ssot__Asset__dlm getAsset(Id contactId) {

        List<ssot__Asset__dlm> Assetsupplier = [Select ssot__Id__c, ssot__PrimaryContactId__c, ssot__AccountContactId__c, ssot__VehicleId__c from ssot__Asset__dlm Where ssot__PrimaryContactId__c =: contactId and ssot__VehicleId__c != ' '];
        Set<String> assetId = new Set<String>();
            for(ssot__Asset__dlm sdc : Assetsupplier){
                if(sdc.ssot__VehicleId__c != NULL && sdc.ssot__VehicleId__c != '' && sdc.ssot__PrimaryContactId__c != NULL && sdc.ssot__PrimaryContactId__c != ''){
                    System.debug('## Coming inside if when ssot__VehicleId__c Found');
                    assetId.add(sdc.ssot__Id__c);
                    break;
                }
            }
            System.debug('## assetId = '+assetId);
        try{
        return [
            Select ssot__Id__c, ssot__PrimaryContactId__c, ssot__AccountContactId__c, ssot__VehicleId__c,PurchaseDateNew__c,Type_of_use__c,Asset_Warranty_Status__c from ssot__Asset__dlm Where ssot__PrimaryContactId__c =: contactId and ssot__Id__c =: assetId limit 1
        ]; 
        }
        catch (Exception e) {throw new AuraHandledException('An error occurred while fetching asset details.');
        }
}
 
    @AuraEnabled(cacheable=true)
    public static ssot__Vehicle__dlm getVehicle(Id vehicleId) {
        try{
        return [
            SELECT ssot__Id__c, ssot__Name__c, ssot__VehicleIdentificationNumber__c, ssot__EngineNumber__c,
            ssot__ChassisNumber__c, ssot__InteriorColorText__c, ssot__ExteriorColorText__c,
            ssot__LastOdometerReadingNumber__c, Owner_Count__c, Connected_Car__c
            FROM ssot__Vehicle__dlm
            WHERE ssot__Id__c = :vehicleId  LIMIT 1
        ];
    }
    catch (Exception e) { throw new AuraHandledException('An error occurred while fetching vehicle details.');
    }
}
}