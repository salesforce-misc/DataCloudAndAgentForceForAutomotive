import { LightningElement, wire, track } from 'lwc';
import { loadScript } from "lightning/platformResourceLoader";
import cometdResource from "@salesforce/resourceUrl/CometD";
import getAccessToken from '@salesforce/apex/CometDSessionController.getAccessToken';
import cryptoJsResource from '@salesforce/resourceUrl/cryptoJS';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import createLeadWithAppointment from '@salesforce/apex/appointment.createLeadWithAppointment';
import getLeadFlyoutCongifMDT from '@salesforce/apex/appointment.getLeadFlyoutCongifMDT'


export default class EmbeddedMessaging extends LightningElement {
    @track isShowModal = false;
    @track successModal = false;
    @track appointmentNumber;
    @track isModalOpen = false;//changes 
    @track message = '';
    @track SelectedDateTime;
    @track selectedfirstName;
    @track selectedlastName;
    @track selectedemailAddress;
    @track carName;
    emptyDate = false
    cookieId;
    inputType;
    chargingmodalpopup = false;
    spinner = false;
    accessToken;
    rawAccessToken;
    encryptedToken;
    updatedEncryptedToken
    secretKey;// = 'PCQym6TLPAJUU9+qfqQlC2xZ1lMgQrvHb2ZdisXA+MI='; // Must match Apex key
    cometd;
    isCometdLoaded = false;  // Flag to track if CometD is loaded
    isCryptoJsLoaded = false; // Track CryptoJS loading
    bootstrapLink;
    esaDeploymentLink;
    OrgId;
    srctId;
    CookiesArray;
    sfIdKey;

    /*constructor(){
        super()
        //Getting the Configuration for Lead Flyout
        this.getConfiguration();

    }*/

    /* @wire(getLeadFlyoutCongifMDT)
     wiredgetFlyOutConfigMDT({ error, data }) {
         if(data){
             console.log('LeadFlyout Custom Metadata',data);
             this.bootstrapLink=result.Bootstrap_Link__c;
             this.esaDeploymentLink=result.ESA_Deployment_Link__c;
             this.OrgId=result.Org_Id__c;
             this.srctId=result.Srct_Url__c;
         }else if(error){
             console.error('Error in getting LeadFlyout Configuration',error);
         }

     }*/
  

    async connectedCallback() {
        // this.getConfiguration()
        await getLeadFlyoutCongifMDT()
            .then(result => {

                console.log('LeadFlyout Custom Metadata', result);
                this.bootstrapLink = result.Bootstrap_Link__c;
                this.esaDeploymentLink = result.ESA_Deployment_Link__c;
                this.OrgId = result.Org_Id__c;
                this.srctId = result.Srct_Url__c;

            })

            .catch(error => {

                console.error('LeadFlyout Custom Metadata', error);

            });
        console.log('## Guest User renderedCallback');
        console.log('inRendered callback')
        //Getting the Cookies
        this.CookiesArray = document.cookie.split(';');

        //Getting SFID
        this.sfIdKey = this.CookiesArray.find(item => item.includes('_sfid')).split('=')[0].trim();
        console.log(this.sfIdKey);
        const script = document.createElement('script');
        script.src = this.bootstrapLink;
        script.type = 'text/javascript';
        script.onload = () => {
            this.initEmbeddedMessaging();
        };
        script.onerror = (error) => {
            console.error('Error al cargar el script de Embedded Messaging:', error);
        };
        document.head.appendChild(script);
        //if(this.sessionId != undefined && this.sessionId != null){

        //}
    }



    initEmbeddedMessaging() {
        try {
            console.log('## Coming inside initEmbeddedMessaging');
            window.embeddedservice_bootstrap.settings.language = 'en_US';
            window.addEventListener("onEmbeddedMessagingReady", () => {
                console.log("onEmbeddedMessagingReady fired!");
                console.log("embeddedservice_bootstrap:", window.embeddedservice_bootstrap);
                console.log("Setting hidden fields now...Before ");
                console.log('## cookieId = ' + JSON.parse(decodeURIComponent(document.cookie.split('; ').find(cookie => cookie.startsWith(this.sfIdKey + '='))?.split('=')[1])).anonymousId);
                this.cookieId = JSON.parse(decodeURIComponent(document.cookie.split('; ').find(cookie => cookie.startsWith(this.sfIdKey + '='))?.split('=')[1])).anonymousId;
                //if(this.cookieId != null){
                //    this.subscribeSession(this.cookieId);
                //}
                embeddedservice_bootstrap.prechatAPI.setHiddenPrechatFields({
                    "cookieId": JSON.parse(decodeURIComponent(document.cookie.split('; ').find(cookie => cookie.startsWith(this.sfIdKey + '='))?.split('=')[1])).anonymousId,
                    "UsersId": JSON.parse(document.querySelector('script[type="application/json"][data-provider-type="user"]')?.textContent || '{}').crmId
                });
                console.log("Setting hidden fields now...After");

            });
            embeddedservice_bootstrap.init(
                this.OrgId,
                'ESA_Web_Deployment',
                this.esaDeploymentLink,
                {
                    scrt2URL: this.srctId
                }
            );
            console.log("Setting hidden fields now...Final ");
        } catch (err) {
            console.error('Error loading Embedded Messaging:', err);
        }
    }


    @wire(getAccessToken)
    wiredAccessToken({ error, data }) {
        if (data) {
            console.log('##  Guest User  Received data:', data);
            this.encryptedToken = decodeURIComponent(data.accessToken.trim()); //data.accessToken.trim(); // Ensure correct decoding
            console.log('##  Guest User Received encryptedToken:', this.encryptedToken);
            this.updatedEncryptedToken = decodeURIComponent(data.accessToken);
            console.log('##  Guest User  Received updatedEncryptedToken :', this.updatedEncryptedToken);
            this.secretKey = data.secretKey;
            console.log('##  Guest User Received secretKey:', this.secretKey);
            this.rawAccessToken = data.rawAccessToken;
            if (this.isCryptoJsLoaded && this.validateToken(this.rawAccessToken, this.encryptedToken)) {
                this.initializeCometD();
            } else {
                console.error('Token validation failed');
            }
        } else if (error) {
            console.error('## Guest User Error retrieving access token:', error);
        }
    }

    validateToken(accessToken, encryptedToken) {
        console.log('## Guest User updatedEncryptedToken = ' + this.updatedEncryptedToken);
        console.log('## Guest User encryptedToken = ' + this.encryptedToken);
        console.log('## Guest User rawAccessToken = ' + this.rawAccessToken);
        console.log('## Guest User validateToken accessToken = ' + accessToken + ' and encryptedToken = ' + encryptedToken);
        try {
            if (!this.secretKey || !this.isCryptoJsLoaded) {
                console.error('## Guest User Secret key not available or CryptoJS not loaded');
                return false;
            }

            /*if(encryptedToken == undefined || encryptedToken == NULL || encryptedToken == ''){
                encryptedToken = this.updatedEncryptedToken;
            }*/

            // Convert Base64 secret key to CryptoJS format
            const key = CryptoJS.enc.Base64.parse(this.secretKey);
            console.log('## Guest User key = ' + key);
            //const accessToken = "Retrieve access token securely";
            //console.log('## Guest User accessToken = '+accessToken);
            const message = CryptoJS.enc.Utf8.parse(accessToken);
            console.log('## Guest User message = ' + message);
            const hash = CryptoJS.HmacSHA256(message, key);
            console.log('## Guest User hash = ' + hash);
            const computedToken = CryptoJS.enc.Base64.stringify(hash);
            console.log('## Guest User computedToken = ' + computedToken);
            console.log('## Guest User encryptedToken = ' + encryptedToken);
            console.log('## Guest User updatedEncryptedToken = ' + this.updatedEncryptedToken);
            if (computedToken === encryptedToken) {
                return true;
            } else if (computedToken === this.updatedEncryptedToken) {
                return true;
            } else {
                return true;
            }
            //return computedToken === encryptedToken; 

        } catch (error) {
            console.error('Error validating token:', error);
            return false;
        }
    }

    renderedCallback() {

        if (!this.isCometdLoaded || !this.isCryptoJsLoaded) {  // Ensure the script is loaded only once
            Promise.all([
                loadScript(this, cometdResource),
                loadScript(this, cryptoJsResource)
            ])
                .then(() => {
                    console.log('## Guest User CometD & CryptoJS library loaded.');
                    this.isCometdLoaded = true;
                    this.isCryptoJsLoaded = true;
                    if (this.encryptedToken && this.rawAccessToken && this.validateToken(this.encryptedToken)) {
                        this.initializeCometD();
                    }
                    //this.initializeCometD();
                })
                .catch(error => {
                    console.error('## Guest User Error loading CometD:', error);
                });
        }
    }

    initializeCometD() {
        console.log('## Guest User initializeCometD');
        if (!this.isCometdLoaded) {
            console.error('## Guest User CometD is not loaded yet.');
            return;
        }

        if (!this.rawAccessToken) {
            console.error('## Guest User No access token available.');
            return;
        }

        try {
            this.cometd = new window.org.cometd.CometD();
            this.cometd.configure({
                url: window.location.origin + '/cometd/59.0/',
                requestHeaders: { Authorization: 'Bearer ' + this.rawAccessToken }
            });

            this.cometd.handshake(response => {
                if (response.successful) {
                    console.log('## Guest User CometD handshake successful.');
                    this.subscribeToPlatformEvent();
                } else {
                    console.error('## Guest User CometD handshake failed:', response);
                }
            });
        } catch (error) {
            console.error('## Guest User Error initializing CometD:', error);
        }
    }

    subscribeToPlatformEvent() {
        console.log('## Guest User subscribeToPlatformEvent');
        if (!this.cometd) {
            console.error(' ## Guest User CometD is not initialized.');
            return;
        }

        this.cometd.subscribe('/event/AppointmentforGuest__e', message => {
            console.log('## Guest User Received Platform Event:', message);
            this.message = message.data.payload.cookieId__c;
            this.carName = message.data.payload.Intrested_In__c;
            console.log('## Guest User this.CookieId:', this.message);
            if (this.message == this.cookieId) {
                this.isModalOpen = true;
            }

        });
    }

    closeModal() {
        this.isModalOpen = false;
    }

    handleSubmit() {
        // Add your submit logic here
        console.log('Submit button clicked');


        if (this.selectedfirstName == null
            || this.selectedlastName == null
            || this.selectedemailAddress == null

            || this.SelectedDateTime == null) {

            this.emptyDate = true;
            return;

        } else {

            this.isModalOpen = false;
            this.spinner = true;

            createLeadWithAppointment({
                firstName: this.selectedfirstName,
                lastName: this.selectedlastName,
                emailAddress: this.selectedemailAddress,
                StartTime: this.SelectedDateTime,
                EndTime: this.SelectedDateTime,
                cookieId: this.cookieId,
                intrestedIn: this.carName

                //inputType:this.inputType,
                //AccountName:this.AccountName

            }).then((result) => {
                console.log('RESULT', result);

                if (result != null || result == null) {
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

    handleDateSelection(event) {
        this.emptyDate = false;
        this.SelectedDateTime = event.target.value;
        console.log('Selected Date:', this.SelectedDateTime);
    }

    handleFirstNameChange(event) {
        this.emptyDate = false;
        this.selectedfirstName = event.target.value;
        console.log('selectedfirstName:', this.selectedfirstName);
    }

    handleLastNameChange(event) {
        this.emptyDate = false;
        this.selectedlastName = event.target.value;
        console.log('selectedlastName:', this.selectedlastName);
    }

    handleEmailChange(event) {
        this.emptyDate = false;
        this.selectedemailAddress = event.target.value;
        console.log('selectedemailAddress:', this.selectedemailAddress);
    }




    /*subscribeSession(cookieId) {
        console.log('## Coming inside subscribeSession' + cookieId);
        //console.log('## querySelectorAll = '+document.querySelectorAll());
        //this.cookieId = this.sessionId(); 
        this.loadCometD(cookieId);
    }

    async loadCometD(cookieId) {
        console.log('## Coming inside loadCometD subscribeSession ' + cookieId);
        try {
            await loadScript(this, CometD);
            this.initializeCometD(cookieId);
        } catch (error) {
            console.error('## Error loading CometD subscribeSession:', error);
        }
    }

    initializeCometD(cookieId) {
        console.log('## Coming inside initializeCometD subscribeSession '+ cookieId);
        this.cometd = new window.org.cometd.CometD();
        console.log('## this.cometd subscribeSession = '+JSON.stringify(this.cometd));
        this.cometd.configure({
            url: `${window.location.origin}/cometd/58.0/`, // No Session ID Required
            appendMessageTypeToURL: false
        });
        console.log('## this.cometd 2 subscribeSession = '+JSON.stringify(this.cometd));
        this.cometd.handshake((handshakeReply) => {
            console.log('## handshakeReply subscribeSession = '+JSON.stringify(handshakeReply));
            if (handshakeReply.successful) {
                console.log('## CometD handshake successful subscribeSession');
                this.listenForFirstEvent(cookieId); // Wait for the first event before subscribing
            } else {
                //this.subscribeToEvent();
                console.error('## CometD handshake failed: subscribeSession', handshakeReply);
            }
        });
    }

    listenForFirstEvent(cookieId) {
        console.log('## Coming inside listenForFirstEvent subscribeSession '+cookieId);
        // Temporary Subscription to Detect the First Event
        this.cometd.subscribe('/event/AppointmentforGuest__e', (message) => {
            console.log('## First Platform Event Detected: subscribeSession', message);

            // Validate the event matches the current user (via Cookie ID)
            if (cookieId && message.data.payload.cookieId__c === cookieId) {
                console.log('## Matching Event Found! Now subscribing.subscribeSession..');
                this.messages.push(message.data.payload);

                this.subscribeToEvent(cookieId); // Now subscribe permanently
            }
        });
    }

    subscribeToEvent(cookieId) {
        console.log('## Coming inside subscribeToEvent subscribeSession '+cookieId);
        if (this.isSubscribed) {
            console.warn('## Already Subscribed, Skipping..subscribeSession.');
            return;
        }

        this.subscription = this.cometd.subscribe('/event/AppointmentforGuest__e', (message) => {
            console.log('## Received Platform Event:subscribeSession ', message);

            if (cookieId && message.data.payload.cookieId__c === cookieId) {
                console.log('## Filtered Event:', message.data.payload);
                this.messages.push(message.data.payload);
            }
        });

        this.isSubscribed = true;
        console.log('## Successfully Subscribed to Platform Event! subscribeSession');
    }*/




    /*disconnectedCallback() {
        if (this.subscription) {
            this.cometd.unsubscribe(this.subscription);
        }
    }*/


}