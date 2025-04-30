@isTest
global class callServiceClassAPIMock implements HttpCalloutMock
{
	global HttpResponse respond (HttpRequest req)
	{
		HttpResponse res = new HttpResponse();
		res.setHeader('Content-Type', 'application/json');
        res.setStatusCode(200);
		res.setBody('{"data":[{"deltaType":"existing","id":"003Pa00000UsPTGIA3","snapshotType":"F","timestamp":"2025-02-11T11:01:41.424Z","versionStamp":"2025-02-06T06:34:55.398Z"},{"deltaType":"existing","id":"003Pa00000UsPTGIA3","snapshotType":"F","timestamp":"2025-02-11T11:01:41.424Z","versionStamp":"2025-02-06T06:34:55.398Z"}]}');
		return res;
       
	}
}