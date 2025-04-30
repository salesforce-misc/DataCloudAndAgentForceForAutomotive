public without sharing class MapController {


 
    public static Boolean isVisibleProdcmp;
    // The variables in this class need to match the prompt template inputs,
    // that may be different on each prompt template
    public class Request {
        //  @InvocableVariable(required=true)
        // public Contact myContact;
        @InvocableVariable
        public Boolean showmapComp;
    }
    
    @AuraEnabled( cacheable=true )
    public static String fetchCookieId() {
        System.debug('## User Id fetchCookieId = '+UserInfo.getUserId());
        String cookieId = '';
        List<MessagingSession> listOfMessagingSession = [SELECT Id,cookieId__c  FROM MessagingSession Where CreatedDate = Today Order By CreatedDate DESC Limit 1];
        System.debug('## listOfMessagingSession = '+listOfMessagingSession);
        if(!listOfMessagingSession.isEmpty()){
            cookieId = listOfMessagingSession[0].cookieId__c;
        }
        return cookieId;
    }
    
    
    @AuraEnabled( cacheable=true )
    public static String fetchSessionId() {
        return UserInfo.getSessionId();
    }
   
    
    @AuraEnabled( cacheable=true )
    public static User getUserDetails() {
        return [Select Id,Name From User Where Id =: UserInfo.getUserId()];
    }
    
  
    
    // Method to send an email with the product names
    @AuraEnabled
    public static void sendEmail(String emailAddress, Object productNames) {
        List<String> recipientEmails = new List<String>();
        String serializedStr=JSON.Serialize(productNames);
        List<Object> fieldList = (List<Object>)JSON.deserializeUntyped(serializedStr);
        
        OrgWideEmailAddress[] owea = [select Id from OrgWideEmailAddress where Address = 'sharma.g2@salesforce.com'];
        // Validate the email address
        if (String.isBlank(emailAddress) || !isValidEmail(emailAddress)) {
            throw new AuraHandledException('Invalid email address');
        }
        
        System.debug('productNames-->'+productNames);
        System.debug('emailAddress-->'+emailAddress);
        recipientEmails.add(emailAddress);// Set the recipient IDs (this assumes you have valid email addresses in recipientIds)
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        if ( owea.size() > 0 ) {
            email.setOrgWideEmailAddressId(owea.get(0).Id);
        }
        
        email.setToAddresses(recipientEmails);
        
        email.setSubject('Product Information'); // Set the subject of the email
        
        String searchEmailBody = 'Here are the products you requested :-\n\n';
        
    }
    
    // Helper method to validate email format
    private static Boolean isValidEmail(String email) {
        String emailPattern = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';
        Pattern p = Pattern.compile(emailPattern);
        Matcher m = p.matcher(email);
        return m.matches();
    }
    
  
   
}