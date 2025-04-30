import { api,track,wire, LightningElement } from 'lwc';
import { loadScript } from "lightning/platformResourceLoader";
import CometD from "@salesforce/resourceUrl/CometD";
import fetchSessionId from '@salesforce/apex/MapController.fetchSessionId';

export default class LwcMapFlyOut extends LightningElement {

     
        @track isShowModal = false;
        @api userClicked=false;
        @api isVisible; 
        homemodalpopup=false;
        chargingmodalpopup=false;
        sessionId;
        currentLat;
        currentLong;
        homeLat;
        homeLong;
        inputType;
    
        connectedCallback() {
            console.log('## Page URL List = '+window.location.href);
          }
        
        @wire( fetchSessionId )
        wiredSessionId( { error, data } ) {
            console.log('data here',data,error)
            if ( data ) {
                this.sessionId = data;
                this.error = undefined;
                console.log('sessionid ->'+this.sessionId);
                
                loadScript( this, CometD )
                .then( () => {
                    let cometDLib = new window.org.cometd.CometD();
                    cometDLib.configure( {
                        url: window.location.protocol + 
                            '//' + window.location.hostname
                            + '/cometd/40.0/',
                        requestHeaders: { 
                            Authorization: 'OAuth ' + 
                            this.sessionId 
                        },
                        appendMessageTypeToURL : false,
                        logLevel: 'debug'
                    } );
                    cometDLib.websocketEnabled = false;
                    var lwcThisContext = this;
                    cometDLib.handshake( function( status ) {      
                        console.log( 'Status is',  JSON.stringify(   status     )
                        );
                        if ( status.successful ) {
                            var subsrip = cometDLib.subscribe('/event/HomeMapFlyOut__e', function( message ) {
                              console.log('message 00->'+JSON.stringify(message));

                             if(message.data.payload.InputType__c=='Home'){
                                lwcThisContext.inputType=message.data.payload.InputType__c;
                                lwcThisContext.currentLat=message.data.payload.CurrentLat__c;
                                lwcThisContext.currentLong=message.data.payload.CurrentLongi__c;
                                lwcThisContext.homeLat=message.data.payload.HomeLat__c;
                                lwcThisContext.homeLong=message.data.payload.HomeLongi__c;

                                lwcThisContext.homemodalpopup = true;
                                lwcThisContext.chargingmodalpopup = false;

                            }else if(message.data.payload.InputType__c=='Charging'){
                                lwcThisContext.inputType=message.data.payload.InputType__c;
                                lwcThisContext.currentLat=message.data.payload.CurrentLat__c;
                                lwcThisContext.currentLong=message.data.payload.CurrentLongi__c;
                                lwcThisContext.homeLat=message.data.payload.HomeLat__c;
                                lwcThisContext.homeLong=message.data.payload.HomeLongi__c;

                                lwcThisContext.chargingmodalpopup = true;
                                lwcThisContext.homemodalpopup = false;


                            }
                             
                              console.log('modalpopup',lwcThisContext.modalpopup );
                              setTimeout(function(){
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
    
                    } );
                    
                } );
    
            } else if ( error ) {
                console.log('Error occurred in loading script');
                console.log(JSON.stringify(error) );
                this.sessionId = undefined;
            }
        }
        hideHomeModalBox(){
            this.homemodalpopup= false;
        }
        hideChargingModalBox(){
            this.chargingmodalpopup = false;
        }
   
    

}