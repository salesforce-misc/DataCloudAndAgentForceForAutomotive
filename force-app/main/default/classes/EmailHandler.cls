/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-28-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class EmailHandler {
    // Public method
    public static void sendMail(String LeadId, String ServiceAppId) {
       /** EmailTemplate et = [SELECT Id,Subject, Body,name,DeveloperName  FROM EmailTemplate where DeveloperName  ='Test_Drive_Appointment_Confirmation'];
     
        
    
        Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate(et.Id, LeadId, ServiceAppId);
        
        mail.setSaveAsActivity(false); // can't save as activity when emailing users
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});**/
        
        
        
    }
     public static String sendEmail(String recipientEmail, String subject, String emailBody){

        OrgWideEmailAddress[] owea = [select Id from OrgWideEmailAddress where Address = 'sdo@salesforce.com'];
        
        
        String response = '';
        List<String> recipientEmails = new List<String>();
        recipientEmails.add(recipientEmail);
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        if ( owea.size() > 0 ) {
            email.setOrgWideEmailAddressId(owea.get(0).Id);
        }
        // Set the recipient IDs (this assumes you have valid email addresses in recipientIds)
        email.setToAddresses(recipientEmails);
        // Set the subject of the email
        email.setSubject(subject);
        
        // Set the body of the email
        //email.setPlainTextBody(emailBody);
  		email.setHTMLBody(emailBody);
        // Send the email
        Messaging.sendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        
        for(Messaging.sendEmailResult result : results){
            if(result.isSuccess()){
                response = 'Email Sent Succesfully';
            }else{
                response = 'Failed to Send Email';
            }
        }
        return response;
    }
    public static string setEmailForSA(String AppointmentId) {
        
        ServiceAppointment ap=[SELECT Id, AppointmentNumber,ParentRecordId,SchedStartTime,ContactId FROM ServiceAppointment Where Id=: AppointmentId];
          
         //Add a query to contact object to get the name of the contact
          Contact con=[Select id,name,email from contact where id=:ap.ContactId];
          
          
         
          String response = '';
         
          
              String bookingEmailBody = 'Hello ' + con.Name + ',<br><br>';
             
              bookingEmailBody += 'Your Service Appointment has been scheduled.<br><br>';
              bookingEmailBody +=  'Here are the details:  <br><br>';
              bookingEmailBody +=  'Scheduled Time: '+ap.SchedStartTime+'  <br>';
              bookingEmailBody += '<br>Thanks';
              System.debug('## bookingEmailBody = '+bookingEmailBody);
              // Add additional fields or formatting for Booking if needed
              if(bookingEmailBody != null){
                  response = sendEmail(con.email, 'Service Appointment Confirmation',bookingEmailBody);
              }
               return response;
          }
         
      
      
    
    public static string setEmailForBooking(String AppointmentId) {
        
      ServiceAppointment ap=[SELECT Id, AppointmentNumber,ParentRecordId,SchedStartTime FROM ServiceAppointment Where Id=: AppointmentId];
        
        Lead ld=[Select id,Intrested_In__c,name,Email from lead where id=:ap.ParentRecordId];
        
        
       
        String response = '';
       
        
			String bookingEmailBody = 'Hello ' + ld.Name + ',<br><br>';
           
            bookingEmailBody += 'Your Test Drive for ' + ld.Intrested_In__c + ' is scheduled.<br><br>';
            bookingEmailBody +=  'Here are the details:  <br><br>';
            bookingEmailBody +=  'Scheduled Time: '+ap.SchedStartTime+'  <br>';
			bookingEmailBody += 'Vehicle Name: '+ld.Intrested_In__c +' <br><br>';
            bookingEmailBody += '<br>Thanks';
            System.debug('## bookingEmailBody = '+bookingEmailBody);
            // Add additional fields or formatting for Booking if needed
            if(bookingEmailBody != null){
                response = sendEmail(ld.Email, 'Test Drive Appointment Confirmation',bookingEmailBody);
            }
             return response;
        }
       
    
    
    
}