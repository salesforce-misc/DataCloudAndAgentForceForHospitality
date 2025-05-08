**Sunshine Trail Resorts**</br> 
=======================
Welcome to Sunshine Trail Resorts, a sample hospitality application. Sunshine Trail Resorts is a fictional resort that uses Agentforce, the power of Data Cloud, and the Salesforce Platform to deliver highly personalized guest experiences. Explore ways to bring agents into business workflows, including new smart automation capabilities, Search Property, content generation.

Did you watch the demo? The following are a set of instructions to setup the end to end demo in your own environment. While the end to end demo supports multiple clouds, you have full flexibility to use only the portions relevant to what you want to try out in your own org, additionally once the packages are installed you have the ability to fully customize it based on your needs. 

The Sunshine Trail app showcases **Data Cloud**, **Agents** and **Prompts**.

<details><summary>

  ## 1. Pre-Deployment Instructions 
</summary>

 4 step process
### 1. Salesforce Org Setup Requirements for Sunshine Resorts App

   **Option 1:** To support the Sunshine Resorts app, you can either create a new Salesforce Org or use an existing one, provided it includes the following features and licenses: 

  | Requirement | Details |
  | ----- | ----- |
  | Licenses Required | - Data Cloud</br>- Sales Cloud</br>- Service Cloud</br>- Loyalty Cloud</br>- Experience</br>- Commerce Cloud</br>- Marketing Cloud</br>- MuleSoft (Optional)
  | Features Required | - Service Agent</br>- Einstein Agent</br>- Copilot</br>- Prompt Builder</br>- Agent Force</br>- Real-time(Additional SKU)</br>- Code Builder (Optional) 
  
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

### 2. Install Pre-Deployment Package (10 minutes)

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Install package | - Click on this Package Installation [Link ](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t4W000002V5WS)</br>- Sign-in to the Org with your credentials.</br>- Choose Install for Admins Only option</br>- Choose “Rename conflicting components in package” and click the Install button.</br>- Wait until installation is completed, you will receive a confirmation on logged in user’s email |![image](https://github.com/user-attachments/assets/316f4e48-b9b2-4169-b362-fc3ecd9cd1b3) ![image](https://github.com/user-attachments/assets/0da1a771-abcc-4caa-b248-1b768905de60)|
  | Verify Package installation | - Click Setup</br>- Search for package</br>- Click on 'Installed PAckage' </br>- Search for 'Sunshine Trails Pre-Deployment Package' is installed  |![image](https://github.com/user-attachments/assets/8b76cd89-abec-4586-91cc-6b4b430dc68c)|

### 3. Enable Features on the Org (40 minutes)

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Enable Commerce Cloud | - From Setup, enter ‘Commerce’ in the Quick Find box.</br>- Select ‘Settings’ under ‘Commerce’.</br>- Turn on ‘Enable Commerce’. |![image](https://github.com/user-attachments/assets/2175d205-8c62-423f-9fc1-678d77e974d2)|
  | Enable Loyalty Management Features | - From Setup, enter ‘Loyalty Management’ in the Quick Find box.</br>- Select ‘Loyalty Management Settings’.</br>- Under ‘Consolidate Member Points for Expiration,’ turn on ‘Consolidate members’ fixed non-qualifying points in real time’. |![image](https://github.com/user-attachments/assets/9078ce06-e7ba-4488-8697-99fa5fec0736)|
  | Create a Basic Experience Builder Site | - From Setup, enter ‘Digital Experiences’ in the Quick Find box.</br>- Select ‘All Sites’ under ‘Digital Experiences’.</br>- Click New to open the Creation wizard with template options.</br>- Select the ‘D2C Commerce (LWR)’ template.</br>- Click Get Started. |![image](https://github.com/user-attachments/assets/6c89e37f-d61c-4333-8587-58a53504fbb7)|
  | Site Name and URL | - After selecting the template, enter a site name and URL.</br>- Name the site ‘Sunshine Resorts’ and ensure the URL ends with /SunshineResorts</br>- Click Create. Your site will be created in Preview status. |![image](https://github.com/user-attachments/assets/8f2226c0-8c2d-4e59-8734-983cd7f8c856)|
  | Activate Site | - From Setup, enter ‘Digital Experiences’ and select ‘All Sites’ under ‘Digital Experiences’.</br>- Click Workspaces next to Sunshine Resorts.</br>- Select Administration, then Emails. </br>- Under ‘Email Tabs,’ uncheck ‘Send welcome email’ and click Save.</br>- In Settings, click Activate and confirm by clicking OK.</br>- Your site will now be live and fully set up.|![image](https://github.com/user-attachments/assets/9a2208ce-6343-4e35-a2a4-0113ba61eef6)![image](https://github.com/user-attachments/assets/21e9b8de-9800-4c51-8324-d35a8a83447e)|

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Setup Data Cloud| - Enter “Data Cloud” in Quick Find box.</br>- Click on “Data Cloud Setup Home”.</br>- Click on “Get Started” if the Data Cloud instance is not set up.</br>- If already Data Cloud setup is done then you will not see Get Started option.</br>- Once the process is complete, the Data cloud instance is ready to use.</br>||
  | Verify Experience Delivery is Disabled | - Go to Setup → Digital Experiences → All Sites.</br>- Click Workspaces for ‘Sunshine Resorts’.</br>- Click Administration.</br>- Click on Settings.</br>- Experience Delivery should be disabled. If it’s enabled, please raise a Salesforce Case with the Support team to disable this feature.</br>||
  | Enable Data Cloud on Experience Site | - Go to Setup → Digital Experiences → All Sites.</br>- Click Builder for ‘Sunshine Resorts’.</br>- Click Settings → Integrations.</br>- Click Add to Site for Data Cloud.</br>- Enable “Share site data with Data Cloud” and click Save.</br>- Once enabled, a green box will appear</br>- Click Publish in the top-right corner | ![image](https://github.com/user-attachments/assets/996aa779-f82d-4bda-b54a-7b1ec99a9bb9)![image](https://github.com/user-attachments/assets/94b29e9e-5dcc-4d75-8db7-37de1b30e42b)|
  | Verify Data Stream  | - Go to App Launcher → Data Cloud → Data Stream.</br>- Change List View to All Data Streams.</br>- Search for Experience\_Cloud.</br>- 6 total Data Streams should appear |![image](https://github.com/user-attachments/assets/a9ae0e22-be7f-475d-980a-5458156b3691)|
  | Create a Record on Custom Metadata | - Go to Setup \-\> Search for Metadata type \-\> Click on ‘Install Package Settings Enabled’ \-\>   Click on **Manage Install Package Settings Enabled** \-\>Click on ‘New’ \-\> Give Label as  **Package Settings Enabled** and **Check Checkbox of Installation Settings Enabled Field.** Click Save|![image](https://github.com/user-attachments/assets/bc667a84-daf9-4e35-b003-45c8de4be360) ![image](https://github.com/user-attachments/assets/7edbecd9-ceb2-4566-bd14-54664ebfd084)|


### 4. Setup the Salesforce Org (30 minutes)

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Assign Data Cloud Permissions to Standard Object  | - Click on App Launcher, search for Sunshine Trails Hospitality and click on **Sunshine Trails Hospitality Setup** App</br>- Click on the “**Assign Permissions for Standard Objects**” button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further.  |![image](https://github.com/user-attachments/assets/34234749-7ebb-4659-9c26-9adf3932a75e)|
  | Assign Data Cloud Permissions to Custom Objects & Custom Fields | - Click on App Launcher, search for Sunshine Trails Hospitality and click on **Sunshine Trails Hospitality Setup** App</br>- Click on **“Assign Permissions for Custom Object”** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further |![image](https://github.com/user-attachments/assets/fdab8405-42cc-4cb7-a724-cb6a790d2acb)|
  | Modify the Data Cloud Admin Permission Set | - Open the Setup Menu and click Setup</br>- In the Quick Find, search for ‘Permission Sets’ and click ‘Permission Sets’</br>- Click the ‘Data Cloud Admin’ permission set</br>- In the Apps section, click ‘Data Cloud Data Space Management’</br>- In the Data Spaces panel, click Edit.</br>- Check the ‘Enabled’ checkbox for the default data space and click Save</br>- Click OK in the confirmation dialog |![image](https://github.com/user-attachments/assets/f8650c78-d64a-4a30-9636-9633a13baed8)|
  | Create a Connection to Amazon S3. S3 is used to bring in structured and unstructured data. Unstructured data is used to drive Agent conversations in this setup </br>$${\color{blue} S3 \space Optional}$$ | ***NOTE:*** If you do not have an existing Amazon S3 instance, [register for the free tier](https://aws.amazon.com/free/), and then follow instructions in [How to Use the Amazon S3 Storage Connector in Data Cloud](https://developer.salesforce.com/blogs/2023/10/how-to-use-the-amazon-s3-storage-connector-in-data-cloud) to create dedicated user with required permissions for this demo.</br></br>If you already have an S3 instance, no need to sign up for a new one.</br></br>Before proceeding further, make a note of your [programmatic credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-creds.html#access-keys-and-secret-access-keys) (Access Key ID and Secret Access Key) that can be used to access the account</br></br>- If you have your own Amazon S3 files, feel free to use those. Otherwise, get started with the test files provided below.</br><br>[AWS UnStructured Data](https://github.com/salesforce-misc/DataCloudAndAgentForceForHospitality/tree/main/AWS%20UnStructured%20Data)</br><br>[AWS Structured Data](https://github.com/salesforce-misc/DataCloudAndAgentForceForHospitality/tree/main/AWS%20Structured%20Data)</br></br>
  | Create a connection to snowflake. This connection is used to showcase Data Cloud's zero copy capabilities.  $${\color{blue} Snowflake \space Optional}$$| **NOTE:** If you do not have access to an existing Snowflake instance, please get access before proceeding further</br></br>- Follow instructions in [this article](https://developer.salesforce.com/blogs/2024/08/zero-copy-data-federation-with-snowflake-and-salesforce-data-cloud) to create a Warehouse and Integration User in Snowflake, generate a public and private key pair, and configure Salesforce Data Cloud to connect to Snowflake.</br><br>If you have your own Snowflake files, feel free to use those. Otherwise, get started with the test files provided [here](https://github.com/salesforce-misc/DataCloudAndAgentForceForHospitality/tree/main/Snowflake%20Data).| |
  | Create a connection for Mulesoft Ingestion API. This is to orchestrate a call to the Hotel Pricing consolidator for pricing comparison. $${\color{blue} Mulesoft \space Optional}$$| - Go to **Setup** \-\> In the **Quick Find** box, type ***static***, then select ***Static Resources***</br>- In the index across the top, click the letter ***M***</br>- Click on **‘Mulesoft\_Ingestion\_API\_Scheme’**</br>- Click on **‘View File’** hyperlink. The **‘Mulesoft\_Ingestion\_API\_Scheme.txt’** is downloaded to your computer.</br>- Change the file extension from ***.txt*** to ***.yaml***</br>- Go to Data Cloud Setup, click on Ingestion API → Click New</br>- Provide the Connector Name as ’Mulesoft Ingestion API’</br>- Upload **Mule\_ingestion\_api.yaml**  file which you have downloaded from above steps and Upload file to scheme and click on Save. | ![image](https://github.com/user-attachments/assets/fca75a1c-b64b-4dcd-8583-0893718bf1da) ![image](https://github.com/user-attachments/assets/87ae1f7f-c733-433b-98e0-ef4faeef0ecb)![image](https://github.com/user-attachments/assets/c0ff8a15-3b3c-4b89-b8b9-32342d0100ae)|
| Install Standard Data Bundles | Click on Data Cloud Setup </br>- Click on ‘Salesforce CRM’</br>- Under ‘Standard CRM Data Bundles’</br>- Click on ‘Arrow’ icon and click on ‘install’ of ‘Sales Cloud’</br>- it will open on new page -> click on Install |![image](https://github.com/user-attachments/assets/8aea58e3-15c5-48f2-a24f-2fbe25d2a0ac)![image](https://github.com/user-attachments/assets/6f4a17f5-211b-4eef-a0d2-b5b993cad3a2)|
| Turn On Einstein Setup | - Navigate to Setup</br>- Search and Select ‘Einstein Setup’</br>- Turn on Einstein Setup |  |
| Turn On Agentforce | - Navigate to Setup</br>- Search and Select ‘Agent’</br>- Turn on Agentforce |  |
</details>

<details><summary>
  
  ## 2. Salesforce Package Installation
</summary>
1 step process

### 1. Install Sunshine Base Package (10 minutes)

 | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Install Sunshine Base Package | - Click on this Package Installation [Link ](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t4W000002V5Wc)</br>- Sign-in to the Org with your credentials.</br>- Choose Install for Admins Only option</br>- Choose “Rename conflicting components in package” and click the Install button.</br>- Click Done when installation is complete. |![image](https://github.com/user-attachments/assets/29af9d66-482c-42e1-9210-b0f803429b5d)|
  | Verify Package installation | - Click Setup</br>- Search for ‘Installed Package’</br>- Search for 'Sunshine Trails Base App' is installed  |![image](https://github.com/user-attachments/assets/8669e29c-a7e9-4fdd-8829-67899fccc608)|

</details>

<details><summary>
  
  ## 3. Data Cloud Configuration
</summary>

7 step process

### 1. Setup Data Streams 
The Data Kit is installed as a part of the Package installation. Follow the steps below to create data streams.

### Setup Salesforce Data Streams (15 minutes)
 | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  Verify Salesforce CRM is Active or Not | In Data Cloud, select the Setup icon and then Data Cloud Setup.</br> - Select Salesforce CRM.</br>- If connection status is “Inactive”</br>- then click on drop down to “Active” </br>- Click on “Active”| ![image](https://github.com/user-attachments/assets/f101dc8c-6af3-41c7-8884-42609b1e0d4e)![image](https://github.com/user-attachments/assets/e222dd20-db0e-4cf5-9b55-0815692c2a87)|
  | Create Data Streams from Data Bundle | - Logged into the environment where you installed the data kit</br>- Go to Data Cloud app and the Data Streams tab.</br>- Click New to create a Data Stream</br>- Select Salesforce CRM and click Next.</br>- Under Custom Data Bundles, select the Salesforce_CRM_Bundle.</br>- Select your Salesforce Org.</br>- Click Next.</br>- Select the data space as ‘Default’, review the fields in your data stream, and click Next.</br>- Review details and click “Deploy.|![image](https://github.com/user-attachments/assets/901db59e-4a4f-4bf5-8129-cd2894af7dd9)|
  | Create Loyalty_CRM_Bundle Data Streams from Data Bundle | - Click on Data Stream Click on New </br>- Select Salesforce CRM Click Next</br> - Select Salesforce_CRM_Loyalty_Bundle Click on Next</br> - Select the data space as ‘Default’, review the fields in your data stream, and click Next. </br>- Review details and click “Deploy”  |![image](https://github.com/user-attachments/assets/a334887f-6cf5-4d62-b643-8e740762b741)![image](https://github.com/user-attachments/assets/b7320073-ab34-4356-8acf-b2f07ed00580)![image](https://github.com/user-attachments/assets/5e656e34-1f80-44d8-8174-6360d66738d3)|
  | Create Website_Mobile_apps Data Stream from Data Kit |- Click on Data Stream</br>- Click on New</br>- Select ‘Installed Data Kits Package’</br>- Select ‘Sunshine Trails DK’ Data Kits</br>- Select checkbox under ‘Websites_Mobile_Apps’ click on ‘Next’</br> -Select Connector type ="website" & connector name "Experience_Cloud_Event_Connector".</br>- Click Next.</br> - Click on Deploy|![image](https://github.com/user-attachments/assets/9869df31-0549-4b4f-b74d-d44ad95d60ce) ![image](https://github.com/user-attachments/assets/3b0e9c44-0176-45f4-8c0d-05866cfdd251)![image](https://github.com/user-attachments/assets/6a9ed53c-f351-46c2-844e-dbaca371735e)![image](https://github.com/user-attachments/assets/d2018ad8-86f8-4f65-be3d-3c645eafbab1)|  
### 1a. Create Data Steam for Amazon S3 (10 minutes) $${\color{blue} S3 \space Optional: \space Please \space note \space that \space some \space functionality \space in \space Experience \space Cloud \space and \space in \space the \space C360 \space will \space no\space longer \space function\space as \space expected \space if \space not \space installed. }$$
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create a Connection to Amazon S3 in Salesforce|Navigate to Data Cloud Setup</br>In the menu, under EXTERNAL INTEGRATIONS, click on Other Connections</br> - Click New, choose Data Kits as the source and click Next. Select Sunshine Trails DK</br>-Select InfosysAWSBucket</br>-Change the name & API name of the connection "hospitalityplayground". </br>-Put the bucket name “hospplaygroundbucket” please feel free to change the bucket name based on your existing AWS bucket</br> -Fill the credentials and save.|
  | Create a Data Stream for Amazon S3 from Data Kit |- Click on Data Stream Click on New</br>- Select Installed Data Kits & Packages Click on Next</br>- Select Sunshine Trails DK<br> - Select Amazon_S3_Bundle</br>- Select Connection as InfosysAWSbucket</br>- Select the data space as ‘Default’, review the fields in your data stream,and click Next</br>-Review details and click Deploy.|
  | Create a Data Stream for Third Party Data |- Click on Data Stream Click on New</br>- Select Installed Data Kits & Packages Click on Next</br>- Select Sunshine Trails DK<br> - Under “Bundle Amazon S3” Select Third Party Survey and click Next</br>- In Connection Select “hospitalityplayground” Click Next</br>- Click Next and click Deploy.|

  ### 1b. Create Data Stream for Snowflake (5 minutes) $${\color{blue} Snowflake \space Optional: \space Please \space note \space that \space some \space functionality \space in \space the \space C360 \space will \space no\space longer \space function\space as \space expected \space if \space not \space installed. }$$
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create a connection to snowflake in Salesforce |Navigate to Data Cloud Setup</br>-In the menu, search SnowFlake,</br> - Click New, choose Data Kits as the source and click Next. Select Sunshine Trails DK</br>-Select Infosys_Demo_Actual. </br>-Please feel free to change the connection name based on your existing snowflake connection </br> -Don’t change the API name </br>Fill the Account URL, Username, and Private Key and click next and save.|
  | Create Data Stream for Snowflake from data kit | - While logged into the environment where you installed the data kit</br>- Go to Data Cloud app and the Data Streams tab.</br>- Click New to create a Data Stream</br>- Under "Other Sources", select "Installed Data Kits & Packages" and click Next</br>- Select "Sunshine Trails DK" Data Kit</br>- Select Snowflake Bundle and click Next.</br>- Under Data Streams choose "POS_Transaction" and "IOT_Transaction" and click Next.</br>- Review the Data Stream fields and click Next</br>- Click Deploy to create the Data Streams| ![image](https://github.com/user-attachments/assets/6deda63a-363b-4330-a877-b6d2de5a9fed)![image](https://github.com/user-attachments/assets/bc8a22d9-a81a-44f6-8a09-f20ab2571f10)|
### 1c. Create Ingestion API for Mule Data Streams from Data Kit(5 minutes) $${\color{blue} Mulesoft \space Optional: \space Please \space note \space that \space some \space functionality \space in \space Experience \space Cloud \space will \space no\space longer \space function\space as \space expected \space if \space not \space installed. }$$
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Ingestion API for Mule Data Streams from Data Kit| - Click on Data Stream </br> - Click on New.</br>- Select Installed Data Kits & Package.</br>- Select ‘Sunshine Trails DK’ Data Kits.</br>- Click on ‘Ingestion’ Bundle.</br>- Click on Next.</br> -Select Connection as ‘Mulesoft Ingestion API’ </br>- Click Next </br> -  Click Deploy| ![image](https://github.com/user-attachments/assets/84ccd7c9-6313-4dc8-b169-7fe40b6b36c6)![image](https://github.com/user-attachments/assets/5878c2ec-47f9-48f1-88a1-098986187d3f)![image](https://github.com/user-attachments/assets/1bdf0f3d-abdc-4697-bac5-5e87f2286cb9)![image](https://github.com/user-attachments/assets/65b718d1-1db1-4efc-92b1-36dedc743752)|
  ### 1d. Create Hotel FAQ and Hotel Safety FAQ DLO Creation for Unstructured Data(10 minutes)
  Complete this step only if you have setup a connection and the file notification process in AWS
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Hotel FAQ & Hotel Safety FAQ DLO Creation | - Click on Data Lake Object Click on New </br>- Click on Create from Data Kits, Click on Next </br>- Select Hotel_FAQ_v3, select “hospitalityPlayground’ connection. Click on Next </br>- Click on Deploy </br>- Follow the same step from Step#1 for Hotel_Safety_FAQ_V2.|

   ### 1e. Create Party Identification Collection Data Lake (5 minutes)
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Party Identification Collection & Party Identification Collection IOT DLO Creation  | - Click on Data Lake Objects Tab </br>- Click on New</br>- Click on “Create from Data Kits”, Click on Next  and select “Sunshine Trails Base App” package </br>- Select Party Identification Collection.</br>- Click on Next </br> - Click on Save </br> - Repeat the above steps again but this time select </br> - Party Identification Collection IOT DLO instead of Party Identification Collection </br>- Click on Next </br> - Click on Save.|

  ### 2. Create Data Transforms from Data Kit (5 minutes)
  Proceed with this step only if you have setup a connection to snowflake
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create IOT & POS Data Transform $${\color{blue} Snowflake \space Optional}$$ | -Click on Data Transforms Tab </br>- Click on New</br>- Click on Create from Data Kits, Click on Next</br>- Select Extract Party Identifiers from IOT</br>- Click on Next . Click on Save, Copy the Name , Remove the Name then Paste the same Name Again</br>- Click on Save</br>- Click on Data Transform Tab </br>- Click on New. Click on ‘Create from a Data Kits’ Option </br>- Select  Extract Party Identifiers from POS </br>- Click on Next . Click on Save, Copy the Name , Remove the Name then Paste the same Name Again </br>- Click on Save|![image](https://github.com/user-attachments/assets/79d6f605-c8e5-4c3d-ac6a-f34f39cc29e2)![image](https://github.com/user-attachments/assets/1c84c981-9a03-4b05-9a3a-cf2137d45425)![image](https://github.com/user-attachments/assets/e1e24730-f55a-42de-9a4f-5ab5af27b04b)![image](https://github.com/user-attachments/assets/c3231d58-e1fd-4653-9981-02f152451f61)
 
  ### 3. Cross Verify CRM Data (5 minutes)
  Proceed with this step only if you have the Real-Time SKU enabled in your org
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | **NOTE**|- Before proceeding further, please ensure that the CRM data is available in the DMO. You can verify this by following these steps:</br>- Navigate to Data Explore </br>- Set Data Space to Default.</br>- Select the Data Model Object (DMO).</br>- From the dropdown, choose Account Contact.</br>- You should see Salesforce_Home listed under the Data Source column.</br> If you don't see the data then wait until the data is refreshed before proceeding to the next step.</br>|![image](https://github.com/user-attachments/assets/396732a3-89cb-455d-9a0c-b6c015b272cb)|

  ### 4. Create Identity Resolution Ruleset from Data Kit (5 minutes)
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Identity Resolutions| -Go to Data Cloud app</br> - Click on the Identity Resolutions tab </br> - Click New</br> - Select Installed from Data Kit</b>- Choose Sunshine Trails DK</br>- Click on Next</br>- Choose ‘Guest Profile’. Click on Next </br> Click on Save.|![image](https://github.com/user-attachments/assets/1f1ef5a5-1f4e-4d33-af13-07978757facd)![image](https://github.com/user-attachments/assets/20027c3d-4d87-4028-89dd-7f73e2a59224)![image](https://github.com/user-attachments/assets/2d5370ae-57e4-444d-969c-b19dc13ada6b)|

### 5. Create Calculated Insights (5 minutes)
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  Create Calculated Insights|- Go to Data Cloud ap </br>- Click on Calculated Insights tab</br>- Click New</br>- Select "Create from a Data Kit" and click  Next</br>- Select ‘Guest Stay Metrics’</br>- Click on Next </br>- Click on ‘Check Syntex’</br>- Click on ‘Activate’</br>- Click Activate</br>- Select Schedule as ‘Every 1 hour’ Select Start Date and Time As default.</br>- Click on ‘Enable’</br>- Repeat the steps for the following metrics: ‘Guest Lifetime Value’, ‘Guest Classification’, ‘Guest Satisfaction Score’ |![image](https://github.com/user-attachments/assets/9f178c36-06c1-405e-b19c-679ef5830c22)![image](https://github.com/user-attachments/assets/e544bf35-223e-4d5b-ad46-34cb6653608c)![image](https://github.com/user-attachments/assets/093600f9-c7a3-4181-88c9-66545191d5b5)|

### 6. Create Data Graph (5 minutes)
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  Create Data Graph |- Click on Data Graph Tab</br>- Click on New</br>- Select Create from Data Kits</br>- Select Sunshine Trails DK </br>- Select **Hospitality Realtime Profile**. </br>- Select primary Data model object as “Unified Individual real”.</br>- Click on Individual and go to the right side where the error is showing and uncheck the check box.</br>- Now click on Save & Build. |![image](https://github.com/user-attachments/assets/f626912f-01b4-43eb-8efc-47d7a24bc615)![image](https://github.com/user-attachments/assets/5184c52c-e00b-4b00-83fe-fd0a9d47ad14)![image](https://github.com/user-attachments/assets/675c7904-9483-4079-86d1-3e15f9b00915)![image](https://github.com/user-attachments/assets/808709b3-49fd-4a9e-acd0-518dae4ae389)![image](https://github.com/user-attachments/assets/738b3c7e-143f-4492-8fe4-7b49d625c541)![image](https://github.com/user-attachments/assets/3648af20-e879-457d-b952-1f73c55792b6)![image](https://github.com/user-attachments/assets/e288cc79-caa7-4163-bcef-563d1e0cf111)|

### 7. Create Data Cloud Related List Enrichment (10 minutes)
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Booking Related List |- Click on Setup</br>- Object Manager</br>- Search for Contact</br>- Click on Contact</br>- Click on Data Cloud Related List Enrichment.</br>- Click on New</br>- Select default data space</br>- Select Data Cloud object as ‘Booking__dlm’</br>- Click Next </br>- Give Child Relationship Name as ‘IndividualBookings’</br>- Give Related List Label as ‘Individual Bookings’ Click Save. |![image](https://github.com/user-attachments/assets/f50d3875-c2b8-451b-bcef-85141aea954d)![image](https://github.com/user-attachments/assets/f8fa4e97-bc19-4e87-a2b3-44a539b597c1)|
  | Create Reservation Related List |- Click on Setup</br>- Object Manager</br>- Search for Contact</br>- Click on Contact</br>- Click on Data Cloud Related List Enrichment.</br>- Click on New</br>- Select default data space & Select Data Cloud object as ‘Reservation__dlm’ </br>- Click Next </br> - Give Child Relationship Name as‘IndividualReservations’</br>- Give Related List Label as ‘Individual Reservations’ Click Save. |![image](https://github.com/user-attachments/assets/366fa15e-2317-44ab-af5c-8025453c554f)![image](https://github.com/user-attachments/assets/f64fad04-3391-4a3c-9534-04caf5e92955)|
  | Create Data Cloud Related List Enrichment for Third Party Survey</br> $${\color{blue} S3 \space Optional}$$|- Click on Setup </br>- Click on Object Manager </br>- Search for Contact </br>- Click on Contact </br>- Click on Data Cloud Related List Enrichment.</br>- Click on New </br>- Select default data space -> Select Data Cloud object as ‘Third Party Survey’  </br>- Click Next </br>- Give Child Relationship Name as 'Third_Party_Survey’ </br>- Give Related List Label as ‘Third Party Survey’ Click Save |![image](https://github.com/user-attachments/assets/fb6d0aeb-2a00-4b75-93cc-703d158d5303)|

### 8. Create Data Cloud Copy Field Enrichment (15 minutes)
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Data Cloud Copy Field Enrichment for ‘Customer Classification’ |- Go to Object Manager.</br>- Search for Contact.</br>Click on Contact</br>- Click on Data cloud Copy Field.</br>- Click on New.</br></br>- Select data space as ‘default’</br>- Select Data Cloud Object as Guest Classification‘ whose API name will be this Guest_Classification__cio’ Click on Next </br></br>- Select data space as ‘default’ </br>- Select field as ‘Customer Class’. Click Next </br> - Give Label as ‘Guest Classification’ </br> - Click ‘Next </br><br>- On contact -> Data Cloud Copy Field Enrichments -> Guest Classification </br>- In Customer_Class under contact “click to Edit” </br>- Select Customer Class </br>- Save and Start Sync.|![image](https://github.com/user-attachments/assets/c2e097ad-754b-4128-b769-bcb7a6d0d5f0)![image](https://github.com/user-attachments/assets/691eef48-d37b-4714-9ff3-0ff695477282)![image](https://github.com/user-attachments/assets/422cb503-0080-417a-a3d1-1f8596c5018d)|
||- Give Label as ‘Guest Classification’</br>- Click on ‘Next.</br>On contact Select Customer Class</br>- Save and Start Sync. |![image](https://github.com/user-attachments/assets/f8e7be99-1d85-4d62-8653-170f5ce15d28)![image](https://github.com/user-attachments/assets/c72ab4b8-5ad6-4278-8786-db0e33889eef)![image](https://github.com/user-attachments/assets/e12ac271-be8d-4b6d-aed3-e73e95c862ed)![image](https://github.com/user-attachments/assets/ebee9d04-8e3d-4d8e-a017-ee54e79cd2ab)|
| Create Data Cloud Field Enrichment of ‘Guest Lifetime Value’ |- Go to Object Manager</br>- Search for Contact.</br>- Click on Contact</br>- Click on Data cloud Copy Field.</br>-Click on New.</br>- Select data space as ‘default’ > Select Data Cloud Object as ‘Guest_Lifetime_Value__cio’ </br>- Click on Next </br>- Select Field As ‘GLV’</br>- Give Label as ‘Guest Lifetime Value’</br>- Click on ‘Next </br> - Select Field GLV </br>- Give Label as ‘Guest Lifetime Value’</br> - Click on Next </br> - On contact Select Lifetime_Value__c </br>- Save and Start Sync.|![image](https://github.com/user-attachments/assets/1d3304f0-63b9-4a90-8609-5332a59fcaac)![image](https://github.com/user-attachments/assets/be92a2c8-0f9b-44b7-a1f2-430da343c23a)|
| Create Data Cloud Field Enrichment of ‘Guest Statisfection Score’ |-> Go to Object Manager.</br>- Search for Contact.</br>- Click on Contact</br>- Click on Data cloud Copy Field.</br>-  Click on New.</br>- Select data space as ‘default’</br>- Select Data Cloud Object as ‘Guest_Satisfaction_Score__cio’</br>- Click on Next</br>- Select Field As ‘GSS’</br>- Give Label as ‘Guest Satisfaction Score’</br>- Click on ‘Next</br>- On contact Select Guest_Satisfaction_Score__c </br>- Save and Start Sync.|![image](https://github.com/user-attachments/assets/e264bcec-b6be-4854-80d9-9d5f649d6a8a)![image](https://github.com/user-attachments/assets/45ae2e88-ca7b-437c-a77c-adbd638cd4b4)|
| Create Data Cloud Field Enrichment of ‘Guest Stay Matrics’ |- Go to Object Manager.</br>- Search for Contact.</br>- Click on Contact</br>-  Click on Data cloud Copy Field.</br>- Click on New.</br>- Select data space as ‘default’</br>- Select Data Cloud Object as ‘Guest_Stay_Metrics__cio’</br>- Click on Next </br>- Select Fields Total_Stays, Total_Room_Nights, Total_Spend, and Avg_Nights_per_Stay</br>- Give Label as ‘Guest Stay Metrics’</br>-Click Next</br>- Map Fields with below Contact Fields </br>
| |Data Cloud:Guest stay Matrics->Contact Object
| |Total_Stays->Total Stays|
| |Total_Stays__c->Total_Stays__c|
| |Total_Room_Nights->Total Room Nights|
| |Total_Room_Nights__c->Total_Room_Nights__c |
| |Total_Spend->Total Spend|
| |Total_Spend__c->Total_Spend__c|
| |Avg_Nights_per_Stay->Avg_Nights_per_Stay |
| |Avg_Nights_per_Stay__c->Avg_Nights_per_Stay__c |
| | </br>- Save and Start Sync|![image](https://github.com/user-attachments/assets/ccde6861-ce6c-4054-9373-a8e0528e1b57)![image](https://github.com/user-attachments/assets/a3e1804c-7a37-4347-8364-599c3014ac37)|
</details>

<details><summary>
  
  ## 4. Commerce Cloud Configuration
</summary>

8 step process

### 1. Verify Organization Wide Address (5 minutes)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Verify Organization-Wide Address Exists or not |- Go to Setup \-\> Search for Organization-Wide Address \-\> Click on Organization-Wide Addresses</br>-  Verify if there is an organization-wide address with the name ‘Default Email’ created and verified.</br>- If there is none, then please create an organization-wide address by following below steps</br>- Click on **Add** button \-\> On the Display Name Add **‘Default Email’.** On the Email Address \<Add your email address\> Select ‘Default No-Reply Address’ on Purpose field \-\> click check box **‘allow all profiles to use this from address’**   |![image](https://github.com/user-attachments/assets/8ddc4ebe-d8cd-4a12-a363-a782dd8d9541)![image](https://github.com/user-attachments/assets/3f7e7dfc-057b-41b0-8115-476028a6d9e9)|


### 2. Install Agent and Experience Site Package (1 hour 30 minutes)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Install Agent & Exp Site Package |- Install VSCode [Download](https://code.visualstudio.com/download) </br>- Setup CLI a. Install the Salesforce CLI  https://developer.salesforce.com/tools/salesforcecli or check that your installed CLI version is greater than 2.56.7 by running sf \-v in a terminal.</br>- If you need to update the Salesforce CLI, either run sf update or npm install \--global @salesforce/cli depending on how you installed the CLI.</br>- Install Extension</br>- Open VSCode \> Go To\> Extensions-\>Salesforce Extension Pack\>Install</br>- Open Terminal Clone git Repository by using below command </br> ```git clone https://github.com/salesforce-misc/DataCloudAndAgentForceForHospitality.git``` </br>- Open the Project </br>- Authorize an Org</br>- Type Ctrl+Shift+P Select SFDX:Authorize an Org</br>- Select Project Default</br>- Enter the Org alias</br>- Authorize the Org</br>- Open terminal type **sf project deploy start --source-dir force-app** </br>- If you have AWS S3 Connection Created and Installed AWS Related Data Stream from Step 3 under Data Cloud Configuration, then execute below SFDX command to deploy **else do not execute**. </br>- Open terminal type **sf project deploy start --source-dir st-aws-app** </br> |![image](https://github.com/user-attachments/assets/293fd406-72fc-4be3-9008-0a9926461586)![image](https://github.com/user-attachments/assets/6d3a14ee-3c65-4f47-99a6-39066b68a9aa)![image](https://github.com/user-attachments/assets/71751813-f4b9-437f-b355-9feb770c0c2d)![image](https://github.com/user-attachments/assets/b50fb406-2ae7-475a-a8c6-939d486dd9fd)![image](https://github.com/user-attachments/assets/5b4efb69-3f1a-4a1a-8ecb-be4e17344098)![image](https://github.com/user-attachments/assets/403c5a8f-ef31-4220-8062-60ae71453008)![image](https://github.com/user-attachments/assets/9a2ff9e1-75f2-4c13-a7d1-1a1ef5c2bc51)|

**NOTE:** $${\color{red} Skip \space the \space below \space steps \space if \space you \space wish \space to \space bring \space in \space your \space own \space Product \space data}$$
$${\color{red} 3.\space Create Commerce Data}$$
$${\color{red} 4.\space Search Update}$$
$${\color{red} 5.\space Upload CMS Images into the Store and}$$
$${\color{red} 6.\space Add CMS Product Images}$$

### 3. Create Commerce Data (5 minutes)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Create Data  | - Click on App Launcher, search for Sunshine Trails Hospitality and click on Sunshine Trails Hospitality Setup App</br>- Click on the **“Create Commerce Data”** button (highlighted in the screenshot to the right) and wait for a confirmation message before proceeding further. |![image](https://github.com/user-attachments/assets/6827a2e8-63a3-4425-b74b-b77123a9524d)|

### 4. Search Update (5 minutes)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Search Update |**Enable Commerce App** </br>- Click Setup and search for Commerce</br>- Click Settings under Feature Settings --> Commerce</br>- Use the toggle to switch on the Enable the Refreshed Commerce App</br></br>**Enable Search Index**</br>- Click on App Launcher, search for Commerce and select Commerce application</br>- In the Store dropdown, choose Sunshine Resort Store</br>- Scroll down to Setting and expand it</br>- Click on Search</br>- Use the toggle to turn on Automatic Updates | ![image](https://github.com/user-attachments/assets/84eed31d-54c7-4326-87ce-88ff8eb73596) ![image](https://github.com/user-attachments/assets/5c7a175b-5396-4e6d-b061-36471f59cc2d)|

### 5. Upload CMS Images into the Store (15 minutes)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Upload CMS Images into Store  |- Download Images from [CMS Images](https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/tree/master/Product%20Images) </br>- Click on App Launcher\>\> Select commerce application\>\> Click on Store</br>- Open Sunshine Resort Store</br>- Scroll down to Content Manager</br>- Click on Add workspace</br>-  Enter details such as Name "Commerce Store Images" and select Enhanced CMS Workspace and click on Next</br>- Add Sunshine Resorts Channel as Public and Sunshine Resorts site and click Next</br>- Keep language as it is and click on Finish</br>-  Click on Add and select Content \>\> select images\>\>Click on Create button\>\> click on upload button\>\>Select Image\>\>Image and Title populated\>\>Enter API name (can be the same as file name)\>\> Save it\>\> Click on Publish button\>\> Keep Details as is\>\> Click on Next\>\> Select Publish Now\>\>click on publish now button </br>- Please repeat the above steps for all the images| ![image](https://github.com/user-attachments/assets/6ce860d4-347a-45f4-a5fe-d055f9354a18)![image](https://github.com/user-attachments/assets/d5e11e30-348b-4fe0-9c63-4c3164230893)![image](https://github.com/user-attachments/assets/752c7004-7e57-4de4-84a0-56beba6fb08e)![image](https://github.com/user-attachments/assets/bd2ec81e-0242-4aab-9ad7-dcdabd707220)![image](https://github.com/user-attachments/assets/4f903a92-5b6f-4350-b3c5-4a141ea789b3)![image](https://github.com/user-attachments/assets/e9e44245-9086-4f59-a506-dad70f9ea9a0)![image](https://github.com/user-attachments/assets/d18f85df-2fd6-4cc2-8684-0fe1f493b770)![image](https://github.com/user-attachments/assets/96fd88ff-4788-4b53-9ab9-3435ae62ddd2)![image](https://github.com/user-attachments/assets/ba38373a-2c09-406c-9df9-462e76435c74)![image](https://github.com/user-attachments/assets/7e009060-885c-44a9-9cad-cbb26df1d5f2)![image](https://github.com/user-attachments/assets/c3c53136-b26f-46fb-83c0-a6c3065c0c2e)![image](https://github.com/user-attachments/assets/f33a580f-9c68-455f-ada9-cbcd1773e2aa)![image](https://github.com/user-attachments/assets/2f026ccd-f1c4-4f9e-8cab-592014ebf6d0)

### 6. Add CMS Product Images (15 minutes)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Add Image to a Product   |- Click on App Launcher\>\> Select commerce application\>\>Click on Store</br>- Open Sunshine Resort Store </br>- Expand Merchandise\>\> Product\>\> open one by one product</br>- Click on eye icon (it removes Site window) after save button</br>- Confirm that "Products" is selected under categories</br>- Scroll down \>\> click on Go to global product record</br>-  Go to Media\>\> Click on Add image for Product details Image section \>\> Select appropriate image from Commerce Store image\>\> click on Add button</br>- Click on Add image for Product list Image section \>\> Select appropriate image from Commerce Store image \>\> click on Add button</br>- Repeat previous steps for each product </br>- Go to store\>\> select Sunshine Resorts \>\>Scroll down to Website Design\>\> select product category from dropdown \>\> click on Publish button (this step maybe not be needed if you are commerce console)</br>- Go back to Sunshine Resort Store\>\>Click on Home\>\> click on preview the site and see product is getting displayed | ![image](https://github.com/user-attachments/assets/eb835d50-0326-4b3b-8b68-39fd4404ef42)![image](https://github.com/user-attachments/assets/bd0ee9f1-2a0c-4357-82b4-991305befccd)![image](https://github.com/user-attachments/assets/b6ae1bda-47a4-4bce-a69b-45e3e6bae306)![image](https://github.com/user-attachments/assets/4790ad8e-e273-4316-8179-b2eaff4d8576)![image](https://github.com/user-attachments/assets/fcbcc98b-1dcf-46b8-92a8-8ab9042e3bce)![image](https://github.com/user-attachments/assets/7f20c62e-e257-4779-85b6-3f1ba4ab5e7a)![image](https://github.com/user-attachments/assets/c3465a4b-3eb2-4c9d-9f72-875a38746b44)![image](https://github.com/user-attachments/assets/43ca9010-9be3-498a-9c41-cecf530e984e)![image](https://github.com/user-attachments/assets/7e2bfa1d-6388-41b5-9fb2-4f30064a98b4)![image](https://github.com/user-attachments/assets/5e722ac7-0875-4de8-b42a-fa720cf7e873)![image](https://github.com/user-attachments/assets/c1c78296-cc04-4133-9473-e82701290bcf)![image](https://github.com/user-attachments/assets/0cad9e4b-97ca-43a6-a3da-1febbaae04ce)|

### 7. Enable Self Resgistration (5 minutes)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Enable Self Registration   |- Click on App Launcher>> Select commerce application>>Click on Store</br>- Open Sunshine Resort Store</br>- Settings >> Store</br>- Click on Buyer Access Tab</br>- Scroll down to Self Registration (enable if it’s not enabled)</br>- Select Account RecordType to “Business Account” </br>- Select Default Buyers Group to “Sunshine Resorts Buyer Group"</br>- Click Save|![image](https://github.com/user-attachments/assets/7f6a0551-1b95-465e-84b9-4b11f74a121c)|



### 8. Share CMS with Site workspace (5 minutes)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Share CMS with Site workspace   |- Click on App Launcher and search for CMS Workspaces</br>- Select CMS Workspaces</br>- Click on "Commerce Store Images" (the CMS created in previous step</br>-  Click the gear icon (at the top right) and select "Workspace Sharing" from the dropdown</br>- Move "Sunshine Resorts Managed Content Space" to the right (under Shared) and click Next </br>- Click Save |![image](https://github.com/user-attachments/assets/353002a4-ca61-4f5e-a71f-60597ab81e86)|


</details>


<details><summary>

  ## 5. Connect and Create Sample Data
</summary>

4 step process

### 1. Create Sample Data (5 minutes) $${\color{blue} Optional: \space These \space steps \space are \space optional \space if \space you \space choose \space to \space use \space your \space own \space data. }$$
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Sample Data | - Click on App Launcher, search for Sunshine Trails Hospitality and click on Sunshine Trails Hospitality Setup App</br>- Click on the **“Create Test Data”** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. |![image](https://github.com/user-attachments/assets/5af44efa-ca6c-4d95-800a-5aec9f477928)

### 2. Enable Test Account as Buyer Account (5 minutes) $${\color{blue} Optional: \space These \space steps \space are \space optional \space if \space you \space choose \space to \space use \space your \space own \space data. }$$
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Enable Account as Buyer Account | - Click on Setup</br>- Go to Object Manager</br>- Click on Account</br>- Click on Page Layout</br>- Click on "**Page Layout Assignment**"</br>- Click on ‘**Edit Assignment**’</br>- Select "SDO-Account" Layout under Record type "Account" for System Administration Profile </br>- From Page Layout to Use dropdown Select "Account layout"</br>- Click on Save</br>- Verify that, for "**System Administrator profile**" for Record type **"Account"** Page layout should be ‘**Account Layout’** </br>- Go Account Tab \-\> Search for Account Name **"Sunshine Experience"** (test Account created in previous steps). Make sure to remove any filter if it exists \-\> Click on that Record</br>- On Record Page click on the **"Enable as Buyer"** Quick Action | ![image](https://github.com/user-attachments/assets/844294ed-9813-4a7b-8707-8d0755de260f)![image](https://github.com/user-attachments/assets/f1f80dca-2d9a-4d35-89dd-92b4e5d1eaa4)![image](https://github.com/user-attachments/assets/eb9fd6ae-aace-4352-b1c4-98eecabcbb95)![image](https://github.com/user-attachments/assets/a553fd10-9a2f-440c-97f8-e645131164f0)![image](https://github.com/user-attachments/assets/818f192e-4ec2-45f4-afad-5faed169830d)![image](https://github.com/user-attachments/assets/ace5bcf4-4f9a-463c-ae84-bca0c68f91bb)|

### 3. Create Community User and Assign User to Buyer Group (5 minutes)
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Community User and Assign Buyer Account to Buyer Group |- Click on App Launcher, search for Sunshine Trails Hospitality and click on Sunshine Trails Hospitality Setup App</br>- Click on the **"Create Buyer Group Member Data"** button (highlighted in the screenshot on the right) and wait for a confirmation message before proceeding further.</br>- **Note:** If the confirmation message does not appear after 5 minutes, refresh the page and if the **"Create Buyer Group Member Data"** button is disabled, proceed. | ![image](https://github.com/user-attachments/assets/2282a058-02df-45c0-8da2-5e7eb4350d9b)


### 4. Setup Data in Snowflake (15 minutes) $${\color{blue} Snowflake \space Optional: \space Please \space note \space that \space some \space functionality \space in \space the \space C360 \space will \space no\space longer \space function\space as \space expected \space if \space not \space installed. }$$
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




### 1. Configure AWS File Notification (30 minutes) $${\color{blue} S3 \space Optional: \space Please \space note \space that \space some \space functionality \space in \space Experience \space Cloud \space and \space in \space the \space C360 \space will \space no\space longer \space function\space as \space expected \space if \space not \space installed. }$$
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Configure AWS File Notification | - Navigate to **Setup** and search for **App Manager** </br>- Click in the down arrow for the **"AWS Unstructured"** app and select view. </br>- Next to Consumer key and secret, click **"Manage Consumer Details"** and copy the values. </br>- Share the values with the AWS team responsible to create the file notification function.</br>- For more details about how to setup file notification visit: (https://developer.salesforce.com/docs/data/data-cloud-int/guide/c360-a-awss3-udlo.html) | ![image](https://github.com/user-attachments/assets/2a2f4793-774b-4933-ba20-b3de2bdc9c95)|

### 2. Prepare Data Cloud

#### 2a. Refresh Amazon S3 Data Streams (5 minutes) $${\color{blue} S3 \space Optional: \space Please \space note \space that \space some \space functionality \space in \space Experience \space Cloud \space and \space in \space the \space C360 \space will \space no\space longer \space function\space as \space expected \space if \space not \space installed. }$$
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Refresh Amazon S3 Data Streams | - Navigate to **Data Cloud** app and the **Data Streams** tab </br>- Query for **Third Party Survey** data stream </br>- Using drop down control on the right against the data stream  initiate refresh for the **Third Party Survey** data stream and  subsequently choose the **Refresh Only New Files** option: </br>- Once the data stream is refreshed validate that the **Total  Records** counts for **Third Party Survey** stream, it should be 42  |![image](https://github.com/user-attachments/assets/2f61cac2-a6c3-4615-b479-a8e697d28a28)|

#### 2b. Refresh Snowflake Data Streams (5 minutes) $${\color{blue} Snowflake \space Optional: \space Please \space note \space that \space some \space functionality \space in \space the \space C360 \space will \space no\space longer \space function\space as \space expected \space if \space not \space installed. }$$
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Refresh Snowflake Data Streams | - Navigate to Data Cloud app and the Data Streams tab </br>- Query for IOT\_Transaction data stream</br>- Using drop down control on the right against the data stream select Edit</br>- Select “Enable acceleration”</br>- In frequency select “Every 15 minutes”</br>- Select “Refresh initial file immediately” </br>- Repeat above steps for POS_Transaction data stream </br>- Once the data stream is refreshed, the Total Records counts for each Data Stream is not 0. | ![image](https://github.com/user-attachments/assets/127248ed-2cf5-409d-b56d-56bf250f47f9) |

#### 2c. Refresh Data Graph (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|   Refresh Data Graph | - Navigate to Data Cloud app and the Data Graph tab </br>- Click on the dropdown of the data graph (Hospitality Realtime Profile)</br>- Click Update Status</br>- Once the job completes successfully, this status will be set as Active. |![image](https://github.com/user-attachments/assets/2d73126b-b8a0-4ab6-bb29-e650ac55ddfc)|

#### 2d. Run Calculated Insights (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Run Calculated Insights | - Navigate to Data Cloud app and the Calculated Insights tab</br>- Query for Guest Stay Metrics calculated insight</br>- Using the drop down control on the right, click "Publish Now" to refresh the Guest Stay Metrics calculated insight.</br>- When the Calculated Insight is refreshed successfully, the Last Run Status will show as Success.</br>- Repeat steps b & c for the below Calculated Insights. Ensure all Insights are refreshed successfully.</br>- Guest Lifetime Value</br>- Guest Satisfaction Score</br>- Guest Classification  |![image](https://github.com/user-attachments/assets/882ffa71-213a-4db7-8b9e-24fddf2c4cc6)

### 3. Prepare Experience Site

#### 3a. Activate Messaging Setting (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Activate Messaging Setting | - Navigate to Setup go to messaging setting</br>-  Click on ESA Channel \-\> Click on ‘Activate’</br>- Click on Checkbox then click on Accept  | ![image](https://github.com/user-attachments/assets/76464f8a-76eb-4226-9805-010e439d7a4d)![image](https://github.com/user-attachments/assets/68e08609-1b76-442d-8396-29465b8ce0e7)|

#### 3b. Configure Digital Experience (20 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Configure Digital Experience. |- Click on **Setup**, in the Quick Find Box, enter Digital Experiences, and then select **All Sites**</br> -  Click on builder against the Site ***‘Sunshine Resort’*** </br> - Click on the ‘Banner’. Under Image Settings, click ‘Clear Image’</br> - Click on ‘Select Image from CMS’ \-\> Click on ‘Banner’ image and click save </br>- Click on **Page Structure Icon** on Left Side of Page </br>- Scroll Down and Click on ‘Embedded Messaging ‘and update as per screenshot below</br>- Select **Site End Point** as - ESW_ESA_Web_Deployment_1733127495782 </br> - Select **enhanced Service URL** from dropdown - it should be same as Site URL , refer Screenshot.</br>- Click on **'Page Structure'** Scroll Down and Click on **'Multilevel Navigation Menu'**. In the right-hand panel under Default Menu select **'Default Navigation'** </br>- Click on **'Page Structure'** Scroll Down to Footer Section under Column 1 , click on Link List then On the Right Hand Side on Default Menu Select **'Default Our Company Menu'**. </br>- Click on Link List inside Column 2 On the Right Hand Side on Default Menu Select **'Default get Help Menu'**.</br>- Click on Link List inside Column 3 On the Right Hand Side on Default Menu Select **Default my Account Menu** .</br>- Click on Social Link List inside Column 4 On the Right Hand Side on Default Menu Select **Default Social Media Menu** </br></br>- Click on Setup</br>- In the Quick Find box, type Digital Experiences, then select All Sites.</br> - Click on Builder next to the site named ‘Sunshine Resort’. </br> - At the top, use the search bar to find the Category Page, and open it.</br> - On the Category Page, select the Result Grid component.</br>- On the right-hand panel, change both the Column Spacing and Row Spacing to Large.|![image](https://github.com/user-attachments/assets/c1e3eb2f-582e-42a9-adec-900905461837)![image](https://github.com/user-attachments/assets/12f6cb59-f148-4177-a6a2-f467c73136ae)![image](https://github.com/user-attachments/assets/8d328cef-f41b-43ce-8f94-b3b3c4820504)![image](https://github.com/user-attachments/assets/76d620f6-9c53-4962-814d-f1a7ef65cc05)![image](https://github.com/user-attachments/assets/51cc9e10-7b80-4674-94c6-9485f4af7d43)![image](https://github.com/user-attachments/assets/338aae59-2506-4957-91eb-6fa634719d4a)![image](https://github.com/user-attachments/assets/d3c52649-3854-4dca-804a-39ecf54fdc23)![image](https://github.com/user-attachments/assets/ac6697a3-65ad-41ea-bf9c-fafdd9017044)![image](https://github.com/user-attachments/assets/594cbf7e-b352-4434-87fd-4e66befbc95b)![image](https://github.com/user-attachments/assets/6c8b07c3-6ebc-4530-a0ea-971b9a2f3e78)![image](https://github.com/user-attachments/assets/a2004ee0-a14d-4e91-bd89-2e23c9a43975)

#### 3c. Enable Login Access (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Enable Login Access. | - Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites</br>- Against the site ‘Sunshine Resort’, click on Workspaces</br>- Under My Workspaces, click on Administration</br>- Click on Login & Registration menu item</br>- Under Login Page Setup, change Login Page Type to Experience Builder Page</br>- For URL, choose Login</br>- Under Password Pages, change Forgot Password to Experience Builder Page</br>- Choose Forgot Password</br>- Under Registration Page Configuration enable "Allow customers and partners to self-register"</br>- Choose Registration Page Type as Experience Builder Page</br>- Choose Register</br>- Assign users to a profile and account, choose Sunshine Resort Profile</br>- Assign Permission Set Group as "Hospitality Industries Permission Set Group"</br>- Click Save |![image](https://github.com/user-attachments/assets/0281266f-e8e0-41e0-9900-3845559fc7d4)![image](https://github.com/user-attachments/assets/78acc5d8-8702-41f1-8797-9e0bdab23f13)![image](https://github.com/user-attachments/assets/16f42201-4ba0-4723-91a8-53e644f9c763)![image](https://github.com/user-attachments/assets/ff987bad-504c-4dc4-b5f5-08a86a944e99)

#### 3d. Change the layout of the Login page (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the layout of the Login page. |- Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites </br>- Against the site ‘Sunshine Resort’, click on Builder</br>- From the Pages dropdown, search for Login, and then select Login </br>-Remove the site logo and add a Text Box component. Enter the text as "Sunshine Resorts", make it bold and center</br>- Publish the changes  |![image](https://github.com/user-attachments/assets/22065622-3dbf-4386-914a-892522dce27b)|

#### 3e. Change the layout of the Register page (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the layout of the Register page |- Go to Setup, search for Digital Experiences, and select All Sites</br>- Against the site 'Sunshine Resorts', click on Builder</br>- From the Pages dropdown, search for Register, and select Register</br>- Remove the site logo and add a Text Box component. Enter the text as "Sunshine Resorts", make it bold and center (perform this step only if the “Sunshine Resorts” text box doesn't exist)</br>- Publish the changes  |![image](https://github.com/user-attachments/assets/7fc0d3dc-fc71-48d8-8c32-b71de229a25b)|

#### 3f. Change the email Address (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the email Address. |- Go to Setup \-\> Open All Sites</br>- Click on Workspaces (the configured Sites) \-\> Click Administrator</br>- Click on Emails</br>- Change Sender email to system admin email</br>- Click on save | ![image](https://github.com/user-attachments/assets/78b52af9-4b3d-49d6-8481-75c1bcd35337)|

#### 3g. Create Trusted URLS (10 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Trusted URLS |- Navigate to Setup, in Quick Find search Trusted URLs and click on Trusted URLs (under Security)</br>- Click on New. Key-in 'TrustedSite2' as the API Name</br>- Use https://DOMAINNAME.my.site.co for URL</br>- Replace DOMAINNAME with actual org Domain Name.</br></br> **To find the Domain name please follow the following steps:** </br>- Navigate to Setup, in Quick find search Domain → Please add https://DOMAIN from the below path (please select domain which is related to the experience cloud Sites Domain)</br>- Click on Save</br></br> **Add Trusted URL to Agent Sites** </br>- Click on Setup</br>-  Click on Sites \-\> Check the check box if Domain is not enabled, Click on **'Register My Salesforce Site domain'** button </br>- Click on ‘ESW\_ESA\_Web\_Deployment\_1733127495782’</br>- Click on Add Domain</br>- Add DOMAINNAME with actual org Domain Name.</br></br> **To find the Domain name please follow the following steps:** </br>- Search for Domain in Quick find → Please copy the name which ends with **.my.site.com** (e.g epicorgfarm79.my.site.com) </br>- Navigate to Setup, in Quick Find search All Sites </br>- Click on All Sites (under Digital Experiences) </br>- Click on Builder against Sunshine Resort </br>- Click on Settings and then 'Security & Privacy' </br>- Click on Add Trusted Sites button - Add Name as 'TrustedSite1' and add url as domain name, which you have copied on prev steps (e.g https://e.g epicorgfarm79.my.site.com) </br>- Click Publish |![image](https://github.com/user-attachments/assets/053258df-5dd6-42ae-9755-777a2d976042)![image](https://github.com/user-attachments/assets/df140214-535e-490c-8b34-eb168a652b9f)![image](https://github.com/user-attachments/assets/4c082226-c770-4a69-bea7-207ea1ce3ae0)![image](https://github.com/user-attachments/assets/3d8dd547-4281-4a00-b912-22da14e97ed6)![image](https://github.com/user-attachments/assets/e2dce1e1-b867-4bea-9ba8-fa29b4715ca6)|

#### 3h. Create CORS (10 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create CORS |- In the Quick Find\>Type CORS</br>- Click on New\> Paste **https://DOMAINNAME.my.site.com** In Origin URL Pattern </br>- Replace DOMAINNAME with actual org Domain Name.</br>\> Click Save</br></br>-Click on New . </br>- Paste **https://*.develop.vf.force.com** to 'origin URL Pattern'</br>- Click Save</br></br>- Click on New</br>- Paste **https://*.live-preview.salesforce-experience.com.** to ‘origin URL Pattern’ </br>- Click Save</br></br>- Click on New</br>- Paste **https://*.my.site.com** to ‘origin URL Pattern’</br></br> **To find the Domain name please follow the following steps:** </br></br> \> Search for Domain in Quick find → Please copy the name which ends with .my.site.com (e.g epicorgfarm79.my.site.com) |![image](https://github.com/user-attachments/assets/219ed050-b9a3-4c98-8ef2-bddcf496d536)![image](https://github.com/user-attachments/assets/58e13f1c-df82-4da7-ad69-5afc06072b3d)|

#### 3i. Publish ESA (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Publish ESA | - Click on Setup </br>- In Quick Find, search Embedded Service Deployments and click on 'Embedded Service Deployments' (under Feature Settings --> Service --> Embedded Service) </br>- Click on ESA Web Deployment </br>- Click on 'Publish' button </br>- Wait for confirmation Message |![image](https://github.com/user-attachments/assets/95efd64a-9709-445a-a62e-414b6e482b84)

### 4. Prepare Agentforce

#### 4a. Add Agent User into Agentforce Service Agent and Activate (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Add Agent User into Agentforce Service Agent & Activate |- Click on setup, search for Agent</br>- Click on Agentforce Agents (under Einstein --> Einstein Generative AI --> Agentforce Studio)</br>- In the Agent list, click on 'Agentforce Service Agent'</br>- In the Details tab, click on the pencil icon against **"Agent User"**, select 'Agent User' </br>- Check the check box **'Keep a record of conversations with Enhanced Event Logs to review agent behavior.'** </br>- Click on Save then click on Open Builder </br>- Click Activate  |![image](https://github.com/user-attachments/assets/3c7d1952-1d13-4c2b-97d0-be8464fcab02)![image](https://github.com/user-attachments/assets/6d35fd77-c99f-46c4-b333-2ff00f6d7d8b)![image](https://github.com/user-attachments/assets/0e5cce82-f774-42f3-92aa-f4465c508e48)|

### 5. Miscellaneous Configuration

#### 5a. Update Einstein Search Retriever (perform only if Amazon S3 Connection has been created ) (10 minutes) $${\color{blue} S3 \space Optional: \space Please \space note \space that \space some \space functionality \space in \space Experience \space Cloud \space and \space in \space the \space C360 \space will \space no\space longer \space function\space as \space expected \space if \space not \space installed. }$$
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Update Einstein Search Retriever |- Click on **Setup**, in the Quick Find Box, enter Prompt Builder, and then select **Prompt Builder**</br>- Search for the Prompt Template named **AnswerHospitality Question** and click on the hyperlink</br>- Hover the cursor on text the next to 'Use this information to answer the question: ', click on Resource, click on Einstein Search, click on 'Hotel\_FAQ\_v3' and click on 'Hotel\_FAQ\_v3' Retriever</br>- On the right side click on default Hotel\_FAQ\_v3\_Retriever, in a Search text add value as "Input:Product.Name"</br>- Hover over cursor on next text on 'Use this information to answer the question:', click on Resource,  click on Einstein Search and click on Hotel\_Safety\_FAQ\_V2</br>- On the right side click on default Hotel\_Safety\_FAQ\_v2\_Retriever in a Search text add value as "Input:Product.Name"</br>- Click on Save As New Version click **Activate** |![image](https://github.com/user-attachments/assets/ec5aa058-6cd4-4d10-8716-1e1b08eb45b0)![image](https://github.com/user-attachments/assets/83b706ad-02d1-47b5-8cf4-747723b15e28)![image](https://github.com/user-attachments/assets/a8205402-43f8-47e6-8fd9-38ac0cb1d7ea)![image](https://github.com/user-attachments/assets/90cdf932-5657-4ce3-b8f9-bf39477105d2)

#### 5b. Share Product Object to External User (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Provide Product2 Sharing  |- Go to Setup, in the Quick Find Box, search for Sharing Setting </br> - Click on Sharing Setting (under Security) </br> - Click Edit </br> - For Product Object, under Default External Access, select "Public Read Only"</br> - Click Save  | ![image](https://github.com/user-attachments/assets/3e89dac1-a89f-4eea-9adb-8900149e86ae)|

#### 5c. Enable Org Theme Option on Sunshine Resort App (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Enable Org Theme Option on Sunshine Resort App  |- Go to Setup </br>- Search for App Manager</br>- Click on App Manager </br>- Click on Edit Related to "Sunshine Trails Hospitality"</br>- Check the checkbox under "Org Theme Options"</br>- Click Save|![image](https://github.com/user-attachments/assets/d4d94c5b-76f9-473c-950d-102efe235eac)![image](https://github.com/user-attachments/assets/dc84c0a3-99b5-449c-91f5-a55a725c37a8)|

#### 5d. Assign Contact Record Page as Org Default (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Assign Contact Record Page as Org Default. |- Click on Setup</br>- Click on Object Manager</br>- Click on Contact</br>-  Click on Lightning Record Page</br>-  Click on Contact Record Page (API Name should be 'Contact_Record_Page')</br>- Click on Edit \-\> Click on Activation \-\> Click on 'Assign Org Default' (Desktop and phone) \-\> Click on Save  |![image](https://github.com/user-attachments/assets/57b4b1e1-7ff7-4dea-a34c-d5fc057ac248)![image](https://github.com/user-attachments/assets/09c1297f-1f72-4b90-8b12-1af7c0571733)![image](https://github.com/user-attachments/assets/949c0429-9c77-402d-afe3-6e11340a77f9)

#### 5e. Create a New Version of Omni-Channel Flow (10 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create a New Version of Omni-Channel Flow  |- Click on Setup</br>- Search for flow on Quick Button</br>- Click on Flow</br>- Click on the Flow</br>- Click on **Route To ESA** </br>- Deactivate the flow and click on the **Route To ESA** at the end</br>- Remove the Service channel and select some other option and then select “Live Message” again</br>- In Route To Select "Agentforce Service Agent"</br>- In Agentforce Service Agent Select "Agentforce Service Agent"</br>- Go to the Fallback Queue ID 🡪 Remove the Messaging Queue and add it back (same queue)</br>- Save as new version and activate the flow by clicking on the **Activate** button.  |![image](https://github.com/user-attachments/assets/4a56fa29-0fc7-42c8-9dae-c1ecf574418c)![image](https://github.com/user-attachments/assets/c380d226-9e77-4d4e-bb38-db3b68dcdf60)![image](https://github.com/user-attachments/assets/12ef770d-d575-455d-a179-390778618eca)![image](https://github.com/user-attachments/assets/e11361fd-f53b-4f7b-8713-7c222b379535)|

#### 5f. Access email Deliverability to all email (5 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Access email Deliverability to all email | Click on Setup </br>- Search for ‘Deliverability’</br>- Change Access Email from ‘System email Only’ to ‘All email’.</br>- Click Save |![image](https://github.com/user-attachments/assets/77507363-6915-40ff-8443-ed89186f811c)

#### 5g. Prepare User (10 minutes) $${\color{blue} Optional: \space These \space steps \space are optional \space if \space you \space choose \space to \space use \space your \space own \space data. }$$
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Prepare Test User |**Note: These steps apply to both existing and new contacts. Below is an example using Marje** </br></br>To test Community functionality , please use : **Marje Croley** contact to login as experience user </br> - Navigate to Setup </br>- In the Quick Find box, search for Digital Experiences </br>- Click the ‘Allow users standard external profiles for self-registration, user creation and login checkbox </br>- Click Okay and click Save </br> </br> **Enable Community User** </br> </br>- Click the App Launcher</br>- Select the Sunshine Trails Hospitality app</br>- Navigate to the Contact of **Marje Croley**</br>- Click the 'Enable as Customer' button (Goto classic page, if the button is not visible)</br>- Update the User License to Customer Community Profile</br>- Update the Profile to Sunshine Resort Profile</br>- Update the Email field to your personal email  </br>- Click Save </br></br> **Optional: Update Marje’s email address in her contact record if you want to receive notifications. Otherwise, this step is not necessary.** </br></br>- Click the App Launcher </br>- Select the Sunshine Trails Hospitality app </br>- Navigate to the Contact of **Marje Croley** </br>- Click the Edit button </br>- Update the Email field to your personal email </br>- Click Save  | ![image](https://github.com/user-attachments/assets/d82a699e-631d-4136-9d7f-ede27652e2d2)![image](https://github.com/user-attachments/assets/c009a09e-ed99-4ded-aa53-469c94a05a98)![image](https://github.com/user-attachments/assets/4767196d-0181-42e0-a074-5eebe8403dc8)![image](https://github.com/user-attachments/assets/be237889-9073-4a27-ab35-0e2d8da396a6)![image](https://github.com/user-attachments/assets/bde45527-5ac1-4506-a645-07f5be2c0eae)|

### 6. General Notes (30 minutes)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| General Notes for new community User | To test Community functionality , please use : **Marje Croley contact** to login as experience user </br> **Note:** If user self register from experience site sign up page, admin needs to add below permission set to that new community user </br>- **Buyer** </br>- **Customer Community Plus Permissions**|![image (44)](https://github.com/user-attachments/assets/81cdd8a1-ce5a-469d-9004-48722f4caa02)|
|**Verify Product Experience Prompt Builder Activation**| Please ensure that the **Product Experience Prompt Builder** is active. </br></br> To verify: </br></br>&emsp;- Navigate to **Setup**</br>&emsp;- In the Quick Find box, search for **Prompt**</br>&emsp;- Click on **Prompt Builder**</br>&emsp;- Open **Product Experience**</br>&emsp;- Check if it is Active</br>&emsp;&emsp;If not, please activate the **Prompt Builder**</br></br> 
|**Enable EPSessionIdHelper Visualforce Page**|</br>&emsp;- Log into Salesforce, click the gear icon in the top-right corner, and select Setup</br>&emsp;- In the Quick Find box, search for Visualforce Pages and select it.</br>&emsp;- Locate EPSessionIdHelper in the list.</br>&emsp;- Click the Security link next to the Visualforce page label</br>&emsp;- In the Available Profiles list, select the following profiles:</br>&emsp;&emsp;Einstein Agent User</br>&emsp;&emsp;Sunshine Resort Profile</br>&emsp;&emsp;System Administrator</br>&emsp;- Move them to the Enabled Profiles list using the arrow button</br>&emsp;- Click Save to apply the changes </br></br> 
|**Steps to Create a New Retriever in Einstein Studio**|-Go to the App Launcher </br>-Type "Einstein Studio" in the search bar and select it </br>- Click on "Retriever", then click "New Retriever" </br>-Select Retriever Type as "Data Cloud"</br>-Set the following: a) DMO: Product</br>b)Search Index: Product </br>- Click Next </br>-Choose "All Documents" when prompted </br>- In the Fields to Return section, configure the following mappings:</br>a) Description → Product > Product Description</br>b) Product Id → Product > Product Id</br> c) Pet Policy → Product > Pet Policy</br> d) Product Family → Product > Product Family</br> e) Name → Product > Product Name</br> f) isActive → Product > Active </br> Click Next, then click Save. |![image (41)](https://github.com/user-attachments/assets/fcca6126-bcf4-4c07-8f2c-c31e2465cdb3)|
|**Steps to Add a Retriever to the "Searching Hotel" Prompt in Prompt Builder:**|-Go to Setup </br>-Search for and click on Prompt Builder</br>-Open the "Searching Hotel" prompt</br>-Locate the Hotel Details text section</br>-To add a retriever:</br>-Click Resource</br>- Select Einstein Retriever</br>-Choose product then select Product Retriever|![image (42)](https://github.com/user-attachments/assets/79a6d108-f91a-46dd-8ef6-a646ba197450)|
|**Finalize and Activate the Prompt in Prompt Builder:**|-Click on the Retriever you just added</br>- On the right-hand panel, the Product Retriever settings will appear</br>-In the Search Parameter text box, enter the following value: input:Question </br>-Click Save As to save your changes</br>-Finally, click Activate to activate the prompt in Prompt Builder</br></br>
|**Steps to Add a Retriever to the "Searching Hotel For Pets" Prompt in Prompt Builder:**|-Go to Setup </br>-Search for and click on Prompt Builder </br>-Open the "Searching Hotel For Pets" prompt</br>Locate the Hotel Details text section</br>-To add a retriever: </br>-Click Resource</br>-Select Einstein Retriever</br>-Choose Product Then select Product Retriever |![image (43)](https://github.com/user-attachments/assets/24472c3a-7d48-4ccb-8736-f4955a46f51b)|
|**Finalize and Activate the Prompt in Prompt Builder:**|-Click on the Retriever you just added </br>-On the right-hand panel, the Product Retriever settings will appear </br>-In the Search Parameter text box, enter the following value:input:Question</br>Click Save As to save your changes</br>Finally, click Activate to activate the prompt in Prompt Builder.
</details>



<details><summary>
  
  ## 7. Mulesoft Configuration for Amadeus Prices
  </summary>

  4 step process

  **IMP NOTE:** You may skip the MuleSoft section if it is not applicable to your use case. However, if you plan to use MuleSoft, please ensure you register with [Amadeus](https://developers.amadeus.com/self-service/category/hotels) to obtain your Client ID and Client Secret.</br>



**Please check if the Ingestion API setup, Data Stream configuration and Data Mappings are already present in the org. If present, start with 3. Mulesoft Configuration**

### 1. Data Cloud Configuration Steps (20 minutes) $${\color{blue} Mulesoft \space Optional: \space Please \space note \space that \space some \space functionality \space in \space Experience \space Cloud \space will \space no\space longer \space function\space as \space expected \space if \space not \space installed. }$$

   ##### 1.1.	Create an Ingestion API in Data Cloud (Skip if already performed)
   | Step  | Action and Details  |  Images |
   | ----- | ----- | ----- |
   | Configure an Ingestion API in Data Cloud |- Click on Setup</br>- Click Data Cloud Setup</br>- Under "External Integration", click Ingestion API</br>- Click New</br>- Provide the Connector Name as "Mulesoft Ingestion API"  | ![image](https://github.com/user-attachments/assets/fcf0f0fe-2d1c-4cc3-b244-0a2f7606ec4b)|


   ##### 1.2.	Upload the .yaml file to define the Schema (Skip if already performed)
   | Step  | Action and Details  |  Images |
   | ----- | ----- | ----- |
   | Download .yaml file |- Click on on the link below to download the .yaml file</br> https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/tree/master/Mulesoft%20Yaml%20File| |
   | Define the Order Schema |- Click on Upload Files</br>- Choose the downloaded schema .yaml file and upload</br>- Make sure the Connection matches the image  |![image](https://github.com/user-attachments/assets/0cc0ddcb-c242-4512-9f25-a08ca6bd15cc)


   ##### 1.3.	Create a Ingestion API Data Stream using the Schema object (Skip if already performed)
   | Step  | Action and Details  |  Images |
   | ----- | ----- | ----- |
   | Configure the Data Stream |- Go to App Launcher → Data Cloud → Data Stream.</br>- Click New</br>- Under Connected Sources, clik "Ingestion API"</br>- Click Next</br>- Choose "Mulesoft Ingestion API"</br>- In the Objects list choose "Order"</br>- Click Next</br>- Choose Category as "Engagement", Primary Key as "hotel_name" and Event Time Field as "created_date"</br>- Click Next</br>- Choose Data Space as "default"</br>- Click Deploy| ![image](https://github.com/user-attachments/assets/9e24ce88-c90f-4d74-a9ac-9041f1baced8)![image](https://github.com/user-attachments/assets/aac912fb-e3cf-485a-9cbc-a351e14d43cf)|
   | Verify Data Stream |- Make sure the Data Stream configuration matches the image | ![image](https://github.com/user-attachments/assets/b424eec5-b004-46aa-a948-e5b59efe0b26)![image](https://github.com/user-attachments/assets/6b825407-9985-4d8f-a7ef-84893ddf68d9)|

   ##### 1.4.	Configure Mapping to DMO (Skip if already performed)
   | Step  | Action and Details |  Images |
   | ----- | ----- | ----- |
   | Data Mapping |- Configure Source to Target mapping such that the mapping matches the image |![image](https://github.com/user-attachments/assets/1cab5175-4b1d-4f93-9c23-e1e30e60e093)


### 2. Mulesoft configuration (20 minutes) $${\color{blue} Mulesoft \space Optional: \space Please \space note \space that \space some \space functionality \space in \space Experience \space Cloud \space will \space no\space longer \space function\space as \space expected \space if \space not \space installed. }$$
**Note: Skip if you are using the provided configuration XML file directly.**</br>
</br>XML File: https://git.soma.salesforce.com/gdevadoss/DataCloudHospitalityDemo/tree/master/Mulesoft%20configuration </br></br>- Open the **Streaming Insert Object** connector and click on **"Test Connection."** </br>- Enter the required credentials: **Client ID, Client Secret, Username,** and **Password**.
 These can be obtained from the **Connected App in Salesforce**. </br>- Ensure that the Connected App is created beforehand to retrieve these credentials. </br>- Store the credentials in the **Salesforce Connector App**.</br>


### 3. Salesforce Configuration Steps (10 minutes) $${\color{blue} Mulesoft \space Optional: \space Please \space note \space that \space some \space functionality \space in \space Experience \space Cloud \space will \space no\space longer \space function\space as \space expected \space if \space not \space installed. }$$
   | Step  | Action and Details  |  Images |
   | ----- | ----- | ----- |
   | Create a Connected App | Create a New Connected App in Salesforce for securely integrating MuleSoft with Salesforce Data Cloud via APIs using OAuth2.0</br> Follow the steps below to create the Connected App.</br>&emsp;- Go to Setup, Search for App Manager and select App Manager</br>&emsp;- Configure the Connected App as shown in the image</br>&emsp;- Ensure you grant Profile level access to newly created Connected App to System Administrator profile |![image](https://github.com/user-attachments/assets/bfe17d05-b392-4a7a-814a-e6d72c31cafe)
   |  | </br>- After creating the Connected App, click on Manage</br>- Configure the App to match the configuration shown in the image |![image](https://github.com/user-attachments/assets/457538af-90d6-4bdb-84ad-ecd8df306d87)|
   |  | </br>- Go to Setup and search for OAuth and OpenID Connect Settings and enable the Allow OAuth Username-Password Flows | ![image](https://github.com/user-attachments/assets/eff46289-456b-4441-b16f-08c0f4184798)|

### 4. Mulesoft Configuration Steps (20 minutes) $${\color{blue} Mulesoft \space Optional: \space Please \space note \space that \space some \space functionality \space in \space Experience \space Cloud \space will \space no\space longer \space function\space as \space expected \space if \space not \space installed. }$$
   | Step  | Action and Details  |  Images |
   | ----- | ----- | ----- |
   |Update the Mule flow that inserts data from Mule to Salesforce Data Cloud via Ingestion API| |![image](https://github.com/user-attachments/assets/dd21d524-ff9a-4ea4-9fca-2a45d2f72f60)|
   |  |**HTTP Request Connector step** </br>- API URL: https://test.api.amadeus.com/v1/security/oauth2/token</br>- Method: POST</br>- Body</br>&emsp;\%dw 2.0</br>&emsp;output application/x-www-form-urlencoded</br>&emsp;\---</br>&emsp;\{</br>&emsp;&emsp;grant_type: "client_credentials",</br>&emsp;&emsp;client_id: "xxxxxxxxxxxxxxxxx",</br>&emsp;&emsp;client_secret: "xxxxxxxxxxxxxxxxx"</br>\} | ![image](https://github.com/user-attachments/assets/532252ea-d43a-4a3a-91af-82307507be72)|
   |  | **Store Access Token step** </br>- Configure as shown in the image | ![image](https://github.com/user-attachments/assets/cf476480-bad3-4779-950b-6b7da3a56601)|
   |  | **Request To Get The Hotel Price step** </br>- API URL: https://test.api.amadeus.com/v3/shopping/hotel-offers</br>- Method: GET</br>- Pass the Header and Query Parameters (get the Hotel Id from Amadeus API and store in the query parameters to get prices for these Hotels)</br>Hotel Id list: MCLONGHM,RTPAR001,BRLAXRRB,ALLON591,ICTYOICB,HLDXB100,ARMADALC,ARMADCAR |![image](https://github.com/user-attachments/assets/a26ab791-357c-4161-9d0f-2fa844411af4)![image](https://github.com/user-attachments/assets/d028675c-fa79-411e-a493-a66c0e11b372)![image](https://github.com/user-attachments/assets/96119f20-60a2-454b-a047-752563ee0c5c)|
   |  |  **Transform Message step** </br>- Prepare the JSON (format given below) that is going the used in Salesforce Connector to ingest data via ingestion API</br>&emsp;\%dw 2.0</br>&emsp;output application/json</br>&emsp;var hotelName = ["Palm Oasis Resort","Coral Bay Retreat","Lagoon Paradise Resort","Emerald Bay Resort","Azure Cove Villas","Golden Palms Retreat","Sea Breeze Villas","Paradise Sands Resort"]</br>&emsp;\---</br>&emsp;\{</br>&emsp;&emsp;data: payload.data map(item, index) -> \{</br>&emsp;&emsp;&emsp;hotel_name: hotelName[index],</br>&emsp;&emsp;&emsp;cost: floor(item.offers[0].price.total as Number),</br>&emsp;&emsp;&emsp;created_date: now() as DateTime</br>&emsp;&emsp;\}</br>&emsp;\} | |
   |  | **Streaming - Insert Objects step** </br>- Setup the Salesforce Streaming Insert Object connector (to connect Mule to Salesforce), by providing appropriate Username, Password, Client Id and Client Secret </br>- Configure the connector by providing Source API Name: Mulesoft_Ingestion_API and Object: Order | ![image](https://github.com/user-attachments/assets/9f945715-439f-4e50-b04d-3cb2fa71d390)![image](https://github.com/user-attachments/assets/d1cd2fa1-4c5a-40f3-b8d5-20149a66b67d)|

</details>

**Behind the Scenes**

Using the Agent to search for a hotel and create a reservation

   | Sl. No. | Utterance | Behind the scenes | Topic | Components |
   | ----- | ----- | ----- | ----- | ----- |
   | 1. | Find a beach front family friendly hotel for next weekend? | Uses LLM to find dates for next weekend, reads unstructurd data via a custom retriever as the hotel description is from in-line unstructured data (i.e. column in a table), prompt builder, APEX class to orchestrate a call via Mulesoft to a travel consolidator to compare prices and looks at structured Reservation Data, Platform event to show the flyout experience | Hotel Inquiry For Family Friendly Hotel and Pets Allow Hotel | Prompt Action (Searching Hotel).
 Flow(Get Product Details From Prompt Builder) </br> Apex (a.DisplayProductList - to publish the platform event to display the Flyout and b.NextWeekendDateCalculation - display the nextweekend check in/check out date for each hotel) </br> LWC - productListComponent, displayFriendlyHotel, childModal, defaultPrechatValuesComponent </br> Platform Event - Enable_Pet_Friendly_Comp__e, Enable_Hotel_Search_Comp__e </br> Ingestion API - Mulesoft_Ingestion_API |
