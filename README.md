**Sunshine Trail Resorts**</br>
=======================
Welcome to Sunshine Trail Resorts, a sample hospitality application. Sunshine Trail Resorts is a fictional resort that uses Agentforce, Data Cloud, and the Salesforce Platform to deliver highly personalized guest experiences. Explore ways to bring agents into business workflows, including new smart automation capabilities, Search Property, content generation.

The Sunshine Trail app showcases **Data Cloud**, **Agents** and **Prompts**.

Table of Contents</br>
=======================
[1. Installation Guide](#1-pre-deployment-instructions)

[2. Salesforce Package Installation](#2-salesforce-package-installation)

[3. Data-Cloud Configuration](#3-data-cloud-configuration)

[4. Commerce Cloud Configuration](#4-commerce-cloud-configuration)

[5. Connect and Create Sample data](#5-connect-and-create-sample-data)

[6. Finish Configuration](#6-finish-configuration)

[7. Mulesoft Configuration for Amadeus Prices](#7-mulesoft-configuration-for-amadeus-prices)

<details><summary>

  ## 1. Pre-Deployment Instructions
</summary>

  ### Table of Contents
  [1.	Salesforce Org Setup Requirements for Sunshine Resorts App](#1-salesforce-org-setup-requirements-for-sunshine-resorts-app)
  
  [2.	Install Pre-Deployment Package](#2-install-pre-deployment-package)
  
  [3.	Enable Features on the Org](#3-enable-features-on-the-org)
  
  [4.	Setup the Salesforce Org](#4-setup-the-salesforce-org)

### 1. Salesforce Org Setup Requirements for Sunshine Resorts App

   **Option1:** To support the Sunshine Resorts app, you can either create a new Salesforce Org or use an existing one, provided it includes the following features and licenses: 

  | Requirement | Details |
  | ----- | ----- |
  | Licenses Required | - Data Cloud</br>- Sales Cloud</br>- Service Cloud</br>- Loyalty Cloud</br>- Experience</br>- Commerce Cloud</br>- Marketing Cloud</br>- MuleSoft (Optional)
  | Features Required | - Service Agent</br>- Einstein Agent</br>- Copilot</br>- Prompt Builder</br>- Agent Force</br>- Real-time</br>- Code Builder (Optional) 
  
  Our package is designed to support all these clouds, but you have full flexibility to use only the portions relevant to your business. If you are not using a particular cloud (e.g., Loyalty 
  Cloud), you can simply skip its configuration—the package will still install successfully, but that feature will not be available until you configure it yourself. Additionally, you can customize 
  and enhance the existing package by adding your own features as needed. <br/>
  
 ⚠️ **Important Note:** Existing Trailheads playgrounds cannot be used

   **Option 2:** To ensure a seamless integration and unlock a 360-degree view of customer interactions, we recommend enabling Salesforce Foundations in your org. This free enhancement integrates Sales, Service, Marketing, Commerce, and Data Cloud functionalities, improving efficiency and AI-readiness.

**How to Enable Salesforce Foundations:**
- Log in to your Salesforce instance.
- Navigate to Setup → Search for Salesforce Foundations.
- Click "Add to My Contract" (It's free).
- Select the Foundations products and proceed with checkout.
- Return to Setup and follow the on-screen instructions to complete the configuration.<br/>
🔗 More details: [Salesforce Foundations](https://www.salesforce.com/crm/foundations)

### 2. Install Pre-Deployment Package

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Install package | - Click on this Package Installation [Link ](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t4W000002V5WS)</br>- Sign-in to the Org with your credentials.</br>- Choose Install for Admins Only option</br>- Choose “Rename conflicting components in package” and click the Install button.</br>- Wait until installation is completed, you will receive a confirmation on logged in user’s email | ![1](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/0090e734-5abd-45df-9377-63d03e6894ae)![2](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/bfdcd3bd-8c94-4ce5-9147-026150a28675)|
  | Verify Package installation | - Click Setup</br>- Search for package</br>- Click on 'Installed PAckage' </br>- Search for 'Sunshine Trails Pre-Deployment Package' is installed  | ![3](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/44482507-cc99-4c5a-928b-c8b2e3d462cd)|

### 3. Enable Features on the Org

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Enable Commerce Cloud | - From Setup, enter ‘Commerce’ in the Quick Find box.</br>- Select ‘Settings’ under ‘Commerce’.</br>- Turn on ‘Enable Commerce’. | ![4](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/39d5c455-b906-4f59-a351-217b9e164151)|
  | Enable Loyalty Management Features | - From Setup, enter ‘Loyalty Management’ in the Quick Find box.</br>- Select ‘Loyalty Management Settings’.</br>- Under ‘Consolidate Member Points for Expiration,’ turn on ‘Consolidate members’ fixed non-qualifying points in real time’. |![5](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/96609586-fe9d-4853-ac16-f2639327908a)|
  | Create a Basic Experience Builder Site | - From Setup, enter ‘Digital Experiences’ in the Quick Find box.</br>- Select ‘All Sites’ under ‘Digital Experiences’.</br>- Click New to open the Creation wizard with template options.</br>- Select the ‘D2C Commerce (LWR)’ template.</br>- Click Get Started. | ![6](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/14ee5195-665a-4467-a399-de76578b6910)|
  | Site Name and URL | - After selecting the template, enter a site name and URL.</br>- Name the site ‘Sunshine Resorts’ and ensure the URL ends with /SunshineResorts</br>- Click Create. Your site will be created in Preview status. | ![7](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/0eecc32f-7361-41a7-91af-8a0af414adc7)|
  | Activate Site | - From Setup, enter ‘Digital Experiences’ and select ‘All Sites’ under ‘Digital Experiences’.</br>- Click Workspaces next to Sunshine Resorts.</br>- Select Administration, then Emails. </br>- Under ‘Email Tabs,’ uncheck ‘Send welcome email’ and click Save.</br>- In Settings, click Activate and confirm by clicking OK.</br>- Your site will now be live and fully set up. | ![9](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/28acd706-31eb-4787-933a-9ad37eb82f50)![8](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/aeac9dab-a24a-40c5-9ac1-3120e2a4c655)|

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Setup Data Cloud| - Enter “Data Cloud” in Quick Find box.</br>- Click on “Data Cloud Setup Home”.</br>- Click on “Get Started” if the Data Cloud instance is not set up.</br>- If already Data Cloud setup is done then you will not see Get Started option.</br>- Once the process is complete, the Data cloud instance is ready to use.</br>||
  | Verify Experience Delivery is Disabled | - Go to Setup → Digital Experiences → All Sites.</br>- Click Workspaces for ‘Sunshine Resorts’.</br>- Click Administration.</br>- Click on Settings.</br>- Experience Delivery should be disabled. If it’s enabled, please raise a Salesforce Case with the Support team to disable this feature.</br>||
  | Enable Data Cloud on Experience Site | - Go to Setup → Digital Experiences → All Sites.</br>- Click Builder for ‘Sunshine Resorts’.</br>- Click Settings → Integrations.</br>- Click Add to Site for Data Cloud.</br>- Enable “Share site data with Data Cloud” and click Save.</br>- Once enabled, a green box will appear</br>- Click Publish in the top-right corner | ![10](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/3721d8fa-5d04-43e7-966a-da5bf847756c)![11](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/a6e07020-f1c5-4938-b9c9-b65a14926f68)|
  | Verify Data Stream  | - Go to App Launcher → Data Cloud → Data Stream.</br>- Change List View to All Data Streams.</br>- Search for Experience\_Cloud.</br>- 6 total Data Streams should appear |![12](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/2526099d-5595-49fc-bc17-3473bbe80e27)|
  | Create a Record on Custom Metadata | - Go to Setup \-\> Search for Metadata type \-\> Click on ‘Install Package Settings Enabled’ \-\>   Click on **Manage Install Package Settings Enabled** \-\>Click on ‘New’ \-\> Give Label as  **Package Settings Enabled** and **Check Checkbox of Installation Settings Enabled Field.** Click Save| ![14](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/d5c7ac52-abe7-4344-9a94-94a3ec7a4aba)![13](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/77ce390a-0d3c-4295-b7bc-6a7252ea4f24)|

### 4. Setup the Salesforce Org

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Assign Data Cloud Permissions to Standard Object  | - Click on App Launcher, search for Sunshine Trails Hospitality and click on **Sunshine Trails Hospitality Setup** App</br>- Click on the “**Assign Permissions for Standard Objects**” button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further.  | ![15](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/8538407d-d5d7-4045-8915-9c0ae4f4f600)|
  | Assign Data Cloud Permissions to Custom Objects & Custom Fields | - Click on App Launcher, search for Sunshine Trails Hospitality and click on **Sunshine Trails Hospitality Setup** App</br>- Click on **“Assign Permissions for Custom Object”** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further | ![16](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/07709485-9fa9-4e1f-b681-96317f36c39c)|
  | Modify the Data Cloud Admin Permission Set | - Open the Setup Menu and click Setup</br>- In the Quick Find, search for ‘Permission Sets’ and click ‘Permission Sets’</br>- Click the ‘Data Cloud Admin’ permission set</br>- In the Apps section, click ‘Data Cloud Data Space Management’</br>- In the Data Spaces panel, click Edit.</br>- Check the ‘Enabled’ checkbox for the default data space and click Save</br>- Click OK in the confirmation dialog |![18](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/05d137c4-d180-4d05-8ad6-83a45b81d26d)|
  | Create a Connection to Amazon S3 | ***NOTE:*** If you do not have an existing Amazon S3 instance, [register for the free tier](https://aws.amazon.com/free/), and then follow instructions in [How to Use the Amazon S3 Storage Connector in Data Cloud](https://developer.salesforce.com/blogs/2023/10/how-to-use-the-amazon-s3-storage-connector-in-data-cloud) to create dedicated user with required permissions for this demo.</br></br>If you already have an S3 instance, no need to sign up for a new one.</br></br>Before proceeding further, make a note of your [programmatic credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-creds.html#access-keys-and-secret-access-keys) (Access Key ID and Secret Access Key) that can be used to access the account</br></br>- If you have your own Amazon S3 files, feel free to use those. Otherwise, get started with the test files provided below.</br><br>[AWS UnStructured Data](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/tree/master/AWS%20UnStructured%20Data)</br><br>[AWS Structured Data](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/tree/master/AWS%20Structured%20Data)</br></br>
  | Create a connection to snowflake | **NOTE:** If you do not have access to an existing Snowflake instance, please get access before proceeding further</br></br>- Follow instructions in [this article](https://developer.salesforce.com/blogs/2024/08/zero-copy-data-federation-with-snowflake-and-salesforce-data-cloud) to create a Warehouse and Integration User in Snowflake, generate a public and private key pair, and configure Salesforce Data Cloud to connect to Snowflake.</br><br>If you have your own Snowflake files, feel free to use those. Otherwise, get started with the test files provided [here](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/tree/master/Snowflake%20Data).| |
  | Create a connection for Mulesoft Ingestion API | - Go to **Setup** \-\> In the **Quick Find** box, type ***static***, then select ***Static Resources***</br>- In the index across the top, click the letter ***M***</br>- Click on **‘Mulesoft\_Ingestion\_API\_Scheme’**</br>- Click on **‘View File’** hyperlink. The **‘Mulesoft\_Ingestion\_API\_Scheme.txt’** is downloaded to your computer.</br>- Change the file extension from ***.txt*** to ***.yaml***</br>- Go to Data Cloud Setup, click on Ingestion API → Click New</br>- Provide the Connector Name as ’Mulesoft Ingestion API’</br>- Upload **Mule\_ingestion\_api.yaml**  file which you have downloaded from above steps and Upload file to scheme and click on Save. |![22](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/d6b05f55-e6d3-4c2a-8354-ae12d9993c31)![21](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/9af953e6-eb09-42d2-bf53-0b0c335a34cb)![20](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/7860c188-b40a-468d-aeba-bc7c65be93cb)|
| Install Standard Data Bundles | Click on Data Cloud Setup </br>- Click on ‘Salesforce CRM’</br>- Under ‘Standard CRM Data Bundles’</br>- Click on ‘Arrow’ icon and click on ‘install’ of ‘Sales Cloud’</br>- it will open on new page -> click on Install | ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/15abd94d-d63d-40ef-a12a-ab19b648b0ed) ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/f4105811-17e1-4f10-b399-7d1344062d8a)|
| Turn On Einstein Setup | - Navigate to Setup</br>- Search and Select ‘Einstein Setup’</br>- Turn on Einstein Setup |  |
| Turn On Agentforce | - Navigate to Setup</br>- Search and Select ‘Agent’</br>- Turn on Agentforce |  |
</details>

<details><summary>
  
  ## 2. Salesforce Package Installation
</summary>

### 1. Install Sunshine Base Package
 | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Install Sunshine Base Package | - Click on this Package Installation [Link ](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t4W000002V5Wc)</br>- Sign-in to the Org with your credentials.</br>- Choose Install for Admins Only option</br>- Choose “Rename conflicting components in package” and click the Install button.</br>- Click Done when installation is complete. |![23](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/89ad7e26-d0c6-424c-bcdd-043c8f7530e4)|
  | Verify Package installation | - Click Setup</br>- Search for ‘Installed Package’</br>- Search for 'Sunshine Trails Base App' is installed  | ![24](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/de5b6fce-44ff-4c79-8aac-43327a0083aa)|

</details>

<details><summary>
  
  ## 3. Data Cloud Configuration
</summary>

## Table of Contents

[1. Install the Data Kit to add Data Cloud components to the Org	](#1-install-the-data-kit-to-add-data-cloud-components-to-the-org)

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[a. Create Data Steam for Amazon S3](#2-Create-Data-Steam-for-Amazon-S3)

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[b. Create Data Stream for Snowflake](#3-create-data-stream-for-snowflake)

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[c. Create a connection to snowflake in Salesforce](#3-create-data-stream-for-snowflake)

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[d. Create Ingestion API for Mule Data Streams from Data Kit](#4-Create-Ingestion-API-for-Mule-Data-Streams-from-Data-Kit)

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[e. Create Hotel FAQ & Hotel Safety FAQ DLO Creation for Unstructured Data](#5-Create-Hotel-FAQ-and-Hotel-Safety-FAQ-DLO-Creation-for-Unstructured-Data)

[2. Create Party Identification Collection Data Lake	](#6-Create-Party-Identification-Collection-Data-Lake)

[3. Create Data Transforms from Data Kit	](#7-Create-Data-Transforms-from-Data-Kit)

[4. Create Identity Resolution Ruleset from Data Kit	](#8-Create-Identity-Resolution-Ruleset-from-Data-Kit)

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[a. Create Calculated Insights	](#9-Create-Calculated-Insights)</br>

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[b. Create Data Graph	](#10-Create-Data-Graph)

[5. Create Data Cloud Related List Enrichment	](#11-Create-Data-Cloud-Related-List-Enrichment)

[6. Create Data Cloud Copy Field Enrichment	](#12-Create-Data-Cloud-Copy-Field-Enrichment)


### 1. Install the Data Kit to add Data Cloud components to the Org
The Data Kit is installed as a part of the Package installation. Once the Data is available in
the org, follow the steps below to create data streams.

 | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  Verify Salesforce CRM is Active or Not | In Data Cloud, select the Setup icon and then Data Cloud Setup.</br> - Select Salesforce CRM.</br>- If connection status is “Inactive”</br>- then click on drop down to “Active” </br>- Click on “Active”| ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/89699b4a-1917-4935-9f54-ff9f567f92d2)![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/81561810-c659-4231-ab0e-321f356e1bdc) |
  | Create Data Streams from Data Bundle | - Logged into the environment where you installed the data kit</br>- Go to Data Cloud app and the Data Streams tab.</br>- Click New to create a Data Stream</br>- Select Salesforce CRM and click Next.</br>- Under Custom Data Bundles, select the Salesforce_CRM_Bundle.</br>- Select your Salesforce Org.</br>- Click Next.</br>- Select the data space as ‘Default’, review the fields in your data stream, and click Next.</br>- Review details and click “Deploy.| ![25](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/3dc3abae-c007-4ad0-992e-672f91c5232d)|
  | Create Loyalty_CRM_Bundle Data Streams from Data Bundle | - Click on Data Stream Click on New </br>- Select Salesforce CRM Click Next</br> - Select Salesforce_CRM_Loyalty_Bundle Click on Next</br> - Select the data space as ‘Default’, review the fields in your data stream, and click Next. </br>- Review details and click “Deploy”  | ![27](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/9f994129-fe3c-447e-96a9-bc24ff2f3b95) ![28](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/6aadabc2-b05b-44de-b0ce-810de0279d92) ![29](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/e3e8de32-dbce-43b7-be38-63dc2b57f3ea)|
  | Create Website_Mobile_apps Data Stream from Data Kit |- Click on Data Stream</br>- Click on New</br>- Select ‘Installed Data Kits Package’</br>- Select ‘Sunshine Trails DK’ Data Kits</br>- Select checkbox under ‘Websites_Mobile_Apps’ click on ‘Next’</br> -Select Connector type ="website" & connector name "Experience_Cloud_Event_Connector".</br>- Click Next.</br> - Click on Deploy| ![30](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/a0226993-1ea0-4e84-9d8a-c8e5b58090cb) ![31](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/bf69236d-5654-427e-96ec-03a8b02e8bca) ![32](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/3015715d-2f07-42fb-9cdb-6628f83656b5) ![34](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/b5613762-dccf-4471-a3f1-9bbdfcee1a5e) ![33](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/c0546c4e-e726-4c35-a067-a00f450b3061)|

  
### 2. Create Data Steam for Amazon S3
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create a Connection to Amazon S3 in Salesforce|Navigate to Data Cloud Setup</br>In the menu, under EXTERNAL INTEGRATIONS, click on Other Connections</br> - Click New, choose Data Kits as the source and click Next. Select Sunshine Trails DK</br>-Select InfosysAWSBucket</br>-Change the name & API name of the connection "hospitalityplayground". </br>-Put the bucket name “hospplaygroundbucket” please feel free to change the bucket name based on your existing AWS bucket</br> -Fill the credentials and save.|
  | Create a Data Stream for Amazon S3 from Data Kit |- Click on Data Stream Click on New</br>- Select Installed Data Kits & Packages Click on Next</br>- Select Sunshine Trails DK<br> - Select Amazon_S3_Bundle</br>- Select Connection as InfosysAWSbucket</br>- Select the data space as ‘Default’, review the fields in your data stream,and click Next</br>-Review details and click Deploy.|
  | Create a Data Stream for Third Party Data |- Click on Data Stream Click on New</br>- Select Installed Data Kits & Packages Click on Next</br>- Select Sunshine Trails DK<br> - Under “Bundle Amazon S3” Select Third Party Survey and click Next</br>- In Connection Select “hospitalityplayground” Click Next</br>- Click Next and click Deploy.|

  ### 3. Create Data Stream for Snowflake
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create a connection to snowflake in Salesforce |Navigate to Data Cloud Setup</br>-In the menu, search SnowFlake,</br> - Click New, choose Data Kits as the source and click Next. Select Sunshine Trails DK</br>-Select Infosys_Demo_Actual. </br>-Please feel free to change the connection name based on your existing snowflake connection </br> -Don’t change the API name </br>Fill the Account URL, Username, and Private Key and click next and save.|
  | Create Data Stream for Snowflake from data kit | - While logged into the environment where you installed the data kit</br>- Go to Data Cloud app and the Data Streams tab.</br>- Click New to create a Data Stream</br>- Under "Other Sources", select "Installed Data Kits & Packages" and click Next</br>- Select "Sunshine Trails DK" Data Kit</br>- Select Snowflake Bundle and click Next.</br>- Under Data Streams choose "POS_Transaction" and "IOT_Transaction" and click Next.</br>- Review the Data Stream fields and click Next</br>- Click Deploy to create the Data Streams| ![38](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/1ad22f8a-778a-4526-a67f-6aee9b67a7f2) ![39](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/f971c7ae-74dc-4b04-be74-4c3bfd7cc1cd)|

### 4. Create Ingestion API for Mule Data Streams from Data Kit
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Ingestion API for Mule Data Streams from Data Kit| - Click on Data Stream </br> - Click on New.</br>- Select Installed Data Kits & Package.</br>- Select ‘Sunshine Trails DK’ Data Kits.</br>- Click on ‘Ingestion’ Bundle.</br>- Click on Next.</br> -Select Connection as ‘Mulesoft Ingestion API’ </br>- Click Next </br> -  Click Deploy| ![42](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/cf8ac46e-3764-4e35-b1bb-a3e749c4dfc9) ![45](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/daf3f6a6-6a87-461f-9920-0addcd49d136) ![44](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/5e8fb1b4-24e4-4b96-80c8-65075597ba9b) ![43](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/0e958c06-5de9-48d2-9abb-48b49e35095d)|

  ### 5. Create Hotel FAQ and Hotel Safety FAQ DLO Creation for Unstructured Data
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Hotel FAQ & Hotel Safety FAQ DLO Creation | - Click on Data Lake Object Click on New </br>- Click on Create from Data Kits, Click on Next </br>- Select Hotel_FAQ_v3, select “hospitalityPlayground’ connection. Click on Next </br>- Click on Deploy </br>- Follow the same step from Step#1 for Hotel_Safety_FAQ_V2.|

   ### 6. Create Party Identification Collection Data Lake
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Party Identification Collection & Party Identification Collection IOT DLO Creation  | - Click on Data Lake Objects Tab </br>- Click on New</br>- Click on “Create from Data Kits”, Click on Next  and select “Sunshine Trails Base App” package </br>- Select Party Identification Collection.</br>- Click on Next </br> - Click on Save </br> - Repeat the above steps again but this time select </br> - Party Identification Collection IOT DLO instead of Party Identification Collection </br>- Click on Next </br> - Click on Save.|

  ### 7. Create Data Transforms from Data Kit
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create IOT & POS Data Transform  | -Click on Data Transforms Tab </br>- Click on New</br>- Click on Create from Data Kits, Click on Next</br>- Select Extract Party Identifiers from IOT</br>- Click on Next . Click on Save, Copy the Name , Remove the Name then Paste the same Name Again</br>- Click on Save</br>- Click on Data Transform Tab </br>- Click on New. Click on ‘Create from a Data Kits’ Option </br>- Select  Extract Party Identifiers from POS </br>- Click on Next . Click on Save, Copy the Name , Remove the Name then Paste the same Name Again </br>- Click on Save|![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/b54cb364-875c-4ecc-a8d8-5280d98f1a43)![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/b22b3a61-dc5d-47a4-a637-6a23c25213a1)![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/00489045-9e1a-4bb1-848b-37d0006f4253)![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/c975dd1f-15fd-406e-bad4-2401aea8d7a1)|


  ### 8. Create Identity Resolution Ruleset from Data Kit
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Identity Resolutions| -Go to Data Cloud app</br> - Click on the Identity Resolutions tab </br> - Click New</br> - Select Installed from Data Kit</b>- Choose Sunshine Trails DK</br>- Click on Next</br>- Choose ‘Guest Profile’. Click on Next </br> Click on Save.| ![54](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/62ab9077-f18b-4f58-a326-50c9f56a4eef) ![53](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/4f0e3402-7774-4bc1-b265-51393b278402) ![52](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/a3e7577d-78f3-416f-a08f-74e5d84166b8)|

### 9. Create Calculated Insights
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  Create Calculated Insights|- Go to Data Cloud ap </br>- Click on Calculated Insights tab</br>- Click New</br>- Select "Create from a Data Kit" and click  Next</br>- Select ‘Guest Stay Metrics’</br>- Click on Next </br>- Click on ‘Check Syntex’</br>- Click on ‘Activate’</br>- Click Activate</br>- Select Schedule as ‘Every 1 hour’ Select Start Date and Time As default.</br>- Click on ‘Enable’</br>- Repeat the steps for the following metrics: ‘Guest Lifetime Value’, ‘Guest Classification’, ‘Guest Satisfaction Score’ | ![55](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/a34a6669-d3a6-4ca3-8add-3caacb00ebc4) ![58](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/1a5a6f5b-d5da-4170-a47b-7086fba2e814) ![57](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/9d325639-fab1-4986-af0e-4044d80cdedd) ![56](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/a2e53813-5ba3-4724-9b62-162a78daa693)|

### 10. Create Data Graph
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  Create Data Graph |- Click on Data Graph Tab</br>- Click on New</br>- Select Create from Data Kits</br>- Select Sunshine Trails DK </br>- Select **Hospitality Realtime Profile**. | ![60](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/49b35d68-0487-4f22-938e-f76a529e782c) ![59](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/09ba6d29-299b-409e-80a1-c64521f6c9a0)|
  |   |- Select primary Data model object as “Unified Individual real”. | ![62](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/ea4c8fac-aa31-4ac7-a2a1-96eb502367ea) ![61](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/83a5f9f2-b108-4f9c-822c-8477f7e199e7)|
  |   |- Click on Individual and go to the right side where the error is showing and uncheck the check box.</br>- Now click on Save & Build. | ![64](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/65850fc7-2a43-4457-bb16-496cd147a599) ![63](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/0f0b5a28-d0ed-4594-9060-65787288c313) ![65](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/674da982-5fa1-4a95-8a6f-56ec375f3548)|

### 11. Create Data Cloud Related List Enrichment
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Booking Related List |- Click on Setup</br>- Object Manager</br>- Search for Contact</br>- Click on Contact</br>- Click on Data Cloud Related List Enrichment.</br>- Click on New</br>- Select default data space</br>- Select Data Cloud object as ‘Booking__dlm’</br>- Click Next </br>- Give Child Relationship Name as ‘IndividualBookings’</br>- Give Related List Label as ‘Individual Bookings’ Click Save. | ![67](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/3aa8060c-07fe-432c-ac57-7024dee972b1) ![66](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/a3664250-d78c-426b-900f-3a093f54f34b)|
  | Create Reservation Related List |- Click on Setup</br>- Object Manager</br>- Search for Contact</br>- Click on Contact</br>- Click on Data Cloud Related List Enrichment.</br>- Click on New</br>- Select default data space & Select Data Cloud object as ‘Reservation__dlm’ </br>- Click Next </br> - Give Child Relationship Name as‘IndividualReservations’</br>- Give Related List Label as ‘Individual Reservations’ Click Save. | ![69](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/136cc25d-ceab-450c-b7f3-41a1e471a3c5) ![68](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/bc0f235b-1b12-4ede-bb59-3191d25ec547)|
  | Create Data Cloud Related List Enrichment for Third Party Survey|- Click on Setup </br>- Click on Object Manager </br>- Search for Contact </br>- Click on Contact </br>- Click on Data Cloud Related List Enrichment.</br>- Click on New </br>- Select default data space -> Select Data Cloud object as ‘Third Party Survey’  </br>- Click Next </br>- Give Child Relationship Name as 'Third_Party_Survey’ </br>- Give Related List Label as ‘Third Party Survey’ Click Save | ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/5593265a-5b51-4bcf-9cb2-6e45429c0299)|

### 12. Create Data Cloud Copy Field Enrichment
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Data Cloud Copy Field Enrichment for ‘Customer Classification’ |- Go to Object Manager.</br>- Search for Contact.</br>Click on Contact</br>- Click on Data cloud Copy Field.</br>- Click on New.</br></br>- Select data space as ‘default’</br>- Select Data Cloud Object as Guest Classification‘ whose API name will be this Guest_Classification__cio’ Click on Next </br></br>- Select data space as ‘default’ </br>- Select field as ‘Customer Class’. Click Next </br> - Give Label as ‘Guest Classification’ </br> - Click ‘Next </br><br>- On contact -> Data Cloud Copy Field Enrichments -> Guest Classification </br>- In Customer_Class under contact “click to Edit” </br>- Select Customer Class </br>- Save and Start Sync.| ![70](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/8a3ec692-ac7e-4ab3-96d3-e6e1135a4abe) ![72](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/569ae359-861a-471e-bbe3-72044dd60b51) ![71](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/d4de3b33-0cd0-4884-9556-e276dc9ad532)|
  |  |- Give Label as ‘Guest Classification’</br>- Click on ‘Next.</br>On contact Select Customer Class</br>- Save and Start Sync. | ![76](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/7df6498a-e3cc-458c-b8f6-55bab552b51b) ![75](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/9428abf5-d190-4bce-8d9b-a970e9fc141d) ![74](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/423f1b53-668f-4b32-95a3-51e198b0e74b) ![73](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/5b6fcf62-5807-4dab-9f85-36bd9938ec65)|
  | Create Data Cloud Field Enrichment of ‘Guest Lifetime Value’ |- Go to Object Manager</br>- Search for Contact.</br>- Click on Contact</br>- Click on Data cloud Copy Field.</br>-Click on New.</br>- Select data space as ‘default’ > Select Data Cloud Object as ‘Guest_Lifetime_Value__cio’ </br>- Click on Next </br>- Select Field As ‘GLV’</br>- Give Label as ‘Guest Lifetime Value’</br>- Click on ‘Next </br> - Select Field GLV </br>- Give Label as ‘Guest Lifetime Value’</br> - Click on Next </br> - On contact Select Lifetime_Value__c </br>- Save and Start Sync.| ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/8a0f00a4-d8f0-4bd8-82b5-66e32f230d7f)![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/a73678ec-bcad-4ea2-b2e6-5559fc21aee9)|
  | Create Data Cloud Field Enrichment of ‘Guest Statisfection Score’ |-> Go to Object Manager.</br>- Search for Contact.</br>- Click on Contact</br>- Click on Data cloud Copy Field.</br>-  Click on New.</br>- Select data space as ‘default’</br>- Select Data Cloud Object as ‘Guest_Satisfaction_Score__cio’</br>- Click on Next</br>- Select Field As ‘GSS’</br>- Give Label as ‘Guest Satisfaction Score’</br>- Click on ‘Next</br>- On contact Select Guest_Satisfaction_Score__c </br>- Save and Start Sync.|![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/27a4a5e1-2404-4d89-8f56-d1c5ce96a396)![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/0162fe29-0205-405e-a98d-a1ee5ba20d16)|
  | Create Data Cloud Field Enrichment of ‘Guest Stay Matrics’ |- Go to Object Manager.</br>- Search for Contact.</br>- Click on Contact</br>-  Click on Data cloud Copy Field.</br>- Click on New.</br>- Select data space as ‘default’</br>- Select Data Cloud Object as ‘Guest_Stay_Metrics__cio’</br>- Click on Next </br>- Select Fields Total_Stays, Total_Room_Nights, Total_Spend, and Avg_Nights_per_Stay</br>- Give Label as ‘Guest Stay Metrics’</br>-Click Next</br>- Map Fields with below Contact Fields </br>
| | Data Cloud: Guest stay Matrics | Contact Object|
| |Total_Stays|Total Stays|
| |Total_Stays__c|Total_Stays__c|
| |Total_Room_Nights|Total Room Nights|
| |Total_Room_Nights__c |Total_Room_Nights__c |
| |Total_Spend |Total Spend|
| |Total_Spend__c |Total_Spend__c|
| |Avg_Nights_per_Stay |Avg_Nights_per_Stay |
| |Avg_Nights_per_Stay__c|Avg_Nights_per_Stay__c |
|| </br>- Save and Start Sync|![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/cae1aa06-e3ae-43cb-978a-be531439394d) ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/56f9eed2-b880-4963-93c1-8935a81eb326)|
</details>

<details><summary>
  
  ## 4. Commerce Cloud Configuration
</summary>

## Table of Contents

[1. Verify Organization Wide Address Exists or not](#1-Verify-Organization-Wide-Address)

[2. Install Agent and Experience Site Package	](#2-Install-Agent-and-Experience-Site-Package)

[3. Create Commerce Data	](#3-Create-Commerce-Data)

[4. Search Update	](#4-Search-Update)

[5. Upload CMS Images into the Store	](#5-Upload-CMS-Images-into-the-Store)

[6. Add CMS Product Image	](#6-Add-CMS-Product-Images)

[7. Enable Self Resgistration	](#7-Enable-Self-Resgistration)

[8. Share CMS with Site workspace	](#8-Share-CMS-with-Site-workspace)


### 1. Verify Organization Wide Address
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Verify Organization-Wide Address Exists or not |- Go to Setup \-\> Search for Organization-Wide Address \-\> Click on Organization-Wide Addresses</br>-  Verify if there is an organization-wide address with the name ‘Default Email’ created and verified.</br>- If there is none, then please create an organization-wide address by following below steps</br>- Click on **Add** button \-\> On the Display Name Add **‘Default Email’.** On the Email Address \<Add your email address\> Select ‘Default No-Reply Address’ on Purpose field \-\> click check box **‘allow all profiles to use this from address’**   | ![77](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/9afd50b1-fa58-4d27-9b19-88de6aa07745) ![78](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/35a60128-25d2-40c9-b9f7-3c7337e52248)|

### 2. Install Agent and Experience Site Package
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Install Agent & Exp Site Package |- Install VSCode [Download](https://code.visualstudio.com/download) </br>- Setup CLI a. Install the Salesforce CLI  https://developer.salesforce.com/tools/salesforcecli or check that your installed CLI version is greater than 2.56.7 by running sf \-v in a terminal.</br>- If you need to update the Salesforce CLI, either run sf update or npm install \--global @salesforce/cli depending on how you installed the CLI.</br>- Install Extension</br>- Open VSCode \> Go To\> Extensions-\>Salesforce Extension Pack\>Install</br>- Open Terminal Clone git Repository by using below command </br> ```git clone https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo.git``` </br>- Open the Project </br>- Authorize an Org</br>- Type Ctrl+Shift+P Select SFDX:Authorize an Org</br>- Select Project Default</br>- Enter the Org alias</br>- Authorize the Org</br>- Open terminal type **sf project deploy start --source-dir force-app** </br>- If you have AWS S3 Connection Created and Installed AWS Related Data Stream from Doc.3, then execute below SFDX command to deploy **else do not execute**. </br>- Open terminal type **sf project deploy start --source-dir st-aws-app** </br> | ![82](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/6bb0282c-c6b4-4036-bb3f-44e1b6316974) ![81](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/dc784557-4ccc-47bc-89b5-6e3dc3192fa3) ![80](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/d642dd5b-5d5b-4239-a141-a6b75842899f) ![79](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/8684961a-8460-4fb9-8926-0bf4c02f7483) ![83](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/1331c913-7ec4-4d5c-bafb-82c65da17f27) ![85](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/a88fbebc-45b6-4f5a-8b43-f256fce1baa6) ![84](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/d3d99be5-adac-4741-a19f-c60f3af03af1)|

**NOTE:** $${\color{red} Skip \space the \space below \space steps \space if \space you \space wish \space to \space bring \space in \space your \space own \space Product \space data}$$
$${\color{red} 3.\space Create Commerce Data}$$
$${\color{red} 4.\space Search Update}$$
$${\color{red} 5.\space Upload CMS Images into the Store and}$$
$${\color{red} 6.\space Add CMS Product Images}$$

### 3. Create Commerce Data
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Create Data  | - Click on App Launcher, search for Sunshine Trails Hospitality and click on Sunshine Trails Hospitality Setup App</br>- Click on the **“Create Commerce Data”** button (highlighted in the screenshot to the right) and wait for a confirmation message before proceeding further. | ![86](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/1a0b7b36-6a55-4a44-b97c-a49122f15483)|


### 4. Search Update
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Search Update |**Enable Commerce App** </br>- Click Setup and search for Commerce</br>- Click Settings under Feature Settings --> Commerce</br>- Use the toggle to switch on the Enable the Refreshed Commerce App</br></br>**Enable Search Index**</br>- Click on App Launcher, search for Commerce and select Commerce application</br>- In the Store dropdown, choose Sunshine Resort Store</br>- Scroll down to Setting and expand it</br>- Click on Search</br>- Use the toggle to turn on Automatic Updates | ![88](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/98e99dd4-998d-4ed8-9764-780b14d06271) ![87](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/c63f28a7-2a01-41cb-8508-78e4f74a9eb1)|
  
### 5. Upload CMS Images into the Store
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Upload CMS Images into Store  |- Download Images from [CMS Images](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/tree/master/Product%20Images) </br>- Click on App Launcher\>\> Select commerce application\>\> Click on Store</br>- Open Sunshine Resort Store</br>- Scroll down to Content Manager</br>- Click on Add workspace</br>-  Enter details such as Name "Commerce Store Images" and select Enhanced CMS Workspace and click on Next</br>- Add Sunshine Resorts Channel as Public and Sunshine Resorts site and click Next</br>- Keep language as it is and click on Finish</br>-  Click on Add and select Content \>\> select images\>\>Click on Create button\>\> click on upload button\>\>Select Image\>\>Image and Title populated\>\>Enter API name (can be the same as file name)\>\> Save it\>\> Click on Publish button\>\> Keep Details as is\>\> Click on Next\>\> Select Publish Now\>\>click on publish now button </br>- Please repeat the above steps for all the images| ![94](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/03c108c7-4004-4ae8-b4a1-802cebef89c4) ![93](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/06f52aa5-e0a9-4c30-a1e4-bd2330debaf7) ![92](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/a1216ba2-4d51-45c8-93d1-04002877e923) ![91](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/2f5229c2-4e1e-44cc-8a95-c35ec8acca9f) ![90](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/2b3830ba-0123-46b7-aef4-891069f28197) ![89](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/9c05f360-f14c-4cc1-acf2-aea1d36a6bf4) ![101](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/c486f50f-f51c-4369-9836-74e5ba8dfaa4) ![100](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/435ee016-2a61-493d-aea4-52949f8e0dde) ![99](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/cd0b5f59-64ab-45d1-a3d1-f523e9c89fea) ![98](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/91d693b3-4213-4f77-8c78-2792d11dd1cf) ![97](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/69cadb36-944e-4255-b0ed-04848999632b) ![96](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/0ce6fd02-ea71-42fa-8d8b-8182af5dca01) ![95](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/af51a0c7-0bbc-4ed4-bf7f-2c8bdf62ed2d)|


### 6. Add CMS Product Images
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Add Image to a Product   |- Click on App Launcher\>\> Select commerce application\>\>Click on Store</br>- Open Sunshine Resort Store </br>- Expand Merchandise\>\> Product\>\> open one by one product</br>- Click on eye icon (it removes Site window) after save button</br>- Confirm that "Products" is selected under categories</br>- Scroll down \>\> click on Go to global product record</br>-  Go to Media\>\> Click on Add image for Product details Image section \>\> Select appropriate image from Commerce Store image\>\> click on Add button</br>- Click on Add image for Product list Image section \>\> Select appropriate image from Commerce Store image \>\> click on Add button</br>- Repeat previous steps for each product </br>- Go to store\>\> select Sunshine Resorts \>\>Scroll down to Website Design\>\> select product category from dropdown \>\> click on Publish button (this step maybe not be needed if you are commerce console)</br>- Go back to Sunshine Resort Store\>\>Click on Home\>\> click on preview the site and see product is getting displayed | ![102](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/46082359-d41c-41c9-b1d6-f70615e1da05) ![113](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/795f54fb-2093-455d-a449-d36c8b515de2) ![112](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/78a3c79d-ead4-4b00-b73e-cb2380453cb7) ![111](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/cba77d1f-cda3-4d39-8b9c-f60daef0d53a) ![110](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/aaadc7a7-34df-459c-950f-269186a978f2) ![109](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/60a7894a-64b2-489f-bbbd-cf8df27fc9f2) ![108](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/a62a83ba-19fd-41a2-aeed-f5901f513304) ![107](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/b7bc3399-5145-4e3e-8e81-b0a63f07eacb) ![106](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/63cb67f8-8601-4c21-8501-b0ad42e18ef4) ![105](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/58a5f582-20da-4be7-b1de-abb97112c112) ![104](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/83f6bb56-f0b3-45ff-9c5c-0002520f5b4a) ![103](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/e41ab925-4b4d-4c1a-9180-22b77f129773)|

### 7. Enable Self Resgistration
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Enable Self Registration   |- Click on App Launcher>> Select commerce application>>Click on Store</br>- Open Sunshine Resort Store</br>- Settings >> Store</br>- Click on Buyer Access Tab</br>- Scroll down to Self Registration (enable if it’s not enabled)</br>- Select Account RecordType to “Business Account” </br>- Select Default Buyers Group to “Sunshine Resorts Buyer Group"</br>- Click Save   |![Screenshot 2025-04-17 at 4 47 01 PM](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59549/d6610304-6264-476a-8fa9-cba29ee815e1)|



### 8. Share CMS with Site workspace
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Share CMS with Site workspace   |- Click on App Launcher and search for CMS Workspaces</br>- Select CMS Workspaces</br>- Click on "Commerce Store Images" (the CMS created in previous step</br>-  Click the gear icon (at the top right) and select "Workspace Sharing" from the dropdown</br>- Move "Sunshine Resorts Managed Content Space" to the right (under Shared) and click Next </br>- Click Save |![image (22)](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59549/97878f81-a29f-4123-b58e-bee0aa36484f)|

</details>


<details><summary>

  ## 5. Connect and Create Sample Data
</summary>

## Table of Contents

[1. Create Sample Data	](#1-create-sample-data)

[2. Enable Test Account as Buyer Account	](#2-enable-test-account-as-buyer-account)

[3. Create Community User and Assign User to Buyer Group	](#3-create-community-user-and-assign-user-to-buyer-group)

[4. Setup Data in Snowflake	](#4-setup-data-in-snowflake)



### 1. Create Sample Data
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Sample Data | - Click on App Launcher, search for Sunshine Trails Hospitality and click on Sunshine Trails Hospitality Setup App</br>- Click on the **“Create Test Data”** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. | ![114](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/7c639947-0b3d-428e-adf6-167964a4175a)|

### 2. Enable Test Account as Buyer Account
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Enable Account as Buyer Account | - Click on Setup</br>- Go to Object Manager</br>- Click on Account</br>- Click on Page Layout</br>- Click on "**Page Layout Assignment**"</br>- Click on ‘**Edit Assignment**’</br>- Select "SDO-Account" Layout under Record type "Account" for System Administration Profile </br>- From Page Layout to Use dropdown Select "Account layout"</br>- Click on Save</br>- Verify that, for "**System Administrator profile**" for Record type **"Account"** Page layout should be ‘**Account Layout’** </br>- Go Account Tab \-\> Search for Account Name **"Sunshine Experience"** (test Account created in previous steps). Make sure to remove any filter if it exists \-\> Click on that Record</br>- On Record Page click on the **"Enable as Buyer"** Quick Action | ![120](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/76e11e0d-23c4-4295-8dab-7fdced41aabb) ![119](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/aa464a8f-eca5-46f5-bc41-ae613ff154ed) ![118](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/f84ed59a-c0d7-49ee-9aa1-624c89f75987) ![117](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/6bbfa3a8-ddc3-4b90-bed3-a1ebce77af52) ![116](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/c8c95af1-5a7f-4094-ada4-3d3d505ac07e) ![115](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/16ebd1c1-4640-4f70-b509-f3fed6e7cac0)|

### 3. Create Community User and Assign User to Buyer Group
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Community User and Assign Buyer Account to Buyer Group |- Click on App Launcher, search for Sunshine Trails Hospitality and click on Sunshine Trails Hospitality Setup App</br>- Click on the **"Create Buyer Group Member Data"** button (highlighted in the screenshot on the right) and wait for a confirmation message before proceeding further.</br>- **Note:** If the confirmation message does not appear after 5 minutes, refresh the page and if the **"Create Buyer Group Member Data"** button is disabled, proceed. | ![121](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/e4e68c06-a45d-4583-952b-e0b9c7d57004)|

### 4. Setup Data in Snowflake
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Table to hold POS data | - Login to the Snowflake Database/Schema that is connected to Data Cloud and run the below DDL script to create DEMO\_HOSPITALITY\_POS\_DATA table.  |  |
```
create or replace TABLE <<database_name>>.<<schema_name>>.DEMO_HOSPITALITY_POS_DATA 
( 
    TRANSACTIONID VARCHAR(30),
    DATE DATE,
    TIME VARCHAR(100),
    CUSTOMERID VARCHAR(30),
    ITEMID VARCHAR(30),
    ITEMNAME VARCHAR(100),
    QUANTITY NUMBER(38,0),
    UNITPRICE NUMBER(38,2),
    TOTALPRICE NUMBER(38,2),
    PAYMENTMETHOD VARCHAR(30)
)
```

| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Load data into DEMO_HOSPITALITY_POS_DATA table | - Load data in the below csv file into DEMO_HOSPITALITY_POS_DATA table: [DEMO_HOSPITALITY_POS_DATA csv](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/blob/master/Snowflake%20Data/DEMO_HOSPITALITY_POS_DATA.csv)  |  |
| Create Table to hold IOT data | - Login to the Snowflake Database/Schema that is connected to Data Cloud and run the below DDL script to create DEMO_HOSPITALITY_IOT_DATA table.  |  |
```
create or replace TABLE <<database_name>>.<<schema_name>>.DEMO_HOSPITALITY_IOT_DATA
(
    EVENTID VARCHAR(30),
    KEYID VARCHAR(30),
    ROOMNUMBER VARCHAR(30),
    GUESTID VARCHAR(30),
    GUESTNAME VARCHAR(100),
    PHONENUMBER VARCHAR(30),
    ACCESS_DATE TIMESTAMP_NTZ(9),
    ACCESS_OUTCOME VARCHAR(30)
)
```
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Load data into DEMO_HOSPITALITY_IOT_DATA table | - Load data in the below csv file into DEMO\_HOSPITALITY\_IOT\_DATA table: [DEMO_HOSPITALITY_IOT_DATA.csv](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/blob/master/Snowflake%20Data/DEMO_HOSPITALITY_IOT_DATA.csv)  |  |
| Grant Access to the Tables in the Database/Schema | - While still logged in to Snowflake, execute the following statement  |  |
```
grant select on tables in <<database_name>>.<<schema>> to role sysadmin
```
</details>

<details><summary>

  ## 6. Finish Configuration
</summary>

## Table of Contents

[1. Configure AWS File Notification	](#1-configure-aws-file-notification)

[2. Refresh Amazon S3 Data Streams	](#2-refresh-amazon-s3-data-streams)

[3. Refresh Snowflake Data Streams	](#3-refresh-snowflake-data-streams)

[4. Run Identity Resolution Ruleset	](#4-run-identity-resolution-ruleset)

[5. Run Calculated Insights	](#5-run-calculated-insights)

[6. Activate Messaging Setting	](#6-activate-messaging-setting)

[7. Update Einstein Search Retriever	](#7-update-einstein-search-retriever)

[8. Configure Digital Experience.	](#8-configure-digital-experience)

[9. Enable Login Access.	](#9-enable-login-access)

[10. Change the layout of the Login page.	](#10-change-the-layout-of-the-login-page)

[11. Share Product Object to External User.	](#11-share-product-object-to-external-user)

[12. Enable Org Theme Option on Sunshine Resort App.	](#12-enable-org-theme-option-on-sunshine-resort-app)

[13. Change the layout of the Register page.	](#13-change-the-layout-of-the-register-page)

[14. Change the email Address.	](#14-change-the-email-address)

[15. Add Agent User into Agentforce Service Agent and Activate	](#15-add-agent-user-into-agentforce-service-agent-and-activate)

[16. Create Trusted URLS	](#16-create-trusted-urls)

[17. Create CORS	](#17-create-cors)

[18. Publish ESA	](#18-publish-esa)

[19. Assign Contact Record Page as Org Default.](#19-assign-contact-record-page-as-org-default)

[20. Create a New Version of Omni-Channel Flow.](#20-create-a-new-version-of-omni-channel-flow)

[21. Access email Deliverability to all email.](#21-access-email-deliverability-to-all-email)

[22. Prepare User.](#22-Prepare-User)

[23. General Notes.](#23-general-notes)


### 1. Configure AWS File Notification
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Configure AWS File Notification | - Navigate to **Setup** and search for **App Manager** </br>- Click in the down arrow for the **"AWS Unstructured"** app and select view. </br>- Next to Consumer key and secret, click **"Manage Consumer Details"** and copy the values. </br>- Share the values with the AWS team responsible to create the file notification function.</br>- For more details about how to setup file notification visit: (https://developer.salesforce.com/docs/data/data-cloud-int/guide/c360-a-awss3-udlo.html) | ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/60923/a46a9ca0-e979-4741-b5f0-8fc6f3596b37)
 |

### 2. Refresh Amazon S3 Data Streams
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Refresh Amazon S3 Data Streams | - Navigate to **Data Cloud** app and the **Data Streams** tab </br>- Query for **Third Party Survey** data stream </br>- Using drop down control on the right against the data stream  initiate refresh for the **Third Party Survey** data stream and  subsequently choose the **Refresh Only New Files** option: </br>- Once the data stream is refreshed validate that the **Total  Records** counts for **Third Party Survey** stream, it should be 42  | ![130](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/7a6deb16-a6ac-41a9-ae6b-a6db46a6d633)|

### 3. Refresh Snowflake Data Streams
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Refresh Snowflake Data Streams | - Navigate to Data Cloud app and the Data Streams tab </br>- Query for IOT\_Transaction data stream</br>- Using drop down control on the right against the data stream select Edit</br>- Select “Enable acceleration”</br>- In frequency select “Every 15 minutes”</br>- Select “Refresh initial file immediately” </br>- Repeat above steps for POS_Transaction data stream </br>- Once the data stream is refreshed, the Total Records counts for each Data Stream is not 0. | ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/60923/41afe7ad-028b-47c0-ab38-2b87fa756b87)
 |

### 4. Run Identity Resolution Ruleset
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|   Run Identity Resolution Ruleset  | - Navigate to Data Cloud app and the Identity Resolutions tab</br>- Query for Guest Profile ruleset</br>- Click on the Ruleset Name hyperlink to navigate to the ruleset’s record home page</br>- Click Run Ruleset</br>- The Last Job Status will turn to In Progress. Once the job completes successfully, this status will be set as Succeeded.  |  ![132](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/cfdf6edf-c290-4b46-a28b-4a4d4bdd18be)|

### 5. Run Calculated Insights (Need to schedule - Please hold on this)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Run Calculated Insights | - Navigate to Data Cloud app and the Calculated Insights tab</br>- Query for Guest Stay Metrics calculated insight</br>- Using the drop down control on the right, click "Publish Now" to refresh the Guest Stay Metrics calculated insight.</br>- When the Calculated Insight is refreshed successfully, the Last Run Status will show as Success.</br>- Repeat steps b & c for the below Calculated Insights. Ensure all Insights are refreshed successfully.</br>- Guest Lifetime Value</br>- Guest Satisfaction Score</br>- Guest Classification  | ![133](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/28a2cf87-a443-448f-af4f-56db8d4ea7b0)|


### 6. Activate Messaging Setting
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Activate Messaging Setting | - Navigate to Setup go to messaging setting</br>-  Click on ESA Channel \-\> Click on ‘Activate’</br>- Click on Checkbox then click on Accept  |  ![134](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/7070d2a0-cb94-47fb-9223-f3f1dbfca4d1) ![135](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/d42953e7-193b-4d87-8322-f8e755046031)|


### 7. Update Einstein Search Retriever (perform only if Amazon S3 Connection has been created )
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Update Einstein Search Retriever |- Click on **Setup**, in the Quick Find Box, enter Prompt Builder, and then select **Prompt Builder**</br>- Search for the Prompt Template named **AnswerHospitality Question** and click on the hyperlink</br>- Hover the cursor on text the next to 'Use this information to answer the question: ', click on Resource, click on Einstein Search, click on 'Hotel\_FAQ\_v3' and click on 'Hotel\_FAQ\_v3' Retriever</br>- On the right side click on default Hotel\_FAQ\_v3\_Retriever, in a Search text add value as "Input:Product.Name"</br>- Hover over cursor on next text on 'Use this information to answer the question:', click on Resource,  click on Einstein Search and click on Hotel\_Safety\_FAQ\_V2</br>- On the right side click on default Hotel\_Safety\_FAQ\_v2\_Retriever in a Search text add value as "Input:Product.Name"</br>- Click on Save As New Version click **Activate**   | ![139](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/1c6b3f03-0334-4aea-a413-51bb750cf283) ![138](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/31a0041b-588c-4058-ab1d-9ca8a3215a88) ![137](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/60a69509-2426-4202-abcf-58b14242ddbf) ![136](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/2483ab08-e240-4c08-aedc-730af2d2de0f)|


### 8. Configure Digital Experience
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Configure Digital Experience. |- Click on **Setup**, in the Quick Find Box, enter Digital Experiences, and then select **All Sites**</br> -  Click on builder against the Site ***‘Sunshine Resort’*** </br> - Click on the ‘Banner’. Under Image Settings, click ‘Clear Image’</br> - Click on ‘Select Image from CMS’ \-\> Click on ‘Banner’ image and click save </br>- Click on **Page Structure Icon** on Left Side of Page </br>- Scroll Down and Click on ‘Embedded Messaging ‘and update as per screenshot below</br>- Select **Site End Point** as - ESW_ESA_Web_Deployment_1733127495782 </br> - Select **enhanced Service URL** from dropdown - it should be same as Site URL , refer Screenshot.</br>- Click on **'Page Structure'** Scroll Down and Click on **'Multilevel Navigation Menu'**. In the right-hand panel under Default Menu select **'Default Navigation'** </br>- Click on **'Page Structure'** Scroll Down to Footer Section under Column 1 , click on Link List then On the Right Hand Side on Default Menu Select **'Default Our Company Menu'**. </br>- Click on Link List inside Column 2 On the Right Hand Side on Default Menu Select **'Default get Help Menu'**.</br>- Click on Link List inside Column 3 On the Right Hand Side on Default Menu Select **Default my Account Menu** .</br>- Click on Social Link List inside Column 4 On the Right Hand Side on Default Menu Select **Default Social Media Menu** </br></br>- Click on Setup</br>- In the Quick Find box, type Digital Experiences, then select All Sites.</br> - Click on Builder next to the site named ‘Sunshine Resort’. </br> - At the top, use the search bar to find the Category Page, and open it.</br> - On the Category Page, select the Result Grid component.</br>- On the right-hand panel, change both the Column Spacing and Row Spacing to Large.
| | ![140](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/1b1c5269-8925-46a7-92da-009642f81b92) ![143](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/a3b142c6-7c38-4b14-8170-6aeeb4637378) ![142](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/441558a3-36fd-40b1-baca-2d604299873c) ![141](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/682890eb-e5e0-402c-8c87-14fc25f04917) ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/9c5387fb-7cf0-469f-99ea-01d34f6668d8) ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/6e998061-58fd-4130-a92b-b9fe31dfcc8b) ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/28c8676a-4575-4c2d-8e40-8db2dff7838c)![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/e16a9e9c-cf6b-415f-a253-7181287576ab)![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/b96377f5-eadd-4698-9fc9-ea22be394d97) ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/de196be8-3553-46c6-b9f0-ff72b955aed0) ![image (20)](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59549/ca7c0057-b51d-4915-a3e7-e8b12a09eb95)|

### 9. Enable Login Access
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Enable Login Access. | - Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites</br>- Against the site ‘Sunshine Resort’, click on Workspaces</br>- Under My Workspaces, click on Administration</br>- Click on Login & Registration menu item</br>- Under Login Page Setup, change Login Page Type to Experience Builder Page</br>- For URL, choose Login</br>- Under Password Pages, change Forgot Password to Experience Builder Page</br>- Choose Forgot Password</br>- Under Registration Page Configuration enable "Allow customers and partners to self-register"</br>- Choose Registration Page Type as Experience Builder Page</br>- Choose Register</br>- Assign users to a profile and account, choose Sunshine Resort Profile</br>- Assign Permission Set Group as "Hospitality Industries Permission Set Group"</br>- Click Save | ![145](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/763bfb05-321e-420f-8df9-687194c4407e) ![144](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/75c19acc-a888-4ffb-b36e-223323bdfd44) ![147](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/58bbe1f5-586c-4e32-a41c-578cecd101cf) ![146](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/46da2746-abca-4e2b-89f6-661cb6aa86b8)|

### 10. Change the layout of the Login page
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the layout of the Login page. |- Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites </br>- Against the site ‘Sunshine Resort’, click on Builder</br>- From the Pages dropdown, search for Login, and then select Login </br>-Remove the site logo and add a Text Box component. Enter the text as "Sunshine Resorts", make it bold and center</br>- Publish the changes  | ![148](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/dc844462-7b64-4cf6-be5f-69ac6d8bb7b6)|

### 11. Share Product Object to External User
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Provide Product2 Sharing  |- Go to Setup, in the Quick Find Box, search for Sharing Setting </br> - Click on Sharing Setting (under Security) </br> - Click Edit </br> - For Product Object, under Default External Access, select "Public Read Only"</br> - Click Save  | ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/974cc058-bdd6-4131-961d-6e07d01a5728)|


### 12. Enable Org Theme Option on Sunshine Resort App
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Enable Org Theme Option on Sunshine Resort App  |- Go to Setup </br>- Search for App Manager</br>- Click on App Manager </br>- Click on Edit Related to "Sunshine Trails Hospitality"</br>- Check the checkbox under "Org Theme Options"</br>- Click Save| ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/a4d7d689-ac9f-475c-912c-57e6b730baf1) ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/23072f71-3c32-411c-9227-9e3341992f77)|

### 13. Change the layout of the Register page
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the layout of the Register page |- Go to Setup, search for Digital Experiences, and select All Sites</br>- Against the site 'Sunshine Resorts', click on Builder</br>- From the Pages dropdown, search for Register, and select Register</br>- Remove the site logo and add a Text Box component. Enter the text as "Sunshine Resorts", make it bold and center (perform this step only if the “Sunshine Resorts” text box doesn't exist)</br>- Publish the changes  | ![149](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/9b4666f0-7ae2-4948-906b-548cdd821816)|


### 14. Change the email Address
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the email Address. |- Go to Setup \-\> Open All Sites</br>- Click on Workspaces (the configured Sites) \-\> Click Administrator</br>- Click on Emails</br>- Change Sender email to system admin email</br>- Click on save | ![150](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/52eba272-e10e-4422-aa71-dd8578fd5233)|


### 15. Add Agent User into Agentforce Service Agent and Activate
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Add Agent User into Agentforce Service Agent & Activate |- Click on setup, search for Agent</br>- Click on Agentforce Agents (under Einstein --> Einstein Generative AI --> Agentforce Studio)</br>- In the Agent list, click on 'Agentforce Service Agent'</br>- In the Details tab, click on the pencil icon against **"Agent User"**, select 'Agent User' </br>- Check the check box **'Keep a record of conversations with Enhanced Event Logs to review agent behavior.'** </br>- Click on Save then click on Open Builder </br>- Click Activate  | ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/1d41102c-392f-41bd-af54-daf49b6bf52d) ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/950989d3-90fe-456a-add0-8f73c8af4b00)|


### 16. Create Trusted URLS
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Trusted URLS |- Navigate to Setup, in Quick Find search Trusted URLs and click on Trusted URLs (under Security)</br>- Click on New. Key-in 'TrustedSite2' as the API Name</br>- Use https://DOMAINNAME.my.site.co for URL</br>- Replace DOMAINNAME with actual org Domain Name.</br></br> **To find the Domain name please follow the following steps:** </br>- Navigate to Setup, in Quick find search Domain → Please add https://DOMAIN from the below path (please select domain which is related to the experience cloud Sites Domain)</br>- Click on Save</br></br> **Add Trusted URL to Agent Sites** </br>- Click on Setup</br>-  Click on Sites \-\> Check the check box if Domain is not enabled, Click on **'Register My Salesforce Site domain'** button </br>- Click on ‘ESW\_ESA\_Web\_Deployment\_1733127495782’</br>- Click on Add Domain</br>- Add DOMAINNAME with actual org Domain Name.</br></br> **To find the Domain name please follow the following steps:** </br>- Search for Domain in Quick find → Please copy the name which ends with **.my.site.com** (e.g epicorgfarm79.my.site.com) </br>- Navigate to Setup, in Quick Find search All Sites </br>- Click on All Sites (under Digital Experiences) </br>- Click on Builder against Sunshine Resort </br>- Click on Settings and then 'Security & Privacy' </br>- Click on Add Trusted Sites button - Add Name as 'TrustedSite1' and add url as domain name, which you have copied on prev steps (e.g https://e.g epicorgfarm79.my.site.com) </br>- Click Publish | ![160](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/7111245c-1d01-4c41-9f67-cd533e63999a) ![159](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/c1eb7395-ad4f-4d8e-9eab-6a13ce1eeb6f) ![162](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/0ff12c74-10da-49b9-846e-cc101e679e15) ![161](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/7d0e4a03-ab9a-4016-bd04-2b42beeea9f7) ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/97ea5fb1-9264-4bb7-8bd5-39314ec80293)|

### 17. Create CORS
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create CORS |- In the Quick Find\>Type CORS</br>- Click on New\> Paste **https://DOMAINNAME.my.site.com** In Origin URL Pattern </br>- Replace DOMAINNAME with actual org Domain Name.</br>\> Click Save</br></br>-Click on New . </br>- Paste **https://*.develop.vf.force.com** to 'origin URL Pattern'</br>- Click Save</br></br>- Click on New</br>- Paste **https://*.live-preview.salesforce-experience.com.** to ‘origin URL Pattern’ </br>- Click Save</br></br>- Click on New</br>- Paste **https://*.my.site.com** to ‘origin URL Pattern’</br></br> **To find the Domain name please follow the following steps:** </br></br> \> Search for Domain in Quick find → Please copy the name which ends with .my.site.com (e.g epicorgfarm79.my.site.com) | ![164](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/3f3efa41-d427-4632-a41e-3828ec952782) ![163](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/c66d4160-66ce-4938-87d2-d5f2cff7bb99)|

### 18. Publish ESA
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Publish ESA | - Click on Setup </br>- In Quick Find, search Embedded Service Deployments and click on 'Embedded Service Deployments' (under Feature Settings --> Service --> Embedded Service) </br>- Click on ESA Web Deployment </br>- Click on 'Publish' button </br>- Wait for confirmation Message | ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/8e85e570-a64f-4e1b-b5ef-4e1640d6d31c)|


### 19. Assign Contact Record Page as Org Default
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Assign Contact Record Page as Org Default. |- Click on Setup</br>- Click on Object Manager</br>- Click on Contact</br>-  Click on Lightning Record Page</br>-  Click on Contact Record Page (API Name should be 'Contact_Record_Page')</br>- Click on Edit \-\> Click on Activation \-\> Click on 'Assign Org Default' (Desktop and phone) \-\> Click on Save  | ![165](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/985bc334-913d-4cbd-8039-55bb5342ae21) ![166](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/2bbfa076-f7d6-42f1-aa7c-4b1c8276c0aa) |


### 20. Create a New Version of Omni-Channel Flow
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create a New Version of Omni-Channel Flow  |- Click on Setup</br>- Search for flow on Quick Button</br>- Click on Flow</br>- Click on the Flow</br>- Click on **Route To ESA** </br>- Deactivate the flow and click on the **Route To ESA** at the end</br>- Remove the Service channel and select some other option and then select “Live Message” again</br>- In Route To Select "Agentforce Service Agent"</br>- In Agentforce Service Agent Select "Agentforce Service Agent"</br>- Go to the Fallback Queue ID 🡪 Remove the Messaging Queue and add it back (same queue)</br>- Save as new version and activate the flow by clicking on the **Activate** button.  | ![170](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/81ffeb38-8a9b-47cc-a867-47100c2560d9) ![169](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/6e75ae4b-86cf-4404-87e8-5c6d5e430f84) ![168](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/d441f976-8b05-48f3-b036-9f025d33e0ab) ![167](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/1ab2cba7-d70a-49c9-8f24-156ade6a44d4)|

### 21. Access email Deliverability to all email
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Access email Deliverability to all email | Click on Setup </br>- Search for ‘Deliverability’</br>- Change Access Email from ‘System email Only’ to ‘All email’.</br>- Click Save | ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/afd1a98d-eb4f-4eae-aada-778f9d600cd7)|

### 22. Prepare User 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Prepare Test User |- To test Community functionality , please use : **Marje Croley** contact to login as experience user </br> - Navigate to Setup </br>- In the Quick Find box, search for Digital Experiences </br>- Click the ‘Allow users standard external profiles for self-registration, user creation and login checkbox </br>- Click Okay and click Save </br> </br> **Enable Community User** </br> </br>- Click the App Launcher</br>- Select the Sunshine Trails Hospitality app</br>- Navigate to the Contact of Marje Croley</br>- Click the 'Enable as Customer' button </br>- Update the User License to Customer Community Profile</br>- Update the Profile to Sunshine Resort Profile</br>- Update the Email field to your personal email  </br>- Click Save </br></br> **Update Marje’s Email** </br>- Click the App Launcher </br>- Select the Sunshine Trails Hospitality app </br>- Navigate to the Contact of Marje Croley </br>- Click the Edit button </br>- Update the Email field to your personal email </br>- Click Save  | ![image_720](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/60923/eb6ee648-89a8-4c86-ad77-ac5f12ef10ef) ![image_720](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/60923/d33d6132-7846-41e2-804e-fc4956bff861) ![image_720](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/60923/7338f891-4f0f-4111-b5ed-e1d91e0bb8d3) ![image_720](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/60923/639bf301-8a18-466a-95aa-645d7d1b8b57) ![image_720](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/60923/54561655-2cce-492d-a1c2-2659d832cf81)|


### 23. General Notes 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| General Notes for new community User | To test Community functionality , please use : **Marje Croley contact** to login as experience user </br> **Note:** If user self register from experience site sign up page, admin needs to add below permission set to that new community user </br>- **Buyer** </br>- **Customer Community Plus Permissions** </br></br> **Verify Product Experience Prompt Builder Activation** </br>Please ensure that the **Product Experience Prompt Builder** is active. </br></br> To verify: </br></br>&emsp;1. Navigate to **Setup**</br>&emsp;2. In the Quick Find box, search for **Prompt**</br>&emsp;3. Click on **Prompt Builder**</br>&emsp;4. Open **Product Experience**</br>&emsp;5. Check if it is Active</br>&emsp;&emsp;If not, please activate the **Prompt Builder**</br></br> **Enable EPSessionIdHelper Visualforce Page** </br>&emsp;1. Log into Salesforce, click the gear icon in the top-right corner, and select Setup</br>&emsp;2. In the Quick Find box, search for Visualforce Pages and select it.</br>&emsp;3. Locate EPSessionIdHelper in the list.</br>&emsp;4. Click the Security link next to the Visualforce page label</br>&emsp;5. In the Available Profiles list, select the following profiles:</br>&emsp;&emsp;Einstein Agent User</br>&emsp;&emsp;Sunshine Resort Profile</br>&emsp;&emsp;System Administrator</br>&emsp;6. Move them to the Enabled Profiles list using the arrow button</br>&emsp;7. Click Save to apply the changes | ![image](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59605/f7471bf4-692d-4e95-b749-775389fa3ac3)|
</details>


<details><summary>
  
  ## 7. Mulesoft Configuration for Amadeus Prices
  </summary>

  **IMP NOTE:** You may skip the MuleSoft section if it is not applicable to your use case. However, if you plan to use MuleSoft, please ensure you register with [Amadeus](https://developers.amadeus.com/self-service/category/hotels) to obtain your Client ID and Client Secret.</br>
  ### Table of Contents**
    
  [1.	Data Cloud Configuration Steps](#1-data-cloud-configuration-steps)

  [2.	Mulesoft configuration](#2-Mulesoft-configuration)

  [3.	Salesforce Configuration Steps](#3-salesforce-configuration-steps)
  
  [4.	Mulesoft Configuration Steps](#4-mulesoft-configuration-steps)


**Please check if the Ingestion API setup, Data Stream configuration and Data Mappings are already present in the org. If present, start with 3. Mulesoft Configuration**

### 1. Data Cloud Configuration Steps

   ##### 1.1.	Create an Ingestion API in Data Cloud (Skip if already performed)
   | Step  | Action and Details  |  Images |
   | ----- | ----- | ----- |
   | Configure an Ingestion API in Data Cloud |- Click on Setup</br>- Click Data Cloud Setup</br>- Under "External Integration", click Ingestion API</br>- Click New</br>- Provide the Connector Name as "Mulesoft Ingestion API"  | ![171](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/1f5163ff-dbdd-4615-a7bf-bf270d1ce17f)|

   ##### 1.2.	Upload the .yaml file to define the Schema (Skip if already performed)
   | Step  | Action and Details  |  Images |
   | ----- | ----- | ----- |
   | Download .yaml file |- Click on on the link below to download the .yaml file</br> https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/tree/master/Mulesoft%20Yaml%20File| |
   | Define the Order Schema |- Click on Upload Files</br>- Choose the downloaded schema .yaml file and upload</br>- Make sure the Connection matches the image  | ![172](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/78e08386-6780-4a87-af6c-0051dc2210d3) ![173](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/aad9375f-30f9-43d2-902e-739129751863)|

   ##### 1.3.	Create a Ingestion API Data Stream using the Schema object (Skip if already performed)
   | Step  | Action and Details  |  Images |
   | ----- | ----- | ----- |
   | Configure the Data Stream |- Go to App Launcher → Data Cloud → Data Stream.</br>- Click New</br>- Under Connected Sources, clik "Ingestion API"</br>- Click Next</br>- Choose "Mulesoft Ingestion API"</br>- In the Objects list choose "Order"</br>- Click Next</br>- Choose Category as "Engagement", Primary Key as "hotel_name" and Event Time Field as "created_date"</br>- Click Next</br>- Choose Data Space as "default"</br>- Click Deploy| ![174](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/acc0c86a-953f-4a7f-916c-6737af22cd59) ![175](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/b9193f61-3a2e-457b-9156-3664b9bd2511) |
   | Verify Data Stream |- Make sure the Data Stream configuration matches the image | ![176](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/0fb48645-756b-4f24-9979-6e4311173926) |

   ##### 1.4.	Configure Mapping to DMO (Skip if already performed)
   | Step  | Action and Details |  Images |
   | ----- | ----- | ----- |
   | Data Mapping |- Configure Source to Target mapping such that the mapping matches the image | ![177](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/baf299fa-0643-4fc1-8789-16205bc13b9e) |


### 2. Mulesoft configuration 
**Note: Skip if you are using the provided configuration XML file directly.**</br>
</br>XML File: https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/tree/master/Mulesoft%20configuration </br></br>- Open the **Streaming Insert Object** connector and click on **"Test Connection."** </br>- Enter the required credentials: **Client ID, Client Secret, Username,** and **Password**.
 These can be obtained from the **Connected App in Salesforce**. </br>- Ensure that the Connected App is created beforehand to retrieve these credentials. </br>- Store the credentials in the **Salesforce Connector App**.</br>


### 3. Salesforce Configuration Steps
   | Step  | Action and Details  |  Images |
   | ----- | ----- | ----- |
   | Create a Connected App | Create a New Connected App in Salesforce for securely integrating MuleSoft with Salesforce Data Cloud via APIs using OAuth2.0</br> Follow the steps below to create the Connected App.</br>&emsp;- Go to Setup, Search for App Manager and select App Manager</br>&emsp;- Configure the Connected App as shown in the image</br>&emsp;- Ensure you grant Profile level access to newly created Connected App to System Administrator profile | ![184](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/4c0a843d-0187-4f43-85d1-5ab04c62c30d) |
   |  | </br>- After creating the Connected App, click on Manage</br>- Configure the App to match the configuration shown in the image | ![185](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/252dc78d-5d24-4afe-b740-bb1066a23d4f) |
   |  | </br>- Go to Setup and search for OAuth and OpenID Connect Settings and enable the Allow OAuth Username-Password Flows | ![186](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/4ec8942a-54ba-496b-9876-363314ff4c35) |

### 4. Mulesoft Configuration Steps
   | Step  | Action and Details  |  Images |
   | ----- | ----- | ----- |
   |Update the Mule flow that inserts data from Mule to Salesforce Data Cloud via Ingestion API| |![183](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/66318fee-d992-4b00-9fed-a6f43ad436d5) |
   |  |**HTTP Request Connector step** </br>- API URL: https://test.api.amadeus.com/v1/security/oauth2/token</br>- Method: POST</br>- Body</br>&emsp;\%dw 2.0</br>&emsp;output application/x-www-form-urlencoded</br>&emsp;\---</br>&emsp;\{</br>&emsp;&emsp;grant_type: "client_credentials",</br>&emsp;&emsp;client_id: "xxxxxxxxxxxxxxxxx",</br>&emsp;&emsp;client_secret: "xxxxxxxxxxxxxxxxx"</br>\} | ![178](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/a78289a9-4dbf-4f8c-82c6-c05e2666a5eb)|
   |  | **Store Access Token step** </br>- Configure as shown in the image | ![179](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/1f3437ea-d172-4ae2-9be0-ce296b51b9ac) |
   |  | **Request To Get The Hotel Price step** </br>- API URL: https://test.api.amadeus.com/v3/shopping/hotel-offers</br>- Method: GET</br>- Pass the Header and Query Parameters (get the Hotel Id from Amadeus API and store in the query parameters to get prices for these Hotels)</br>Hotel Id list: MCLONGHM,RTPAR001,BRLAXRRB,ALLON591,ICTYOICB,HLDXB100,ARMADALC,ARMADCAR | ![180](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/0e2f0fe0-cfc0-48cb-be9c-9644c99045da) ![181](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/b6359d26-b92c-4b07-afdd-45b31449e6e3) ![182](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/3d440fcd-7040-47d2-8116-34558e40d97a) |
   |  |  **Transform Message step** </br>- Prepare the JSON (format given below) that is going the used in Salesforce Connector to ingest data via ingestion API</br>&emsp;\%dw 2.0</br>&emsp;output application/json</br>&emsp;var hotelName = ["Palm Oasis Resort","Coral Bay Retreat","Lagoon Paradise Resort","Emerald Bay Resort","Azure Cove Villas","Golden Palms Retreat","Sea Breeze Villas","Paradise Sands Resort"]</br>&emsp;\---</br>&emsp;\{</br>&emsp;&emsp;data: payload.data map(item, index) -> \{</br>&emsp;&emsp;&emsp;hotel_name: hotelName[index],</br>&emsp;&emsp;&emsp;cost: floor(item.offers[0].price.total as Number),</br>&emsp;&emsp;&emsp;created_date: now() as DateTime</br>&emsp;&emsp;\}</br>&emsp;\} | |
   |  | **Streaming - Insert Objects step** </br>- Setup the Salesforce Streaming Insert Object connector (to connect Mule to Salesforce), by providing appropriate Username, Password, Client Id and Client Secret </br>- Configure the connector by providing Source API Name: Mulesoft_Ingestion_API and Object: Order | ![187](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/69534670-df76-4cfb-8c0b-3a7212f541fc) ![188](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/assets/59551/a52bb7b2-683d-49d5-98ba-e2d3e2107503) |

</details>
