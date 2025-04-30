public with sharing class Vehicle360 {
    @TestVisible
    private static Boolean isTestMode = false;
    @AuraEnabled(cacheable=true)
    public static Vehicle getVehicleDetails(Id vehicleId) {
        
        return [ 
            SELECT Id,Name, VehicleIdentificationNumber,
            IsConnectedServiceActive,Manufacturer_Warranty__c,Connected_Car__c,Owner_Count__c,InteriorColor,ExteriorColor,LastOdometerReading,
            ChassisNumber,EngineNumber,Last_Check_in_Date__c FROM Vehicle
            WHERE Id = :vehicleId LIMIT 1
        ];
    }
    
    @AuraEnabled
    public static Map<String, Object> getVehicleTelemetricDataByVIN (Id vehicleId){
        Map<String, Object> response = new Map<String,Object>();
        try {
            Vehicle vehicle = [SELECT Id,VehicleIdentificationNumber,Name,FrontDriver__c,FrontPassenger__c,RearDriver__c,RearPassenger__c From Vehicle WHERE Id =:vehicleId LIMIT 1];
            if(vehicle == null || String.isEmpty(vehicle.VehicleIdentificationNumber)){
                throw new AuraHandledException(' Vehicle Identification Number not found for this vehicle Id');
            }
            response.put('VIN', vehicle);
            system.debug('VIN NUMBER'+vehicle.VehicleIdentificationNumber);
            // if(isTestMode){
            //     response.put('TELEMETRIC DATA', getMockTelematicsData(vehicle.VehicleIdentificationNumber));
            // }else{
            List<Vehicle_Telemetric__dlm> vehicleData = [SELECT battery_soc_level__c,latitude__c,longitude__c,timestamp__c,tire_pressure_fl__c,
            tire_pressure_fr__c,tire_pressure_rl__c,tire_pressure_rr__c,VIN__c,odometer__c FROM
            Vehicle_Telemetric__dlm WHERE VIN__c=:vehicle.VehicleIdentificationNumber ORDER BY timestamp__c DESC LIMIT 1];
            system.debug('TEMELETRIC DATA'+vehicleData);
            response.put('TELEMETRICDATA', vehicleData.isEmpty() ? null :vehicleData[0]);
            system.debug('TEMELETRIC DATA'+vehicleData[0]);
            // }
            return response;
        } catch (Exception e) {
            throw new AuraHandledException('Error Fetching Vehicle Data:'+e.getMessage());
        }
    }
    
}