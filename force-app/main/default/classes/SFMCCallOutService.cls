public with sharing class SFMCCallOutService {
 
     @InvocableMethod(label='Call Journey API' description='Call Journey API')
    public static List<Response> callJourneyApi(List<FlowInputs> request) {
       		String EventId = request[0].EventId;
        	String ContactId = request[0].contactId;
        	String FirstName = request[0].FirstName;
        	String LastName = request[0].LastName;
            String vin = request[0].VIN;
            String Emailadress =request[0].EmailAddress;
            Double Delay = request[0].Delay;
        	
           // Integer PhoneNumber = request[0].PhoneNumber;
        system.debug('\n EventId ->'+EventId);
        if(EventId!=null){
            callSFMCEvent(EventId);
        	Response res = new Response();
            List<Response> responses = new List<Response>(); 
            res.setMessage = 'success';
           	responses.add(res);
            return responses;} 
        else{
          	String CopilotResponse = callMaintenanceStatusjourney(ContactId, Delay);
            System.debug('Copilotresponse'+CopilotResponse);
        	Response res = new Response();
            List<Response> responses = new List<Response>();
           if(CopilotResponse != null){  
            res.setMessage = CopilotResponse;
           	responses.add(res);
               System.Debug('response setmsg'+ res.setMessage);
           }
                return responses;
        }
        
    }
    
    //response class for copilot 
    public class Response {
        @InvocableVariable
        public String setMessage;
    }
    
    //wrapper class for invocable variables
    public class FlowInputs {
        @InvocableVariable public String EventId;
        @InvocableVariable public String contactId;
        @InvocableVariable public String FirstName;
        @InvocableVariable public String LastName;
        @InvocableVariable public String VIN;
        @InvocableVariable public String EmailAddress;
        @InvocableVariable public Double Delay;
        @InvocableVariable public Integer PhoneNumber;
    }
    
    //Token generation callout
    public static String SFMCtokenGeneraion(){
        SFMC_API_Event__mdt ups = SFMC_API_Event__mdt.getInstance('AutomotiveJourneyAPI');// Use Custom setting to store your data & Credential
        String clientId = ups.ClientId__c;
        String clientSecret = ups.ClientSecret__c;
        String accountID = ups.accountID__c;
       	String eventKey = ups.eventKey__c;
        String authURL = ups.AuthenticationBaseURI__c;
        String restBaseURL = ups.restBaseURL__c;
        System.debug('SFMC API Details ->'+ups);
        System.debug('SFMC clientId Details ->'+clientId);
        System.debug('SFMC clientSecret Details ->'+clientSecret);
        System.debug('SFMC accountID Details ->'+accountID);
        System.debug('SFMC eventKey Details ->'+eventKey);
        System.debug('SFMC authURL Details ->'+authURL);
        System.debug('SFMC restBaseURL Details ->'+restBaseURL);

        String jsonBody = GetAccessTokenJsonBody(clientId, clientSecret,accountID,eventKey).getAsString();
        //String authURL = ups.AuthenticationBaseURI__c;
        String accessToken;
        system.debug('jsonBody---'+jsonBody);
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(authURL);
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        req.setBody(jsonBody);

        HttpResponse res = h.send(req);
        String responseBody = res.getBody();
        system.debug('responseBody---'+responseBody);
        Map<String, Object> result = (Map<String, Object>)JSON.deserializeUntyped(responseBody);
        if(res.getStatusCode() == 200){
            accessToken = 'Bearer '+result.get('access_token').toString();
        }
        system.debug('accessToken---'+accessToken);
        return accessToken;     
    }
  
    //call from flow
    public static void callSFMCEvent(String EventId){
        String FirstName;
        String LastName;
        String Email;
        Double OdometreReading;
        String ABSstatus;
        String Airbagstatus;
        
        String AccessToken=SFMCtokenGeneraion();
        SFMC_API_Event__mdt ups = SFMC_API_Event__mdt.getInstance('AutomotiveJourneyAPI');
        String restBaseURL = ups.restBaseURL__c;
        String eventKey = ups.eventKey__c;
        
        LIST<Vehicle_Telemetric__dlm> telemtrics = [SELECT eventname__c,ABS_status__c, airbag_status__c,battery_soc_level__c, esp_status__c, odometer__c, VIN__c, timestamp__c FROM Vehicle_Telemetric__dlm WHERE eventname__c =: EventId ORDER BY timestamp__c DESC LIMIT 1];
        String vin = telemtrics[0].VIN__c;
        Integer BatteryLevel= Integer.valueOf(telemtrics[0].battery_soc_level__c);
        LIST<ssot__Vehicle__dlm> vehicle = [SELECT ssot__AssetId__c, ssot__Id__c, ssot__VehicleDefinitionId__c,
                                            ssot__VehicleIdentificationNumber__c FROM ssot__Vehicle__dlm WHERE ssot__VehicleIdentificationNumber__c =:vin];
        String Assetid= vehicle[0].ssot__AssetId__c;
        List<ssot__Asset__dlm> asset =[SELECT ssot__Id__c, ssot__VehicleId__c,ssot__PrimaryContactId__c  FROM ssot__Asset__dlm WHERE ssot__Id__c =: Assetid];
        String contactid= asset[0].ssot__PrimaryContactId__c;
        List<ssot__Individual__dlm> individual = [SELECT ssot__FirstName__c, ssot__Id__c, ssot__LastName__c FROM ssot__Individual__dlm WHERE ssot__Id__c =: contactid];
        String Individualid= individual[0].ssot__Id__c;
        List<ssot__ContactPointEmail__dlm> ConEmail = [SELECT ssot__Id__c, ssot__EmailAddress__c FROM ssot__ContactPointEmail__dlm WHERE ssot__Id__c=: Individualid];
        list<ssot__ContactPointPhone__dlm> ConPhone = [SELECT ssot__TelephoneNumber__c,ssot__FormattedE164PhoneNumber__c,ssot__CountryId__c FROM ssot__ContactPointPhone__dlm WHERE ssot__Id__c =:ContactId];
        
        //Nearest location url generation
        List<Account> nearstChargingStation = [SELECT Id,Name,BillingLatitude, BillingLongitude,Industry FROM Account WHERE Industry ='Energy'];
        system.debug('accounts '+nearstChargingStation);
        List<String> locations = new List<String>();
        for(Account acc: nearstChargingStation){
            String Loc = generateMapUrl(acc.BillingLatitude,acc.BillingLongitude);
            System.debug('URL googleMapURL->'+Loc);
            locations.add(Loc);
            //emailBody += '<a href="'+googleMapURL+'" target="_blank">'+ acc.Name+ '</a>' +'<br>';
        }
        
        //Assiging the telemtry and contact data to variables
        
        String Location1= locations[0];
        String Location2= locations[1];
        String Location3= locations[2];
        String PhoneNumber = ConPhone[0].ssot__FormattedE164PhoneNumber__c;
        FirstName=individual[0].ssot__FirstName__c;
        LastName=individual[0].ssot__LastName__c;
        Email= ConEmail[0].ssot__EmailAddress__c;
        OdometreReading = Double.valueOf(telemtrics[0].odometer__c);
        ABSstatus = telemtrics[0].abs_status__c;
        Airbagstatus = telemtrics[0].airbag_status__c;
        String CountryId= ConPhone[0].ssot__CountryId__c;
        //   
        HttpRequest req1 = new HttpRequest();
        req1.setEndpoint(restBaseURL);
        req1.setMethod('POST');  // Use 'POST' for POST requests
        req1.setHeader('Authorization', accessToken ); // Use OAuth token if required
        req1.setHeader('Content-Type', 'application/json');
        String reqBody = getRequestBodyToSendEvent(FirstName,LastName,Email,OdometreReading,ABSstatus,Airbagstatus,vin,eventKey,null,PhoneNumber,Location1,Location2,Location3,BatteryLevel,null,CountryId).getAsString();
        System.debug('\n Request Body --> '+reqBody);
        req1.setBody(reqBody);
        // Create the HTTP object
        Http http1 = new Http();
        HttpResponse res2;
        try {
            // Send the request and capture the response
            res2 = http1.send(req1);
            if (res2.getStatusCode() == 201) {
                // Success - process the response body
                String resp2Body = res2.getBody();
                System.debug('API Response: ' + resp2Body);
            } else {
                // Handle errors if the response code is not 201
                System.debug('Error: ' + res2.getStatusCode() + ' - ' + res2.getStatus());
            }
        } catch (Exception e) {
            // Handle any exceptions that occur during the HTTP request
            System.debug('Exception: ' + e.getMessage());
        }
    }
    
    //generating the google map url using account longitude and latitude
    public static String generateMapUrl(Decimal latitude, Decimal longitude) {
            // Base URL for Google Maps
            String baseUrl = 'https://www.google.com/maps?q=';
            // Construct the full URL with latitude and longitude
            String mapUrl = baseUrl + latitude + ',' + longitude;            
            return mapUrl;
        }
    
    //Callout for service maintenace status request
    public static String callMaintenanceStatusjourney(String ContactId,  Double Delay){
        String AccessToken=SFMCtokenGeneraion();
        SFMC_API_Event__mdt ups = SFMC_API_Event__mdt.getInstance('AutomotiveJourneyAPI');
        String restBaseURL = ups.restBaseURL__c;
        String eventKey = ups.eventKey__c;
        String CopilotResponse;
        
        List<ssot__ContactPointEmail__dlm> ConEmail = [SELECT ssot__EmailAddress__c FROM ssot__ContactPointEmail__dlm WHERE ssot__Id__c =:ContactId];
        String EmailAddress= ConEmail[0].ssot__EmailAddress__c;
        list<ssot__ContactPointPhone__dlm> ConPhone = [SELECT ssot__TelephoneNumber__c,ssot__FormattedE164PhoneNumber__c,ssot__CountryId__c FROM ssot__ContactPointPhone__dlm WHERE ssot__Id__c =:ContactId];
        String PhoneNumber = ConPhone[0].ssot__FormattedE164PhoneNumber__c;
        String CountryId = ConPhone[0].ssot__CountryId__c;
        List<ssot__Individual__dlm> Individual = [SELECT ssot__FirstName__c, ssot__LastName__c FROM ssot__Individual__dlm WHERE ssot__Id__c =:ContactId];
        String FirstName= Individual[0].ssot__FirstName__c;
        String LastName = Individual[0].ssot__LastName__c;
        
        HttpRequest req1 = new HttpRequest();
        req1.setEndpoint(restBaseURL);
        req1.setMethod('POST');  // Use 'POST' for POST requests
        req1.setHeader('Authorization', accessToken ); // Use OAuth token if required
        req1.setHeader('Content-Type', 'application/json');
       
        String reqBody = getRequestBodyToSendEvent(FirstName,LastName,EmailAddress,null,null,null,null,eventKey,Delay,PhoneNumber,null,null,null,null,ContactId,CountryId).getAsString();
        System.debug('\n Request Body --> '+reqBody);
       
        req1.setBody(reqBody);
       
        // Create the HTTP object
        Http http1 = new Http();
        HttpResponse res2;
       
        try {
            // Send the request and capture the response
            res2 = http1.send(req1);
            if (res2.getStatusCode() == 201) {
                // Success - process the response body
                String resp2Body = res2.getBody();
                CopilotResponse = 'The following details have been sent to the customer’s email.\n' +
                 'For your convenience, we will be providing a loaner car. As a token of our appreciation, we are offering you a Starbucks voucher. \n'+
                 'Please use the voucher code: BREW-GOODNESS50. \n' + 
                 'We hope you enjoy this gesture.';
                System.debug(CopilotResponse);
                System.debug('API Response: ' + resp2Body);
                System.debug('Copilot Response: ' + CopilotResponse);
               
            } else {
                // Handle errors if the response code is not 201
                CopilotResponse = 'error';
                System.debug('Error: ' + res2.getStatusCode() + ' - ' + res2.getStatus());
            }
        } catch (Exception e) {
            // Handle any exceptions that occur during the HTTP request
            System.debug('Exception: ' + e.getMessage());
        }
        return CopilotResponse;  
    }
    //
    
    public static JSONGenerator GetAccessTokenJsonBody(String clientID, String clientSecret,String accountID, String eventKey){
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField('grant_type', 'client_credentials');
        gen.writeStringField('client_id', clientID);
        gen.writeStringField('client_secret', clientSecret);
        gen.writeStringField('account_id', accountID);
        gen.writeEndObject();
        return gen;
    }
    
     public static JSONGenerator getRequestBodyToSendEvent(String FirstName, String LastName, String Email,Double OdometreReading,String ABSstatus,
                        String Airbagstatus,String vin, String Eventkey, Double Delay,String PhoneNumber,String Location1, String Location2, 
                        String Location3,Integer BatteryLevel,String ContactId,String CountryId)
         
     {
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
	
         if(Delay != null){
                gen.writeStringField('ContactKey', ContactId);}
        if(vin !=null) {
                gen.writeStringField('ContactKey', vin);}
        if(eventKey!=null){
                gen.writeStringField('EventDefinitionKey',eventKey);}      
                gen.writeFieldName('Data');
                gen.writeStartObject();
        if(vin!=null){
                gen.writeStringField('SubscriberKey',vin);}
        
         if(vin!=null){
                gen.writeStringField('vin',vin);}
        if(Email!=null){
                gen.writeStringField('EmailAddress', Email);}
        if(FirstName!=null){
                gen.writeStringField('FirstName', FirstName);}
        if(LastName!=null){
                gen.writeStringField('LastName', LastName);}
        if(ABSstatus!=null){
                gen.writeStringField('ABSstatus', ABSstatus);}
        if(Airbagstatus!=null){
                gen.writeStringField('Airbagstatus', Airbagstatus);}
        if(odometreReading!=null){
                gen.writeNumberField('OdometreReading', odometreReading);
        System.debug('odometre reading passed to body'+ odometreReading);
        }
        if(Delay!=null){
            gen.writeStringField('SubscriberKey', ContactId);
            gen.writeNumberField('Delay', Delay);}
         if(BatteryLevel!=null){
                gen.writeNumberField('BatteryLevel', BatteryLevel);}
        if(PhoneNumber!=null){
           gen.writeStringField('PhoneNumber', PhoneNumber);}
        // if(CountryId!=null){
         //  gen.writeStringField('CountryId', CountryId);}
         if(Location1!=null){gen.writeStringField('Location1', Location1);}
         if(Location2!=null){gen.writeStringField('Location2', Location2);}
         if(Location3!=null){gen.writeStringField('Location3', Location3);}
         gen.writeStringField('LOCALE', 'US');
                gen.writeEndObject();
                gen.writeEndObject();
               
                //system.debug('responseBody---'+gen.getAsString());
                return gen;
    }

}