/*
Author: Rajeev Shekhar
Purpose: This LWC is used to prepopuate the standard prechat fields on the MIAW component
*/

import { LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import USER_ID from '@salesforce/user/Id';
import FIRST_NAME_FIELD from '@salesforce/schema/User.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/User.LastName';
import EMAIL_FIELD from '@salesforce/schema/User.Email';
import CONTACT_FIELD from '@salesforce/schema/User.ContactId';

export default class DefaultPrechatValuesComponent extends LightningElement {
    userDetails = {
        firstName: '',
        lastName: '',
        email: '',
        id: USER_ID,
        contactId: ''
    };

    @wire(getRecord, {
        recordId: USER_ID,
        fields: [FIRST_NAME_FIELD, LAST_NAME_FIELD, EMAIL_FIELD, CONTACT_FIELD],
    })
    userRecord({ error, data }) {
        if (data) {
            console.error('User data retrieved:', data);
            this.userDetails = {
                firstName: data.fields.FirstName.value,
                lastName: data.fields.LastName.value,
                email: data.fields.Email.value,
                id: USER_ID,
                contactId: data.fields.ContactId.value
            };
            
            const userDetailsEvent = new CustomEvent("userDetails", {
                detail: this.userDetails,
                bubbles: true,
                composed: true
            });

            this.dispatchEvent(userDetailsEvent);
            
        } else if (error) {
            console.error('Error retrieving user data:', error);
        }
    }
}