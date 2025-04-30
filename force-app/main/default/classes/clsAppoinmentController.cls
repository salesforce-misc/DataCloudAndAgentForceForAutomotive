public with sharing class clsAppoinmentController {
    
    // Method to publish platform event
    @InvocableMethod(label='Appoinment handler' description='Appoinment Platform event fireing class')
    public static void publishAppoinment(List<Request> requests) {
        
        Request input = requests[0];
        String inputContactId = input.ContactId;
        
        system.debug('inside publishAppointment');
        
        TestDriveAppoinmentFlyout__e  tsAp = New TestDriveAppoinmentFlyout__e();
        
        tsAp.ContactId__c=inputContactId;
        tsAp.InputType__c=input.inputType;
        tsAp.AccountName__c=input.AccountName;
        tsAP.ServiceDate__c=  input.ServiceDate;
        
        system.debug('contact'+tsAp.ContactId__c);
        system.debug('inputType'+tsAp.InputType__c);
        system.debug('AccountName'+tsAp.AccountName__c);
        
        Database.SaveResult sr = EventBus.publish(tsAp);
        
        // Add logger to check if the event is published successfully
        if (sr.isSuccess()) {
            System.debug('Event published successfully: ' + sr.getId());
        } else {
            for (Database.Error error : sr.getErrors()) {
                System.debug('Failed to publish event: ' + error.getStatusCode() + ' - ' + error.getMessage());
            }
            
        }
    }
    public class Request {            
        @InvocableVariable(label='contactId')
        public String ContactId;    
        
        @InvocableVariable(label='inputType')
        public String inputType;    
        
        @InvocableVariable(label='AccountName')
        public String AccountName;   
        
         @InvocableVariable(label='ServiceDate')
        public Date ServiceDate;    
        
        
        
        
        
        
    }   
    
}