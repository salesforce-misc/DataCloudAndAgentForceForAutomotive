/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-17-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class DisplayLeadForm {

    @InvocableMethod(label='Display Schedule Appointment Flyout' 
                     description='Publish the platform Event to display Flyout')
    public static List<Response> getInputQuestion(List<Request> requests) {
        List<Response> responses = new List<Response>();
        Request input = requests[0];
      
        String cookieId = input.cookieId;   
        String finalCookieId;     
        
            List<MessagingSession> listOfMessagingSession = new List<MessagingSession>();
            if(cookieId != null){
                listOfMessagingSession = [SELECT Id,cookieId__c,UsersId__c FROM MessagingSession Where cookieId__c != NULL and cookieId__c=: cookieId Order By CreatedDate DESC Limit 1];
                if(listOfMessagingSession[0].cookieId__c == cookieId){
                    finalCookieId = cookieId;
                }
            }else if(cookieId == NULL || cookieId == ''){
                listOfMessagingSession = [SELECT Id,cookieId__c,UsersId__c FROM MessagingSession Where cookieId__c != NULL and CreatedDate = Today Order By CreatedDate DESC Limit 1];
                finalCookieId = listOfMessagingSession[0].cookieId__c;
            }
            System.debug('## cookieId = '+cookieId);         
            AppointmentforGuest__e  apt = New AppointmentforGuest__e();
            apt.cookieId__c = finalCookieId;
            apt.Intrested_In__c= input.carName;
            Database.SaveResult sr=EventBus.publish(apt);
            Response response = new response();
            if (sr.isSuccess()) {
                response.isSuccess = true;
                System.debug('Event published successfully: ' + sr.getId());
            } else {
                response.isSuccess = true;
                for (Database.Error error : sr.getErrors()) {
                    System.debug('Failed to publish event: ' + error.getStatusCode() + ' - ' + error.getMessage());
                }            
            }
            System.debug('##publIsh platform event After ##');
            responses.add(response);
                
        return responses;       
    }   
    
   
    public class Request {
        
        @InvocableVariable(label='CookieId')
        public String cookieId;
        
        @InvocableVariable(label='car Name')
        public String carName;
       
    }
    public class Response {
        @InvocableVariable
        public Boolean isSuccess;
    }
}