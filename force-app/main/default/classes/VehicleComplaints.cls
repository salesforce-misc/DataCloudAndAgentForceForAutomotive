public class VehicleComplaints {

  @InvocableMethod(label='Get Vehicle Complaints' description='Get vehicle complaints data from API')
    public static List<VehicleComplaintInfo> getVehicleComplaints(List<VehicleParams> requests) {
           List<VehicleComplaintInfo> VehicleInfoList = new List<VehicleComplaintInfo>();
        // Initialize the static list to hold the results
        VehicleInfoList = new List<VehicleComplaintInfo>();
        
        // API URL with parameters
        String make = requests[0].make;
        String model = requests[0].model;
        String modelYear = requests[0].modelYear;
        String url = 'https://api.nhtsa.gov/complaints/complaintsByVehicle?make=' + make + '&model=' + model + '&modelYear=' + modelYear;
        
        // Create a new HttpRequest object
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);  // Set the endpoint URL
        req.setMethod('GET');  // Specify that it's a GET request
        req.setHeader('Content-Type', 'application/json');  // Set the content type to JSON

        // Send the request and capture the response
        Http http = new Http();
        HttpResponse res = http.send(req);

        // Check the response status
        if (res.getStatusCode() == 200) {
            // Parse the JSON response into the VehicleComplaintsParser class
            VehicleComplaintsParser response = (VehicleComplaintsParser) JSON.deserialize(res.getBody(), VehicleComplaintsParser.class);

            // Access and display the response data
            System.debug('Message: ' + response.message);
            System.debug('Number of Complaints: ' + response.count);


            VehicleComplaintsParser.results complaint = response.results[2];
      
             System.debug('VIN: ' + complaint.vin);
        System.debug('Date Complaint Filed: ' + complaint.dateComplaintFiled);
        System.debug('Components: ' + complaint.components);
        System.debug('Date of Incident: ' + complaint.dateOfIncident);
        System.debug('Summary: ' + complaint.summary);
        System.debug('Number of Deaths: ' + complaint.numberOfDeaths);
        System.debug('Fire: ' + complaint.fire);
        System.debug('Crash: ' + complaint.crash);
        System.debug('Number of Injuries: ' + complaint.numberOfInjuries);
        System.debug('Manufacturer: ' + complaint.manufacturer);
        System.debug('ODI Number: ' + complaint.odiNumber);

        // Create a VehicleComplaintInfo object for the 3rd complaint and add it to the VehicleInfoList
        VehicleInfoList.add(new VehicleComplaintInfo(
            complaint.vin, 
            complaint.dateComplaintFiled, 
            complaint.components, 
            complaint.dateOfIncident, 
            complaint.summary, 
            complaint.numberOfDeaths, 
            complaint.fire, 
            complaint.crash, 
            complaint.numberOfInjuries, 
            complaint.manufacturer, 
            complaint.odiNumber
        ));

        } else {
            // Handle the error case if the status code is not 200
            System.debug('Error: ' + res.getStatusCode() + ' - ' + res.getStatus());
        }
        return VehicleInfoList;
    }
    
    public class VehicleParams {
        @InvocableVariable(label='Make' description='Vehicle make')
        public String make;

        @InvocableVariable(label='Model' description='Vehicle model')
        public String model;

        @InvocableVariable(label='ModelYear' description='Vehicle model year')
        public String modelYear;
        
        @InvocableVariable(label='Name Of car' description='Name of the car')
        public String carName;
    }
    
    public class VehicleComplaintInfo {
        
        @InvocableVariable()
        public String vin;
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
        public Boolean fire;
        @InvocableVariable()
        public Boolean crash;
        @InvocableVariable()
        public Integer numberOfInjuries;
        @InvocableVariable()
        public String manufacturer;
        @InvocableVariable()
        public Integer odiNumber;

        public VehicleComplaintInfo(String vin, String dateComplaintFiled, String components, String dateOfIncident, String summary, Integer numberOfDeaths, Boolean fire, Boolean crash, Integer numberOfInjuries, String manufacturer, Integer odiNumber) {
            this.vin = vin;
            this.dateComplaintFiled = dateComplaintFiled;
            this.components = components;
            this.dateOfIncident = dateOfIncident;
            this.summary = summary;
            this.numberOfDeaths = numberOfDeaths;
            this.fire = fire;
            this.crash = crash;
            this.numberOfInjuries = numberOfInjuries;
            this.manufacturer = manufacturer;
            this.odiNumber = odiNumber;
        }
    }
}