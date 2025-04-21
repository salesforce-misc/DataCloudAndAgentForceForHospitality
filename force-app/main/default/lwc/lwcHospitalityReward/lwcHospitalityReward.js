import { api, LightningElement, wire } from 'lwc';
import getLoyaltyData from '@salesforce/apex/clsLoyaltyController.getLoyaltyData';

export default class LwcHospitalityReward extends LightningElement {
    @api recordId;  // This will be passed from the parent component or page
    enrolledDate;
    enrolmentStatus;
    membership;
    pointBalance;
    loyaltyData;
    loyaltyName;

    @wire(getLoyaltyData, { contactId: '$recordId' })
    wiredServiceAppointments({ error, data }) {
        if (data) {
            console.log('data is ', data)
            // Extracting data from the response
            this.loyaltyData = data;
            this.enrolledDate = this.loyaltyData.EnrollmentDate;
            this.enrolmentStatus = this.loyaltyData.MemberStatus;
            this.membership = this.loyaltyData.MembershipNumber;
            // Assuming Loyalty_Member_Currency and Loyalty_Member_Tier are related lists

            if (this.loyaltyData.Loyalty_Member_Currency != null && this.loyaltyData.Loyalty_Member_Currency.length > 0) {
                this.pointBalance = this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance;
            } else {
                this.pointBalance = 0;
            }

            if (this.loyaltyData.Loyalty_Member_Tier != null) {
                this.loyaltyName = this.loyaltyData.Loyalty_Member_Tier[0].Name;
            }
        } else if (error) {
            console.log('Error is')
            this.error = error.body.message;
            this.loyaltyData = undefined;
        } else {
            console.log(' Nothing here')
        }
    }
}