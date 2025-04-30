@isTest
public class clsAppoinmentController_Test {
	 @isTest
    public static void testPublishAppoinment() {
       
        Contact con = new contact();
        con.LastName='TestAppointment';
        con.Email='test@gmail.com';
        insert con;
        clsAppoinmentController.Request request = new clsAppoinmentController.Request();
        request.ContactId = con.Id; 
        
        List<clsAppoinmentController.Request> requests = new List<clsAppoinmentController.Request>{ request };
        
        Test.startTest();
        clsAppoinmentController.publishAppoinment(requests);
        Test.stopTest();
        
        
        //List<TestDriveAppoinmentFlyout__e> events = [SELECT ContactId__c FROM TestDriveAppoinmentFlyout__e];
        
        //System.assertEquals(1, events.size(), 'One event should be published');
        //System.assertEquals('0035g00000ABC123', events[0].ContactId__c, 'ContactId should match the mock request');
    }
}