public with sharing class VehicleController {

    @AuraEnabled(cacheable=true) 
    public static Supplier_Home__dlm getSupplierDetails(Id contactId){
        try {
            ssot__Asset__dlm Assetsupplier = [Select ssot__Id__c, ssot__PrimaryContactId__c, ssot__AccountContactId__c, ssot__VehicleId__c from ssot__Asset__dlm Where ssot__PrimaryContactId__c =: contactId limit 1];
            return [
                Select Id__c, AccountId__c, Name__c from Supplier_Home__dlm where AccountId__c =: Assetsupplier.ssot__AccountContactId__c limit 1
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
        try{
        return [
            SELECT ssot__Id__c, ssot__AccountContactId__c, ssot__PrimaryContactId__c, 
            ssot__VehicleId__c, PurchaseDateNew__c, 
            Type_of_use__c, Asset_Warranty_Status__c
            FROM ssot__Asset__dlm
            WHERE ssot__PrimaryContactId__c = :contactId LIMIT 1
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
            WHERE ssot__Id__c = :vehicleId LIMIT 1
        ];
    }
    catch (Exception e) { throw new AuraHandledException('An error occurred while fetching vehicle details.');
    }
}
}