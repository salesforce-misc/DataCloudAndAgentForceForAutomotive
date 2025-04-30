import { LightningElement, track, wire, api } from 'lwc';
import { loadScript } from "lightning/platformResourceLoader";
import CometD from "@salesforce/resourceUrl/CometD";
import fetchSessionId from '@salesforce/apex/MapController.fetchSessionId';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import createappointment from '@salesforce/apex/appointment.createappointment';

// import {LightningNotification} from 'lightning/notification';
export default class AppointmentFlyout extends LightningElement {
    @track isShowModal = false;
    @track successModal = false;
    @track SelectedDateTime;
    @track appointmentNumber;
    inputType;
    modalpopup = false;
    chargingmodalpopup = false;
    sessionId;
    AccountName;
    ContactId
    spinner = false;
    emptyDate = false;
    ServiceDate;
    hasServiceDate=false

    @track messages = [];
    cometd;
    subscription;
    cookieId;
    channelName = '/event/AppointmentforGuest__e'; // Replace with your Platform Event API Name




    handleDateSelection(event) {
        if(this.hasServiceDate){
            this.ServiceDate=event.target.value;
            this.SelectedDateTime=this.ServiceDate;
        }else{
            this.SelectedDateTime = event.target.value;
            this.emptyDate = false;
        }
        
        console.log('Selected Date:', this.SelectedDateTime);
    }

    @wire(fetchSessionId)
    wiredSessionId({ error, data }) {
        console.log('data here', data, error)
        if (data) {
            this.sessionId = data;
            this.error = undefined;
            console.log('sessionid ->' + this.sessionId);

            loadScript(this, CometD)
                .then(() => {
                    let cometDLib = new window.org.cometd.CometD();
                    cometDLib.configure({
                        url: window.location.protocol +
                            '//' + window.location.hostname
                            + '/cometd/62.0/',
                        requestHeaders: {
                            Authorization: 'OAuth ' +
                                this.sessionId
                        },
                        appendMessageTypeToURL: false,
                        logLevel: 'debug'
                    });
                    cometDLib.websocketEnabled = false;
                    var lwcThisContext = this;
                    console.log('Appointment LWC Context', lwcThisContext);
                    console.log('Appointment Comet', cometDLib);
                    cometDLib.handshake(function (status) {
                        console.log('Appointment Status is', JSON.stringify(status)
                        );
                        if (status.successful) {
                            console.log('handshake successful', status)

                            var subscrip = cometDLib.subscribe('/event/TestDriveAppoinmentFlyout__e', function (message) {
                                console.log('subscrip appoinment->' + subscrip);
                                console.log('message appoinment->' + JSON.stringify(message));




                                lwcThisContext.ContactId = message.data.payload.ContactId__c;
                                lwcThisContext.inputType = message.data.payload.InputType__c;
                                lwcThisContext.AccountName = message.data.payload.AccountName__c;
                                if(message.data.payload.ServiceDate__c!=null){
                                    lwcThisContext.hasServiceDate=true;
                                    lwcThisContext.ServiceDate = message.data.payload.ServiceDate__c;
                                }else{
                                    lwcThisContext.hasServiceDate=false;
                                }
                                
                                
                                lwcThisContext.modalpopup = true;




                                console.log('modalpopup', lwcThisContext.modalpopup);
                                console.log('ContactId', lwcThisContext.ContactId);
                                setTimeout(function () {
                                    lwcThisContext.isShowModal = true;
                                }, 10000);

                                lwcThisContext.isShowModal = false;
                            });
                            //cometDLib.unsubscribe(subsrip);
                        } else {
                            console.error(
                                'Error in handshaking:',
                                JSON.stringify(
                                    status
                                )
                            );
                        }

                    });

                });

        } else if (error) {
            console.log('Error occurred in loading script');
            console.log(JSON.stringify(error));
            this.sessionId = undefined;
        }
    }
    // hideHomeModalBox(){
    //       lwcThisContext.modalpopup= false;
    // }
    handleSubmit() {
        // Add your submit logic here
        console.log('Submit button clicked');
        console.log(this.SelectedDateTime);


        if (this.SelectedDateTime == null || this.SelectedDateTime == undefined) {
            this.emptyDate = true;
            return;

        } else {
            this.modalpopup = false;
            this.spinner = true;



            createappointment({
                contactId: this.ContactId,
                StartTime: this.SelectedDateTime,
                EndTime: this.SelectedDateTime,
                inputType: this.inputType,
                AccountName: this.AccountName


            }).then((result) => {
                console.log('RESULT', result);

                if (result != null) {
                    this.appointmentNumber = result;
                    this.spinner = false;
                }
                this.showToast('Success', 'Appointment Created Successfully', 'success');
                //this.hideHomeModalBox();
                this.successModal = true;
            }).catch(error => {
                this.spinner = false;
                console.error('Error creating appointment:', error);
                this.showToast('Error', 'Failed', 'error');
            });
        }
        console.log('Submit button clicked after');

    }


    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event)
    }


    closeModal() {
        this.modalpopup = false;
    }
    smallcloseModal() {
        this.successModal = false;
    }

}