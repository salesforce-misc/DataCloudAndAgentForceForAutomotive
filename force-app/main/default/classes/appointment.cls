/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 04-10-2025
* @last modified by  : Aman Patil
**/
public without sharing class appointment {
    @AuraEnabled
    public static String createappointment(String contactId, DateTime StartTime,DateTime EndTime,String inputType,String AccountName){
        
        try{ 
            
            if(inputType=='Break Pads Wear' && AccountName != null){
                //Get Account where Account Name equals AccountName
                Account acc = [SELECT Id, Name FROM Account WHERE Name=:AccountName LIMIT 1];
                ServiceAppointment sa;
                
                if (Schema.sObjectType.ServiceAppointment.fields.ContactId.isCreateable() ||
                    Schema.sObjectType.ServiceAppointment.fields.SchedStartTime.isCreateable() ||
                    Schema.sObjectType.ServiceAppointment.fields.SchedEndTime.isCreateable() ||
                    Schema.sObjectType.ServiceAppointment.fields.ParentRecordId.isCreateable() ||
                    Schema.sObjectType.ServiceAppointment.fields.Status.isCreateable()
                   ) {
                       
                       
                       
                       //Create a Service Appoinment where ParentId equals to accountid
                       sa = new ServiceAppointment(
                           ContactId=contactId,
                           SchedStartTime=StartTime,
                           SchedEndTime=EndTime,
                           ParentRecordId=acc.Id,
                           Status='Scheduled'
                       );
                       insert sa;
                   }
                
                
                
                CreateCase(contactId, StartTime, inputType);
                
                
                ServiceAppointment ap = [SELECT Id, AppointmentNumber FROM ServiceAppointment Where Id=:sa.Id LIMIT 1];
                system.debug('AP NUMBER'+ ap.AppointmentNumber);
                EmailHandler.setEmailForSA(ap.Id);
                return ap.AppointmentNumber;
                
                
            }else  {
                
                
                User con =[ SELECT ContactId,Contact.Name,Account_Id_Formula__c FROM User Where ContactId=:contactId LIMIT 1];
                
                List<ServiceAppointment> serApoint = new List<ServiceAppointment>();
                
                if (Schema.sObjectType.ServiceAppointment.fields.ContactId.isCreateable() ||
                    Schema.sObjectType.ServiceAppointment.fields.SchedStartTime.isCreateable() ||
                    Schema.sObjectType.ServiceAppointment.fields.SchedEndTime.isCreateable() ||
                    Schema.sObjectType.ServiceAppointment.fields.ParentRecordId.isCreateable() ||
                    Schema.sObjectType.ServiceAppointment.fields.Status.isCreateable()
                   ) {
                       ServiceAppointment newappt=new ServiceAppointment(
                           ContactId=contactId,
                           SchedStartTime=StartTime,
                           SchedEndTime=EndTime,
                           ParentRecordId = con.Account_Id_Formula__c,
                           Status='Scheduled'
                           
                       );
                       serApoint.add(newappt);
                       
                       insert serApoint;
                   }
                CreateCase(contactId, StartTime, inputType);
                
                ServiceAppointment ap = [SELECT Id, AppointmentNumber FROM ServiceAppointment Where Id=:serApoint[0].Id];
                system.debug('AP NUMBER'+ ap.AppointmentNumber);
                 EmailHandler.setEmailForSA(ap.Id);

            
        
                return ap.AppointmentNumber;
            }
            
        }catch(Exception e){
            throw new AuraHandledException('Error creating appt:'+e.getMessage());
        }
    }
    
    //Craete a Medtoda that Gets the Queue and create a case which takes parameter as a Id 
    public static void CreateCase(String contactId,DateTime StartTime,String inputType){ 
        System.debug('contactId'+contactId);
        System.debug('StartTime'+StartTime);
        System.debug('inputType'+inputType);
        //Get Queue
        Group ServiceCenterQueue= [Select 
                                   Id,DeveloperName,Type 
                                   From Group
                                   where DeveloperName = 'Service_Center_Agent' and Type='Queue' limit 1];
                                   System.debug('ServiceCenterQueue'+ServiceCenterQueue);
        
        if (Schema.sObjectType.Case.fields.OwnerId.isCreateable() ||
            Schema.sObjectType.Case.fields.Status.isCreateable() ||
            Schema.sObjectType.Case.fields.Origin.isCreateable()||
            Schema.sObjectType.Case.fields.ContactId.isCreateable()||
            Schema.sObjectType.Case.fields.Subject.isCreateable()
           ) {
            System.debug('inside Create Case');
               
               //Create a Case Record
               Case cs = new Case(
                   OwnerId=ServiceCenterQueue.Id,
                   Status='New',
                   Origin='Web',
                   ContactId=contactId, 
                   Subject=inputType + StartTime.format('MM-dd-yyyy h:mm a')
               );
               insert cs;
               System.debug('inside Create Case'+cs);
           }
           System.debug('outside Create Case');
        
        
    }
    
    @AuraEnabled
    public static String createLeadWithAppointment(String firstName, String lastName, String emailAddress, DateTime StartTime, DateTime EndTime, String cookieId, String intrestedIn){
        System.debug('## firstName = '+firstName);
        System.debug('## lastName = '+lastName);
        System.debug('## emailAddress = '+emailAddress);
        System.debug('## StartTime = '+StartTime);
        System.debug('## EndTime = '+EndTime);
        System.debug('## cookieId = '+cookieId);
        try{
            Lead lead;
            ServiceAppointment serviceAppointment;
            if (Schema.sObjectType.Lead.fields.FirstName.isCreateable() ||
                Schema.sObjectType.Lead.fields.LastName.isCreateable() ||
                Schema.sObjectType.Lead.fields.Email.isCreateable()||
                Schema.sObjectType.Lead.fields.Intrested_In__c.isCreateable()||
                Schema.sObjectType.Lead.fields.CookieId__c.isCreateable()
               ) {
                   
                    lead = new Lead(FirstName= firstName,
                                        LastName= lastName,
                                        Email= emailAddress,
                                        Intrested_In__c= intrestedIn,
                                        CookieId__c= cookieId);
                   
                   insert lead;
               }
           
             if (Schema.sObjectType.ServiceAppointment.fields.SchedStartTime.isCreateable() ||
                    Schema.sObjectType.ServiceAppointment.fields.SchedEndTime.isCreateable() ||
                    Schema.sObjectType.ServiceAppointment.fields.ParentRecordId.isCreateable() ||
                    Schema.sObjectType.ServiceAppointment.fields.Status.isCreateable()
                   ) {
                       
                serviceAppointment =new ServiceAppointment(
                SchedStartTime=StartTime,
                SchedEndTime=EndTime,
                ParentRecordId = lead.Id,
                Status='Scheduled');
            
            insert serviceAppointment;
                   }
            System.debug('## serviceAppointment = '+serviceAppointment);
            System.debug('## serviceAppointment Id = '+serviceAppointment.Id);
            //System.debug('## serviceAppointment serviceAppointment = '+serviceAppointment.AppointmentNumber);
            ServiceAppointment ap = [SELECT Id, AppointmentNumber FROM ServiceAppointment Where Id=:serviceAppointment.Id];
            system.debug('AP NUMBER'+ ap.AppointmentNumber);
            //Lead ld=[Select id,Email from Lead where id=:lead.Id];
            EmailHandler.setEmailForBooking(ap.Id);
            
            return ap.AppointmentNumber;
        }catch(Exception e){
            throw new AuraHandledException('Error creating appt:'+e.getMessage());
        }
    }
    @AuraEnabled
    public static LeadFlyoutConfig__mdt getLeadFlyoutCongifMDT(){
        LeadFlyoutConfig__mdt lFConfig = [SELECT Bootstrap_Link__c, ESA_Deployment_Link__c, Org_Id__c ,Srct_Url__c FROM LeadFlyoutConfig__mdt LIMIT 1];
        if(lFConfig != null){
            return lFConfig;
        }
        return null;
    
    }
}