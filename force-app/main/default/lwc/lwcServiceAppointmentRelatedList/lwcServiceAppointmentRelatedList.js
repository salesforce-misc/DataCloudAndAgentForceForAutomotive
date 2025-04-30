import { LightningElement,api,wire } from 'lwc';
import getServiceAppointments from '@salesforce/apex/ServiceAppointmentRelatedList.getServiceAppointments';
import SERVICE_APPOINTMENT_OBJECT from '@salesforce/schema/ServiceAppointment';
import {getObjectInfo} from 'lightning/uiObjectInfoApi';

const COLUMNS = [
    { label: 'Appointment No.', fieldName: 'appointmentUrl', type:'url', typeAttributes: { label: { fieldName: 'AppointmentNumber' }, target: '_blank' }, hideDefaultActions: true},
    { label: 'Date', fieldName: 'SchedStartTime', type: 'date', hideDefaultActions: true },
    { label: 'Status', fieldName: 'Status', hideDefaultActions: true },
    { label: 'Created Date', fieldName: 'CreatedDate', type: 'date', hideDefaultActions: true }
];
export default class LwcServiceAppointmentRelatedList extends LightningElement {
    @api recordId; // This will hold the Contact recordId
    serviceAppointments;
    error;
    columns = COLUMNS;
    isDisplayTable = false;
    iconName;

    @wire(getServiceAppointments, { contactId: '$recordId' })
    wiredServiceAppointments({ error, data }) {
        if (data) {
            data = JSON.parse(JSON.stringify(data));
            data.forEach(res => {
                //res.AppointmentNumber = res.AppointmentNumber;
                //res.AppointmentNumber =  res.Id;
                res.appointmentUrl='/lightning/r/ServiceAppointment/' + res.Id + '/view';
            });
            this.isDisplayTable = true;
            this.serviceAppointments = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body.message;
            this.serviceAppointments = undefined;
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
}