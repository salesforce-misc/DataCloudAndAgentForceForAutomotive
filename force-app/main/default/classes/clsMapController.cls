public class clsMapController {
    
     // Method to calculate distance and estimated travel time
    @InvocableMethod(label='Calculate Distance and Time' description='Calculate the distance and travel time between two locations')
    public static void calculateDistanceAndTime(List<Request> requests) {
        Request input = requests[0];
        String inType = input.inputType;
        
        if(inType=='Home'){
      
            HomeMapFlyOut__e  hmf = New HomeMapFlyOut__e();
            hmf.InputType__c='Home';
            hmf.CurrentLat__c=input.currentLat;
            hmf.CurrentLongi__c=input.currentLong;
            hmf.HomeLat__c=String.valueOf(input.homeLat);
            hmf.HomeLongi__c=String.valueOf(input.homeLong);
                
            EventBus.publish(hmf);
            
        }else if(inType=='Charging'){
            
            HomeMapFlyOut__e  hmf = New HomeMapFlyOut__e();
            hmf.InputType__c='Charging';
            hmf.CurrentLat__c=input.currentLat;
            hmf.CurrentLongi__c=input.currentLong;
            hmf.HomeLat__c=String.valueOf(input.homeLat);
            hmf.HomeLongi__c=String.valueOf(input.homeLong);
                
            EventBus.publish(hmf);
            
        }else if(inType=='Maintainance'){
            
             HomeMapFlyOut__e  hmf = New HomeMapFlyOut__e();
            hmf.InputType__c='Maintainance';
            hmf.CurrentLat__c=input.currentLat;
            hmf.CurrentLongi__c=input.currentLong;
            hmf.HomeLat__c=String.valueOf(input.homeLat);
            hmf.HomeLongi__c=String.valueOf(input.homeLong);
            hmf.AdditionalLatitude__c=String.valueOf(input.AdditionalLat);
            hmf.AdditionalLongitude__c=String.valueOf(input.AdditionalLong);
                
            EventBus.publish(hmf);
        }
        
        

}
  public class Request {            
        @InvocableVariable(label='inputType')
        public String inputType;    
      
       @InvocableVariable(required=true description='Latitude of the current location')
        public String currentLat;
        
        @InvocableVariable(required=true description='Longitude of the current location')
        public String currentLong;
      
       @InvocableVariable(required=true description='Latitude of the home location')
        public Decimal homeLat;
        
        @InvocableVariable(required=true description='Longitude of the home location')
        public Decimal homeLong;
      
       @InvocableVariable(label='AdditionalLatitude')
        public Decimal AdditionalLat;
        
        @InvocableVariable(label='AdditionalLatitude')
        public Decimal AdditionalLong;
      
      
    }   
}