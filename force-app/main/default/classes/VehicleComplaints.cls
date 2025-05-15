public class VehicleComplaints {
    
    @InvocableMethod(label='Get Vehicle Complaints' description='Get vehicle complaints data from API')
    public static List<DataWrapper> getVehicleComplaints(List<VehicleParams> requests) {
        
        List<DataWrapper> VehicleInfoList = new List<DataWrapper>();
        
        // Initialize the static list to hold the results
        VehicleInfoList = new List<DataWrapper>(); 
        
        //String url = 'https://vehicleissueapi-vn36iz.5sc6y6-1.usa-e2.cloudhub.io/Vehicle_Issue_API';
        String url = System.Label.VehicleIssueMuleApi;
        
        // Create a new HttpRequest object
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);  // Set the endpoint URL
        req.setMethod('GET');  // Specify that it's a GET request
        req.setHeader('Content-Type', 'application/json');  // Set the content type to JSON
        
        // Send the request and capture the response
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        System.debug('## Status Code = '+res.getStatusCode());
        System.debug('## Body = '+res.getBody());
        if(res.getStatusCode() == 200){
            vehicleIssueResponse parsedResponse = (vehicleIssueResponse) JSON.deserialize(res.getBody(), vehicleIssueResponse.class);
            System.debug('## parsedResponse = '+parsedResponse);    
            DataWrapper complaint = parsedResponse.data[1];
            
            VehicleInfoList.add(new DataWrapper(
                complaint.dateComplaintFiled, 
                complaint.components, 
                complaint.dateOfIncident, 
                complaint.summary, 
                complaint.numberOfDeaths, 
                complaint.fire, 
                complaint.crash, 
                complaint.numberOfInjuries, 
                complaint.odi_number
            ));
            
        }
        
        
        else {
            // Handle the error case if the status code is not 200
            System.debug('Error: ' + res.getStatusCode() + ' - ' + res.getStatus());
        }
        return VehicleInfoList;
    }
    
    public class VehicleParams {
        
        @InvocableVariable(label='Name Of car' description='Name of the car')
        public String carName;
    }
    
    
    public class vehicleIssueResponse{
        public List<DataWrapper> data{get;set;}
    }
    public class DataWrapper {
        
        @InvocableVariable()   
        public String dateComplaintFiled;
        @InvocableVariable()
        public String components;
        @InvocableVariable()
        public String dateOfIncident;
        @InvocableVariable()
        public String summary;
        @InvocableVariable()
        public Integer numberOfDeaths;
        @InvocableVariable()
        public String fire;
        @InvocableVariable()
        public String crash;
        @InvocableVariable()
        public Integer numberOfInjuries;
        @InvocableVariable()
        public String odi_number;
        
        public DataWrapper( String dateComplaintFiled, String components, String dateOfIncident, String summary, Integer numberOfDeaths, String fire,
                           String crash, Integer numberOfInjuries, String odi_number) {
                               
                               this.dateComplaintFiled = dateComplaintFiled;
                               this.components = components;
                               this.dateOfIncident = dateOfIncident;
                               this.summary = summary;
                               this.numberOfDeaths = numberOfDeaths;
                               this.fire = fire;
                               this.crash = crash;
                               this.numberOfInjuries = numberOfInjuries;
                               this.odi_number = odi_number;
                           }
        
    }   
    
    
}