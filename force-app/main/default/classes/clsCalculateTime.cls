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
    
    
    /**
public static Map<String, Decimal> getCurrentLocation() {
String apiUrl = 'https://api.ipgeolocation.io/ipgeo?apiKey=27c72edcfcf645bbad98c5140fd125f6';
HttpRequest req = new HttpRequest();
req.setEndpoint(apiUrl);
req.setMethod('GET');

Http http = new Http();
HttpResponse res = http.send(req);

if (res.getStatusCode() == 200) {
// Parse the response JSON
Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
Decimal latitude = Decimal.valueOf(responseMap.get('latitude').toString());
Decimal longitude = Decimal.valueOf(responseMap.get('longitude').toString());
System.debug(responseMap);
System.debug(latitude);
System.debug(longitude);
// Return latitude and longitude as a map
Map<String, Decimal> location = new Map<String, Decimal>();
location.put('latitude', latitude);
location.put('longitude', longitude);
return location;

}
return null;


}
@InvocableMethod(
label='Calculate Time'
description='This method will get the latitude and longitude of teh current vehicle/device to calucalte the hours'
)
public static List<TimeTravelResponse> caculateTime(List<ContactIds> requests){

String Con = (String) requests[0].con;
//Get The Contact Home GeoLocation
Contact cn=[SELECT MailingLatitude, MailingLongitude
FROM Contact where id=:Con];

//Get the User's Current Location
Map<String,Decimal> currentLatLongi= clsCalculateTime.getCurrentLocation();
Decimal currentLat;
Decimal currentLon;

for (String key : currentLatLongi.keySet()) {
if (key == 'latitude') {
currentLat = currentLatLongi.get(key);
System.debug('Latitude: ' + currentLat);
}
if (key == 'longitude') {
currentLon = currentLatLongi.get(key);
System.debug('Longitude: ' + currentLon);
}
}

System.debug('Current Location Latitude-->'+currentLat);
System.debug('Current Location Longitude-->'+currentLon);

System.debug('Current Location Latitude-->'+cn.MailingLatitude);
System.debug('Current Location Longitude-->'+cn.MailingLongitude);

//Google API to calculate the distance
Location loc1 = Location.newInstance(currentLat,currentLon);
Location loc2 = Location.newInstance(cn.MailingLatitude,cn.MailingLongitude);
Double dist = Location.getDistance(loc1, loc2, 'km');
System.debug(dist);

TimeTravelResponse response = new TimeTravelResponse();

response.distanceToTravel = dist;

response.timetakenDescription ='Distance To Travel is ' + dist ;

return new List<TimeTravelResponse>{ response };



}

public class ContactIds {
@InvocableVariable(
required=true
description='Current Users Contact Id'
)
public string con;
}

public class TimeTravelResponse {

@InvocableVariable(
description='Distance to travel '
)
public Decimal distanceToTravel;

@InvocableVariable(
description='Description of the time taken to travel'
)
public String timetakenDescription;
}
**/
    
}