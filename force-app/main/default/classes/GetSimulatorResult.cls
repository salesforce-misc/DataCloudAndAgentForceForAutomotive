public with sharing class GetSimulatorResult {

    @InvocableMethod(label='Get Simulator Result')
    public static List<Response> getSimulatorResponse(List<Request> requests) {
        System.debug('## requests = '+requests);
        Boolean simulatorResponse = false;
        List<Response> responses = new List<Response>();
        Response res = new Response();
        if(requests != null && !requests.isEmpty() && requests[0].contactId != null){
            simulatorResponse = getResponse();
        }
        res.Prompt = simulatorResponse;
        responses.add(res);
        return responses;
		        
    }
    
    @TestVisible
    public static Boolean getResponse(){
        Boolean queryOutput = false;
        try {
            String endpoint = 'https://jsonplaceholder.typicode.com/todos/12';
            HttpRequest req = new HttpRequest();
            req.setEndpoint(endpoint);
            req.setMethod('GET');
            System.debug('Endpoint ' + endpoint);
            
            Http http = new Http();
            HttpResponse res = http.send(req);
            System.debug('## Response Body = '+res.getBody());
            if (res.getStatusCode() == 200) {
                // Return the response body
                if(res.getBody() != null){
                   map<String, Object> data = (Map<String, Object>) JSON.deserializeUntyped(res.getBody()); 
                    if(data.get('completed') == true){
                        queryOutput = true;
                    }else{
                        queryOutput = false;
                    }
                    
                }
                
            } else {
                // Handle non-200 status codes
                throw new AuraHandledException('Error occurred while querying profile data123 ' + endpoint);
            }
        }catch (Exception e) {
            // Handle any exceptions that occur during the HTTP request
            throw new AuraHandledException('Error while fetching profile data graph' + ' - ' + e.getMessage());
        }
        return queryOutput;
    }
    
    
    public class Request {            
        @InvocableVariable(label='Contact')
        public String contactId;      
    }
    
    public class Response {
        @InvocableVariable
        public Boolean Prompt;
    }
}