@isTest
public class clsMapController_Test {
	@isTest
    public static void testCalculateDistanceAndTime_Home() {
        clsMapController.Request request = new clsMapController.Request();
        request.inputType = 'Home';
        request.currentLat = '37.7749';
        request.currentLong = '-122.4194';
        request.homeLat = 34.0522;
        request.homeLong = -118.2437;
        
        List<clsMapController.Request> requests = new List<clsMapController.Request>{ request };
        
        Test.startTest();
        clsMapController.calculateDistanceAndTime(requests);
        Test.stopTest();
        
        //List<HomeMapFlyOut__e> events = [SELECT InputType__c FROM HomeMapFlyOut__e];
        //System.assertEquals(1, events.size(), 'One event should be published');
        //System.assertEquals('Home', events[0].InputType__c, 'Event type should be Home');
    }
    
    @isTest
    public static void testCalculateDistanceAndTime_Charging() {
        clsMapController.Request request = new clsMapController.Request();
        request.inputType = 'Charging';
        request.currentLat = '37.7749';
        request.currentLong = '-122.4194';
        request.homeLat = 34.0522;
        request.homeLong = -118.2437;
        
        List<clsMapController.Request> requests = new List<clsMapController.Request>{ request };
        
        Test.startTest();
        clsMapController.calculateDistanceAndTime(requests);
        Test.stopTest();
        
        //List<HomeMapFlyOut__e> events = [SELECT InputType__c FROM HomeMapFlyOut__e];
        //System.assertEquals(1, events.size(), 'One event should be published');
        //System.assertEquals('Charging', events[0].InputType__c, 'Event type should be Charging');
    }
    
    @isTest
    public static void testCalculateDistanceAndTime_Maintainance() {
        clsMapController.Request request = new clsMapController.Request();
        request.inputType = 'Maintainance';
        request.currentLat = '37.7749';
        request.currentLong = '-122.4194';
        request.homeLat = 34.0522;
        request.homeLong = -118.2437;
        request.AdditionalLat = 36.7783;
        request.AdditionalLong = -119.4179;
        
        List<clsMapController.Request> requests = new List<clsMapController.Request>{ request };
        
        Test.startTest();
        clsMapController.calculateDistanceAndTime(requests);
        Test.stopTest();
        
       // List<HomeMapFlyOut__e> events = [SELECT InputType__c FROM HomeMapFlyOut__e];
        //System.assertEquals(1, events.size(), 'One event should be published');
        //System.assertEquals('Maintainance', events[0].InputType__c, 'Event type should be Maintainance');
    }
}