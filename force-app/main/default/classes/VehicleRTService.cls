/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-28-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class VehicleRTService {
    private static final String API_VERSION = 'v61.0';
    @AuraEnabled(cacheable=true)
    public static String fetch(String recordId, String dataGraphName) {
        /*List<MessagingSession> listMessagingSession = [SELECT cookieId__c  FROM MessagingSession Where CreatedDate = Today Order By CreatedDate DESC Limit 1];
        if(!listMessagingSession.isEmpty()){
            recordId = listMessagingSession[0].cookieId__c;
        }*/
        String rawBody;
        String endpoint = String.format(
            'callout:DataCloudNew/services/data/{0}/ssot/data-graphs/data/{1}',
            new String[]{ API_VERSION, dataGraphName }
        );
        
        String lookupKeys = 'UnifiedLinkssotIndividualReal__dlm.SourceRecordId__c=' + recordId;
        System.debug('## Final Endpoint = '+endpoint + '?lookupKeys=' + EncodingUtil.urlEncode(lookupKeys, 'UTF-8'));
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint + '?lookupKeys=' + EncodingUtil.urlEncode(lookupKeys, 'UTF-8'));
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        System.debug('## res = '+res);
        if (res.getStatusCode() == 200) {
             rawBody = res.getBody();
            System.debug('## rawBody = '+rawBody);
        }

        return rawBody;


    }
}