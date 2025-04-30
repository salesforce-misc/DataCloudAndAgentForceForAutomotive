public with sharing class ServiceClass 
{
     public static String getSessionIdFromVFPage()
     {
        //String SessionId;
         PageReference visualforcePage = Page.EPSessionIdHelper;
         String content = visualforcePage.getContent().toString();
         Integer s = content.indexOf('Start_Of_Session_Id') + 'Start_Of_Session_Id'.length(),
             e = content.indexOf('End_Of_Session_Id');
         return content.substring(s, e);
        
    }
    
    @AuraEnabled(cacheable=true)
    public static String getSegment1(ID id) {
        String contactId1 = null;
        String orgURL = System.URL.getOrgDomainUrl().toExternalForm();
        try {
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(orgURL + '/services/data/v62.0/ssot/segments/Drivers_visited_the_dealership/members?Id__c=' + id);
            req.setMethod('GET');
            if(!Test.isRunningTest()){
            req.setHeader('Authorization', 'Bearer ' + getSessionIdFromVFPage());
            }
            HttpResponse res = http.send(req);
            System.debug('Response Body 1: ' + res.getBody());

            String jsonString = res.getBody();
            if (res.getStatusCode() == 200) {
                 System.debug('StatusCode'+ res.getStatusCode());
                Map<String, Object> jsonObj = (Map<String, Object>) JSON.deserializeUntyped(jsonString);

                if (jsonObj.containsKey('data')) {
                    List<Object> dataList = (List<Object>) jsonObj.get('data');
                    for (Object itemObj : dataList) {
                        Map<String, Object> item = (Map<String, Object>) itemObj;
                        // Log each item for debugging
                        System.debug('Item: ' + item);

                        // Check if the ID matches and make sure to convert the types correctly
                        if (item.containsKey('id') && (String) item.get('id') == id) {
                            contactId1 = (String) item.get('id');
                            System.debug('Found matching contactId1: ' + contactId1);
                        }
                    }
                } else {
                    System.debug('Data field is missing in the response.');
                }
            } else {
                System.debug('The JSON string is empty.');
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }		String contactId2 = getSegment2(contactId1);
        System.debug('ContactId2 from getSegment2: ' + contactId2);
        return contactId1;
    }
    
    @AuraEnabled(cacheable=true) 
    public static String getSegment2(String id) { 
        String contactId2 = null;
        String orgURL = System.URL.getOrgDomainUrl().toExternalForm();
        try {
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(orgURL + '/services/data/v62.0/ssot/segments/Drivers_who_drove_into_the_dealers/members?Id__c=' + id);
            req.setMethod('GET');
            if(!Test.isRunningTest()){
            req.setHeader('Authorization', 'Bearer ' + getSessionIdFromVFPage());
            }
            HttpResponse res = http.send(req);
            System.debug('Response Body 2:'+ res.getBody());
            String jsonString = res.getBody();
            system.debug('jsonString'+jsonString);
            
            if (res.getStatusCode() == 200) {
                System.debug('StatusCode'+ res.getStatusCode());
                Map<String, Object> jsonObj = (Map<String, Object>) JSON.deserializeUntyped(jsonString);
                
                if (jsonObj.containsKey('data')) {
                    List<Object> dataList = (List<Object>) jsonObj.get('data');
                    for (Object itemObj : dataList) {
                        Map<String, Object> item = (Map<String, Object>) itemObj;
                        if (item.containsKey('id') && (String) item.get('id') == id) {
                            contactId2 = (String) item.get('id');
                            System.debug('Found matching contactId2: ' + contactId2);
                        }
                    }
                } else {
                    System.debug('Data field is missing in the response.');
                }
            } else {
                System.debug('The JSON string is empty.');
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }
        return contactId2;
    }   
}