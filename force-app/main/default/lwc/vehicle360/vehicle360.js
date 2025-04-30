import { LightningElement,track,api,wire } from 'lwc';
import IMAGES from '@salesforce/resourceUrl/vehiclenew';
import getVehicleDetails from '@salesforce/apex/Vehicle360.getVehicleDetails';
import getVehicleTelemetricDataByVIN from '@salesforce/apex/Vehicle360.getVehicleTelemetricDataByVIN';
export default class Vehicle360TryOut extends LightningElement {
        
        @api recordId; 
        vinNumber;
        telemetricVehicleData;
        vinName;
        @track isFDLocked;
        @track isFPLocked;
        @track isRDLocked;
        @track isRPLocked;
        vehicle;
        error;
        vehicledetails;
        lat=92;lon=33;range;
        // Static data
        @track vehicleData = {
            
            lastUpdated: '20/06/2023',
            range: 302, // km
            battery:55,
            tire_pressure_fl__c:12,
            tire_pressure_rl__c:34,
            tire_pressure_fr__c:67,
            tire_pressure_rr__c:20

        };
            
        
        //Lock /Unlock Front Driver
        get lockButtonClass(){
            return this.isFDLocked ? 'icon-button active':'icon-button';
        }

        get unlockButtonClass(){
            return this.isFDLocked ? 'icon-button':'icon-button active';
        }

        

        //Lock /Unlock Rear Driver
         get lockButtonRDClass(){
            return this.isRDLocked ? 'icon-button active':'icon-button';
        }

        get unlockButtonRDClass(){
            return this.isRDLocked ? 'icon-button':'icon-button active';
        }

        

        //Lock /Unlock Front Passenger
        get lockButtonFPClass(){
            return this.isFPLocked ? 'icon-button active':'icon-button';
        }

        get unlockButtonFPClass(){
            return this.isFPLocked ? 'icon-button':'icon-button active';
        }

        //Lock /Unlock Front Passenger
        get lockButtonRPClass(){
            return this.isRPLocked ? 'icon-button active':'icon-button';
        }

        get unlockButtonRPClass(){
            return this.isRPLocked ? 'icon-button':'icon-button active';
        }

        

        vehicleImg = IMAGES;

        @wire(getVehicleDetails, { vehicleId: '$recordId' })
            wiredVehicle({ data, error }) {
                if (data) {
                    this.vehicle = data;
                    console.log('vehicle-->',this.vehicle);
                    console.log('vehicle name-->',this.vehicle.Name);
                    this.error = undefined;
                    console.log('error-->',this.error);
                } else if (error) {
                    this.error = error;
                    this.vehicle = undefined;
                    console.log('vehicle-->',this.vehicle);
                    console.log('vehicle name-->',this.vehicle.Name);
                    console.log('error-->',this.error);
                }
            }


        connectedCallback(){
            if(this.recordId){
                this.fetchVehicleDataFromTelemetrics();
            }
        }
        fetchVehicleDataFromTelemetrics(){
            console.log('RECORD ID ',this.recordId);
            getVehicleTelemetricDataByVIN({vehicleId: this.recordId})
            .then((result)=>{
                console.log('RESULT FROM BACKEND',result);
                this.vehicledetails=result;
                console.log('vehicledata',this.vehicledetails);
                this.isFDLocked = result.VIN.FrontDriver__c;
                this.isFPLocked = result.VIN.FrontPassenger__c;
                this.isRDLocked = result.VIN.RearDriver__c;
                this.isRPLocked = result.VIN.RearPassenger__c;
                console.log('IS FD LOCKED',this.isFDLocked);
                this.vinNumber = result.VIN.VehicleIdentificationNumber;
                console.log('VIN',this.vinNumber);
                this.vinName = result.VIN.Name;
                console.log('VIN NAME LWC',this.vinName);
                this.telemetricVehicleData = result.TELEMETRICDATA;
                console.log('TELEMETRIC DATA LWC',this.telemetricVehicleData);
                console.log('TELEMETRIC odo LWC',result.TELEMETRICDATA.odometer__c);
                this.range=Math.round((result.TELEMETRICDATA.odometer__c/result.TELEMETRICDATA.battery_soc_level__c));
                this.lon=Math.round(result.TELEMETRICDATA.longitude__c * 100) / 100;
                this.lat=Math.round(result.TELEMETRICDATA.latitude__c * 100) / 100;
                console.log('TELEMETRIC lang LWC',this.lat);
            }).catch((error)=>{
                console.error('Error Fetching Vehicle Data',error);

            })
        }

        get batteryStyle(){
            console.log('COLOR'+this.telemetricVehicleData.battery_soc_level__c);
            const batterPercentage = Math.min(this.telemetricVehicleData.battery_soc_level__c);
            const color = this.telemetricVehicleData.battery_soc_level__c <=30 ?'red' 
                                                : this.telemetricVehicleData.battery_soc_level__c <=50 ?'orange':'green';
            console.log('COLOR'+color);
            return `width: ${batterPercentage}%;
            background-color:${color};`;
        }
            // get batteryStyle(){
            //     console.log('COLOR'+this.vehicleData.battery);
            //     const batterPercentage = Math.min(this.vehicleData.battery);
            //     const color = this.vehicleData.battery <=30 ?'red' 
            //                                         : this.vehicleData.battery <=50 ?'orange':'green';
            //     console.log('COLOR'+color);
            //     return `width: ${batterPercentage}%;
            //     background-color:${color};`;
            // }
}