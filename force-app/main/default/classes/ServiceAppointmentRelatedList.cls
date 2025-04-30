/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-29-2025
 * @last modified by  : Aman Patil
**/
public with sharing class ServiceAppointmentRelatedList {
    @AuraEnabled(cacheable=true)
    public static List<ServiceAppointment> getServiceAppointments(Id contactId) {
        try {
            return [SELECT Id, AppointmentNumber, Status, SchedStartTime, CreatedDate 
                    FROM ServiceAppointment 
                    WHERE ContactId = :contactId
                    ORDER BY AppointmentNumber DESC LIMIT 5];
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching Service Appointments: ' + e.getMessage());
        }
    }
    
    @AuraEnabled(cacheable=true)
    public static List<ServiceAppointment> getUpcomingServiceAppointments(Id contactId) {
        try {
            DateTime today = System.now();
            return [SELECT Id, AppointmentNumber, Status, SchedStartTime, CreatedDate 
                    FROM ServiceAppointment 
                    WHERE ContactId = :contactId and SchedStartTime >= :today
                    ORDER BY AppointmentNumber ASC LIMIT 5];
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching Service Appointments: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<ServiceAppointment> getPreviousServiceAppointments(Id contactId) {
        try {
            DateTime today = System.now();
            return [SELECT Id, AppointmentNumber, Status, SchedStartTime, CreatedDate 
                    FROM ServiceAppointment 
                    WHERE ContactId = :contactId and SchedStartTime < :today
                    ORDER BY AppointmentNumber DESC LIMIT 5];
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching Service Appointments: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<ssot__SurveyResponse__dlm> getSurveyRecords(String ExternalId) {
        // Query Third_Party_Survey__dlm records where Email__c matches the provided email
        List<ssot__SurveyResponse__dlm> surveys = [
            SELECT ssot__Id__c, Interested_in_Outdoor_Activities__c,Interested_in_Roof_Rack__c, Rating_Value__c, Survey_Question__c,
            Survey_Weight__c,ssot__CompletionDateTime__c,ssot__SubmitterId__c
            FROM ssot__SurveyResponse__dlm
            WHERE ssot__SubmitterId__c = :ExternalId
        ];

        return surveys;
    }
    
}