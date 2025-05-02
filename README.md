# DataCloudAutomotiveDemo

Table of Contents
=======================
[1. Installation Guide Sample](#pre-deployment-instructions) 

[2. Salesforce Package Installation](#salesforce-package-installation)

[3. Data-Cloud Configuration](#data-cloud-configuration)

[4. Commerce Cloud Configuration And Sample Data Creation](#commerce-cloud-configuration-and-sample-data-creation)

[5.Configure amazon and snowflake connection](#configure-amazon-and-snowflake-connection)

[6. Finish Configuration](#finish-configuration)

[7. Mulesoft Configuration For Real Time Telemetric Data](#mulesoft-configuration-for-real-time-telemetric-data)

[8. Mulesoft Configuration For Vehicle Issue](#mulesoft-configuration-for-vehicle-issue)

<details><summary>

  ## 1. Pre-Deployment Instructions
</summary>

 ### Table of Contents
  [1.	Salesforce Org Setup Requirements for Automotive App](#1-salesforce-org-setup-requirements-for-automotive-app)
  
  [2.	Enable Features on the Org](#3-enable-features-on-the-org)

  [3.	Install Pre-Deployment Package](#2-install-pre-deployment-package)
  
  [4.	Setup the Salesforce Org](#4-setup-the-salesforce-org)


  ### 1. Salesforce Org Setup Requirements for Automotive App

   To support the Automotive app, you can either create a new Salesforce Org or use an existing one, provided it includes the following features and licenses: 

  | Requirement | Details |
  | ----- | ----- |
  | Licenses Required | - Data Cloud</br>- Auto Cloud</br>- Sales Cloud</br>- Service Cloud</br>- Experience</br>- Commerce Cloud</br>- Marketing Cloud</br>- MuleSoft (Optional) |
  | Features Required | - Service Agent</br>- Einstein Agent</br>- Copilot</br>- Prompt Builder</br>- Agent Force</br>- Real-time</br>- Code Builder (Optional) |

 ⚠️ **Important Note:** Existing Trailheads playgrounds cannot be used 


### 2. Enable Features on the Org

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Enable Commerce Cloud | - From Setup, enter ‘Commerce’ in the Quick Find box.</br>- Select ‘Settings’ under ‘Commerce’.</br>- Turn on ‘Enable Commerce’.</br>-Turn on Enable App under Enable the Refreshed Commerce App.</br>Save | ![Enable commerce cloud1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/Enable%20commerce%20cloud1.png)|
  | Enable Automotive | - From Setup, enter ‘Automotive’ in the Quick Find box.</br>- Select Automotive Settings.</br>- Turn on ‘Automotive’. </br>-Select 'Service Console for Automotive’.</br>-Turn on ‘Service Console for Automotive.’ </br>-**Note:** When you create a scratch org for Automotive Cloud where the Service Console for Automotive setting is enabled, assign the Automotive Foundation User and the Industry Service Excellence permission sets to the scratch org user.| ![enable automotive](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/8675c5ae-efe8-4462-88f1-375729fc76df)![enable automotive2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f80b8883-3f3a-4bda-a23b-96fda101a9be)![enable automotive3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c5f7f55f-b4ba-4cd5-9911-f007f53811b4)|
| Enable Vehicle and Asset Finance Settings  | - From Setup, in the Quick Find box, enter Vehicle and Asset, and then select Vehicle and Asset Finance Settings. </br>- Enable Vehicle and Asset Finance.</br>- Make sure you’ve enabled Automotive in your org before you enable this feature. </br>- Before enabling Vehicle and Asset Finance Additional Components, enable Timeline. Click on URL. </br>- Turn on the Timeline to enable. </br>-Navigate to Vehicle and Asset Finance and enable Vehicle and Asset Finance Additional Components  | ![enable vehicle asset finance](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/e10921b3-69a7-4f50-ad71-53215bd414ff)|
|Enabled System Permissions for automotive objects. |-Go to setup.</br>-Search Permissions set and click on it. </br>-Find out "Data Cloud Salesforce Connector" permission and click on it. </br>-Click on system permission. </br>-Find the "Use Automotive Foundation" Permissions name and check checkbox Enabled it. </br>-Find the "Use Vehicle and Asset Finance Features" permission name and check checkbox  enabled it. </br>-Click on Save.  |   |
| Enable Partner Lead Management  | - Go to setup .</br>- Search Partner Lead Management and click on it. </br>- click on toggle enabled.  |  |
| Enable Interest Tags | - Go to setup .</br>- Search Interest tags .</br>-Enable the toggle. |  |

### 3. Install Pre-Deployment Package

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Install package | - Click on this Package Installation [Link ](https://login.salesforce.com/packaging/installPackage.apexp?p0=04tPa000000iKz7)</br>- Sign-in to the Org with your credentials.</br>- Choose Install for Admins Only option</br>- Choose “Rename conflicting components in package” and click the Install button.</br>- Wait until installation is completed, you will receive a confirmation on logged in user’s email | ![Install package1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/01ea0c61-5a63-4438-a3b8-5b5ec783ca94)|
| Verify Package installation | - Click Setup</br>- Search for package</br>- Search for 'AutomotiveConfigPackage' is installed  |![verify package install1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/9e016e2e-d92e-4abb-b4d8-1a096b14e6dd)|

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Site Name and URL |-From Setup, enter ‘Digital Experiences’ and select ‘All Sites’ under ‘Digital Experiences’. </br>- After selecting the template, enter a site name and URL.Name the site ‘AutoFolio’ and ensure the URL ends with /AutoFolio.</br>-Click Create. Your site will be created in Preview status. | ![site name url](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/33b3ed69-b061-4525-b68f-4550c350194c)|
|Activate Site |-From Setup, enter ‘Digital Experiences’ and select ‘All Sites’ under ‘Digital Experiences’. </br>-Click Workspaces next to AutoFolio. Select Administration, then Emails.</br>-Under ‘Email Tabs,’ uncheck ‘Send welcome email’ and click Save. </br>-In Settings, click Activate and confirm by clicking OK. </br>-Your site will now be live and fully set up. | ![activate site](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/18ec05c3-b6e3-482b-bf9a-1241c25be43f)![ac](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/235d5691-9259-4ca7-b792-4f78509dbafe)|
|Enable Data Cloud Setup Home |-Go to Setup → Quick box search Data Cloud Setup Home.</br>-Enable/Activate it. **Note:** After activation wait 10 min to complete the Automated Steps. </br>-**Note:** We need to perform this step only when the below step integration data cloud button is disabled.| ![Enable data cloud setup](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/d1f1138a-87b5-4100-9712-7253f9083cb5)|
  | Enable Data Cloud on Experience Site | - Go to Setup → Digital Experiences → All Sites.</br>- Click Builder for ‘Autofolio’.</br>- Click Settings → Integrations.</br>- Click Add to Site for Data Cloud.</br>- Enable “Share site data with Data Cloud” and click Save.</br>- Once enabled, a green box will appear</br>- Click Publish in the top-right corner |  ![enable data cloud on exp site](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/feeacff6-565a-4b9b-8878-7ecd94aca929)![enable data cloud on exp site2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c3602060-baef-4f32-a9c9-4437d06ba78c)|
| Verify Data Stream  | - Go to App Launcher → Data Cloud → Data Stream.</br>- Change List View to All Data Streams.</br>- Search for Experience\_Cloud.</br>- 6 total Data Streams should appear |  ![verify data stream](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/d21d4a25-4ff2-4989-bfcd-f1bda3a52ded)|
  | Create a Record on Custom Metadata | - Go to Setup \-\> Search for Metadata type \-\> Click on ‘Install Package Settings Enabled’ \-\>   Click on **Manage Install Package Settings Enabled** \-\>Click on ‘New’ \-\> Give Label as  **Package Settings Enabled** and **Check Checkbox of Installation Settings Enabled Field**  |  ![Create record on custom metadata](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/a029f687-eac1-45e9-b213-1f0d556a4a95)![Create record on custom metadata2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/e5bb292f-96ae-4a9c-813a-859b2239b358)|


  ### 4. Setup the Salesforce Org

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Assign data cloud Permissions for Standard and Custom Object  | - Click on App Launcher, search for Automotive and click on **Automotive Setup** App</br>- Click on the “**Assign Permissions for Standard Objects**” button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further.  | ![Assign data cloud permission for standard cusotm obj](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f9333aa9-31ff-47aa-be37-78b1adb5477c)|
  | Modify the Data Cloud Admin Permission Set | - Open the Setup Menu and click Setup</br>- In the Quick Find, search for ‘Permission Sets’ and click ‘Permission Sets’</br>- Click the ‘Data Cloud Admin’ permission set</br>- In the Apps section, click ‘Data Cloud Data Space Management’</br>- In the Data Spaces panel, click Edit.</br>- Check the ‘Enabled’ checkbox for the default data space and click Save</br>- Click OK in the confirmation dialog | ![modify the data cloud admin PS](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/6ec5c998-2985-4fff-87cf-a8d68865e88b)|
  | Create a Connection to Amazon S3 | ***NOTE:*** If you do not have an existing Amazon S3 instance, [register for the free tier](https://aws.amazon.com/free/), and then follow instructions in [How to Use the Amazon S3 Storage Connector in Data Cloud](https://developer.salesforce.com/blogs/2023/10/how-to-use-the-amazon-s3-storage-connector-in-data-cloud) to create dedicated user with required permissions for this demo.</br></br>If you already have an S3 instance, no need to sign up for a new one.</br></br>Before proceeding further, make a note of your [programmatic credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-creds.html#access-keys-and-secret-access-keys) (Access Key ID and Secret Access Key) that can be used to access the account</br></br>- Navigate to Data Cloud Setup</br>- In the menu, under EXTERNAL INTEGRATIONS, click on Other Connections</br>- Click **New**, choose **Amazon** **S3** as the source and click **Next**</br>- Name the connection **Amazon_S3_Unstructure**</br>- Fill in the credentials and save. ***DO NOT CHANGE THE CONNECTION NAME*** </br>- Refer to [this](https://developer.salesforce.com/docs/data/data-cloud-int/guide/c360-a-set-up-s3-connection.html) document for more details on how to setup the connection | ![create connection to amazon s3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/72523fac-9a94-4981-a564-2f8645a60693)|
  | Create a connection to snowflake | **NOTE:** If you do not have access to an existing Snowflake instance, please get access before proceeding further</br></br>- Follow instructions in [this article](https://developer.salesforce.com/blogs/2024/08/zero-copy-data-federation-with-snowflake-and-salesforce-data-cloud) to create a Warehouse and Integration User in Snowflake, generate a public and private key pair, and configure Salesforce Data Cloud to connect to Snowflake.</br>- Name the connection ***“SnowflakeDataFederatio”*** | ![create connection to snowflake](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/07ef5511-019f-46cb-8b73-8f78c1cf36b8)|
  | Create a connection for Mulesoft Ingestion API | - Go to **Setup** \-\> In the **Quick Find** box, type ***static***, then select ***Static Resources***</br>-In the index across the top, click the letter **R** </br>- Click on **‘Real_Time_Telemetric_Data’** </br>- Click on **‘View File’** hyperlink. The **‘Real_Time_Telemetric_Data.txt’** And and **‘Vehicle_Issues_Details’** is downloaded to your computer.</br>- Change the file extension from ***.txt*** to ***.yaml***</br>**1-** Go to Data Cloud Setup, click on Ingestion API → Click New</br>- Provide the Connector Name as ’Real_Time_Telemetric_data’</br>- Upload **Real_Time_Telemetric_Data.yaml**  file which you have downloaded from above steps and Upload file to scheme and click on Save. </br>⦁	Repeat all the above step to create second Ingestion API with Name as **‘Vehicle_Issues_Details’**|  ![create connection to mulesoft ingestion api](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/7aaeaab4-415e-4276-b6e3-15f09904628f)|
 | Turn On Einstein Bots And Agent | - Navigate to Setup</br>- Search and Select ‘Einstein Bots’</br>- Turn on Einstein Bots</br></br>-Navigate to Setup </br>-Search for Einstein</br>-Click on ‘Einstein Setup</br>-check the ‘Turn On einstein’ toggle </br>-Navigate to Setup </br>-Search for agent</br>-Click on Agentforce Agents </br>-Toggle the agentforce to Enabled </br>-Drag down on same page and Enable the Agentforce (Default) Agent </br>-Refresh the page|  |
 | Deactivate Standard Einstein CoPilot Bots | - Click on Setup</br>- Search 'Agent' and click ‘Agents’</br>-Enable the Agentforce (Default) Agent </br>- Click on 'Einstein Copilot'</br>- Click on 'Open Builder'</br>- Click on 'Deactivate'</br>- Click on ‘Ok’ |  |
  |Activate Salesforce CRM |-Go to Setup. </br>-Click on Data Cloud Setup.</br>-In quick find search for Salesforce CRM.</br>-Click on Salesforce CRM.</br>-Go to the Standard Connection section and activate it. |![activate salesforce crm](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/9c21d20c-177e-439a-9b8a-46b311f5753b)|

</details>

<details><summary>
  
  ## 2. Salesforce Package Installation
</summary>

### Table of Contents
  [1.	Install AutoFolio Base Package ](#1-Install-AutoFolio-Base-package)
  
  [2.	Verify The Package is installed ](#2-Verify-The-Package-is-installed)

### 1. Install Automotive Base Package
 | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Install Automotive Base Package | - Click on this Package Installation [Link ](https://login.salesforce.com/packaging/installPackage.apexp?p0=04tPa000000gErN)</br>- Sign-in to the Org with your credentials.</br>- Choose Install for Admins Only option</br>- Choose “Rename conflicting components in package” and click the Install button.</br>- Wait until installation is completed, you will receive a confirmation on logged in user’s email | <img width="184" alt="Install AutoFolio Base Package1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/bac9dfc5-8f27-4536-9df6-7d2471dd95f0">|
| Verify Package installation | - Click Setup</br>- Search for package</br>- Search for 'SFAutomotivePackage' is installed  | ![Verify the package is installed](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/0df2c9b8-b816-4636-bcc4-0d912c1dbdd0)|
</details>

<details><summary>

 ## 3. Data Cloud Configuration
</summary>

## Table of Contents

[1. Install the Data Kit to add Data Cloud components to the Org	](#1-install-the-data-kit-to-add-data-cloud-components-to-the-org)

[2. Create Data Stream for Snowflake	](#2-create-data-stream-for-snowflake)

[3.Create Ingestion API for Mule Data Streams from Data Kit	](#3-Create-Ingestion-API-for-Mule-Data-Streams-from-Data-Kit)

[4. Create Automotive FAQ DLO Creation for unstructured data](#4-Create-Automotive-FAQ-DLO-Creation-for-unstructured-data)

[5. Create Identity Resolution Ruleset from Data Kit	](#5-Create-Identity-Resolution-Ruleset-from-Data-Kit)

[6.Create Calculated Insights	](#6-Create-Calculated-Insights)

[7. Create Data Graph	](#7-Create-Data-Graph)

[8. Create Data Cloud Copy Field Enrichment	](#8-Create-Data-Cloud-Copy-Field-Enrichment)

[9. Create activation target	](#9-Create-activate-target)

[10. Create segment from data kit](#10-Create-segment-from-data-kit)

[11. Create Activation	](#11-Create-Activation)

[12. Search Index and Retriever Configuration ](#12-Search-Index-and-Retriever-Configuration)


### 1. Install the Data Kit to add Data Cloud components to the Org
The Data Kit is installed as a part of the Package installation. Once the Data is available in
the org, follow the steps below to create data streams.

 | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Data Streams from Data Bundle | - While logged into the environment where you installed the data kit</br>- Go to Data Cloud app and the Data Streams tab.</br>- Click New to create a Data Stream</br>- Select Salesforce CRM and click Next.</br>- Under Custom Data Bundles,select the SalesforceCRM01. </br>-Select your Salesforce Org and Click Next. </br>-Select the data space as ‘Default’, review the fields in your data stream, and click Next.</br>-Review details and click “Deploy”.</br>-Repeat the same step for second Data Bundles, select the SalesforceCRM02 . | ![Create Data Streams from Data Bundle 1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/2d9fbf7c-12f0-4267-b8bc-0a0b5bbb6de0)![Create Data Streams from Data Bundle  2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/9ec6de15-9938-44fd-9bce-f92cc688a173)![Create Data Streams from Data Bundle  3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/87343484-c5a4-470a-9c78-64be2f08c648)|
| Create Website_Mobile_apps Data Stream from Data Kit |- Click on Data Stream</br>- Click on New</br>- Select ‘Installed Data Kits Package’</br>- Select ‘SFAutomotivePackage’ Data Kits</br>- Select checkbox under ‘Websites_Mobile_Apps’ click on ‘Next’</br> -Select Connector type =‘website’ & connector name Experience_Cloud_Event_Connector’.</br> - Click on Deploy| ![Create Website_Mobile_apps Data Stream from Data Kit1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/9d8ad62c-98ae-4368-b625-0ffcd577a1f2)![Create Website_Mobile_apps Data Stream from Data Kit2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/495de831-3302-4e83-bf01-d46829484694)![Create Website_Mobile_apps Data Stream from Data Kit4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/49c79cf4-1852-4577-8bfa-b0e1a3556c3e) ![Create Website_Mobile_apps Data Stream from Data Kit5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/a1323341-7ee6-4c57-bf15-4ed0794554b9)![Create Website_Mobile_apps Data Stream from Data Kit6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/edb9612a-6383-4e9d-83ff-ab597e31d99b)|
| Create a Data Stream for Amazon S3 from Data Kit |- Click on Data Stream Click on New</br>- Select Installed Data Kits & Packages Click on Next</br>- Select SFAutomotivePackage Data Kits<br> - Select Amazon_S3_Bundle</br>- Select Connection as InfosysAWSbucket</br>- Select the data space as ‘Default’, review the fields in your data stream,and click Next</br>-Review details and click Deploy  | |

 ### 2. Create Data Stream for Snowflake
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Data Stream for Snowflake from data kit | - Click on Data Stream Click on New </br>- Select Installed Data Kits & Package Click on Next</br>-Select Snowflake Bundle</br>- Select connection as ‘SnowflakeDataFederation’ .</br>- Select Database as ‘INFOSYS_DEMO’.</br>-Select ‘PUBLIC’ on schema> On Available Object Select ‘THIRD_PARTY_SURVEY ’. | ![Create Data Stream for Snowflake from data kit1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/ebd53c2c-d24e-43ae-b00d-65f8c167462d)|

  ### 3. Create Ingestion API for Mule Data Streams from Data Kit
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | **Real Time Telemetric** | - Click on Data Stream </br> - Click on New.</br>- Select Installed Data Kits & Package. </br>- Select ‘SFAutomotivePackage’ Data Kits. </br>- Select Name as **RealTimeTelemetric**.</br>- Click on Next.</br> -Select Connection as ‘Real_Time_Telemetric_Data </br>- Click Next </br> -  Click Deploy| ![Create Ingestion API for Mule Data Streams from Data Kit   1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/315e3b7c-23b7-4aed-8fbf-bed29e8227b4) ![Create Ingestion API for Mule Data Streams from Data Kit   2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/09834fac-bad8-4411-ac16-ac95072228a7) ![Create Ingestion API for Mule Data Streams from Data Kit   3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/05e6aba8-da07-4d2a-81da-3076a3e2f131) ![Create Ingestion API for Mule Data Streams from Data Kit   4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/36773553-baee-4999-8b32-74012b66e479)  ![Create Ingestion API for Mule Data Streams from Data Kit   5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/83bc3467-8a6e-412b-8ed5-2ff3586697e2)|
  | **Vehicle Issues** |-Click on Data Stream </br> - Click on New.</br>- Select Installed Data Kits & Package. </br>- Select ‘SFAutomotivePackage’ Data Kits. </br>- Select Name as **VehicleIssue**.</br>- Click on Next.</br> -Select Connection as ‘Vehicle_issues_Details </br>- Click Next </br> -  Click Deploy|    |
  ### 4. Create Automotive_FAQ DLO Creation for Unstructured Data 
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Automotive FAQ. **Amazon Connection Should be Established**  | - Click on Data Lake Object Click on New</br>-Click on Create from Data Kits, Click on Next</br>-Select Automotive_FAQ, select connection. Click on Next.</br>-Click on Deploy.</br>-Follow same steps for creating **Automotive_Warranty_Info** DLOs| ![Create Automotive FAQ1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/0abe50c1-68fb-4bfa-8170-d6648cea7099) ![Create Automotive FAQ2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c3d1d4c6-7914-4912-b489-c733abfe9008)![Create Automotive FAQ3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/6e9433a3-00a6-4e17-82f8-78e229a3650e)|

### 5. Create Identity Resolution Ruleset from Data Kit
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  | -Go to Data Cloud app</br> - Click on the Identity Resolutions tab </br> - Click New</br> - Select Installed from Data Kit</b>- Choose "SFAutomotivePackage"</br>-Choose "Guest Profile" </br>- Click on Next</br>- Click on Save | ![Create Identity Resolution Ruleset from Data Kit1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/9ce9805a-d010-4aa6-a924-65484a0380ec)![Create Identity Resolution Ruleset from Data Kit2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c63c1bdd-ff59-4217-bfa4-81ed2d8a3955)![Create Identity Resolution Ruleset from Data Kit3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/39565f64-cc56-4239-81d8-d1c1e9bbf73f)|

### 6. Create Calculated Insights
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  Create Calculated Insights|- Go to Data Cloud app </br>- Click on Calculated Insights tab</br>- Click New</br>- Select "Create from a Data Kit" and click  Next</br>- Select ‘Customer Lifetime Value’</br>- Click on Next </br>- Click on ‘Check Syntex’</br>- Click on ‘Activate’</br>- Click Activate</br>- Select Schedule as "Scheduled for 24 hrs" </br>- Click on ‘Enable’</br>- Repeat the steps for the following metrics: ‘Customer Satisfaction Score’, 'Customer Interest from survey data’ | ![Create Calculated Insights1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f67dde54-5881-4852-866d-2a3a29f11f38)![Create Calculated Insights2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/782ea0f8-da54-4bbe-9142-688bceb1fa21)|

  ### 7. Create Data Graph
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  **Web Engagement RT** |- Click on Data Graph Tab</br>- Click on New</br>- Select Create from Data Kits</br>-Click on SFAutomotivePackage</br>- Select Web Engagement RT </br>- Select Realtime Profile. | |
  |   |- Select primary Data model object as “Unified Individual real”. |  |
  |   |- Click on Individual and go to the right side where the error is showing and uncheck the check box.</br>- Now click on Save & Build. |  ![Create Data Graph1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/a40a1bed-43af-4ebf-aa3e-755f08e7eeae)![Create Data Graph2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/07db4679-d8a7-4065-8422-e491130b534f)![Create Data Graph3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c6383be5-53b3-4363-80f8-57a12f352274)![Create Data Graph4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/417933de-198c-4162-8462-09f76e1f6af9)![Create Data Graph5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/0de55097-57e6-48a8-a826-9c0c56f2d718)![Create Data Graph6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/e18a441c-6608-47b5-9ea8-6297d5771505)![Create Data Graph7](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f253919a-016b-411b-8833-c56023e79494)![Create Data Graph8](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/717a8d72-7588-4527-978a-9b5c114c2bc7)|
  | **Automotive Real Time**   |-Click on Data Graph Tab  </br>-Click on New</br>-Select Create from Data Kits</br>-Click on AutomotiveDatakitPackage</br>- Select **Automotive Real Time**  </br>- Select Realtime Profile. |  |
  |   |- Select primary Data model object as “Unified Individual real”. |    |
  |   |- Click on Individual and go to the right side where the error is showing and uncheck the check box.</br>- Now click on Save & Build. |     |

### 8. Create Data Cloud Copy Field Enrichment
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Data Cloud Copy Field Enrichment |- Go to Object Manager.</br>- Search for Contact.</br>-Click on Contact</br>- Click on Data cloud Copy Field.</br>- Click on New.</br>- Select data space as ‘default’</br>- Select Data Cloud Object as ‘Customer_Lifetime_Value__cio’  </br>- Click on Next </br>- Select Field As ‘amt’| ![Create Data Cloud Copy Field Enrichment  1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/72cb4791-c6bf-4828-b004-be5cb7dcda92)![Create Data Cloud Copy Field Enrichment  2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/e7363b21-9973-4b7b-aabc-d427bb44a88b)![Create Data Cloud Copy Field Enrichment  3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/ed0e1869-6a87-4239-a829-4228214cd675)![Create Data Cloud Copy Field Enrichment  4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/1a222b64-4954-4b4c-83ee-7b0d8c247869)|
  |  |- Give Label as ‘Customer Lifetime Value’</br>- Click on ‘Next.</br>-On contact Select "Lifetime Value"</br>- Save and Start Sync. |![Create Data Cloud Copy Field Enrichment  5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/e2f552f4-6848-4d22-a156-3000ba109fdc)![Create Data Cloud Copy Field Enrichment  6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/8ee4fd4f-ff64-46f2-aa21-c1ecbcf988d2)![Create Data Cloud Copy Field Enrichment  7](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/15f514eb-6509-464c-bc41-ab59c4675b49)|
  |Data Cloud copy field For Customer satisfaction score|- Go to Object Manager.</br>- Search for Contact.</br>Click on Contact</br>- Click on Data cloud Copy Field.</br>- Click on New.</br>- Select data space as ‘default’</br>- Select Data Cloud Object as ‘Customer_Satisfaction_Score__cio’  </br>- Click on Next </br>- Select Field As ‘CSS’ | ![Data Cloud copy field For Customer satisfaction score 1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/b672c42d-3058-4c51-aa80-8b64be6086e4)<img width="238" alt="Data Cloud copy field For Customer satisfaction score 2" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/3d1f91d7-08d6-4370-80a4-de27bea48a05">|
  |  |- Give Label as ‘Customer Satisfaction Score’</br>- Click on ‘Next.</br>On contact Select "Customer Satisfaction Score"</br>- Save and Start Sync. | |

### 9. Create activation targets
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create Marketing Cloud Engagement |-Go to Data Cloud app </br>-Go to setup and select data cloud setup</br>-Search for Marketing Cloud Engagement and enable it.</br>-Finally, you need to check in Select Business Units to Activate option and click on Manage button.Check inside available business units and move those values to selected business unit.</br>-Click on Save. | ![Create Marketing Cloud Engagement1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/2229cefa-bc79-4f59-b25b-852de47218f5)![Create Marketing Cloud Engagement2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/0cc923f2-409b-4778-a03e-b04b4d01d11f)![Create Marketing Cloud Engagement3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/111e4701-2daa-4550-a35c-cc56a29fbd8a)|
  |Create Activation Targets |-Go to Data Cloud app.</br>-Click on the Activation Targets tab </br>-Click on MCDO.</br>-Need to provide name as Marketing for activation target.</br>-And selecting data space as default.</br>-Click on Next. | ![Create Activation Targets1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/ebbfbd4a-1e0c-4d9a-8701-8c559322b237)![Create Activation Targets2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/9fb2fd71-9b3e-47ae-98b1-64f3f8fbb8c5)|

### 10. Create Segment From Data Kit
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create Segment |-Go to Data Cloud app and Click on the Segment tab.</br>-Click on New</br>-Select "Installed from Data Kit”</br>-Choose "SFAutomotivePackage" </br>-Click on Next</br>-Select Segment as Individual and provide Segment name as Drivers visited the dealership.</br>-Select Rapid Publish</br>-Select Publish Schedule to 4 hrs and select the start and end date. </br>-Click on Save</br>-Click on the Publish now button. </br>-Needs to select the following segment from data kit</br>-Drivers who drove into the dealers. </br>-High Purchase Probability Customers v8 </br>-UpcomingWarrantyEnddate </br>-**Note:** After inserting the sample data or loading data from tool in the org. Go to Opportunity_Home data stream and click on Refresh Now button and wait for 15mins till you see Success message in Last run status. Then once again go to segment and publish it manually once.| ![Create Segment from Data Kit1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/fd88108e-5e01-4480-9227-40129e7ceaa1)![Create Segment from Data Kit2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/5c025a45-33d0-497f-865c-288573ffe329)![Create Segment from Data Kit3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/1ff0ef80-cb7f-458b-acc4-c637d1a4c2b3)![Create Segment from Data Kit5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/a54b0516-221c-4ea0-9acd-55ff55c77603)|

### 11. Create Activation
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create Activation|-Go to Data Cloud app </br>-Click on the Activations tab</br>-Click on new</br>-Select Segment and continue </br>-By default, space is default </br>-Need to select the High Purchase Probability Customer V8 segment and activation target as marketing </br>-click on continue</br>-Select Email and Click on continue</br>-Click on add attributes </br>-And from individual select the following attributes First Name and Last Name </br>-Click on Save and provide name as High Purchase Probability Activations. |![Create Activations1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/afb3b9f0-7f80-4307-b400-382126fb8fec)![Create Activations2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/e892b9ad-2476-4e12-9c7d-9f290ba7206d)![Create Activations3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/1d72a0b4-9fbe-4a4e-a10a-4ae0059bad96)![Create Activations4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c3c71c90-ab28-4f03-a7c0-1bdbfaf64572)![Create Activations5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/78a29433-dd5e-4fca-9d23-20197c7fd820)|
  |Create Activations for Recall Customer |-Click on data cloud app</br>-Click on the Activations tab </br>-Click on new</br>-Select Segment and continue </br>-By default, space is default </br>-Need to select the Upcoming Warranty End Date segment and activation target as marketing</br>-click on continue</br>-select email and sms </br>-click on continue</br>-click on add attribute</br>-And from individual select the Following attributes First Name, Last Name, Country</br>-Click on Save and provide name as Upcoming Warranty End Date.| ![Create Activations for Recall Customer1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/1779abfe-f99b-4e0e-8c97-994947ca6093)|

  ### 12. Search Index and Retriever Configuration
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Search Index and Retriever Configuration|-Go to App Launcher Search for Data Cloud, Go to Search Index Tab. </br>-Click on New, Select From a Data Kit , Select ‘SFAutomotiveDataKitsPackage’ , Select Product ,Click on Next </br>-For Search Type Select Hybrid Search, Click Next </br>-For Chunking, Keep the Same Changes and Click Next. </br>-For Vectorization, Make sure E5 Large V2 Embedding model is Selected, Click Next  </br>-For Fields for Filtering, Keep Same, Click Next. </br>-For Ranking, no Change , Click Next </br>-Click Save </br>-After Save the ‘Search Index Last Run Status’ Will be In Progress, wait for 15-30 Minutes Till the Status changes to Ready. </br>-**Create Retriever for Showing Product**</br>-Create  Retriver, Go to App Launcher Search for Data Cloud, Go to Einstein Studio Tab. On the Left Side below Models, click on Retriver, Clikc on New Retriver </br>-In Select Retriever Type Section, Select Data Source as Data Cloud, In which data space does the source data reside? As default, data model objec as Product, Data model object's search index configuration as Product, Click Next </br>-In Section Define Retriver Filters, Select All Document, Click Next </br>-In Section Confiure Retriver Results Number  of Results as 20 and map Fields to Return as following </br>**1-** Field Label :Seat Capacity Field Name :Direct Attribute > Product >Seat Capacity </br>**2-** Field Label :Product Description Field Name :Direct Attribute > Product >Product Description </br>**3-** Field Label :Vehicle Name Field Name :Direct Attribute > Product >Product Name</br>-Click Next</br>-Click Save</br>-Click on Setup, in the Quick Find Box, enter Prompt Builder, and then select Prompt Builder </br>-Search for the Prompt Template named Vehicle Recommendation and click on the hyperlink </br>-Place the cursor after the text the ‘Vehicle Details:’, click on Resource then click on Einstein Search then click on ‘Product’ click on ‘Product retriever’ </br>-On the right side click on default ‘Product retriever’ click on Search Parameter click on Free Text Click on Question</br>-Scroll down Select Chunk under Output Field and Enter 1 in Number of Result </br>-Click on Save As New Version click Activate  |     |
</details>

<details><summary>

  ## 4. Commerce Cloud Configuration And Sample Data Creation
</summary>

## Table of Contents

[1. Verify Organization Wide Address Exists or not	](#1-verify-organization-wide-address)

[2. Install Agent and Experience Site Package	](#2-install-agent-and-experience-site-package)

[3. Create Sample Data 	](#3-create-sample-data)

[4. Create Commerce Data 	](#4-create-commerce-data)

[5. Search Update	](#5-turnon-search-update)

[6. Upload CMS Images into the Store And verify workspace	](#6-upload-cms-images-into-the-store-and-verify-workspace)

[7. Add CMS Product Image	](#7-add-image-to-a-product-in-cms)

[8. Enable as buyer group	](#8-Enable-as-buyer-group)

[9. Enable as guest access	](#9-Enable-as-guest-access)

[10. Create community user and assign buyer account to buyer group	](#10-create-community-user-and-assign-buyer-account-to-buyer-group)

[11. Create order and orderItem Data	](#11-create-order-and-orderitem-data)  

[12. Create Opportunity ML Data](#12-Create-Opportunity-ML-Data)

### 1. Verify Organization Wide Address
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Verify Organization-Wide Address Exists or not |- Go to Setup \-\> Search for Organization-Wide Address \-\> Click on Organization-Wide Addresses</br>-  Verify if there is an organization-wide address with name ‘Default Email’ is created and verified or not like below.</br>- If there is none, then please create an organization-wide address by following below steps</br>- Click on **Add** button \-\> On the Display Name Add **‘Default Email’.** On the Email Address \<Add your email address\> Select ‘Default No-Reply Address’ on Purpose field \-\> click check box **‘allow all profiles to use this from address’**   | ![Verify Organization-Wide Address Exists or not1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/fdb743d9-bab4-4775-98da-4176e4defa3b)![Verify Organization-Wide Address Exists or not2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/de6e89f2-db21-4709-be15-11e7e375854c)|


### 2. Install Agent and Experience Site Package
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Install Agent & Exp Site Package | **Option 1**</br>- Install VSCode [Download](https://code.visualstudio.com/download) </br>- Setup CLI a. Install the Salesforce CLI  https://developer.salesforce.com/tools/salesforcecli or check that your installed CLI version is greater than 2.56.7 by running sf \-v in a terminal.</br>- If you need to update the Salesforce CLI, either run sf update or npm install \--global @salesforce/cli depending on how you installed the CLI.</br>- Install Extension</br>- Open VSCode \> Go To\> Extensions-\>Salesforce Extension Pack\>Install</br>- StepUp Base metadata deployment</br>- Create Project with Manifest</br>- Open VSCode\> Type Ctrl+Shift+P\>Select SFDX: Create Project with Manifest</br>- Select Standard</br>- Enter Project Name</br>- Click Enter </br>- Select the folder where you want to create a project then select ‘Create Project’.</br></br> Download the zip folder from the link below:</br>- [Download](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/tree/master/force-app/main/default)</br>-  Unzip the folder and copy the ‘main’ folder</br>- Go To\>The Project folder created as part of ‘Create Project with manifest’ \>Go To\> force-app folder\>Paste the folder</br>- Authorize an Org</br>- Type Ctrl+Shift+P\>Select SFDX:Authorize an Org</br>- Select Project Default</br>- Enter the Org alias</br>- Authorize the Org</br>- Deploy the base app metadata.</br>- terminal sf deploy start \-d force-app </br></br>  **Option 2: Deploy using Code Builder**</br>-  Download the zip file and unzip locally Download the zip folder from the link below:</br>  [Download](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/tree/master/force-app/main/default)</br>- To Open Code Builder → Login in salesforce and search for Code builder in All tab menu.</br>- Click on Launch button</br>- Expand the force app.</br>- Right Click on Application → Upload → choose the file from the Un Zipped folder application file.</br></br> **Option 3: Using Code Builder by Cloning Repository from GitHub**</br> $${\color{orange}Waiting \space for \space Salesforce \space Github}$$ </br></br> **NOTE:** $${\color{red}Skip \space steps \space 3, \space 4, \space and \space 5 \space if \space you \space wish \space to \space bring \space in \space your \space own \space Product \space data}$$ | ![Install Agent   Exp Site Package1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/3b575a75-202f-4c34-bf08-8657a015a53d) ![Install Agent   Exp Site Package2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/40490f8d-7fad-4502-8ba3-f40152d6ac40)![Install Agent   Exp Site Package3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/49fa8794-8765-4e3b-a854-3b716ffd53b7)![Install Agent   Exp Site Package4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/21574cfe-ad5a-4f9d-943a-ecb0f2a73251)![Install Agent   Exp Site Package5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/ba29b573-11d5-4a43-8688-52c7ab3c7375)![Install Agent   Exp Site Package6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/3d5ccd2d-97cf-4a54-916d-6c24546a5986)![Install Agent   Exp Site Package7](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/baf8255b-5613-4838-90cd-45d7dc2345e1)|


### 3. Create Sample Data
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Create Sample Data  | - Click on App Launcher, search for Automotive Setup and click on Automotive Setup app </br>- Click on the **Create Test Data** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. </br>-**Note:** If an error comes up after clicking on Create Test Data Button then follow the below steps, else skip it. </br> 1. Go to Setup>> Enter Duplicate>> Click on Duplicate Rules  </br>2. Click on "Standard Account Duplicate Rule">>once it get open>> click on Deactivate Button  </br>3. again go back to Duplicate rules list view>> click on " Standard Contact Duplicate Rule"  </br>4. once it gets open >> click on Deactivate button.| <img width="225" alt="Create Sample Data1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/159ba519-6327-4003-b148-ffde3e3f3aa0">|

### 4. Create Commerce Data
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Create Data  | - Click on App Launcher, search for Automotive and click on Automotive App</br>- Click on the **“Create Commerce Data”** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. | <img width="234" alt="Create commerce data1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/0df6baa3-a889-43a6-b4b8-48de3c37222b">|


### 5. Turn on Search Update
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Search Update |- Click on App Launcher\>\> Select commerce application\>\>Click on Store</br>- Open Autofolio Store</br>- Scroll down to Setting\>\>Expand It\>\> Click on Search</br>- Turn on Automatic Update    |   |


### 6. Upload CMS Images into the Store And Verify Workspace Shared To Site
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Upload CMS Images  |-Download Images for CMS From [download](https://drive.google.com/drive/folders/1u5evLElZJTCQFfo-QGPM3a5rhebczr8H?usp=drive_link) </br>-Click on App Launcher\>\> Select commerce application\>\> Click on Store</br>- Open Autofolio Store</br>- Scroll down to Content Manager</br>- Click on Add workspace</br>-  Enter details such as Name "AutoFolio  Store" and select Enhanced CMS Workspace and click on Next</br>-   AutoFolio Site as Public and click Next</br>- Keep language as it is and click on Finish</br>-  Click on Add and select Content \>\> select images\>\>Click on Create button\>\> click on upload button\>\>Select Image\>\>Image and Title populated\>\>Enter API name (can be the same as file name)\>\> Save it\>\> Click on Publish button\>\> Keep Details as is\>\> Click on Next\>\> Select Publish Now\>\>click on publish now button </br>- Please find the required images here \- Download images   | ![Upload CMS Images into Store and Verify Workspace shared to Site1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/77d19beb-4ce1-405f-bf7c-4482ac69d565) ![Upload CMS Images into Store and Verify Workspace shared to Site2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/b1500d74-c50e-4ede-8f79-df52206d0790)![Upload CMS Images into Store and Verify Workspace shared to Site3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/528eb296-9395-449a-ac5b-46b3d41fc839)![Upload CMS Images into Store and Verify Workspace shared to Site4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/107e7d70-e67a-4e8f-a7fa-5478bced4ed6) ![Upload CMS Images into Store and Verify Workspace shared to Site5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/19508c82-c32c-42b6-9293-ad675267c02f)![Upload CMS Images into Store and Verify Workspace shared to Site6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/36f5ff7e-999c-44b2-bfa3-9bda56b3e7a9)|
  |Verify Workspace Shared to Site |-Open Autofolio Store </br>-Scroll down to Content Manager>> Click on Autofolio Store workspace</br>-Click on Gear Icon>> Select Workspace Sharing  </br>-Select All Commerce -Enhanced, AutoFolio Managed Content Space CianuN4G. | <img width="202" alt="Upload CMS Images into Store and Verify Workspace shared to Site7" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/90a06a14-0544-490d-945a-d824880191d3"><img width="204" alt="Upload CMS Images into Store and Verify Workspace shared to Site8" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/0efe8960-08a7-40e7-9bdf-1d7d0c5bb377">![Upload CMS Images into Store and Verify Workspace shared to Site9](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/9de0dcc7-f2e9-4389-a927-893c7fcfeffe)![Upload CMS Images into Store and Verify Workspace shared to Site10](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/0198c158-38e3-4e83-968f-dbf481d46d79)![Upload CMS Images into Store and Verify Workspace shared to Site11](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/b726651b-6fff-4520-b60f-a03bf46aa6c4)![Upload CMS Images into Store and Verify Workspace shared to Site12](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/8d189bb8-3f0e-40e7-9c2e-e6236e59bc61)![Upload CMS Images into Store and Verify Workspace shared to Site13](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/02b47308-0bdd-44fc-a22e-f80f8754f0fe)|


### 7. Add Image to a Product in CMS
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Add Image to a Product   |- Click on App Launcher\>\> Select commerce application\>\>Click on Store</br>- Open Autofolio Store </br>- Expand Merchandise\>\> Product\>\> open one by one product</br>- Click on eye icon (it removes Site window) after save button   </br>- Scroll down \>\> click on Go to global product record</br>-  Go to Media\>\> Click on Add image for Product details Image section \>\> Select appropriate image from Autofolio Store CMS Workspace\>\> click on Add button</br>- Repeat Step vi for product List Image  repeat step iii. to vii for rest of the product</br>- Go to store\>\> select Autofolio \>\>Scroll down to Website Design\>\> select product category from dropdown \>\> click on Publish button</br>- Go back to AutoFolio Store\>\>Click on Home\>\> click on Preview the site and see product is getting displayed | ![Add CMS Product Image1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/13550ff2-ca43-45bd-8bc7-5b271feb261c)<img width="181" alt="Add CMS Product Image2" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/bacd1971-e5fb-4d78-bb8d-3bdbf04801c5">![Add CMS Product Image3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/3dfe2000-7e86-4c05-ba17-96559bc22f76)![Add CMS Product Image4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/2731ebff-fa82-460a-a1f8-b8f8ecc2bb65)![Add CMS Product Image5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/cd4a6d73-d5a6-4543-a0f3-f9336417ef0c)![Add CMS Product Image6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/3e3164d9-e96f-471d-b5d2-b89f1fa63660)![Add CMS Product Image7](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/d0aba33e-d16f-4135-8113-d37f29f83bf7)![Add CMS Product Image8](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/e8edb573-4430-48b7-a9ee-3f282066b299)![Add CMS Product Image9](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/79157594-a4fa-4e29-a6d3-b3d7a111e979)![Add CMS Product Image10](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f79a3146-c8f6-4689-a985-7e0cb16b04c6)![Add CMS Product Image11](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/1a31acd6-452e-4a7a-9604-3d1d8ae4803a) |

### 8. Enable as a Buyer Group
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Enable as a Buyer Group |-Go to App launcher>>Enter Account and click on it>> Open TMZ Dealership account record </br>-Click on Enable as Buyer Button>> Click on Enable As Buyer. | ![Enable as a Buyer Group1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/d45b538c-592b-4923-8c84-a6479c146bf7)|

### 9. Enable Guest access
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Enable Guest access |-Click on App Launcher>> Select commerce application>> Click on store </br>-Open AutoFolio Store</br>-Scroll down click on Settings>>Click on Store>> Click on Buyer Access </br>-Click on Enable button under Guest Access.| <img width="234" alt="Enable Guest access1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/5e7b14f5-13be-4702-a8fc-886bb0cef06c">![Enable Guest access2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/ceda123f-5dfb-4040-a989-bc8d1588b1c2)|

### 10. Create Community User and Assign Buyer Account to Buyer Group
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Create Community User and Assign Buyer Account to Buyer Group |-Click on App Launcher, search for Automotive and click on Automotive Setup App. </br>-Click on the **Create Buyer Group Member Data** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. | <img width="226" alt="Create Community User and Assign Buyer Account to Buyer Group1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/06df400c-cfab-40c5-88ae-81c61fa17d4a">|

### 11. Create Order and OrderItems Data
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Create Order and OrderItems Data |-Click on App Launcher, search for Automotive Setup and click on Automotive Setup app </br>-Click on the **Create Order and OrderItems** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. | <img width="226" alt="Create Order and OrderItems Data1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/abfc8670-07b8-414a-af18-049ab8ffe8f8">|

### 12. Create Opportunity ML Data
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Create Opportunity ML Data |-Click on App Launcher, search for Automotive Setup and click on Automotive Setup app  </br>-Click on the **Create Opportunity Data For ML** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. |  |
</details>
<details><summary>

 ## 5. Configure Amazon and Snowflake Connections
</summary>

## Table of Contents

[1. Enable Account as Buyer Account	](#1-enable-account-as-buyer-account)

[2. Setup Data in Amazon S3	](#2-setup-data-in-amazon-s3)

[3. Setup Data in Snowflake	](#3-setup-data-in-snowflake)

[4. Create ML Model	](#4-Create-ML-Model)

[5. Add ML Model Into Flow](#5-Add-ML-Model-Into-flow)

 
### 1. Enable Account as Buyer Account 
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Enable Account as Buyer Account | - Click on Setup </br>- Go to Object Manager.</br>-Click on account.</br>-Click on page Layout</br>-Click on ‘page layout assignment’ </br>-Click on edit assignment. </br>-Select ‘SDO-Account’ Layout under Record type ‘Account’ for System Administration Profile </br>-From Page Layout to Use dropdown Select ‘Account layout’ </br>-Click on save. </br>-Verify that, for ‘System Administrator profile’ for  Record type ‘Account’ Page layout should be ‘Account Layout’.|![Enable Account as Buyer Account1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/e5070e31-845b-495a-a256-41c1bec13ff0)![Enable Account as Buyer Account2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/35c4e7fd-8166-46f5-8c0b-87638381b1f3)![Enable Account as Buyer Account3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/29ea2a1a-9ddc-4c2e-8dd1-9c1805bca2b8)![Enable Account as Buyer Account4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/04a39926-1e65-419c-a6d9-3b73744c2776) |

### 2. Setup Data in Amazon S3
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Setup Data in Amazon S3 | - Log into Management Console and proceed to [S3 service](https://s3.console.aws.amazon.com/s3/home) and create a new bucket (give it an appropriate name).</br>  ***NOTE*****:** if you already have a bucket, you don’t need to create another bucket. Download the following files to your computer:</br>- Automotive FAQ PDF  csv [https://drive.google.com/file/d/1xuZfrxosGAWUTEo-3DMzkch1gx3Jv0Fr/view?usp=drive\_link](https://drive.google.com/file/d/16EpkMQrZpkBr4ySjdKsYww4FzRjOIk8i/view?usp=drive_link )]</br>- Upload these files to the appropriate S3 bucket.  |  |

### 3. Setup Data in Snowflake
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Setup Data in Snowflake | - Login to the Snowflake database and schema created for the tables used in the demo and execute the before steps. </br>-Create Table for Third Party Survey and Load data into Table.</br>-Login to the Snowflake Database/Schema that is connected to Data Cloud and run the below DDL script to create THIRD_PARTY_SURVEY table.   |  |
```
create or replace TABLE <<database_name>>.<<schema_name>>.THIRD_PARTY_SURVEY ( 

  SURVEY_ID VARCHAR(30), 
  SURVEY_DATETIME TIMESTAMP_NTZ(9),  
  RESPONDENT_ID VARCHAR(30), 
  SURVEY_QUESTION VARCHAR(32768), 
  RATING_VALUE NUMBER(5,0), 
  QUESTION_WEIGHT NUMBER(5,0), 
  IS_INTERESTED_IN_OUTDOOR_ACTIVITIES VARCHAR(10), 
  IS_INTERESTED_IN_ROOF_RACK VARCHAR(10) 
);

Load data in the below csv file into Third_Party_Survey_Data table:
Third Party Survey Data- https://docs.google.com/spreadsheets/d/1hmD5QQAennbsQCi0H--BlSY2gfB4Lpj-ei_Z5uhVMxg/edit?usp=sharing
```
### 4. Create ML Model  
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create ML Model | - Click on App launcher and search for Einstein Studio.</br>-Click on Add Predictive Model button </br>-Select create a model from scratch </br>-click on next</br>-Select data space as Default and select Opportunity DMO for data option </br>-Click on Next </br>-For training select Filter Set of Records option </br>-Specify the condition to filter the records and select field as Closed and select operator as IN and select values like true </br>-Click on Apply Changes </br>-For Set goal option select field name as Won and Select Maximize option Select true</br>-Click on next</br>-For Prepare Variable select disable Autopilot and select the follow fields like **Total Amount, Test Drive Date, Close Date, Number of Past Interactions, Car Model, Recency of Interactions, After Completing a Test Drive Status** </br>-Click on next</br>-For select Algorithm option Enable Automatic Selection. </br>-Click on next</br>-Review all the things and Click on Save and Train and specify ML Model name as Predicted Likelihood of Purchase </br>-Lets wait the model to train it successfully </br>-click on Activate button. |   |

### 5. Add ML Model into Flow 
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Add ML Model into flow | - Click on Setup >> Enter Flows in quick find box>> click on flows </br>-Search for Data Cloud Likelihood of purchase on opportunity and open the flow  </br>-Connect path from Get Records to Decision(check Contact) and now change the layout from Free-Form to Auto Layout>> Pop up occurs then click on Lose Positions  </br>-Below Get Records from Opportunity Contact there is plus sign>> click on plus sign </br>-Select Action >>Enter Predicted and  select the action " Predicted Likelihood of Purchase" </br>-Enter label as "Predict Likelihood" , and map the fields  :  </br>1. click on Triggering ssot_Opportunity__dlm >>Select  After Completing a Test Drive Status </br>2. click on Triggering ssot_Opportunity__dlm >>Select Car Model  </br>3. click on Triggering ssot_Opportunity__dlm >>Select Number of Past Interactions </br>4. click on Triggering ssot_Opportunity__dlm >>Select  Recency of Interactions </br>5. click on Triggering ssot_Opportunity__dlm >>Select  Test Drive Date </br>6. click on Triggering ssot_Opportunity__dlm >>Select Total Amount </br>-Then Go to Update record >> click on it >> for Likelihood_of_Purchas__c  field value as select Outputs from Predict_Likeihood>> Select prediction </br>-Click on Save As New  Version button>> click on save</br>-Click Activate button</br>-Go to applauncher>> enter opportunity>> click on it >> Open any 4 to 5 records >> click on edit button and do some change and save it(like description..)  </br>-Go to John Smith contact>> See Likelihood purchase value. </br>-Still its value not populating>> then again refresh the data stream </br>**Note:** For Other contacts if Likelihood purchase not populating then Go to Contact’s associated opportunity and click on edit and do some change in amount and save it >> Then Refresh Opportunity_Home data stream. |   |

</details>

<details><summary>

  ## 6. Finish Configuration
</summary>

## Table of Contents

[1. Refresh Snowflake Data Streams	](#1-refresh-snowflake-data-streams)

[2. Run Identity Resolution Ruleset	](#2-run-identity-resolution-ruleset)

[3. Run Calculated Insights	](#3-run-calculated-insights)

[4. Activate Messaging Setting	](#4-activate-messaging-setting)

[5. Update Einstein Search Retriever](#5-update-einstein-search-retriever)

[6. Configure Digital Experience.	](#6-configure-digital-experience)

[7. Enable Login Access.](#7-enable-login-access)

[8. Change the layout of the Login page.](#8-change-the-layout-of-the-login-page)

[9. Change the layout of the forget password page.	](#9-change-the-layout-of-the-forget-password-page)

[10. Change the layout of the Register page.	](#10-change-the-layout-of-the-register-page)

[11. Change the email Address.	](#11-change-the-email-address)

[13. Add Agent User into Agent force Service Agent and Activate	](#13-add-agent-user-into-agent-force-service-agent-and-activate)

[14. Add site logo	](#14-add-site-logo)

[15. Activate Einstein Copilot	](#15-activate-einstein-copilot)

[16. Create Trusted URLS	](#16-create-trusted-urls)

[17. Create CORS	](#17-create-cors)

[18. Assign Contact,vehicle and opportunity Record Page as Org Default.](#18-assign-contact-vehicle-opportunity-record-page-as-org-default)

[19. Create a New Version of Omni-Channel Flow.](#19-create-a-new-version-of-omni-channel-flow)

[20. Create Tableau Einstein Dashboards.](#20-create-tableau-einstein-dashboards)

[21. Add External Id into Contact as well snowflake after Self Registration contact creation.](#21-Add-External-Id-into-Contact-as-well-snowflake-after-Self-Registration-contact-creation)

[22.Create warranty contract document for vehicle record created via Self Registration form and upload into S3.](#22-Create-warranty-contract-document-for-vehicle-record-created-via-Self-Registration-form-and-upload-into-S3)

[23.Publish Calculated Insights After Self Registration.](#23-Publish-Calculated-Insights-After-Self-Registration)

[24.Connected App Configuration.](#24-Connected-App-Configuration)

[25.Named Credentials.](#25-Named-Credentials)

[26.Enable Oauth and OpenID Connect Settings](#26-Enable-Oauth-and-OpenID-Connect-Settings)

[27.Assign AutoFolio Guest Buyer Profile.  ](#27-Assign-AutoFolio-Guest-Buyer-Profile)

[28.Assign AutoFolio Buyer Group ](#28-Assign-AutoFolio-Buyer-Group)

[29.Assign Buyer Group For Self Registration ](#29-Assign-Buyer-Group-For-Self-Registration)

[30.If Strikethrough price is not populating on UI for any of the products then perform below steps ](#30-If-Strikethrough-price-is-not-populating-on-UI-for-any-of-the-products-then-perform-below-steps)

[31.Experience Site Product UI Configuration](#31-Experience-Site-Product-UI-Configuration)

[32.Experience Site Product Price as Display 1 Price Configuration  ](#32-Experience-Site-Product-Price-as-Display-1-Price-Configuration)


### 1. Refresh Snowflake Data Streams
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Refresh Snowflake Data Streams | - Navigate to Data Cloud app and the Data Streams tab </br>- Query for **Third Party Survey data** stream</br>- Using drop down control on the right against the data stream initiate update status for the **Third Party Survey data** stream </br>- Third Party Survey -8 | ![Refresh Snowflake Data Streams1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c5c4553f-91be-4725-ad4c-e8e8303022e9) |

### 2. Run Identity Resolution Ruleset
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|   Run Identity Resolution Ruleset | - Navigate to Data Cloud app and the Identity Resolutions tab</br>- Query for Guest Profile ruleset</br>- Click on the Ruleset Name hyperlink to navigate to the ruleset’s record home page</br>- Click Run Ruleset</br>- The Last Job Status will turn to In Progress. Once the job completes successfully, this status will be set as Succeeded.  |  ![Run Identity Resolution Ruleset1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/016d2355-0dcf-4d42-affc-8818acdbbdeb)![Run Identity Resolution Ruleset2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/70718436-231c-4181-8e2b-dacc256b7eba)|

### 3. Run Calculated Insights
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Run Calculated Insights | - Navigate to Data Cloud app and the Calculated Insights tab</br>- Query for Customer Lifetime Value calculated insight</br>- Using drops down control on the right against the data stream initiates refresh for the **Customer LifeTime Value** calculated insight.</br>- When the Calculated Insight is refreshed successfully, the Last Run Status will show as Success.</br>- Repeat steps b & c for the below Calculated Insights. Ensure all Insights are refreshed successfully.</br>- Customer Satisfaction Score   </br>- Customer Interest from Survey Data  </br>-   | ![Run Calculated Insights1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f41f8a6e-38da-4cc1-bb20-5f50cc3b92ed)|

### 4. Activate Messaging Setting
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Activate Messaging Setting | - Navigate to Setup go to messaging setting</br>-  Click on ESA Channel \-\> Click on ‘Activate’</br>- Click on Checkbox then click on Accept.</br>- Go back Messaging setting >> there is  ESA channel and scroll to right >> Click on downward arrow>> click on edit button.</br>- Scroll to downward direction>>check the “Let Customers download their conversation. </br>-Please refer the images for more understanding.  | ![Activate Messaging Setting1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/d3cbd117-39d9-4de8-9074-8ce7110af440)![Activate Messaging Setting2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/33100006-de7a-4998-9aca-ba2d5a8d507a)![Activate Messaging Setting3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/754dbb1c-ed3e-4e4a-b280-5e0649e17e4f)![Activate Messaging Setting4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/dd349aa8-d3ce-4750-ba24-37898fe91e7f)![Activate Messaging Setting5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/1b322d4e-83ea-4b84-a47c-89427e913c87) |

### 5. Update Einstein Search Retriever
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Update Einstein Search Retriever |- Click on **Setup**, in the Quick Find Box, enter Prompt Builder, and then select **Prompt Builder**</br>- Search for the Prompt Template named **Generate FAQ From Automotive Industry** and click on the hyperlink</br>- Hover the cursor on text the next to ‘Question : ‘, click on Resource à click on Einstein Search à click on 'Automotive_FAQ’ à click on ‘‘Default_Automotive_FAQ’ Retriever</br>- On the right side click on default ‘Default_Automotive_FAQ Retriver click on Search Parameter click on Free Text Click on Question</br>- Hover over cursor on next text on ‘Use this information to answer the question:’, click on Resource à click on Einstein Search à click on Automotive_FAQ Retriver\_V2</br>- Click on Save As New Version click **Activate**.</br>-	Go back to Prompt Builder.</br>- Search for Prompt template names as Return Warranty Info and click on the hyperlink.</br>- Hover the cursor on text the next to ‘Input:VIN with the‘, click on Resource à click on Einstein Search à click on ‘Automotive_Warranty_Info’ click on ‘Default_Automotive_Warranty_Info Retriver.</br>- Below this line ‘You are a Warranty Expert in Autofolio, here are some documents about Warranty Information’ click on Resource à click on Einstein Search à click on ‘Automotive_Warranty_Info’ click on ‘Default_Automotive_Warranty_Info Retriver.</br>- On the right side click on default Automotive_Warranty_Info click on Search Parameter click on Free Text Click on VIN. </br>- Click on Save As New Version click Activate   | ![Update Einstein Search Retriever1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/9beeaeb2-737a-429b-9bca-ed45d9b300c2)![Update Einstein Search Retriever2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/e154e456-0d44-4150-9bf8-ab5ae30886f6)![Update Einstein Search Retriever3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/b68d3da9-27a9-4e68-8dc7-66f256050c3f)![Update Einstein Search Retriever4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/48459195-d281-40db-b440-5adc0d14c849) |

### 6. Configure Digital Experience
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Configure Digital Experience. |- Click on **Setup**, in the Quick Find Box, enter Digital Experiences, and then select **All Sites**</br> -  Click on builder against the Site ***‘Autofolio’*** </br> - Click on ‘Banner’  in the right-hand panel, under Image Settings, click ‘Clear Image’</br> - Click on ‘Select Image from CMS’ \-\> Click on ‘BackgroundImnageCar’ </br> - Click on ‘Embedded Messaging ‘and update as per screenshot below </br> - Click on ‘Multilevel Navigation Menu ‘, in the right-hand panel under Default Menu select ‘Default Navigation’  |   ![Configure Digital Experience1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/5d989df3-92b7-4ba5-a5cb-e4afa9c3a7c7)![Configure Digital Experience2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/cbed3b61-236f-4bea-81b9-5b9807ec91e0)![Configure Digital Experience3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/001802d2-ad27-4838-85d5-62115233d083)![Configure Digital Experience4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/3680d28c-8e8d-4ed8-ae79-048933ac5aed)|

### 7. Enable Login Access
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Enable Login Access. | - Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites</br>- Against the site ‘AutoFolio’, click on Workspaces</br>- Under My Workspaces, click on Administration</br>- Click on Login & Registration menu item</br>- Under Login Page Setup, change Login Page Type to Experience Builder Page</br>- For URL, choose Login</br>- Under Password Pages, change Forgot Password to Experience Builder Page</br>- Choose Forgot Password</br>- Under Registration Page Configuration enable "Allow customers and partners to self-register"</br>- Choose Registration Page Type as Experience Builder Page</br>- Choose Register</br>- Assign users to a profile and account,choose AutoFolio Community User </br>- Assign Permission Set Group as "Commerse_Shopper"  |  ![Enable Login Access1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/ad29778f-d4c3-4bd4-ac2f-fea035e232ef)![Enable Login Access2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/18d6d6ec-2f33-4e21-9754-8b1110f4c797) |

### 8. Change the layout of the Login page
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the layout of the Login page. |- Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites </br>- Against the site ‘AutoFolio’’, click on Builder</br>- From the Page dropdown, search for Login, and then select Login </br>-Remove the site logo and add a Text Box component. Enter the text as "AutoFolio’", make it bold and center</br>- Publish the changes  | <img width="233" alt="Change the layout of the Login page1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/a1adc2f0-b200-4c34-9b9a-6ab6a577e5b1">
 |

### 9. Change the layout of the Forget Password page.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the layout of the Forget Password page.|- Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites </br>- Against the site ‘AutoFolio’, click on Builder </br>-From the Page dropdown, search for Login, and then select Forget Password </br>- Remove the site logo and add a Text Box component. Enter the text as "AUTOFOLIO", make it bold and center </br>-Publish the changes | <img width="232" alt="Change the layout of the Forget Password page1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/4a318e7f-439d-460c-b94d-73bdd21b09d8">|

### 10. Change the layout of the Register page
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the layout of the Register page. |- Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites</br>- Against the site ‘AutoFolio’’, click on Builder</br>- From the Page dropdown, search for Register, and then select Register</br>- Remove the site logo and add a Text Box component. Enter the text as "AutoFolio’", make it bold and center</br>- Publish the changes  | <img width="222" alt="Change the layout of the Register page1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f22ab956-01b0-49e9-9c7d-3517ed5bc602"> |

### 11. Change the email Address
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the email Address. |- Go to Setup \-\> Open All Sites</br>- Click on Workspaces (the configured Sites) \-\> Click Administrator</br>- Click on Emails</br>- Change Sender email to system admin email</br>- Click on save | <img width="234" alt="Change the email Address1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/014afbc7-2973-48ff-af8e-83a3c2829b0c">|


### 13. Add Agent User into Agent force Service Agent and Activate
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Add Agent User into Agent force Service Agent & Activate |- Click on setup, search for agent</br>- Click on ‘Agentforce Service Agent’</br>- Click on Open Builder</br>- Click on setting</br>-Click on company field and just give one space and remove space. </br>-Select Agent User to Service Agent User</br>-  Activate  | ![Add Agent User into Agent force Service Agent   Activate1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/0c38b0de-e15d-4369-9771-a1b900d8c10b)![Add Agent User into Agent force Service Agent   Activate2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/fe208c8a-fe5e-4a18-b98b-4bb933d6a89f)![Add Agent User into Agent force Service Agent   Activate3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/97a71ddb-e1d7-460f-9b31-f45bdd9307a9)|

### 14. Add site logo
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Add Site Logo |-Go to Setup>> Enter All sites in quick find box click on builder of "AutoFolio" site  Search for the logo of "alpine group' >> click on it Under setting>> click on Select Image from CMS> Select Content space>> select image "image name" click on Save.|   |

### 15. Activate Einstein Copilot
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Activate Einstein Copilot |- Click on setup, search for agent</br>- Click on ‘Einstein Copilot’</br>- Click on Open Builder click on Activate                |  ![Activate Einstein Copilot1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/493734f1-e74c-46cf-8cd1-395b8f26ba25)![Activate Einstein Copilot2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/5aa600dc-5053-4880-b5c3-a6601b63570e)|

### 16. Create Trusted URLS
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Trusted URLS |- In the Quick Find\>Type Trusted URLs</br>- Click on New\>In API Name \>Type ‘‘Trusted’ </br>- In URL> Type> https://*.tile.openstreetmap.org</br>- Under CSP Directives>>check below checkbox for.</br>1. connect-src(scripts)  </br>2. frame-src (iframe content)  </br>3-img-src (images)  </br>- Save it </br>- Click on New.</br>- In API Name, type ‘TrustedSite2’. </br>- In URL, type: https://DOMAINNAME.my.site.com. </br>Replace DOMAINNAME.my.site.com with your actual org Domain Name. </br>- **To find the Domain Name** follow these steps: </br>-Search for Domain in Quick Find. </br>-Copy the domain name ending with .my.site.com (e.g., epicorgfarm79.my.site.com). </br>-Select the domain related to your Experience Cloud Sites. </br>-Click on Save. </br> **Add Trusted URL to Agent Sites:** </br>-Click on Setup. </br>-Search for Site, then click on Enable Site (if it’s not enabled already). </br>-Click on **Register My Salesforce Site Domain**.</br>-Search for Site, and click on **‘ESW_ESA_Web_Deployment_1736313145513’**.</br>-Click on Add Domain. </br>-Add DOMAINNAME with your actual org Domain Name. </br>-Prefix with https://(e.g.,https://epicorgfarm79.my.site.com). <br>-To **find the Domain Name**, follow these steps: </br>-Search for Domain in Quick Find. </br>-Copy the name ending with .my.site.com (e.g., epicorgfarm79.my.site.com). </br>**To Add Trusted Sites in Digital Experience:** </br>-Click on All Sites under Digital Experience. </br>-Click on Builder for your site (e.g., Autofolio). </br>-Click on Security & Privacy. </br>-Click on the Add Trusted Sites button. </br>-Name it ‘TrustedSite1’. </br>-Add the copied Domain URL And Click on **Publish**.</br> **Configure CORS Settings:** </br>-In Quick Find, type CORS. </br>-Click on New </br>-In Origin URL Pattern, type: (https://DOMAINNAME.my.site.com.) </br>-Replace DOMAINNAME with your actual org Domain Name. </br>-Click save. </br>-Click on New. </br>- Paste this into Origin URL Pattern:  (https://*.develop.vf.force.com)</br>Click Save</br>-Click on New And Paste this into **Origin URL Pattern:** (https://*.live-preview.salesforce-experience.com.)</br>-Click Save.</br>-Click on New. Paste this into Origin URL Pattern: (https://*.my.site.com.) And Click Save. </br>**Steps to Publish Embedded Service:**</br>-Search for Domain in Quick Find. Copy the domain name ending with .my.site.com (e.g., epicorgfarm79.my.site.com). </br>-Click on Setup</br>-Search for Embedded Service. </br>-Click on **Embedded Service Deployment**.</br>-Click on **ESA Web Deployment.**</br>-Click on Publish and wait for the confirmation message. </br></br> **Note:** After Successfully publishing the ESA EWS deployment go to In Setup Search for Embedded Service Deployments Click on ESA_Web_Deployment In the Card Code Snippet Click on Install Code Snippet and add Below Values mentioned in the Image in the LeadFlyoutConfig  Custom metadata Open LeadFlyoutConfig Custom metadata, Click on Manage LeadFlyoutConfig, Click On New to Create new Custom Metadata record. </br></br>-Add Label à Lead Flyout Configuration **LeadFlyoutConfig Name Will auto Populate** </br>-Bootstrap Link à Boostrap Link ; Refer Image </br>-ESA Deployment Link à ESA Deployment Link ;Refer Image </br>-Org Id à Organization Id ;Refer Image </br>-Srct Url à Scrt Id ;Refer Image |  ![Create Trusted URLS1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c1697152-0b57-4bc7-92d3-eaf8dad9267c)![Create Trusted URLS2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/e4a1dda0-9c96-433d-9d75-759fefe4f0c0)![Create Trusted URLS3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/1b4e651f-57cd-4c43-8d99-ecc23688cbc6)| 

### 17. Create CORS
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create CORS |- In the Quick Find\>Type CORS</br>- Click on New\>In Origin URL Pattern\>Type ‘https://DOMAINNAME.my.site.com’ </br>- Replace DOMAINNAME with actual org Domain Name.</br></br> **To find the Domain name please follow the following steps:**</br></br>- search for Domain in Quick find → Please add https://DOMAIN from the below path</br>- Click on Save  |![Create CORS – Repeated the step1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c2981e03-bf31-433b-a1b0-4595d8ab0b2c)![Create CORS – Repeated the step2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/6d279492-e66c-4d12-85e4-93d699f2ca2b)|

### 18. Assign Contact, Vehicle and Opportunity Record Page as Org Default
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Assign Contact Record Page as Org Default. |- Click on Setup</br>- Click on Object Manager</br>- Click on Contact</br>-  Click on Lightning Record Page</br>-  Click on Contact_Record_Page1</br>- Click on Edit \-\> Click on Activation \-\> Click on ‘Assign Org Default’ \-\> Click on Save. </br></br>-Repeat above steps for Vehicle_Record_Page1 on Vehicle object. </br>-Repeat above steps for Opportunity_Record_Page on opportunity object. </br>-Create a new workspace and name it Auto folio.</br>-Create New semantics for the 4 Dashboards.    |  ![Assign Contact, Vehicle and Opportunity Record Page as Org Default1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/dc68be05-b9cb-476b-97f1-2ae1720584cc)![Assign Contact, Vehicle and Opportunity Record Page as Org Default2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/bba000d5-ab1c-4aa5-b4fd-e46ceb2dadce)![Assign Contact, Vehicle and Opportunity Record Page as Org Default3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/99fc9b85-e8c2-4e07-854e-31ed97a5a7b4)![Assign Contact, Vehicle and Opportunity Record Page as Org Default4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/8c4b1f86-ae24-45f1-a3bb-272fb16948a6)![Assign Contact, Vehicle and Opportunity Record Page as Org Default5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f3adfc49-58fc-4e22-bb9c-29b1da8fb268)|

### 19. Create a New Version of Omni-Channel Flow
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create a New Version of Omni-Channel Flow  |- Click on Setup</br>- Search for flow on Quick Button</br>- Click on Flow</br>- Click on the Flow</br>- Click on **Route To ASA** </br>- Deactivate the flow and click on the **Route To ESA** at the end</br>- Remove the Service channel and add it back (Same component)</br>- Go to the Fallback Queue🡪 Remove the Messaging Queue and add it back (Same Queue)</br>- Save as new version and activate the flow by clicking on the **Activate** button. </br>-Click on setup, search for agent </br>-Click on ‘Agentforce Service Agent’ </br>-Check under the connection tab “Route To ASA” is added or not. If not added repeat the above steps  | ![Create a New Version of Omni-Channel Flow1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f28c5cd4-794b-4b93-b1e6-7062a0494c95)![Create a New Version of Omni-Channel Flow2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/38e185c2-6a19-4640-91fa-d8a7dc1c6696)![Create a New Version of Omni-Channel Flow3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/86b67fbe-529b-4169-9143-205511e60a3d)![Create a New Version of Omni-Channel Flow4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/3b02b32c-42de-4e2f-8908-711f418b0ff5) |

### 20. Tableau Einstein Dashboards
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Tableau Einstein Dashboards | - Create a new workspace and name it Auto folio</br> - Create a new workspace and name it Auto folio.</br> -	Create New semantics for the 4 Dashboards.</br> -	After semantics are created, create Calculated fields.</br> - Build visualization.</br> - Build Dashboards.</br> - Embed the Dashboards by creating Lightning app builder and related tabs.</br> - Go to setup, select Custom Tab, select Lightning page tab and create a new tab.</br> -	Embed the dashboard on Vehicle related tabs and Data cloud Home page. |  ![Tableau Einstein Dashboards1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/1bade666-9de0-4b39-a580-2aca56f9b2ba)![Tableau Einstein Dashboards2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c578dc97-809d-4be6-88f5-3dba11e147a2)![Tableau Einstein Dashboards3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/cfc4415e-bf1a-497b-bc90-a2cc55988d9b)![Tableau Einstein Dashboards4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/57d23594-9bc2-4799-82d0-abe03ed76aca)![Tableau Einstein Dashboards5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/983fe06e-5680-48f7-aa48-bb7e55db0282)|

### 21. Add External Id into Contact as well snowflake after Self Registration contact creation 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
**Scenario 1: When Existing Ext Id value present in snowflake and user want to use it**
|Add External Id into Contact as well snowflake after Self Registration contact creation |-Go to App launcher>> Search for Data Explorer >> Select object type as data model>> Select Survey Response </br>-Now Result will show under Submitter column>> copy any of any of the value(eg: 48291735) </br>-Go to contact tab>> open recently created record via self registration form paste the value in EXT Id field.</br>-click on save</br>-Wait for 10 to 15 min so that data stream will refresh then refresh the page then ask the question to copilot.</br> **Scenario 2: When new Ext Id mentioned in contact , so new snowflake record need to create** </br>-Go to contact tab>> open recently created record via self registration form And Enter new EXT Id field value And click on save</br>-Same Ext id need to present in snow flake : Download the below file, use the same format to create data entries, under Response_Submitter__c column you can mention the Ext Id field new value from Contact object. [Snowflake data file](https://statics.teams.cdn.office.net/evergreen-assets/safelinks/1/atp-safelinks.html?url=https%3A%2F%2Finfosystechnologies-my.sharepoint.com%2F%3Ax%3A%2Fg%2Fpersonal%2Fsreeram_v01_ad_infosys_com%2FEZxoswyXBY5MlMlbd06UCFgBA3r8d-znvoXpCsnnIQR3kA%3Femail%3Dsnehal.salve01%2540infosys.com%26wdOrigin%3DTEAMS-MAGLEV.p2p_ns.rwc%26wdExp%3DTEAMS-TREATMENT%26wdhostclicktime%3D1743764137679%26web%3D1&locale=en-us&dest=https%3A%2F%2Fteams.microsoft.com%2Fapi%2Fmt%2Fpart%2Fapac-02%2Fbeta%2Fatpsafelinks%2Fgeturlreputationsitev2%2F&pc=6mxxgiHqn5vFNzsJ49cbVOCy1cwIWqGNW19a3A5O3dxCTHgQzQ0HIwMoGae63N5PcXQTCfy5qZ4nN9TpwSqHxIHARArUCqVOs1RYNTHrkBdKvf%252f5JnZRoREKjOReGS4vZ8dBid7oTFH0p%252b%252feojMHzx%252bxF90iCfJSbDxrpHYJCjJqRoIMOOWbzu4wuh2upaIR304oOwMCrd9oWeQkR%252flP2NVqZKPgqJCiaHhrr2tfwDm8k%252b3o9PynByaMCefP03tvUp9AyZOCbRfzzwwFpFDC9ybNXCWzYMwhbKhoHmgNNyAB7n8RUPKK66uysAteT3sd6uRvRQIYNuOv%252f8xgsQQCu16f2CoCc%252bUscuisB9HVfndpiG7HPUFzGWGc1mzjZmx%252f8jSVPzOi2hcdBvbckZuGYpP7P9pOIe%252fi%252bsaDd6I9ncNF1Zdfdwuk6uxVnBVfKzYTwpuNjSh30gK45Hb%252fL6xwVtJJGYirDvK4zaTA0Lr5enOnGxkTtyM8PFvh%252bpBPN%252b%252fcFSy%252b87bvAecLS84DGrLTn92vskDbcHghkuk5%252fngazkRQn1%252fEkVc2SR5%252fCzsWTnwk9PCdI5BvaObGiU8wajAh3E7H3oo4XyVIRGvnVYRQWqI65dhgnKQFUFKfMXgJOIgBbgcOuep3uuKdDwo2d2r1n1jN7qK6n5%252fk%252boCD%252fc8mzMMmvdxIiQNvzJ6wQ6qt53OQgeuMsrQjrUaFd0NemweLYtcyJzue1IyGFuIPPqkso5pYqMEjjlfH7FWVZua5zCQ%252bLi%252fJYoh3qraDl3INGJiQsNlObnq2O0MjGPHWyR4ElN%252b8Z8QYwQm5rvh8T4LdUTR%252bqc2HtG4bOMGKkzpAjpHBNT%252fONl1uzu%252fK4W0auPmV7LoBdUAAgvkAG1MLNa9lWaYEJDWmEOKcGk5wqsQWElvPJgR269EZt5Dk0KNWGfGcCZhWDfCZ95APTSFeVVlpo48jHBUCdGmkbeMOEp6gVNh%252fAJaHVqtw2DmdSGolnqveK%252fx4GfjR8aRSCujx979N9Ly9NhdLOOhr7wX0UcqsxB6DOGu7VGDWs%252f04%252bhFbWWOziGqPiTxYsfH3NF3HpRAvsmk%252fqjq2nJZzTCF2%252fEbr0QyUEbFpk58Fk73DUDdLVGQiZDVXaeHqzQXiNLKyqv5fCGgGxjvNjl1uVBgZ8RBwb2d%252bjMrUDiEDRzX7%252f4X1GNOKU5c%252f5MXzAQPv4ULgwFIkcwUPQPuT8bgqUjggCEUSvkfL1CGD5C%252bWqKqMGgReqVugYK5MJs06tTwYmWCTdw4phDn4BmUX7Qk%252f%252fgO7dG%252bn5VQqjcq8C05XDv4xvvjdWZL9%252b7R11jI6x7C7kf6p0WyhuzPV57h8lRr8xCJp5QsMo5iqNZ2y5wnorh0q9e%252f4X4ntxUakKP1l425a57GBqymKj%252fHX%3B%20expires%3DSat%2C%2005%20Apr%202025%2006%3A22%3A10%20GMT%3B%20path%3D%2F%3B%20SameSite%3DNone%3B%20secure%3B%20httponly&wau=https%3A%2F%2FAPC01.safelinks.protection.outlook.com%2FGetUrlReputation&si=undefined%3B1743675503279%3B19%3A4d6eb542-b0b7-41d5-a449-3f580e45842c_8d2d1e57-78a0-4125-87ef-e815e6b324f3%40unq.gbl.spaces&sd=%7BconvId%3A%2019%3A4d6eb542-b0b7-41d5-a449-3f580e45842c_8d2d1e57-78a0-4125-87ef-e815e6b324f3%40unq.gbl.spaces%2C%20messageId%3A%201743675503279%7D&ce=prod&cv=49%2F25030201010&ssid=a7b8e959-be73-42b8-8409-3d99e7242a63&ring=general&clickparams=eyJBcHBOYW1lIjoiVGVhbXMtRGVza3RvcCIsIkFwcFZlcnNpb24iOiI0OS8yNTAzMDIwMTAxMCIsIkhhc0ZlZGVyYXRlZFVzZXIiOmZhbHNlfQ==&bg=%23f0f0f0&fg=%23242424&fg2=%239092c1) </br>Go to Snowflake>> under table THIRD_PARTY_SURVEY ,upload the file Wait for 15 to 20 min to refresh the data stream named as Third Party Survey. </br>-Go to App launcher>> Search for Data Explorer >> Select object type as data model>> Select Survey Response>> Result will pop up , verify your new data entry </br>-At the end you will refresh the contact page and ask your copilot scenario. </br></br>**Note: Before asking any questions to agentforce and copilot please wait 15 to 30 min for all data stream to be refresh so that you will see the data under contact 360, vehicle 360.** </br>**2. You can only create 26 self register users.** |    |

### 22. Create warranty contract document for vehicle record created via Self Registration form and upload into S3  
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Create warranty contract document for vehicle record created via Self Registration form and upload into S3 |-Go to Contact>> Open the recently created record via self registration form>> </br>-Go to Related tab>> go to asset>> Open the record>> click on Vehicle field value </br>-It will redirect to vehicle record>> Go to details>> Copy the VIN </br>-Download below file , you can replace the details as per your requirement such as VIN ,warranty start date, end date but make sure your VIN should be correct.[Warranty Contract](https://statics.teams.cdn.office.net/evergreen-assets/safelinks/1/atp-safelinks.html) </br>- Create a PDF and upload into amazon S3. </br>**Note: Before asking any questions to agentforce and copilot please wait 15 to 30 min for all data stream to be refresh so that you will see the data under contact 360, vehicle 360.**</br>**2. You can only create 26 self register users.**|      |

### 23. To enable real time for the new contact on Self Registration 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|To enable real time for the new contact on Self Registration |-Go to App launcher>> Go to Data Cloud>> Go to Identity Resolution  </br>-Click on Guest Profile>>click on Run Ruleset button((once Status Succeeded then process with next step )  </br>-Go to App launcher>> Enter Data Graphs>>Click on it  </br>-Scroll to right of Automotive Real Time data graph>> click on arrow >> click on update status and wait for Status Active  </br>- Scroll to right of Web Engagement RT Profile  data graph>> click on arrow >> click on update status and wait for Status Active  </br>Go to Experience site>> login with newly created user from self registration form </br>Click on product tab>>select any product </br>-Go back to salesforce org and open Contact Record page to see the Real Time Product Details. |      |

### 24. Publish Calculated Insights After Self Registration
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Publish Calculated Insights After Self Registration |- Go to App launcher>> Go to Data cloud>> Go to Calculated Insights>> open Customer Satisfaction Score >> click on publish now. </br>-Go to Calculated Insights>> open Customer Lifetime Value >> click on publish now.  |    |

### 25. Connected App Configuration 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Connected App Configuration |-In the Top Right, Click on the Profile Icon then Click on the Name of the profile(for e.g OrgFarm Epic), then click on User Details, after you land on User Detail Page, click Edit </br>-Change the Email Address Of Orgfram Epic User to your Email Id </br>-Wait for 5-10 minutes till your Email is Verified  </br>-Go to Setup, search App Manager, Click on App Manager Then, search for ‘GuestUserCometD’ Connected App, scroll to the Right, click on drop-down arrow button, click on View, once you are on Connected App Page, click on ‘Manage Consumer Details’ </br>-Copy the Consumer Key and Consumer Secret and Keep it in Notepad, we will be using them in the steps below. </br>-Perform the below script from anonymous window to get the Secret key and then store in Secret_Key__mdt -->Secret_Key__c Field **‘String secretKey = EncodingUtil.base64Encode(Crypto.generateAesKey(256)); System.debug('Generated Key: ' + secretKey);’** Metadata record name must be Label=HMAC_Secret, Client_Id__c = Consumer Key Client_Secret__c= Consumer Secret </br></br>-Search for the connected app again **‘GuestUserCometD’** </br>-From Setup Go to the connected app again ‘GuestUserCometD’ Scroll to the Right, click on drop-down arrow button, click on View, once you are on Connected App Page, click on ‘Manage’, Scroll down to **‘Client Credentials Flow’ and Select Admin User for E.g( Org Farm Epic),** and Save  </br></br>-Go to Auth Provider Search for ‘GuestUserAuth’ Click on Edit and Paste the Consumer Secret and Consumer key that you have in your notepad, also If you are performing this in Sandbox change the Authorization Endpoint as [](https://test.salesforce.com/services/oauth2/authorize) and Authorization Token[](https://test.salesforce.com/services/oauth2/token ), if Performing in Production add the Authorization Endpoint as [](https://login.salesforce.com/services/oauth2/authorize) and Authorization Token[]( https://login.salesforce.com/services/oauth2/token ).</br>-Save the Auth Provider, from the same Auth Provider Scroll down to Salesforce Configuration Section, Copy the Callback URL  and Paste It in Notepad. </br>Go To Setup , Search App manager, Search for ‘GuestUserCometD’, Scroll to right Click on dropdown arrow and view, once you are in connected app, Click on Edit  Paste the callback URL you copied inThe Callback URL Field and Save the App </br>-Go to Setup Search for Named Credentials </br>-Search for GuestCometD And Click on Edit </br>-Update the URL to current org domain URL (Go to setup>>search>>MyDomain ) </br>-Save the Named Credentials and you will Get authenticated </br>-If you get an Error Wait for 10 minutes and Save the Named Credentials again. </br></br>-**Connected App Configuration 2** </br>-Go to Setup, search App Manager, Click on App Manager Then, search for ‘Data Cloud API’ Connected App Click on Manage Consumer Details </br>-Copy the Consumer Key, Consumer Secret and Keep it in Notepad, we will be using them in below steps. </br>-Go to Setup, search for Auth. Provider Auth Search for ‘Data_Cloud_Auth ‘Click on Edit and Paste the Consumer Secret and Consumer key that you have in your notepad, If you are performing this in Sandbox change the Authorization Endpoint as https://test.salesforce.com/services/oauth2/authorize and Authorization Token [](https://test.salesforce.com/services/oauth2/token ) </br>-if Performing in Production add the Authorization Endpoint as https://login.salesforce.com/services/oauth2/authorize and Authorization Token [](https://login.salesforce.com/services/oauth2/token) </br>-Save the Auth Provider, from the same Auth Provider Scroll down to Salesforce Configuration Section, Copy the Callback URL  and Paste It in Notepad. </br>-Go To Setup , Search App manager, Search for Data Cloud API, Scroll to right Click on dropdown arrow and view, once you are in connected app, Click on Edit  Paste the callback URL you copied inThe Callback URL Field and Save the App.   |     |

### 26. Named Credentials
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Named Credentials|-Search for Named Credentials </br>-In Named Credentials search for **‘DataCloudNew’** </br>-click on edit</br>-Update the URL to current org domain URL (Go to setup>>search>>MyDomain ) </br>-Save the Named Credentials and you will Get authenticated.</br>-If you get an Error Wait for 10 minutes and Save the Named Credentials again. |  ![Named Credentials1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/5a53741a-f135-4267-86f3-5dadafdbfd8a)![Named Credentials2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/d8a3dd1d-042d-4fda-b695-dee431eec2fe)![Named Credentials3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/beccec26-f441-47ce-a35e-23502b76fdb4)|

### 27. Enable Oauth and OpenID Connect Settings
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Save the Named Credentials and you will Get authenticated |-Go to Setup </br>- Search for Enable OAuth and OpenId Connect Settings </br>-Enable **Allow OAuth Username-Password Flows and Allow OAuth User-Agent Flows** | ![Enable Oauth and OpenID Connect Settings1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/b8f3c82a-ad7e-46cb-8bf4-44e74bd3b81b)|

### 28. Assign AutoFolio Guest Buyer Profile.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Assign AutoFolio Guest Buyer Profile |-Click on App Launcher on the left side.  </br>- Search Commerce and click on it.  </br>-Select Store name as “AutoFolio” if not selected on the left side </br>-Click on settings on left side and expand it </br>-Click on “Buyer Access” tab on the menu. </br>-Scroll down under Enable Guest Access and Click on AutoFolio guest buyer profile And click on related tab. </br>-click on Assign buyer group and select **AutoFolio buyer group**. |    |

### 29. Assign AutoFolio Buyer Group
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Assign AutoFolio Buyer Group |-Select Store name as “AutoFolio” if not selected on the left side  </br>- Click on settings on left side and expand it .  </br>-Click on “Buyer Access” tab on the menu. </br>-Click on settings on left side and expand it </br>-Under store access go to buyer group section and click on AutoFolio Buyer group. </br>-Go to related tab and click on assign on buyer group member.   </br>-select **TMZ Dealership and AutoFolio Guest Buyer Profile** and save. </br>**Enable Product tab on exp site After login(Excluding self registration user and apart from John Smith and Guest user) Follow below steps:** </br>-Go to setup>>user>>open user>> click on permission set assignment>>click on edit permission >>select Buyer from Available permission set and click on Add>>click on save </br>-Go to Contact's associated account record and click on as enable as buyer button>> click on Enable </br>-Go to Commerce Store AutoFolio>>Click on settings on left side and expand it >>Click on “Buyer Access” tab on the menu. </br>-Under store access go to buyer group section and click on AutoFolio Buyer group.  </br>-Go to related tab and click on assign from buyer group member and Select Contact's associated account  and save. |    |

### 30.Assign Buyer Group For Self Registration 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- | 
|Assign Buyer Group For Self Registration |-Scroll down to self-registration section </br>-Select Profile as ‘Autofolio community user’ </br>-Account record type as ‘Business Type’ </br>-Permission group set ‘Commerce_shopper’ </br>-Default buyer as ‘Autofolio Buyer Group’ </br>-Click Save|   <img width="239" alt="Assign Buyer Group For Self Registration1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/7ca8ff36-79a8-452d-8f70-6db898150d70">|

### 31.Configure Segment
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Configure Segment|-Go to data cloud </br>-Search for Segments And Click on hyperlink of each segment one by one </br>-click on save</br>-The segment count should be greater than 0. </br>-click on done</br>-Click on the Publish now button. |  ![Segment](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/3b9bce22-463a-46bc-9f54-f240855ea8d2) |

### 32.If Strikethrough price is not populating on UI for any of the products then perform below steps
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|If Strikethrough price is not populating on UI for any of the products then perform below steps|-Go to App launcher>> Enter Commerce and click on it>>Select AutoFolio >>  </br>-click on the product where strikethrough price is not present on UI (eg: Electra Model 3.2 - 2025)>> Scroll down </br>-Click on Go to Global product Record>> Once you landed on Product record page then click on Related tab </br>-Search for Pricebook>> click on edit button of Standard Pricebook (do not change any values)>> click on save.</br>-Go back to Store again>> on the left hand side >> click on Website Design>>Select product from dropdown>> click on publish button </br>- Once its successfully published then>> Go back to Store again>> on the left hand side >> Scroll down >> Expand Setting </br>-click on search >>click on update button>> Select full update>> then click on Update button. </br>-Refresh the page after 10 to 15 min and see Automatic update status mark as completed or not , if not then wait to complete it.</br>-Go back to Site url>>hard refresh it >> click on product tab>>see the price is coming or not </br>-if price is still not coming then>> Go to setup>> enter all sites under quick find box>> click on All sites </br>- Click on Builder for AutoFolio Site, click on publish button>> wait for 10 to 15 min for successful publishing the site</br>- Go back to Site url>> hard refresh it >>click on product tab>> see the price is coming or not. |    |
| |-**To proceed for testing kindly change below fields manually**</br>-We are using John Smith contact for testing purpose whose email id ends with dataclouddemo.com And Address, Email </br>-phone number, please add phone extension as well don't add plus sign please see eg(eg: 19045737373, 1 is here as usa phone number extension), |  |

### 33.Experience Site Product UI Configuration
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Experience Site Product UI Configuration |-Go to App Launcher>>Enter All Sites and click on it. </br>-For  Autofolio site click on builder </br>-click on preview>>click product>>click on back to builder again </br>-search for product images then click on it( result grid) </br>-Under Grid layout there is Number of Columns on Desktop – Select More Column Spacing – Select None Row Spacing- Select None.</br>-Publish the Site  |   |

### 34.Experience Site Product Price as Display 1 Price Configuration
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Experience Site Product Price as Display 1 Price Configuration |-Go to App Launcher>>Enter All sites in quick find box>> click on it </br>-For  Autofolio site click on builder</br>-click on preview>>click product>>Click on any of Electra product </br>-click on back to builder again>>There are some pricing details present click on it </br>-Under Setting scroll down >> Pricing type as Display 1 Price </br>-Click on Publish button. |   |
|Enable Email Deliverability |-go to setup</br>-search for deliverability</br>-**Access to Send Email (All Email Services) -->Select All Email**  |   |
|Assign Permission to Agent User |-Go to setup</br>-In the Top Search for 'Agent User'</br>-Click on agent user</br>-Go the Permission Set Assignment, Cilkc on Edit</br>-Select 'Automotive Service Agent' Permission set and add to the Right Side</br>-Click Save|    |
|Assign CSS For Header|-Go to setup</br>-Search for All Site</br>-for 'Autofolio' Site Click on Builder</br>-Click on Settings Icon on Left Side </br>-Click on Advanced --> Click on Edit Head Markup </br>-Paste this CSS</br> .header { width:100%;  </br>}</br>  header{ </br>     background: black !important; </br>   }</br>  .slds-has-flexi-truncate ul li a { </br> color: #f0f0f0 !important; }</br>.slds-icon_small{ fill: white;}|   |
</details>
<details><summary>
  
 ## 7. Mulesoft Configuration For Real Time Telemetric Data
</summary>

## Table of Contents
[1. Create Ingestion API in Data Cloud ](#1-Create-Ingestion-API-in-Data-Cloud)

[2. Upload the schema file(used ‘Order’ in the yaml file format	](#4-Upload-the-schema-file-used-order-in-the-yaml-file-format)

[3. Create a Data Stream for Ingestion API with Selected Schema Object that going to use](#5-Create-a-Data-Stream-for-Ingestion-API-with-Selected-Schema-Object-that-going-to-use)

[4. Configure the mapping with Primary key](#1-Configure-the-mapping-with-Primary-key)

[5. Configure the Mule with Salesforce Streaming Insert Object connector](#1-Configure-the-Mule-with-Salesforce-Streaming-Insert-Object-connector)

[6. Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API.](#1-Flow-to-insert-the-data-form-Mule-to-Salesforce-Data-Cloud-via-Ingestion-API)

**Use Case: Integrate Salesforce with MuleSoft to ingest the Data (for Vehicle 360) in Data Cloud via Ingestion API**

**Note: Please check first 4 steps already performed in the org or not. if already present (ingestion API already present) then start with step 5, if not present then start with step 1 and use the attached schema file while creating Ingestion API.**

### 1. Create Ingestion API in Data Cloud. 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Create Ingestion API in Data Cloud |  ![MuleSoft configuration For Real-Time Telematics Data1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/40c28455-f3e7-4cf8-8946-13ace561e1cc)|

### 2. Upload the schema file(used ‘Order’ in the yaml file format.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Upload the schema file(used ‘Order’ in the yaml file format |  ![MuleSoft configuration For Real-Time Telematics Data2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/ab6f3f23-376c-477a-9771-b8a04d14079a)|

### 3. Create a Data Stream for Ingestion API with Selected Schema Object that going to use.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| |-Create a Data Stream for Ingestion API with Selected Schema Object that going to use. |  ![MuleSoft configuration For Real-Time Telematics Data3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/3ce0010a-1f51-40a6-b558-12f343e6081d)|

### 4. Configure the mapping with Primary key. 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Configure the mapping with Primary key. |   ![MuleSoft configuration For Real-Time Telematics Data5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/0e96b461-fe20-4787-90a0-5f418ae4bec4)![MuleSoft configuration For Real-Time Telematics Data6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/ede0354b-bb76-48ea-af58-3076b35030ae)![MuleSoft configuration For Real-Time Telematics Data8](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f214aefb-04ed-4d54-9a7d-ccfe101738be)![MuleSoft configuration For Real-Time Telematics Data9](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/b952ae87-36ac-4c0f-a61a-1b9002e1497e)| 

### 5. Configure the Mule with Salesforce Streaming Insert Object connector. 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Configure the Mule with Salesforce Streaming Insert Object connector. |  | 

### 6. Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API. |-The integration starts with Scheduler component configured to trigger the flow every 30,000 milliseconds.</br>-The first Transform message generates random values for all the telematics fields.</br>-Using second Transform message prepare the payload structure required by Salesforce Data Cloud Ingestion API.</br>-Create a New Connected App for securely integrating MuleSoft with Salesforce Data Cloud via APIs using OAuth2.0 below are the details for connected app: </br>-Go to Setup and Search App Manager and Select App Manager. </br>-Provide details of Connected App name, Contact Email and enable OAuth details as follows: Callback URL: https://login.salesforce.com (depend on org, if prod then its login.salesforce.com and if Sandbox then its test.salesforce.com) Require Secret for Web Server Flow: Enable Require Secret for Refresh Token Flow: Enable Enable Client Credentials Flow: Enable</br>-Please give the Profile level of access to connected App for System Administrative profile. </br>-Go to Setup and open OAuth and OpenID Connect Settings and enable the toggle for Allow OAuth Username-Password Flows </br>-Use the Salesforce Streaming Insert Object connector – below is the configuration details: Connection between Salesforce and Mule based on Username, Password, Client Id and Client Secret. </br>-Source API Name: Ingestion API Name </br>-Object: Selected Object name (Order).  |  ![MuleSoft configuration For Real-Time Telematics Data10](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/5dc1afe9-f035-48bc-b8e1-8723160ae693)![MuleSoft configuration For Real-Time Telematics Data11](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/9b868bc9-1b36-41b3-8193-856baf1e9735) ![MuleSoft configuration For Real-Time Telematics Data13](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/57d28751-9f98-49a1-8025-60772dac56dd) ![MuleSoft configuration For Real-Time Telematics Data14](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/8fc9d123-1586-455c-af9c-e71395348fcf)<img width="468" alt="MuleSoft configuration For Real-Time Telematics Data15" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/fc0c56dd-1d93-4750-983f-92b6c8a7e7db"><img width="468" alt="MuleSoft configuration For Real-Time Telematics Data16" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/19f11b6f-d62f-4d96-b82c-36b2e0595339"><img width="468" alt="MuleSoft configuration For Real-Time Telematics Data17" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/ac5087e0-de6c-4d9e-93e2-4f135f996119">![MuleSoft configuration For Real-Time Telematics Data18](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/9f30a3ad-d6ca-4431-bdcc-5ba27ed549a8)![MuleSoft configuration For Real-Time Telematics Data19](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/60740652-a304-4a49-807c-aefc8690ab5a)|
|**Mulesoft Flow Diagram**|-**a.** **First Transform Message and below is the script**</br>-%dw 2.0</br>output application/json</br>varvinNumber["1A9416080TA288340","JF1SG65633H720182","1J8GA591X8L585418","1FMZK05125GA34650","4S4BP61C367326807","2B4GP44G31R110618","2C3LA53G68H187062","1C6RR6KT8FS501438","1G4GA5ER9CF217432","1G1AF5F56A7188155","3C8FY68814T224319","3TMJU4GN1BM116390","JN8AZ1MW0CW208397","5XYPGDA5XGG002192","3D7KU28D14G161500","1FAHP34N47W213682","3TMLU4EN2AM049034","1FTFW1EF4CFC35658","1N6AA06A64N571239","3B7KF23W9VM516994","KNAFU4A2XC5622597","2G1WG5EKXB1312050","3VWRK69M02M053790","1FDXE40S3XHA03474","5XYKU4A72FG653951","3GNDA63XX8S643669","2GKFLWE51C6247763","1GCFG15X861182048","JTJHF10UX10182895","5XYKT3A63EG529108","4V4WDBRH2VN737217","2G1WT58K369145853","2A4RR2D18AR406072","WDDHF8HB2BA295868","5J6RE38308L006040","JTDKN3DU5A0098811","3C4PDCBG4ET107805","1FTSW21P87EA29662","1N6AA0ECXCN305496","JTHBE1BL9E5039430"]</br>var status = ["Active", "Normal", "Critical", "Warning","Done"]</br>var airBagStatus = ["Active", "Critical"]</br>var latitudeData = ["37.787396", "37.777773", "37.791263", "37.797480", "37.785754", "37.786006"]</br>var longitudeData = ["-122.403324", "-122.426442", "-122.415680", "-122.408679", "-122.414068", "-122.411320"]</br>var randomSpeed = (min,max) ->(round(random()*(max-min+1)+min))</br>var batteryLevel =(min,max) -> (floor(random()*(max-min+1)+min))</br>var randomInRange = (min, max) -> (random() * (max - min)) + min</br>var randomTirePressure = (min, max) -> randomInt(max - min) + min</br>var randomTemperature = (min, max) -> round(random() * (max - min) + min)</br>var randomVoltage = (min, max) -> round(random() * (max - min) + min)</br>var randomStatus = () ->status[randomInt(sizeOf(status))]</br>var randomStatusForAirBag = () -> airBagStatus[randomInt(sizeOf(airBagStatus))]</br>var randomlatitudeData = () -> latitudeData[randomInt(sizeOf(latitudeData))]</br>var randomlongitudeData = () -> longitudeData[randomInt(sizeOf(longitudeData))]</br>---</br>(1 to 199)map(index)->{</br>eventname:uuid(),</br>timestamp: now() as DateTime,</br>VIN: vinNumber[(index / 5) as Number],</br>latitude: randomlatitudeData()</br>longitude: randomlongitudeData(),</br>speed: randomSpeed(20,120),</br>rpm: randomTirePressure(2000,6000),</br>oilpressure:randomInRange(3.5,3.5),</br>engine_temperature: randomTemperature(70, 100),</br>coolant_temperature: randomTemperature(60, 90),</br>battery_voltage: randomVoltage(11.5, 14.5),</br>battery_soc_level: batteryLevel(10,100),</br>fuel_level: randomTemperature(60, 100),</br>tire_pressure_fl: randomTirePressure(30, 32)</br>tire_pressure_fr:randomTirePressure(30, 32),</br>tire_pressure_rl: randomTirePressure(30, 32),</br>tire_pressure_rr: randomTirePressure(30, 32),</br>brake_fluid_level:randomTemperature(78, 80),</br>esp_status:randomStatus(),</br>ABS_status:randomStatus(),</br>airbag_status: if(index <= 195) "Active" else "Critical",</br>odometer:randomTirePressure(10000,300000),</br>//odometer: if(payload.VIN__c == randomVIN) </br>brake_pad_wear_rr:randomTirePressure(45, 90),</br>brake_pad_wear_rl: randomTirePressure(12, 15),</br>brake_pad_wear_fr: randomTirePressure(12, 15),</br>brake_pad_wear_fl: randomTirePressure(12, 15)</br>}|    |
|**b.** **Second Transform Message and below is the script**|- %dw 2.0</br>output application/json--- </br>{</br>"data":payload</br>}</br>|   |
|**c.** **Mule Streaming Insert Objects Connected** |- Click on plus sign and then select Connection as Oauth Username and Password and then</br> fill the required details then click on test connection and then user Source API Name as “Real_Time_Telemetric_data” and Object Name as “vehicle_telemetric” and Body as “payload”|   |

**Below is the configuration XML file so directly creating new project in Mule Anypoint and copy paste the configuration XML then update the credentials for Salesforce Data Cloud (Streaming Insert Object) connector. (Don’t forget to add the Data Cloud Insert Object Connector from Exchange)**

</details>
<details><summary>

## 8. Mulesoft Configuration For Vehicle Issue
</summary>

## Table of Contents
[1. Create Ingestion API in Data Cloud ](#1-Create-Ingestion-API-in-Data-Cloud)

[2. Upload the schema file(used ‘Vehicle Issue’ in the yaml file format	](#4-Upload-the-schema-file-used-vehicle-issue-in-the-yaml-file-format)

[3. Create a Data Stream for Ingestion API with Selected Schema Object that going to use](#5-Create-a-Data-Stream-for-Ingestion-API-with-Selected-Schema-Object-that-going-to-use)

[4. Configure the mapping with Primary key](#1-Configure-the-mapping-with-Primary-key)

[5. Configure the Mule with Salesforce Streaming Insert Object connector](#1-Configure-the-Mule-with-Salesforce-Streaming-Insert-Object-connector)

[6. Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API.](#1-Flow-to-insert-the-data-form-Mule-to-Salesforce-Data-Cloud-via-Ingestion-API)

**Use Case: Integrate Salesforce with MuleSoft to ingest the Data (for Vehicle 360) in Data Cloud via Ingestion API**

**Note: Please check first 4 steps already performed in the org or not. if already present (ingestion API already present) then start with step 5, if not present then start with step 1 and use the attached schema file while creating Ingestion API.**

### 1. Create Ingestion API in Data Cloud. 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Create Ingestion API in Data Cloud |  <img width="468" alt="MuleSoft configuration For Vehicle Issues1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/4b026e14-bc1a-4aa3-98c0-c71c0be1286f">|

### 2. Upload the schema file(used ‘vehicle issue’ in the yaml file format.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Upload the schema file(used ‘Order’ in the yaml file format |  <img width="409" alt="MuleSoft configuration For Vehicle Issues2" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f1a09cb3-9162-40e7-9803-2ef4a4b9e02e">![MuleSoft configuration For Vehicle Issues3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/b956de8c-4f5a-4120-84eb-f7fbc5833e35)|

### 3. Create a Data Stream for Ingestion API with Selected Schema Object that going to use.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| |-Create a Data Stream for Ingestion API with Selected Schema Object that going to use. |   <img width="468" alt="MuleSoft configuration For Vehicle Issues4" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f73a7e04-5728-4883-b7d6-e0ab0e25e03c"><img width="468" alt="MuleSoft configuration For Vehicle Issues5" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/fb682fb4-7558-4392-a03d-50e93770972e">|

### 4. Configure the mapping with Primary key. 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Configure the mapping with Primary key. | <img width="468" alt="MuleSoft configuration For Vehicle Issues6" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/3b22ad1a-a880-421f-9b9f-258dc89906ce">| 

### 5. Configure the Mule with Salesforce Streaming Insert Object connector. 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Configure the Mule with Salesforce Streaming Insert Object connector. |    | 

### 6. Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API. |-The integration starts with Scheduler component configured to trigger the flow every 30,000 milliseconds.</br>-First - Using HTTP request connector we are hitting nhsta.gov API to get the details to get the generic vehicle issue details.</br>-Second – For Specific ODI store the response and prepare the Payload using Transform Message. </br>-Third –Prepare the new payload Data that is going to use for Salesforce only those ODI numbers.</br>-Fourth – Prepare new payload as per the Salesforce standard format. </br>-Fifth – Using Data Cloud Streaming Insert Object  connector inserting the Data from Mule to Salesforce </br>-Create a New Connected App for securely integrating MuleSoft with Salesforce Data Cloud via APIs using OAuth2.0 below are the details for connected app:</br>-Go to Setup and Search App Manager and Select App Manager.</br>-Provide details of Connected App name, Contact Email and enable OAuth details as follows: Callback URL: https://login.salesforce.com (depend on org, if prod then its login.salesforce.com and if Sandbox then its test.salesforce.com **Require Secret for Web Server Flow:** **Enable. Require Secret for Refresh Token Flow:** Enable.  **Enable Client Credentials Flow:** Enable.</br>-Please give the Profile level of access to connected App for System Administrative profile. </br>-Click on Manage after creating connected app. </br>-Go to Setup and open OAuth and OpenID Connect Settings and enable the toggle for Allow OAuth Username-Password Flows.</br>-Use the Salesforce Streaming Insert Object connector – below is the configuration details:Connection between Salesforce and Mule based on Username, Password, Client Id and Client Secret.</br>-Source API Name: Ingestion API Name </br>-Object: Selected Object name (Order).| ![MuleSoft configuration For Vehicle Issues9](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/ac21cc8a-cc44-4248-aa8c-5af81c0f0a81)  <img width="468" alt="MuleSoft configuration For Vehicle Issues10" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/5672522f-7ecb-4c13-b4a6-af8c2f2bac15"> <img width="468" alt="MuleSoft configuration For Vehicle Issues11" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f49f4cb8-86a0-4607-a23e-f30c543a969e"> <img width="468" alt="MuleSoft configuration For Vehicle Issues12" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/d2cb4061-36ee-402a-af1e-56380b7b29fc"> ![MuleSoft configuration For Vehicle Issues13](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/ad527b5a-1f29-43ef-aa10-19d5a61e5bd1) ![MuleSoft configuration For Vehicle Issues14](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/ecd44e40-0e2e-44a5-bfa7-c99279b7ce0d)<img width="340" alt="MuleSoft configuration For Vehicle Issues15" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/968ec40a-f60e-4417-a0d4-51e44f352254"> <img width="356" alt="MuleSoft configuration For Vehicle Issues16" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/058b0810-ff57-4c68-87a4-4f73f5255b3b"> <img width="404" alt="MuleSoft configuration For Vehicle Issues17" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/f9a0175f-b6b4-4998-8f21-5cf987f2b4d2"> <img width="380" alt="MuleSoft configuration For Vehicle Issues18" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/3efedf10-4c85-465c-8ff5-fd4154692570"> <img width="390" alt="MuleSoft configuration For Vehicle Issues19" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c211183b-3b89-4a27-b885-d3a86258315b"> <img width="367" alt="MuleSoft configuration For Vehicle Issues20" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/af1de967-caf1-44fa-8935-87543bdc9204"><img width="392" alt="MuleSoft configuration For Vehicle Issues21" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/006e5958-5c33-4b08-8f3e-bce5e96e23c8">|
|**Mulesoft Flow Diagram**|**1**-First is the HTTP Request connector and below is the details Click on plus icon right side of configuration and fill the configuration details as per the given below snap and add the Path (URL) and in the body put “payload”</br>URL: /complaints/complaintsByVehicle?make=acura&model=rdx&modelYear=2012Method: “GET”</br></br>**2.** Second Use the Transform Message and below is the script need to use.</br>%dw 2.0</br>output application/json</br>var requiredODINumbers = [11124195 ,11074082, 10818539, 10459314] // List of required ODI numbers</br>{</br>filteredResults: payload.results filter (item) -> requiredODINumbers contains item.odiNumber</br>}</br></br>**3**. Third Use the Transform Message and below is the script need to use</br></br>%dw 2.0</br>output application/json</br>{</br>transformedResults: payload.filteredResults map (item) -> {</br>odi_number: (item.odiNumber) as String,</br>odinumber: (item.odiNumber) as String,</br>crash: item.crash as String,</br>fire: item.fire as String,</br>numberOfInjuries: item.numberOfInjuries as String,</br>numberOfDeaths: item.numberOfDeaths as String,</br>dateOfIncident: item.dateOfIncident as String,</br>dateComplaintFiled: item.dateComplaintFiled as String ,</br>components: item.components as String,</br>summary: item.summary as String,</br>timestamp: now() as DateTime,</br>}</br>}</br></br>**4.** Fourth Use the Transform Message and below is the script need to use</br>%dw 2.0</br>output application/json</br>{</br>"data":payload.transformedResults</br>}</br></br>5. Fifth use Saelsforce Streaming insert objects connector and click on plus button and select “OAuth Username Password” in the connection and then fill the all the required details and then click on Test connection.Source API Name: Vehicle_Issues_DetailsObject API Name: vehicle_issuesBody: payload|   |

 **Below is the configuration XML file so directly creating new project in Mule Anypoint and copy paste the configuration XML then update the credentials for Salesforce Data Cloud (Streaming Insert Object) connector. (Don’t forget to add the Data Cloud Insert Object Connector from Exchange)**
 </details>
<details><summary>
