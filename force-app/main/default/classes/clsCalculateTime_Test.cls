@isTest
public class clsCalculateTime_Test {
	@isTest
    public static void testCalculateDistanceAndTime() {
        
        clsCalculateTime.LocationParams location = new clsCalculateTime.LocationParams();
        location.currentLat = '37.7749';
        location.currentLong = '-122.4194';
        location.homeLat = 34.0522;
        location.homeLong = -118.2437;
        
        List<clsCalculateTime.LocationParams> requests = new List<clsCalculateTime.LocationParams>{ location };
        
       
        Test.setMock(HttpCalloutMock.class, new MockHttpResponse());
        
       
        List<clsCalculateTime.TravelInfo> result = clsCalculateTime.calculateDistanceAndTime(requests);
        system.debug(result);
        System.assertNotEquals(result, null, 'Result should not be null');
        System.assertEquals(1, result.size(), 'Result size should be 1');
        System.assertEquals('559 km', result[0].travelDistance, 'Distance should match the mock response');
        System.assertEquals('6 hours 15 mins', result[0].travelDuration, 'Duration should match the mock response');
    }
    
    private class MockHttpResponse implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('{"status": "OK", "origin_addresses": ["San Francisco, CA"], "destination_addresses": ["Los Angeles, CA"], "rows": [{"elements": [{"status": "OK", "distance": {"text": "559 km"}, "duration": {"text": "6 hours 15 mins"}}]}]}');
            return res;
        }
    }
}