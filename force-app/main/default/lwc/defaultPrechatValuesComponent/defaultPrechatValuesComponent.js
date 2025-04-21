import {LightningElement, wire} from 'lwc';
import {getRecord} from 'lightning/uiRecordApi';
import getCommunityUserId from '@salesforce/apex/CommunityUserController.getCommunityUserId';
import FIRST_NAME_FIELD from '@salesforce/schema/User.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/User.LastName';
import EMAIL_FIELD from '@salesforce/schema/User.Email';
import CONTACT_FIELD from '@salesforce/schema/User.ContactId';
export default class DefaultPrechatValuesComponent extends LightningElement {
	//userId;
	userDetails = {
		firstName: '',
		lastName: '',
		email: '',
		id: '',
		contactId: ''
	};
	/*connectedCallback() {
		console.log('on connected call back');
		getCommunityUserId()
			.then(result => {
				console.log('on connected call back 12'+result);
				this.userId = result;
				console.log('on connected call back 1256'+this.userId);
			})
			.catch(error => {
				console.error(error);
			});
	}*/

	@wire(getCommunityUserId) userDataHandler({data, error}) {
        if(data) {
			console.error('User data retrieved:', data);
			this.userDetails = {
				firstName: data.FirstName,
				lastName: data.LastName,
				email: data.Email,
				id: data.Id,
				contactId: data.ContactId
			};

			const userDetailsEvent = new CustomEvent("userDetails", {
				detail: this.userDetails,
				bubbles: true,
				composed: true
			});
			this.dispatchEvent(userDetailsEvent);
        }
	else if (error) {
		console.error('Error retrieving user data:', error);
	}
} 

	/*@wire(getRecord, {
		recordId: this.userId,
		fields: [FIRST_NAME_FIELD, LAST_NAME_FIELD, EMAIL_FIELD, CONTACT_FIELD],
	})
	userRecord({
		error,
		data
	}) {
		if (data) {
			console.error('User data retrieved:', data);
			this.userDetails = {
				firstName: data.fields.FirstName.value,
				lastName: data.fields.LastName.value,
				email: data.fields.Email.value,
				id: this.userId,
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
	}*/
}