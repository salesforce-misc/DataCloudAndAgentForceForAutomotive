public class VehicleComplaintsParser {
    public String message{get;set;}
		public list<results> results{get;set;}
		public Integer count{get;set;}
	public class results{
		public String vin{get;set;}
		public String dateComplaintFiled{get;set;}
		public String components{get;set;}
		public String dateOfIncident{get;set;}
		public String summary{get;set;}
		public Integer numberOfDeaths{get;set;}
		public Boolean fire{get;set;}
		public Boolean crash{get;set;}
		public Integer numberOfInjuries{get;set;}
		public String manufacturer{get;set;}
		public list<products> products{get;set;}
		public Integer odiNumber{get;set;}
	}
	public class products{
		public String type{get;set;}
		public String productMake{get;set;}
		public String productModel{get;set;}
		public String productYear{get;set;}
		public String manufacturer{get;set;}
	}
}