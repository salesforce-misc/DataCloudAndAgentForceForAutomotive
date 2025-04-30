import { LightningElement,api,wire } from 'lwc';
import getUpcomingServiceAppointments from '@salesforce/apex/ServiceAppointmentRelatedList.getUpcomingServiceAppointments';
import getPreviousServiceAppointments from '@salesforce/apex/ServiceAppointmentRelatedList.getPreviousServiceAppointments';
import SERVICE_APPOINTMENT_OBJECT from '@salesforce/schema/ServiceAppointment';
import {getObjectInfo} from 'lightning/uiObjectInfoApi';

const COLUMNS = [
    { label: 'Appointment No.', fieldName: 'appointmentUrl', type:'url', typeAttributes: { label: { fieldName: 'AppointmentNumber' }, target: '_blank' }, sortable: false, hideDefaultActions: true},
    { label: 'Date', fieldName: 'SchedStartTime', type: 'date', sortable: false, hideDefaultActions: true},
    { label: 'Status', fieldName: 'Status', sortable: false, hideDefaultActions: true}    
];
export default class LwcServiceAppointmentRelatedLists extends LightningElement {
    @api recordId; // This will hold the Contact recordId
    upcomingServiceAppointments;
    previousServiceAppointments
    error;
    columns = COLUMNS;
    iconName;

    @wire(getUpcomingServiceAppointments, { contactId: '$recordId' })
    wiredUpcomingServiceAppointments({ error, data }) {
        if (data) {
            console.log('## Service Appointment data = '+JSON.stringify(data));
            data = JSON.parse(JSON.stringify(data));
            data.forEach(res => {
                //res.AppointmentNumber = res.AppointmentNumber;
                //res.AppointmentNumber =  res.Id;
                res.appointmentUrl='/lightning/r/ServiceAppointment/' + res.Id + '/view';
            });

            this.upcomingServiceAppointments = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body.message;
            this.upcomingServiceAppointments = undefined;
        }
    }

    @wire(getPreviousServiceAppointments, { contactId: '$recordId' })
    wiredPreviousServiceAppointments({ error, data }) {
        if (data) {
            console.log('## Service Appointment data = '+JSON.stringify(data));
            data = JSON.parse(JSON.stringify(data));
            data.forEach(res => {
                //res.AppointmentNumber = res.AppointmentNumber;
                //res.AppointmentNumber =  res.Id;
                res.appointmentUrl='/lightning/r/ServiceAppointment/' + res.Id + '/view';
            });

            this.previousServiceAppointments = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body.message;
            this.previousServiceAppointments = undefined;
        }
    }

    @wire(getObjectInfo, { objectApiName: SERVICE_APPOINTMENT_OBJECT })
    wiredObjectInfo({ data, error }) {
        if (data) {
            this.iconName = data.themeInfo.iconUrl;
            this.error = undefined;
        } else if (error) {
            this.error = error.body.message;
            this.serviceAppointments = undefined;
        }
    }

    /*handleGotoRelatedList(){
        console.log('## Coming inside handleGotoRelatedList'+this.recordId);
        this[NavigationMixin.Navigate]({
            type: 'standard__recordRelationshipPage',
            attributes: {
                recordId: this.recordId,
                objectApiName: 'Contact',
                relationshipApiName: 'ServiceAppointment',
                actionName: 'view'
            }
        });
    }*/
}