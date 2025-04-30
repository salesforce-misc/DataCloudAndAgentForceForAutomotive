public with sharing class CometDSessionController {
    
    @AuraEnabled(cacheable=true)
    public static Map<String, String> getAccessToken() {
        Map<String, String> responseMap = new Map<String, String>();
        try {
            Secret_Key__mdt secretKetRecord = [Select Client_Id__c,Client_Secret__c from Secret_Key__mdt Where MasterLabel = 'HMAC_Secret' Limit 1];
            String secreyKey = getSecretKey();
            HttpRequest req = new HttpRequest();
            req.setEndpoint('callout:GuestCometD/services/oauth2/token');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
            req.setBody('grant_type=client_credentials'+ '&client_id='+secretKetRecord.Client_Id__c + '&client_secret='+secretKetRecord.Client_Secret__c);

            Http http = new Http();
            HttpResponse res = http.send(req);  
            System.debug('## res.getStatusCode = '+res.getStatusCode());
            if (res.getStatusCode() == 200) {
                Map<String, Object> jsonResponse = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                System.debug('## jsonResponse = '+jsonResponse);
                String accessToken = (String) jsonResponse.get('access_token');
                System.debug('## accessToken = '+accessToken);
                // Encrypt the token using HMAC-SHA256
                String encryptedToken = encryptHMAC(accessToken,secreyKey);
                responseMap.put('accessToken', encryptedToken);
                responseMap.put('rawAccessToken', accessToken);
                responseMap.put('secretKey', secreyKey);
                System.debug('## responseMap = '+responseMap);
                return responseMap;
            } else {
                System.debug('Failed to retrieve token: ' + res.getBody());
                return null;
            }
        } catch (Exception e) {
            System.debug('Error fetching access token: ' + e.getMessage());
            return null;
        }
    }
    
    private static String getSecretKey(){
        try{
            Secret_Key__mdt secretKetRecord = [Select Secret_Key__c from Secret_Key__mdt Where MasterLabel = 'HMAC_Secret' Limit 1];
            return secretKetRecord.Secret_Key__c;
        }catch (Exception e) {
            System.debug('Error fetching access token: ' + e.getMessage());
            return null;
        }
    }
    
    private static String encryptHMAC(String data, String secreyKey) {
        Blob key = EncodingUtil.base64Decode(secreyKey);
        Blob message = Blob.valueOf(data);
        Blob encryptedBlob = Crypto.generateMac('HMACSHA256', message, key);
        return EncodingUtil.urlEncode(EncodingUtil.base64Encode(encryptedBlob), 'UTF-8');
    }
}