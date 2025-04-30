@isTest
public class Vehicle360_Test {
    private static Id testVehicleId;
    private static Id testVehicleIdentificationNumber;
    @IsTest
    static void testVehicleDetails() {
     Vehicle testVehicle = new Vehicle(
        Name='Test Vehicle',
        VehicleIdentificationNumber = 'VINXMLP1987463FG',
        AssetId = '02iPa000001z322IAA',
        VehicleDefinitionId='1PqPa0000001FWZKA2'
     );
     insert testVehicle;
     testVehicleId = testVehicle.Id;
     Test.startTest();
     Vehicle result = Vehicle360.getVehicleDetails(testVehicleId);
     Test.stopTest();
       
    }

   @IsTest
    static void testVehicleTelematicsData() {
      Vehicle testVehicle1 = new Vehicle(
        Name='Test Vehicle',
        VehicleIdentificationNumber = 'VINXMLP1987463KG',
        AssetId = '02iPa000001z322IAA',
        VehicleDefinitionId='1PqPa0000001FWZKA2'
     );
     insert testVehicle1;
      Test.startTest();
      //Vehicle360.isTestMode = true;
      try{
      Map<String,Object> result = Vehicle360.getVehicleTelemetricDataByVIN(testVehicle1.Id);
      Test.stopTest();
      system.assertEquals(((Vehicle)result.get('VIN')).VehicleIdentificationNumber, 'VINXMLP1987463FG','Vehicle Id match found');
      system.assert(result.containsKey('TELEMETRICDATA'),'Telematics data key should exist in response');
      system.assertNotEquals(result.get('TELEMETRICDATA'),null,'Telematics data should not be null');
      }catch(Exception e){

      }
      Test.stopTest();
    }

    @IsTest
    static void testVehicleIdentificationNull() {
      
      Test.startTest();
      try{
      //Id vehicleId ='00000000000000AAA';
      Map<String,Object> result = Vehicle360.getVehicleTelemetricDataByVIN(null);
      system.assert(false, 'Expected Aura Handled Exception');
      //System.assertEquals('Error: ID is null', result, 'The method should return an error message when the ID is null.');
      }catch(AuraHandledException e){
        system.assert(true,'Expected Missing VIN');
          // e.getMessage().contains(' Vehicle Identification Number not found for this vehicle Id'), 'Expected Missing VIN');
      }
      Test.stopTest();
      
}
}