@isTest
public class UpdateVehicleOwnerCount_Test {
    
    @isTest
    public static void vehicleOwnerTest(){
        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        Contact con = new Contact();
        con.LastName = 'Test Contact';
        con.AccountId = acc.Id;
        insert con;
        
        Asset asset = new Asset();
        asset.Name = 'Test Asset';
        asset.ContactId = con.Id;
        insert asset;
        
        Product2 prd = new Product2();
        prd.Name = 'Test Product';
        insert prd;
        
        VehicleDefinition vehDef = new VehicleDefinition();
        vehDef.Name = 'Test Veh Def';
        vehDef.ProductId = prd.Id;
        insert vehDef;
        
        Vehicle vehicle = new Vehicle();
        vehicle.Name = 'Test Vehicle1';
        vehicle.VehicleIdentificationNumber = '1J8GA591X8L585418';
        vehicle.AssetId = asset.Id;
        vehicle.VehicleDefinitionId = vehDef.Id;
        insert vehicle;
        
        AssetTitle assetTitle = new AssetTitle();
        assetTitle.AssetId = asset.Id;
        assetTitle.TitleNumber = '12345';
        assetTitle.IssueFormat = 'Paper';
        assetTitle.Type = 'Clean';
        insert assetTitle;
        
        vehicle.Owner_Count__c = '2';
        update vehicle;
        
        Vehicle updatedVehicle = [SELECT Owner_Count__c FROM Vehicle WHERE Id = :vehicle.Id];
    }
}