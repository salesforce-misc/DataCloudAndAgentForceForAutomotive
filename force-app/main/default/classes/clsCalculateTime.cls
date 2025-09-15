public class clsCalculateTime {
    
    
    // Method to calculate distance and estimated travel time
    @InvocableMethod(label='Calculate Distance and Time' description='Calculate the distance and travel time between two locations')
    public static List<TravelInfo> calculateDistanceAndTime(List<LocationParams> requests) {
        
        //List to hold the results 
        List<TravelInfo> travelInfoList = new List<TravelInfo>();
        
        // API URL with parameters
        String url = 'callout:Calculate_Distance/maps/api/distancematrix/json?origins='+requests[0].currentLat+','+requests[0].currentLong+'&destinations='+requests[0].homeLat+','+requests[0].homeLong+'&key='+DistanceMatrix__mdt.getInstance('Distance_Matrix').ApiKey__C;
        
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
            // Parse the JSON response into the GoogleMapsResponse class
            MatrixParser response = (MatrixParser) JSON.deserialize(res.getBody(), MatrixParser.class);

            // Access and display the response data
            System.debug('Status: ' + response.status);
            System.debug('Origin Address: ' + response.origin_addresses[0]);
            System.debug('Destination Address: ' + response.destination_addresses[0]);

            // Loop through rows and elements to print more detailed information
            for (MatrixParser.Row row : response.rows) {
                for (MatrixParser.Element element : row.elements) {
                    System.debug('Distance: ' + element.distance.text);
                    System.debug('Duration: ' + element.duration.text);
                    System.debug('Origin: ' + element.origin);
                    System.debug('Destination: ' + element.destination);
                    System.debug('Element Status: ' + element.status);
                     // Extract distance and duration
                    String distanceKm = String.valueOf(element.distance.text) ;
                    String travelTimeMinutes = String.valueOf(element.duration.text) ;

                    // Create a TravelInfo object and add to the result list
                    travelInfoList.add(new TravelInfo(distanceKm, travelTimeMinutes));
                }
            }
           
        } else {
            // Handle the error case if the status code is not 200
            System.debug('Error: ' + res.getStatusCode() + ' - ' + res.getStatus());
        }
        return travelInfoList;
    } 
    
    // Inner class to define input parameters
    public class LocationParams {
        @InvocableVariable(required=true description='Latitude of the current location')
        public String currentLat;
        
        @InvocableVariable(required=true description='Longitude of the current location')
        public String currentLong;
        
        @InvocableVariable(required=true description='Latitude of the home location')
        public Decimal homeLat;
        
        @InvocableVariable(required=true description='Longitude of the home location')
        public Decimal homeLong;
    }
    
    // Inner class to define output data
    public class TravelInfo {
        @InvocableVariable(description='Distance between the two locations in kilometers')
        public String travelDistance;
        
        @InvocableVariable(description='Estimated travel time in minutes')
        public String travelDuration;
        
        // Constructor
        public TravelInfo(String distanceKm, String travelTimeMinutes) {
            this.travelDistance = distanceKm;
            this.travelDuration = travelTimeMinutes;
        }
        
    }
}
