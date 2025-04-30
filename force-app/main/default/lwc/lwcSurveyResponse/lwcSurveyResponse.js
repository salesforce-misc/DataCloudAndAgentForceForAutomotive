import { LightningElement, api, wire } from 'lwc';
import { getRecord } from "lightning/uiRecordApi";
import getSurveyRecords from "@salesforce/apex/ServiceAppointmentRelatedList.getSurveyRecords";
const FIELDS = ["Contact.Ext_Id__c"];
const columns = [
   
    { label: 'Id', fieldName: 'ssot__SubmitterId__c',sortable: "false" },
    { label: 'Question', fieldName: 'Survey_Question__c',sortable: "false"},
    { label: 'Rating', fieldName: 'Rating_Value__c',sortable: "false"},
    { label: 'Intrested in OutDoor', fieldName: 'Interested_in_Outdoor_Activities__c',sortable: "false"},
    { label: 'Intrested in Roof Rack', fieldName: 'Interested_in_Roof_Rack__c',sortable: "false"},
    { label: 'Completion Date', fieldName: 'ssot__CompletionDateTime__c',sortable: "false"}
];

export default class LwcSurveyResponse extends LightningElement {
    @api recordId;
    ExternalId;
    surveys;
    columns = columns;
    itemNumber;
    defaultSortDirection = 'asc';
    sortedBy;
    sortDirection = 'asc';

    @wire(getRecord, { recordId: "$recordId",fields: FIELDS})
    wiredContact({ data, error }) { // Destructure the result
        if (data) {
            console.log('here came')
            console.log('Third party survey', data)
            this.ExternalId = data.fields.Ext_Id__c.value;
            this.error = undefined; // Clear previous errors
        } else if (error) {
            console.log(error)
            console.log('here came',error)
            this.error = error;
            this.contactData = undefined; // Clear previous data
        }
    }

    @wire(getSurveyRecords, { ExternalId: '$ExternalId' })
    wiredSurveyTransationData({ error, data }) {
        if (data) {
            console.log('data is ', data)
            // Extracting data from the response
            this.surveys = data;
            this.itemNumber = data.length

        } else if (error) {
            console.log('Error is')
            this.error = error.body.message;
            this.surveys = undefined;
            this.itemNumber = 0;
        } else {
            this.itemNumber = 0;
            console.log(' Nothing here',this.ExternalId)
        }
    }
}