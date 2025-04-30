import { LightningElement, wire, api, track } from 'lwc';
import getSupplierDetails from '@salesforce/apex/VehicleController.getSupplierDetails';
//import getVehicleDetails from '@salesforce/apex/VehicleController.getVehicleDetails';
import getContact from '@salesforce/apex/VehicleController.getContact';
import getAsset from '@salesforce/apex/VehicleController.getAsset';
import getVehicle from '@salesforce/apex/VehicleController.getVehicle';


import IMAGES from "@salesforce/resourceUrl/VehicleC360";

export default class VehicleProfileC360 extends LightningElement {
    @api recordId;  
    @track supplier; 
   // @track vehicleDetails;
    @track error;
    @track contact;
    @track asset;
    @track vehicle;
    @track formattedPurchaseDate;

    imageUrl = IMAGES; 

    @wire(getSupplierDetails, { contactId: '$recordId' })
    wiredSupplier({ data, error }) {
        console.log('Supplier Data: ', data);
        if (data) {
            this.supplier = data;
            
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.supplier = undefined;
        }
    } 

    get isSupplierAvailable() {
        return this.supplier && this.supplier.Name__c; 
    }

    @wire(getContact, { contactId: '$recordId' })
    wiredContact({ data, error }) {
        if (data) {
            this.contact = data;
            
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contact = undefined;
        }
    }

    @wire(getAsset, { contactId: '$recordId' })
    wiredAsset({ data, error }) {
        if (data) {
            this.asset = data;
            if (this.asset.PurchaseDateNew__c) {
                this.formattedPurchaseDate = new Date(this.asset.PurchaseDateNew__c).toLocaleDateString();
                console.log('formattedPurchaseDate: ', this.formattedPurchaseDate);
            }
            console.log('Asset Details: ', this.asset);            
            this.error = undefined;
        } else if (error) { 
            this.error = error;
            this.asset = undefined;
        }
    }

    @wire(getVehicle, { vehicleId: '$asset.ssot__VehicleId__c' })
    wiredVehicle({ data, error }) {
        if (data) {
            this.vehicle = data;
            console.log('vehicle Details: ', this.vehicle);
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.vehicle = undefined;
        }
    }
  
    get manufactureWarrantyStyle() {
        return this.asset?.Asset_Warranty_Status__c
            ? 'background-color: rgb(30, 191, 57); border-radius: 30px; width: 87px; padding: 5px 10px;'
            : '';
    }

    get ConnectedCarStyle(){
        return this.vehicle?.Connected_Car__c
            ? 'background-color: grey; border-radius: 30px; width: 56px; padding: 5px 10px;'
            : '';
    }

}