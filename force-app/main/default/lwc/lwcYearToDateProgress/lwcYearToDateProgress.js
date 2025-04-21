import { LightningElement, wire, api } from 'lwc';
import getLoyaltyData from '@salesforce/apex/clsLoyaltyController.getLoyaltyData';
import { loadScript, loadStyle } from 'lightning/platformResourceLoader';
import chartjs from "@salesforce/resourceUrl/Chart";
import gaugejs from "@salesforce/resourceUrl/ChartGauge";
import gaugepluginjs from "@salesforce/resourceUrl/GaugepluginData";
import { refreshApex } from '@salesforce/apex';
const generateRandomNumber = () => {
    return Math.round(Math.random() * 100);
};
export default class LwcYearToDateProgress extends LightningElement {
    @api recordId;  // This will be passed from the parent component or page

    pointBalance;
    pointToNextTire;

    error;
    chart;
    isChartJsInitialized = false;
    score


    config = {
        type: "gauge",
        data: {

            datasets: [{
                data: [7500, 15000, 20000],
                value: 0,
                backgroundColor: ["red", "yellow", "green"],
                borderWidth: 2
            }]
        },
        options: {
            responsive: true,
            title: {
                display: false

            },
            layout: {
                padding: {
                    bottom: 30
                }
            },
            needle: {
                // Needle circle radius as the percentage of the chart area width
                radiusPercentage: 2,
                // Needle width as the percentage of the chart area width
                widthPercentage: 3.2,
                // Needle length as the percentage of the interval between inner radius (0%) and outer radius (100%) of the arc
                lengthPercentage: 80,
                // The color of the needle
                color: "rgba(0, 0, 0, 1)"
            },

            valueLabel: {
                formatter: Math.round
            },
            plugins: {
                datalabels: {
                    display: true,
                    formatter: function (value, context) {
                        //return '>'+value;
                        if (value >= 7000 || value < 7000) {
                            return value;
                        } else {
                            return '';
                        }

                    },
                    color: function (context) {
                        //return context.dataset.backgroundColor;
                        return 'black';
                    },
                    //color: 'rgba(255, 255, 255, 1.0)',
                    /*backgroundColor: "rgba(0, 0, 0, 1.0)",*/
                    borderWidth: 0,
                    borderRadius: 5,
                    font: {
                        weight: "bold"
                    }
                }

            }
        }
    };

    /* disconnectedCallback() {
         if (this.timerId) clearTimeout(this.timerId);
     }*/
    /*changeScoreValue() {
        this.timerId = setTimeout(() => {
            if (this.timerId) clearTimeout(this.timerId);
            if (this.score < 100) {
                this.setGaugeValue(this.score + 20);
            } else {
                this.setGaugeValue(0);
            }
            this.changeScoreValue();
        }, 4000);
    }*/
    /*calculateValueColor() {
        return this.score < 20
            ? "#c23934"
            : this.score < 40
                ? "#ff9900"
                : this.score < 60
                    ? "#ffcc00"
                    : this.score < 80
                        ? "#669900"
                        : "#027e46";
    }*/
    /*setGaugeValue(value) {
        if (this.score !== value) {
            this.score = value;
            this.gaugeConfig.data.datasets[0].value = value;
            this.gaugeConfig.data.datasets[0].gaugeData.valueColor =
                this.calculateValueColor();
            this.chart.update();
        }
    }*/

    connectedCallback() {
        loadScript(this, chartjs)

            .then(() => {

                console.log('Script 1 loaded successfully');

                return loadScript(this, gaugejs);

            })

            .then(() => {

                console.log('Script 2 loaded successfully');
                return loadScript(this, gaugepluginjs);


            })
            .then(() => {
                //refreshApex(this.loyaltyData);

                console.log('Script 3 loaded successfully', this.pointBalance);
                const canvas = document.createElement('canvas');

                this.template.querySelector('div.chart').appendChild(canvas);

                const ctx = canvas.getContext('2d');
                //this.config.data.datasets[0].value = this.pointBalance;
                this.chart = new window.Chart(ctx, this.config);





            })

            .catch(error => {

                console.error('Error loading scripts:', error);

                // Handle errors 

            })



        /* if (!this.isChartJsInitialized) {
              loadScript(this, chartjs);
              loadScript(this, gaugejs);
          } else {
              return;
          }
          this.isChartJsInitialized = true;
          try {
             
          } catch (error) {
              this.error = error;
          } */
    }


    @wire(getLoyaltyData, { contactId: '$recordId' })
    wiredServiceAppointments({ error, data }) {
        if (data) {
            // Extracting data from the response
            this.loyaltyData = data;
            this.enrolledDate = this.loyaltyData.EnrollmentDate;
            this.enrolmentStatus = this.loyaltyData.MemberStatus;
            this.membership = this.loyaltyData.MembershipNumber;
            console.log('came here', this.loyaltyData)
            // Assuming Loyalty_Member_Currency and Loyalty_Member_Tier are related lists
            if (this.loyaltyData.Loyalty_Member_Currency != null && this.loyaltyData.Loyalty_Member_Currency.length > 0) {

                //0-7500 : Silver
                //7500-15000: Gold
                //15000 : Platinum
                if (this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance == 0) {
                    this.pointToNextTire = 7500;
                }
                else if (this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance > 0 &&
                    this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance <= 7500
                ) {
                    this.pointToNextTire = 7500 - this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance;

                } else if (this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance > 7500 &&
                    this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance <= 15000
                ) {
                    this.pointToNextTire = 15000 - this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance;
                } else if (this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance > 15000 &&
                    this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance <= 20000) {

                    this.pointToNextTire = 20000 - this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance;

                } else if (this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance > 20000) {
                    this.pointToNextTire = 0;
                }
                this.pointBalance = this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance > 20000 ? 20000 : this.loyaltyData.Loyalty_Member_Currency[0].PointsBalance;

                console.log('this.pointBalance Yes Data', this.pointBalance)
                this.config.data.datasets[0].value = this.pointBalance;


            } else {

                this.pointToNextTire = 7500;
                this.pointBalance = 0;
                this.config.data.datasets[0].value = this.pointBalance;
                console.log('this.pointBalance 0', this.pointBalance)
            }
            console.log('this.pointBalance Final', this.pointBalance)

        } else if (error) {
            this.pointToNextTire = 7500
            this.pointBalance = 0;
            this.config.data.datasets[0].value = this.pointBalance;
            console.log('Came here Error')
            this.error = error.body.message;
            this.loyaltyData = undefined;
        } else {
            this.pointToNextTire = 7500
            this.pointBalance = 0;
            this.config.data.datasets[0].value = this.pointBalance;
            console.log('Came here NO dATA')
        }
    }
}