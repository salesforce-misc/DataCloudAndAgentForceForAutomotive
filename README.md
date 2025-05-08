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

[9. Tableau Dashboard](#Tableau-Dashboard)
<details><summary>

  ## 1. Pre-Deployment Instructions
</summary>

 ### Table of Contents
  [1.	Salesforce Org Setup Requirements for Automotive App](#1-salesforce-org-setup-requirements-for-automotive-app)
  
  [2.	Enable Features on the Org](#3-enable-features-on-the-org)

  [3.	Install Pre-Deployment Package](#2-install-pre-deployment-package)
  
  [4.	Setup the Salesforce Org](#4-setup-the-salesforce-org)


  ### 1. Salesforce Org Setup Requirements for Automotive App (5 min)

   To support the Automotive app, you can either create a new Salesforce Org or use an existing one, provided it includes the following features and licenses: 

  | Requirement | Details |
  | ----- | ----- |
  | Licenses Required | - Data Cloud</br>- Auto Cloud</br>- Sales Cloud</br>- Service Cloud</br>- Experience</br>- Commerce Cloud</br>- Marketing Cloud</br>- MuleSoft (Optional) </br>- Tableau Admin|
  | Features Required | - Service Agent</br>- Einstein Agent</br>- Copilot</br>- Prompt Builder</br>- Agent Force</br>- Real-time</br>- Code Builder (Optional) </br>- Tableau Next (Beta) |

 ⚠️ **Important Note:** Existing Trailheads playgrounds cannot be used 


### 2. Enable Features on the Org (10 min)

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Enable Commerce Cloud | - From Setup, enter ‘Commerce’ in the Quick Find box.</br>- Select ‘Settings’ under ‘Commerce’.</br>- Turn on ‘Enable Commerce’.</br>-Turn on Enable App under Enable the Refreshed Commerce App.</br>Save | ![Enable commerce cloud1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/Enable%20commerce%20cloud1.png)|
  | Enable Automotive | - From Setup, enter ‘Automotive’ in the Quick Find box.</br>- Select Automotive Settings.</br>- Turn on ‘Automotive’. </br>-Select 'Service Console for Automotive’.</br>-Turn on ‘Service Console for Automotive.’ </br>-**Note:** When you create a scratch org for Automotive Cloud where the Service Console for Automotive setting is enabled, assign the Automotive Foundation User and the Industry Service Excellence permission sets to the scratch org user.| ![enable automotive](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/enable%20automotive.png)![enable automotive2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/enable%20automotive2.png)![enable automotive3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/enable%20automotive3.png)|
| Enable Vehicle and Asset Finance Settings  | - From Setup, in the Quick Find box, enter Vehicle and Asset, and then select Vehicle and Asset Finance Settings. </br>- Enable Vehicle and Asset Finance.</br>- Make sure you’ve enabled Automotive in your org before you enable this feature. </br>- Before enabling Vehicle and Asset Finance Additional Components, enable Timeline. Click on URL. </br>- Turn on the Timeline to enable. </br>-Navigate to Vehicle and Asset Finance and enable Vehicle and Asset Finance Additional Components  | ![enable vehicle asset finance](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/enable%20vehicle%20asset%20finance.png)|
|Enabled System Permissions for automotive objects. |-Go to setup.</br>-Search Permissions set and click on it. </br>-Find out "Data Cloud Salesforce Connector" permission and click on it. </br>-Click on system permission. </br>-Find the "Use Automotive Foundation" Permissions name and check checkbox Enabled it. </br>-Find the "Use Vehicle and Asset Finance Features" permission name and check checkbox  enabled it. </br>-Click on Save.  |   |
| Enable Partner Lead Management  | - Go to setup .</br>- Search Partner Lead Management and click on it. </br>- click on toggle enabled.  |  |
| Enable Interest Tags | - Go to setup .</br>- Search Interest tags .</br>-Enable the toggle. |  |

### 3. Install Pre-Deployment Package (25 min)

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Install package | - Click on this Package Installation [Link ](https://login.salesforce.com/packaging/installPackage.apexp?p0=04tPa000000iKz7)</br>- Sign-in to the Org with your credentials.</br>- Choose Install for Admins Only option</br>- Choose “Rename conflicting components in package” and click the Install button.</br>- Wait until installation is completed, you will receive a confirmation on logged in user’s email | ![Install package1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/Install%20package1.png)|
| Verify Package installation | - Click Setup</br>- Search for package</br>- Search for 'AutomotiveConfigPackage' is installed  |![verify package install1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/verify%20package%20install1.png)|

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Site Name and URL |-From Setup, enter ‘Digital Experiences’ and select ‘All Sites’ under ‘Digital Experiences’. </br>-Select D2C Commerce (LWR) Template</br>- After selecting the template, enter a Store name and URL.Name the Store ‘AutoFolio’ and ensure the URL ends with /AutoFolio.</br>-Click Create. Your site will be created in Preview status. | ![site name url](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/site%20name%20url.png)|
|Activate Site |-From Setup, enter ‘Digital Experiences’ and select ‘All Sites’ under ‘Digital Experiences’. </br>-Click Workspaces next to AutoFolio. Select Administration, then Emails.</br>-Under ‘Email Tabs,’ uncheck ‘Send welcome email’ and click Save. </br>-In Settings, click Activate and confirm by clicking OK. </br>-Your site will now be live and fully set up. | ![activate site](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/activate%20site.png)![ac](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/ac.png)|
|Enable Data Cloud Setup Home |-Go to Setup → Quick box search Data Cloud Setup Home.</br>-Enable/Activate it. **Note:** After activation wait 10 min to complete the Automated Steps. </br>-**Note:** We need to perform this step only when the below step integration data cloud button is disabled.| ![Enable data cloud setup](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/Enable%20data%20cloud%20setup.png)|
  | Enable Data Cloud on Experience Site | - Go to Setup → Digital Experiences → All Sites.</br>- Click Builder for ‘Autofolio’.</br>- Click Settings → Integrations.</br>- Click Add to Site for Data Cloud.</br>- Enable “Share site data with Data Cloud” and click Save.</br>- Once enabled, a green box will appear</br>- Click Publish in the top-right corner |  ![enable data cloud on exp site](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/feeacff6-565a-4b9b-8878-7ecd94aca929)![enable data cloud on exp site2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c3602060-baef-4f32-a9c9-4437d06ba78c)|
| Verify Data Stream  | - Go to App Launcher → Data Cloud → Data Stream.</br>- Change List View to All Data Streams.</br>- Search for Experience\_Cloud.</br>- 6 total Data Streams should appear |  ![verify data stream](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/verify%20data%20stream.png)|
  | Create a Record on Custom Metadata | - Go to Setup \-\> Search for Metadata type \-\> Click on ‘Install Package Settings Enabled’ \-\>   Click on **Manage Install Package Settings Enabled** \-\>Click on ‘New’ \-\> Give Label as  **Package Settings Enabled** and **Check Checkbox of Installation Settings Enabled Field**  |  ![Create record on custom metadata](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/Create%20record%20on%20custom%20metadata.png)![Create record on custom metadata2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/Create%20record%20on%20custom%20metadata2.png)|


  ### 4. Setup the Salesforce Org (30 min)

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Assign data cloud Permissions for Standard and Custom Object  | - Click on App Launcher, search for Automotive and click on **Automotive Setup** App</br>- Click on the “**Assign Permissions for Standard Objects**” button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further.  | ![Assign data cloud permission for standard cusotm obj](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/Assign%20data%20cloud%20permission%20for%20standard%20cusotm%20obj.png)|
  | Modify the Data Cloud Admin Permission Set | - Open the Setup Menu and click Setup</br>- In the Quick Find, search for ‘Permission Sets’ and click ‘Permission Sets’</br>- Click the ‘Data Cloud Admin’ permission set</br>- In the Apps section, click ‘Data Cloud Data Space Management’</br>- In the Data Spaces panel, click Edit.</br>- Check the ‘Enabled’ checkbox for the default data space and click Save</br>- Click OK in the confirmation dialog | ![modify the data cloud admin PS](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/modify%20the%20data%20cloud%20admin%20PS.png)|
  | Create a Connection to Amazon S3 | ***NOTE:*** If you do not have an existing Amazon S3 instance, [register for the free tier](https://aws.amazon.com/free/), and then follow instructions in [How to Use the Amazon S3 Storage Connector in Data Cloud](https://developer.salesforce.com/blogs/2023/10/how-to-use-the-amazon-s3-storage-connector-in-data-cloud) to create dedicated user with required permissions for this demo.</br></br>If you already have an S3 instance, no need to sign up for a new one.</br></br>Before proceeding further, make a note of your [programmatic credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-creds.html#access-keys-and-secret-access-keys) (Access Key ID and Secret Access Key) that can be used to access the account</br></br>- Navigate to Data Cloud Setup</br>- In the menu, under EXTERNAL INTEGRATIONS, click on Other Connections</br>- Click **New**, choose **DataKit** click on next then click on **SFAutomotiveDataKitPackage** And Select **Amazon_S3_Unstructure** Then click on Next.</br>-Under **Authentication details** select **Authentication option** as Access key/Secret based. Add your AWS Access key And AWS Secret Access Key</br>-Click on test connection</br>-Click on save. </br>(**After saving wait for 10 to 15min till the status is active**)***DO NOT CHANGE THE CONNECTION NAME*** </br>- Refer to [this](https://developer.salesforce.com/docs/data/data-cloud-int/guide/c360-a-set-up-s3-connection.html) document for more details on how to setup the connection | ![create connection to amazon s3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/AmazonS3.png)|
  | Create a connection to snowflake | **NOTE:** If you do not have access to an existing Snowflake instance, please get access before proceeding further</br></br>- Follow instructions in [this article](https://developer.salesforce.com/blogs/2024/08/zero-copy-data-federation-with-snowflake-and-salesforce-data-cloud) to create a Warehouse and Integration User in Snowflake, generate a public and private key pair, and configure Salesforce Data Cloud to connect to Snowflake.</br>- Name the connection ***“SnowflakeDataFederatio”*** | ![create connection to snowflake](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/create%20connection%20to%20snowflake.png)|
  | Create a connection for Mulesoft Ingestion API | - Go to **Setup** \-\> In the **Quick Find** box, type ***static***, then select ***Static Resources***</br>-In the index across the top, click the letter **R** </br>- Click on **‘Real_Time_Telemetric_Data’** </br>- Click on **‘View File’** hyperlink. The **‘Real_Time_Telemetric_Data.txt’** And and **‘Vehicle_Issues_Details’** is downloaded to your computer.</br>- Change the file extension from ***.txt*** to ***.yaml***</br>**1-** Go to Data Cloud Setup, click on Ingestion API → Click New</br>- Provide the Connector Name as ’Real_Time_Telemetric_data’</br>- Upload **Real_Time_Telemetric_Data.yaml**  file which you have downloaded from above steps and Upload file to scheme and click on Save. </br>⦁	Repeat all the above step to create second Ingestion API with Name as **‘Vehicle_Issues_Details’**|  ![create connection to mulesoft ingestion api](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/create%20connection%20to%20mulesoft%20ingestion%20api.png)|
 | Turn On Einstein Bots And Agent | - Navigate to Setup</br>- Search and Select ‘Einstein Bots’</br>- Turn on Einstein Bots</br></br>-Navigate to Setup </br>-Search for Einstein</br>-Click on ‘Einstein Setup</br>-check the ‘Turn On einstein’ toggle </br>-Navigate to Setup </br>-Search for agent</br>-Click on Agentforce Agents </br>-Toggle the agentforce to Enabled </br>-Drag down on same page and Enable the Agentforce (Default) Agent </br>-Refresh the page|  |
 | Deactivate Standard Einstein CoPilot Bots | - Click on Setup</br>- Search 'Agent' and click ‘Agents’</br>-Enable the Agentforce (Default) Agent </br>- Click on 'Einstein Copilot'</br>- Click on 'Open Builder'</br>- Click on 'Deactivate'</br>- Click on ‘Ok’ |  |
  |Activate Salesforce CRM |-Go to Setup. </br>-Click on Data Cloud Setup.</br>-In quick find search for Salesforce CRM.</br>-Click on Salesforce CRM.</br>-Go to the Standard Connection section and activate it. |![activate salesforce crm](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Pre%20Deployment%20Images/activate%20salesforce%20crm.png)|

</details>

<details><summary>
  
  ## 2. Salesforce Package Installation 
</summary>

### Table of Contents
  [1.	Install AutoFolio Base Package ](#1-Install-AutoFolio-Base-package)
  
  [2.	Verify The Package is installed ](#2-Verify-The-Package-is-installed)

### 1. Install Automotive Base Package (10 min)
 | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Install Automotive Base Package | - Click on this Package Installation [Link ](https://login.salesforce.com/packaging/installPackage.apexp?p0=04tPa000000p7lp)</br>- Sign-in to the Org with your credentials.</br>- Choose Install for Admins Only option</br>- Choose “Rename conflicting components in package” and click the Install button.</br>- Wait until installation is completed, you will receive a confirmation on logged in user’s email | <img width="184" alt="Install AutoFolio Base Package1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Salesforce%20Package%20Installation/Install%20AutoFolio%20Base%20Package1.png">|
| Verify Package installation | - Click Setup</br>- Search for package</br>- Search for 'SFAutomotiveDataKitsPackage' is installed  | ![Verify the package is installed](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Salesforce%20Package%20Installation/Verify%20the%20package%20is%20installed.png)|
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


### 1. Install the Data Kit to add Data Cloud components to the Org (15 mins)
The Data Kit is installed as a part of the Package installation. Once the Data is available in
the org, follow the steps below to create data streams.

 | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Data Streams from Data Bundle | - While logged into the environment where you installed the data kit</br>- Go to Data Cloud app and the Data Streams tab.</br>- Click New to create a Data Stream</br>- Select Salesforce CRM and click Next.</br>- Under Custom Data Bundles,select the SalesforceCRM01. </br>-Select your Salesforce Org and Click Next. </br>-Select the data space as ‘Default’, review the fields in your data stream, and click Next.</br>-Review details and click “Deploy”.</br>-Repeat the same step for second Data Bundles, select the SalesforceCRM02 . | ![Create Data Streams from Data Bundle 1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Streams%20from%20Data%20Bundle/Create%20Data%20Streams%20from%20Data%20Bundle%201.jpg)![Create Data Streams from Data Bundle  2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Streams%20from%20Data%20Bundle/Create%20Data%20Streams%20from%20Data%20Bundle%20%202.png)![Create Data Streams from Data Bundle  3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Streams%20from%20Data%20Bundle/Create%20Data%20Streams%20from%20Data%20Bundle%20%203.png)|
| Create Website_Mobile_apps Data Stream from Data Kit |- Click on Data Stream</br>- Click on New</br>- Select ‘Installed Data Kits Package’</br>- Select ‘SFAutomotiveDataKitsPackage’ Data Kits</br>- Select checkbox under ‘Websites_Mobile_Apps’ click on ‘Next’</br> -Select Connector type =‘website’ & connector name Experience_Cloud_Event_Connector’.</br> - Click on Deploy| ![Create Website_Mobile_apps Data Stream from Data Kit1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Website_Mobile_apps%20Data%20Stream%20from%20Data%20Kit/Create%20Website_Mobile_apps%20Data%20Stream%20from%20Data%20Kit1.png)![Create Website_Mobile_apps Data Stream from Data Kit2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Website_Mobile_apps%20Data%20Stream%20from%20Data%20Kit/Create%20Website_Mobile_apps%20Data%20Stream%20from%20Data%20Kit2.png)![Create Website_Mobile_apps Data Stream from Data Kit4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Website_Mobile_apps%20Data%20Stream%20from%20Data%20Kit/Create%20Website_Mobile_apps%20Data%20Stream%20from%20Data%20Kit4.png) ![Create Website_Mobile_apps Data Stream from Data Kit5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Website_Mobile_apps%20Data%20Stream%20from%20Data%20Kit/Create%20Website_Mobile_apps%20Data%20Stream%20from%20Data%20Kit5.png)![Create Website_Mobile_apps Data Stream from Data Kit6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Website_Mobile_apps%20Data%20Stream%20from%20Data%20Kit/Create%20Website_Mobile_apps%20Data%20Stream%20from%20Data%20Kit6.png)|
| Create a Data Stream for Amazon S3 from Data Kit |- Click on Data Stream Click on New</br>- Select Installed Data Kits & Packages Click on Next</br>- Select SFAutomotiveDataKitsPackage Data Kits<br> - Select Amazon_S3_Bundle</br>- Select Connection as InfosysAWSbucket</br>- Select the data space as ‘Default’, review the fields in your data stream,and click Next</br>-Review details and click Deploy  | |

 ### 2. Create Data Stream for Snowflake (10 mins)
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Data Stream for Snowflake from data kit | - Click on Data Stream Click on New </br>- Select Installed Data Kits & Package Click on Next</br>-Select Snowflake Bundle</br>- Select connection as ‘SnowflakeDataFederation’ .</br>- Select Database as ‘INFOSYS_DEMO’.</br>-Select ‘PUBLIC’ on schema> On Available Object Select ‘THIRD_PARTY_SURVEY ’. | ![Create Data Stream for Snowflake from data kit1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Stream%20for%20Snowflake%20from%20data%20kit/Create%20Data%20Stream%20for%20Snowflake%20from%20data%20kit1.png)|

  ### 3. Create Ingestion API for Mule Data Streams from Data Kit 
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | **Real Time Telemetric** | - Click on Data Stream </br> - Click on New.</br>- Select Installed Data Kits & Package. </br>- Select ‘SFAutomotiveDataKitsPackage’ Data Kits. </br>- Select Name as **RealTimeTelemetric**.</br>- Click on Next.</br> -Select Connection as ‘Real_Time_Telemetric_Data </br>- Click Next </br> -  Click Deploy| ![Create Ingestion API for Mule Data Streams from Data Kit   1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Ingestion%20API%20for%20Mule%20Data%20Streams%20from%20Data%20Kit/Create%20Ingestion%20API%20for%20Mule%20Data%20Streams%20from%20Data%20Kit%20%20%201.png) ![Create Ingestion API for Mule Data Streams from Data Kit   2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Ingestion%20API%20for%20Mule%20Data%20Streams%20from%20Data%20Kit/Create%20Ingestion%20API%20for%20Mule%20Data%20Streams%20from%20Data%20Kit%20%20%202.png) ![Create Ingestion API for Mule Data Streams from Data Kit   3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Ingestion%20API%20for%20Mule%20Data%20Streams%20from%20Data%20Kit/Create%20Ingestion%20API%20for%20Mule%20Data%20Streams%20from%20Data%20Kit%20%20%203.png) ![Create Ingestion API for Mule Data Streams from Data Kit   4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Ingestion%20API%20for%20Mule%20Data%20Streams%20from%20Data%20Kit/Create%20Ingestion%20API%20for%20Mule%20Data%20Streams%20from%20Data%20Kit%20%20%204.png)  ![Create Ingestion API for Mule Data Streams from Data Kit   5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Ingestion%20API%20for%20Mule%20Data%20Streams%20from%20Data%20Kit/Create%20Ingestion%20API%20for%20Mule%20Data%20Streams%20from%20Data%20Kit%20%20%205.png)|
  | **Vehicle Issues** |-Click on Data Stream </br> - Click on New.</br>- Select Installed Data Kits & Package. </br>- Select ‘SFAutomotiveDataKitsPackage’ Data Kits. </br>- Select Name as **VehicleIssue**.</br>- Click on Next.</br> -Select Connection as ‘Vehicle_issues_Details </br>- Click Next </br> -  Click Deploy|    |
  ### 4. Create Automotive_FAQ DLO Creation for Unstructured Data (5 min)
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Automotive FAQ. **Amazon Connection Should be Established**  | - Click on Data Lake Object Click on New</br>-Click on Create from Data Kits, Click on Next</br>-Select Automotive_FAQ, select connection. Click on Next.</br>-Click on Deploy.</br>-Follow same steps for creating **Automotive_Warranty_Info** DLOs| ![Create Automotive FAQ1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Automotive%20FAQ/Create%20Automotive%20FAQ1.png) ![Create Automotive FAQ2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Automotive%20FAQ/Create%20Automotive%20FAQ2.png)![Create Automotive FAQ3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Automotive%20FAQ/Create%20Automotive%20FAQ3.png)|

### 5. Create Identity Resolution Ruleset from Data Kit (5 min)
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  | -Go to Data Cloud app</br> - Click on the Identity Resolutions tab </br> - Click New</br> - Select Installed from Data Kit</b>- Choose "SFAutomotiveDataKitsPackage"</br>-Choose "Guest Profile" </br>- Click on Next</br>- Click on Save | ![Create Identity Resolution Ruleset from Data Kit1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Identity%20Resolution%20Ruleset%20from%20Data%20Kit/Create%20Identity%20Resolution%20Ruleset%20from%20Data%20Kit1.png)![Create Identity Resolution Ruleset from Data Kit2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Identity%20Resolution%20Ruleset%20from%20Data%20Kit/Create%20Identity%20Resolution%20Ruleset%20from%20Data%20Kit2.png)![Create Identity Resolution Ruleset from Data Kit3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Identity%20Resolution%20Ruleset%20from%20Data%20Kit/Create%20Identity%20Resolution%20Ruleset%20from%20Data%20Kit3.png)|

### 6. Create Calculated Insights (10 min)
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  Create Calculated Insights|- Go to Data Cloud app </br>- Click on Calculated Insights tab</br>- Click New</br>- Select "Create from a Data Kit" and click  Next</br>- Select ‘Customer Lifetime Value’</br>- Click on Next </br>- Click on ‘Check Syntex’</br>- Click on ‘Activate’</br>- Click Activate</br>- Select Schedule as "Scheduled for 24 hrs" </br>- Click on ‘Enable’</br>- Repeat the steps for the following metrics: ‘Customer Satisfaction Score’, 'Customer Interest from survey data’ | ![Create Calculated Insights1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Calculated%20Insights/Create%20Calculated%20Insights1.png)![Create Calculated Insights2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Calculated%20Insights/Create%20Calculated%20Insights2.png)|

  ### 7. Create Data Graph (10 min)
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  **Web Engagement RT** |- Click on Data Graph Tab</br>- Click on New</br>- Select Create from Data Kits</br>-Click on SFAutomotiveDataKitsPackage</br>- Select Web Engagement RT </br>- Select Realtime Profile. | |
  |   |- Select primary Data model object as “Unified Individual real”. |  |
  |   |- Click on Individual and go to the right side where the error is showing and uncheck the check box.</br>- Now click on Save & Build. |  ![Create Data Graph1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Graph/Create%20Data%20Graph1.png)![Create Data Graph2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Graph/Create%20Data%20Graph2.png)![Create Data Graph3]([https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/c6383be5-53b3-4363-80f8-57a12f352274](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Graph/Create%20Data%20Graph3.png))![Create Data Graph4]([https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/417933de-198c-4162-8462-09f76e1f6af9](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Graph/Create%20Data%20Graph4.png))![Create Data Graph5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Graph/Create%20Data%20Graph5.png)![Create Data Graph6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Graph/Create%20Data%20Graph6.png)![Create Data Graph7](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Graph/Create%20Data%20Graph7.png)![Create Data Graph8](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Graph/Create%20Data%20Graph8.png)|
  | **Automotive Real Time**   |-Click on Data Graph Tab  </br>-Click on New</br>-Select Create from Data Kits</br>-Click on AutomotiveDatakitPackage</br>- Select **Automotive Real Time**  </br>- Select Realtime Profile. |  |
  |   |- Select primary Data model object as “Unified Individual real”. |    |
  |   |- Click on Individual and go to the right side where the error is showing and uncheck the check box.</br>- Now click on Save & Build. |     |

### 8. Create Data Cloud Copy Field Enrichment (10 min)
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Data Cloud Copy Field Enrichment |- Go to Object Manager.</br>- Search for Contact.</br>-Click on Contact</br>- Click on Data cloud Copy Field.</br>- Click on New.</br>- Select data space as ‘default’</br>- Select Data Cloud Object as ‘Customer_Lifetime_Value__cio’  </br>- Click on Next </br>- Select Field As ‘amt’| ![Create Data Cloud Copy Field Enrichment  1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Cloud%20Copy%20Field%20Enrichment/Create%20Data%20Cloud%20Copy%20Field%20Enrichment%20%201.png)![Create Data Cloud Copy Field Enrichment  2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Cloud%20Copy%20Field%20Enrichment/Create%20Data%20Cloud%20Copy%20Field%20Enrichment%20%202.png)![Create Data Cloud Copy Field Enrichment  3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Cloud%20Copy%20Field%20Enrichment/Create%20Data%20Cloud%20Copy%20Field%20Enrichment%20%203.png)![Create Data Cloud Copy Field Enrichment  4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Cloud%20Copy%20Field%20Enrichment/Create%20Data%20Cloud%20Copy%20Field%20Enrichment%20%204.png)|
  |  |- Give Label as ‘Customer Lifetime Value’</br>- Click on ‘Next.</br>-On contact Select "Lifetime Value"</br>- Save and Start Sync. |![Create Data Cloud Copy Field Enrichment  5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Cloud%20Copy%20Field%20Enrichment/Create%20Data%20Cloud%20Copy%20Field%20Enrichment%20%205.png)![Create Data Cloud Copy Field Enrichment  6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Cloud%20Copy%20Field%20Enrichment/Create%20Data%20Cloud%20Copy%20Field%20Enrichment%20%206.png)![Create Data Cloud Copy Field Enrichment  7](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Cloud%20Copy%20Field%20Enrichment/Create%20Data%20Cloud%20Copy%20Field%20Enrichment%20%207.png)|
  |Data Cloud copy field For Customer satisfaction score|- Go to Object Manager.</br>- Search for Contact.</br>Click on Contact</br>- Click on Data cloud Copy Field.</br>- Click on New.</br>- Select data space as ‘default’</br>- Select Data Cloud Object as ‘Customer_Satisfaction_Score__cio’  </br>- Click on Next </br>- Select Field As ‘CSS’ | ![Data Cloud copy field For Customer satisfaction score 1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Cloud%20Copy%20Field%20Enrichment/Data%20Cloud%20copy%20field%20For%20Customer%20satisfaction%20score/Data%20Cloud%20copy%20field%20For%20Customer%20satisfaction%20score.1.png)<img width="238" alt="Data Cloud copy field For Customer satisfaction score 2" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Data%20Cloud%20Copy%20Field%20Enrichment/Data%20Cloud%20copy%20field%20For%20Customer%20satisfaction%20score/Data%20Cloud%20copy%20field%20For%20Customer%20satisfaction%20score.1.png">|
  |  |- Give Label as ‘Customer Satisfaction Score’</br>- Click on ‘Next.</br>On contact Select "Customer Satisfaction Score"</br>- Save and Start Sync. | |

### 9. Create activation targets (5 min)
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create Marketing Cloud Engagement |-Go to Data Cloud app </br>-Go to setup and select data cloud setup</br>-Search for Marketing Cloud Engagement and enable it.</br>-Finally, you need to check in Select Business Units to Activate option and click on Manage button.Check inside available business units and move those values to selected business unit.</br>-Click on Save. | ![Create Marketing Cloud Engagement1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Activation%20Targets/Create%20Marketing%20Cloud%20Engagement/Create%20Marketing%20Cloud%20Engagement1.png)![Create Marketing Cloud Engagement2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Activation%20Targets/Create%20Marketing%20Cloud%20Engagement/Create%20Marketing%20Cloud%20Engagement2.png)![Create Marketing Cloud Engagement3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Activation%20Targets/Create%20Marketing%20Cloud%20Engagement/Create%20Marketing%20Cloud%20Engagement3.png)|
  |Create Activation Targets |-Go to Data Cloud app.</br>-Click on the Activation Targets tab </br>-Click on MCDO.</br>-Need to provide name as Marketing for activation target.</br>-And selecting data space as default.</br>-Click on Next. | ![Create Activation Targets1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Activation%20Targets/Create%20Activation%20Targets/Create%20Activation%20Targets1.png)![Create Activation Targets2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Activation%20Targets/Create%20Activation%20Targets/Create%20Activation%20Targets2.png)|

### 10. Create Segment From Data Kit (5 min)
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create Segment |-Go to Data Cloud app and Click on the Segment tab.</br>-Click on New</br>-Select "Installed from Data Kit”</br>-Choose "SFAutomotiveDataKitsPackage" </br>-Click on Next</br>-Select Segment as Individual and provide Segment name as Drivers visited the dealership.</br>-Select Rapid Publish</br>-Select Publish Schedule to 4 hrs and select the start and end date. </br>-Click on Save</br>-Click on the Publish now button. </br>-Needs to select the following segment from data kit</br>-Drivers who drove into the dealers. </br>-High Purchase Probability Customers v8 </br>-UpcomingWarrantyEnddate </br>-**Note:** After inserting the sample data or loading data from tool in the org. Go to Opportunity_Home data stream and click on Refresh Now button and wait for 15mins till you see Success message in Last run status. Then once again go to segment and publish it manually once.| ![Create Segment from Data Kit1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Segment%20from%20Data%20Kit/Create%20Segment%20from%20Data%20Kit1.png)![Create Segment from Data Kit2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Segment%20from%20Data%20Kit/Create%20Segment%20from%20Data%20Kit2.png)![Create Segment from Data Kit3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Segment%20from%20Data%20Kit/Create%20Segment%20from%20Data%20Kit3.png)![Create Segment from Data Kit5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Segment%20from%20Data%20Kit/Create%20Segment%20from%20Data%20Kit5.png)|

### 11. Create Activation (10 min)
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create Activation|-Go to Data Cloud app </br>-Click on the Activations tab</br>-Click on new</br>-Select Segment and continue </br>-By default, space is default </br>-Need to select the High Purchase Probability Customer V8 segment and activation target as marketing </br>-click on continue</br>-Select Email and Click on continue</br>-Click on add attributes </br>-And from individual select the following attributes First Name and Last Name </br>-Click on Save and provide name as High Purchase Probability Activations. |![Create Activations1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Activations/Create%20Activations1.png)![Create Activations2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Activations/Create%20Activations1.png)![Create Activations3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Activations/Create%20Activations3.png)![Create Activations4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Activations/Create%20Activations4.png)![Create Activations5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20Activations/Create%20Activations5.png)|
  |Create Activations for Recall Customer |-Click on data cloud app</br>-Click on the Activations tab </br>-Click on new</br>-Select Segment and continue </br>-By default, space is default </br>-Need to select the Upcoming Warranty End Date segment and activation target as marketing</br>-click on continue</br>-select email and sms </br>-click on continue</br>-click on add attribute</br>-And from individual select the Following attributes First Name, Last Name, Country</br>-Click on Save and provide name as Upcoming Warranty End Date.| ![Create Activations for Recall Customer1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/1779abfe-f99b-4e0e-8c97-994947ca6093)|
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

[13. Search Index and Retriever Configuration](#13-Search-Index-and-Retriever-Configuration)

### 1. Verify Organization Wide Address (5 min)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Verify Organization-Wide Address Exists or not |- Go to Setup \-\> Search for Organization-Wide Address \-\> Click on Organization-Wide Addresses</br>-  Verify if there is an organization-wide address with name ‘Default Email’ is created and verified or not like below.</br>- If there is none, then please create an organization-wide address by following below steps</br>- Click on **Add** button \-\> On the Display Name Add **‘Default Email’.** On the Email Address \<Add your email address\> Select ‘Default No-Reply Address’ on Purpose field \-\> click check box **‘allow all profiles to use this from address’**   | ![Verify Organization-Wide Address Exists or not1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Verify%20Organization-Wide%20Address%20Exists%20or%20not1.png)![Verify Organization-Wide Address Exists or not2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Verify%20Organization-Wide%20Address%20Exists%20or%20not2.png)|


### 2. Install Agent and Experience Site Package (1 hr 30 min)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Install Agent & Exp Site Package | **Option 1**</br>- Install VSCode [Download](https://code.visualstudio.com/download) </br>- Setup CLI a. Install the Salesforce CLI  https://developer.salesforce.com/tools/salesforcecli or check that your installed CLI version is greater than 2.56.7 by running sf \-v in a terminal.</br>- If you need to update the Salesforce CLI, either run sf update or npm install \--global @salesforce/cli depending on how you installed the CLI.</br>- Install Extension</br>- Open VSCode \> Go To\> Extensions-\>Salesforce Extension Pack\>Install</br>- StepUp Base metadata deployment</br>- Create Project with Manifest</br>- Open VSCode\> Type Ctrl+Shift+P\>Select SFDX: Create Project with Manifest</br>- Select Standard</br>- Enter Project Name</br>- Click Enter </br>- Select the folder where you want to create a project then select ‘Create Project’.</br></br> Download the zip folder from the link below:</br>- [Download](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/tree/master/force-app/main/default)</br>-  Unzip the folder and copy the ‘main’ folder</br>- Go To\>The Project folder created as part of ‘Create Project with manifest’ \>Go To\> force-app folder\>Paste the folder</br>- Authorize an Org</br>- Type Ctrl+Shift+P\>Select SFDX:Authorize an Org</br>- Select Project Default</br>- Enter the Org alias</br>- Authorize the Org</br>- Deploy the base app metadata.</br>- terminal sf deploy start \-d force-app </br></br>  **Option 2: Deploy using Code Builder**</br>-  Download the zip file and unzip locally Download the zip folder from the link below:</br>  [Download](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/tree/master/force-app/main/default)</br>- To Open Code Builder → Login in salesforce and search for Code builder in All tab menu.</br>- Click on Launch button</br>- Expand the force app.</br>- Right Click on Application → Upload → choose the file from the Un Zipped folder application file.</br></br> **Option 3: Using Code Builder by Cloning Repository from GitHub**</br> $${\color{orange}Waiting \space for \space Salesforce \space Github}$$ </br></br> **NOTE:** $${\color{red}Skip \space below\space steps \space 4, \space 5, \space 6, \space and \space 7 \space if \space you \space wish \space to \space bring \space in \space your \space own \space Product \space data}$$ | ![Install Agent   Exp Site Package1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Install%20Agent%20%26%20Exp%20Site%20Package1.png) ![Install Agent   Exp Site Package2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Install%20Agent%20%26%20Exp%20Site%20Package2.png)![Install Agent   Exp Site Package3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Install%20Agent%20%26%20Exp%20Site%20Package3.png)![Install Agent   Exp Site Package4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Install%20Agent%20%26%20Exp%20Site%20Package4.png)![Install Agent   Exp Site Package5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Install%20Agent%20%26%20Exp%20Site%20Package5.png)![Install Agent   Exp Site Package6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Install%20Agent%20%26%20Exp%20Site%20Package6.png)![Install Agent   Exp Site Package7](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Install%20Agent%20%26%20Exp%20Site%20Package7.png)|


### 3. Create Sample Data (5 min)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Create Sample Data  | - Click on App Launcher, search for Automotive Setup and click on Automotive Setup app </br>- Click on the **Create Test Data** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. </br>-**Note:** If an error comes up after clicking on Create Test Data Button then follow the below steps, else skip it. </br> 1. Go to Setup>> Enter Duplicate>> Click on Duplicate Rules  </br>2. Click on "Standard Account Duplicate Rule">>once it get open>> click on Deactivate Button  </br>3. again go back to Duplicate rules list view>> click on " Standard Contact Duplicate Rule"  </br>4. once it gets open >> click on Deactivate button.| <img width="225" alt="Create Sample Data1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Create%20Sample%20Data1.png">|

### 4. Create Commerce Data (5 min)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Create Data  | - Click on App Launcher, search for Automotive and click on Automotive App</br>- Click on the **“Create Commerce Data”** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. | <img width="234" alt="Create commerce data1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Create%20commerce%20data1.png">|


### 5. Turn on Search Update (5 min)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Search Update |- Click on App Launcher\>\> Select commerce application\>\>Click on Store</br>- Open Autofolio Store</br>- Scroll down to Setting\>\>Expand It\>\> Click on Search</br>- Turn on Automatic Update    |   |


### 6. Upload CMS Images into the Store And Verify Workspace Shared To Site (15 min)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Upload CMS Images  |-Download Images for CMS From [download](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/tree/master/Product%20Image) </br>-Click on App Launcher\>\> Select commerce application\>\> Click on Store</br>- Open Autofolio Store</br>- Scroll down to Content Manager</br>- Click on Add workspace</br>-  Enter details such as Name "AutoFolio  Store" and select Enhanced CMS Workspace and click on Next</br>-   AutoFolio Site as Public and click Next</br>- Keep language as it is and click on Finish</br>-  Click on Add and select Content \>\> select images\>\>Click on Create button\>\> click on upload button\>\>Select Image\>\>Image and Title populated\>\>Enter API name (can be the same as file name)\>\> Save it\>\> Click on Publish button\>\> Keep Details as is\>\> Click on Next\>\> Select Publish Now\>\>click on publish now button </br>- Please find the required images here \- Download images   | ![Upload CMS Images into Store and Verify Workspace shared to Site1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site1.png) ![Upload CMS Images into Store and Verify Workspace shared to Site2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site2.png)![Upload CMS Images into Store and Verify Workspace shared to Site3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site3.png)![Upload CMS Images into Store and Verify Workspace shared to Site4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site4.png) ![Upload CMS Images into Store and Verify Workspace shared to Site5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site5.png)![Upload CMS Images into Store and Verify Workspace shared to Site6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site6.png)|
  |Verify Workspace Shared to Site |-Open Autofolio Store </br>-Scroll down to Content Manager>> Click on Autofolio Store workspace</br>-Click on Gear Icon>> Select Workspace Sharing  </br>-Select All Commerce -Enhanced, AutoFolio Managed Content Space CianuN4G. | <img width="202" alt="Upload CMS Images into Store and Verify Workspace shared to Site7" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site7.png"><img width="204" alt="Upload CMS Images into Store and Verify Workspace shared to Site8" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site8.png">![Upload CMS Images into Store and Verify Workspace shared to Site9](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site9.png)![Upload CMS Images into Store and Verify Workspace shared to Site10](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site10.png)![Upload CMS Images into Store and Verify Workspace shared to Site11](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site11.png)![Upload CMS Images into Store and Verify Workspace shared to Site12](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site12.png)![Upload CMS Images into Store and Verify Workspace shared to Site13](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Upload%20CMS%20Images%20into%20Store%20and%20Verify%20Workspace%20shared%20to%20Site13.png)|


### 7. Add Image to a Product in CMS (10 min)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Add Image to a Product   |- Click on App Launcher\>\> Select commerce application\>\>Click on Store</br>- Open Autofolio Store </br>- Expand Merchandise\>\> Product\>\> open one by one product</br>- Click on eye icon (it removes Site window) after save button   </br>- Scroll down \>\> click on Go to global product record</br>-  Go to Media\>\> Click on Add image for Product details Image section \>\> Select appropriate image from Autofolio Store CMS Workspace\>\> click on Add button</br>- Repeat Step vi for product List Image  repeat step iii. to vii for rest of the product</br>- Go to store\>\> select Autofolio \>\>Scroll down to Website Design\>\> select product category from dropdown \>\> click on Publish button</br>- Go back to AutoFolio Store\>\>Click on Home\>\> click on Preview the site and see product is getting displayed | ![Add CMS Product Image1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Add%20CMS%20Product%20Image1.png)<img width="181" alt="Add CMS Product Image2" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Add%20CMS%20Product%20Image2.png">![Add CMS Product Image3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Add%20CMS%20Product%20Image3.png)![Add CMS Product Image4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Add%20CMS%20Product%20Image4.png)![Add CMS Product Image5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Add%20CMS%20Product%20Image5.png)![Add CMS Product Image6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Add%20CMS%20Product%20Image6.png)![Add CMS Product Image7](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Add%20CMS%20Product%20Image7.png)![Add CMS Product Image8](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Add%20CMS%20Product%20Image8.png)![Add CMS Product Image9](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Add%20CMS%20Product%20Image9.png)![Add CMS Product Image10](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Add%20CMS%20Product%20Image10.png)![Add CMS Product Image11](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Add%20CMS%20Product%20Image11.png) |

### 8. Enable as a Buyer Group (5 min)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Enable as a Buyer Group |-Go to App launcher>>Enter Account and click on it>> Open TMZ Dealership account record </br>-Click on Enable as Buyer Button>> Click on Enable As Buyer. | ![Enable as a Buyer Group1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Enable%20as%20a%20Buyer%20Group1.png)|

### 9. Enable Guest access (5 min)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Enable Guest access |-Click on App Launcher>> Select commerce application>> Click on store </br>-Open AutoFolio Store</br>-Scroll down click on Settings>>Click on Store>> Click on Buyer Access </br>-Click on Enable button under Guest Access.| <img width="234" alt="Enable Guest access1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Enable%20Guest%20access1.png">![Enable Guest access2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Enable%20Guest%20access2.png)|

### 10. Create Community User and Assign Buyer Account to Buyer Group (5 min)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Create Community User and Assign Buyer Account to Buyer Group |-Click on App Launcher, search for Automotive and click on Automotive Setup App. </br>-Click on the **Create Buyer Group Member Data** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. | <img width="226" alt="Create Community User and Assign Buyer Account to Buyer Group1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Create%20Community%20User%20and%20Assign%20Buyer%20Account%20to%20Buyer%20Group1.png">|

### 11. Create Order and OrderItems Data (5 min)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Create Order and OrderItems Data |-Click on App Launcher, search for Automotive Setup and click on Automotive Setup app </br>-Click on the **Create Order and OrderItems** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. | <img width="226" alt="Create Order and OrderItems Data1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Commerce%20cloud%20and%20Sample%20Data%20images/Create%20Order%20and%20OrderItems%20Data1.png">|

### 12. Create Opportunity ML Data (5 min)
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Create Opportunity ML Data |-Click on App Launcher, search for Automotive Setup and click on Automotive Setup app  </br>-Click on the **Create Opportunity Data For ML** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. |  |

 ### 13. Search Index and Retriever Configuration (15 min)
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Search Index and Retriever Configuration|-Go to App Launcher Search for Data Cloud, Go to Search Index Tab. </br>-Click on New, Select From a Data Kit , Select ‘SFAutomotiveDataKitsPackage’ , Select Product ,Click on Next </br>-For Search Type Select Hybrid Search, Click Next </br>-For Chunking, Keep the Same Changes and Click Next. </br>-For Vectorization, Make sure E5 Large V2 Embedding model is Selected, Click Next  </br>-For Fields for Filtering, Keep Same, Click Next. </br>-For Ranking, no Change , Click Next </br>-Click Save </br>-After Save the ‘Search Index Last Run Status’ Will be In Progress, wait for 15-30 Minutes Till the Status changes to Ready. </br>-**Create Retriever for Showing Product**</br>-Create  Retriver, Go to App Launcher Search for Data Cloud, Go to Einstein Studio Tab. On the Left Side below Models, click on Retriver, Clikc on New Retriver </br>-In Select Retriever Type Section, Select Data Source as Data Cloud, In which data space does the source data reside? As default, data model objec as Product, Data model object's search index configuration as Product, Click Next </br>-In Section Define Retriver Filters, Select All Document, Click Next </br>-In Section Confiure Retriver Results Number  of Results as 20 and map Fields to Return as following </br>**1-** Field Label :Seat Capacity Field Name :Direct Attribute > Product >Seat Capacity </br>**2-** Field Label :Product Description Field Name :Direct Attribute > Product >Product Description </br>**3-** Field Label :Vehicle Name Field Name :Direct Attribute > Product >Product Name</br>-Click Next</br>-Click Save</br>-Click on Setup, in the Quick Find Box, enter Prompt Builder, and then select Prompt Builder </br>-Search for the Prompt Template named Vehicle Recommendation and click on the hyperlink </br>-Place the cursor after the text the ‘Vehicle Details:’, click on Resource then click on Einstein Search then click on ‘Product’ click on ‘Product retriever’ </br>-On the right side click on default ‘Product retriever’ click on Search Parameter click on Free Text Click on Question</br>-Scroll down Select Chunk under Output Field and Enter 1 in Number of Result </br>-Click on Save As New Version click Activate  |     |
</details>
<details><summary>

 ## 5. Configure Amazon and Snowflake Connections
</summary>

## Table of Contents

[1. Assign account page layout	](#1-assign-account-page-layout)

[2. Setup Data in Amazon S3	](#2-setup-data-in-amazon-s3)

[3. Setup Data in Snowflake	](#3-setup-data-in-snowflake)

[4. Create ML Model	](#4-Create-ML-Model)

[5. Add ML Model Into Flow](#5-Add-ML-Model-Into-flow)

 
### 1. Assign Account Page Layout (10 min)
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Assign Account Page Layout | - Click on Setup </br>- Go to Object Manager.</br>-Click on account.</br>-Click on page Layout</br>-Click on ‘page layout assignment’ </br>-Click on edit assignment. </br>-Select ‘SDO-Account’ Layout under Record type ‘Account’ for System Administration Profile </br>-From Page Layout to Use dropdown Select ‘Account layout’ </br>-Click on save. </br>-Verify that, for ‘System Administrator profile’ for  Record type ‘Account’ Page layout should be ‘Account Layout’.|![Enable Account as Buyer Account1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Configure%20Amazon%20and%20Snowflake%20and%20ML%20Images/Enable%20Account%20as%20Buyer%20Account1.png)![Enable Account as Buyer Account2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Configure%20Amazon%20and%20Snowflake%20and%20ML%20Images/Enable%20Account%20as%20Buyer%20Account2.png)![Enable Account as Buyer Account3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Configure%20Amazon%20and%20Snowflake%20and%20ML%20Images/Enable%20Account%20as%20Buyer%20Account3.png)![Enable Account as Buyer Account4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Configure%20Amazon%20and%20Snowflake%20and%20ML%20Images/Enable%20Account%20as%20Buyer%20Account4.png) |

### 2. Setup Data in Amazon S3 (20 min)
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Setup Data in Amazon S3 | - Log into Management Console and proceed to [S3 service](https://s3.console.aws.amazon.com/s3/home) and create a new bucket (give it an appropriate name).</br>  ***NOTE*****:** if you already have a bucket, you don’t need to create another bucket. Download the following files to your computer:</br>- Automotive FAQ PDF  csv [https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/tree/master/AWS%20Unstructure%20Data](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/tree/master/AWS%20Unstructure%20Data )]</br>- Upload these files to the appropriate S3 bucket.  |  |

### 3. Setup Data in Snowflake (15 min)
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
Third Party Survey Data- [[https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/tree/master/AWS%20Unstructure%20Data](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/tree/master/Snowflake%20Data)](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/tree/master/Snowflake%20Data )]
```
### 4. Create ML Model (20 min)
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create ML Model | - Click on App launcher and search for Einstein Studio.</br>-Click on Add Predictive Model button </br>-Select create a model from scratch </br>-click on next</br>-Select data space as Default and select Opportunity DMO for data option </br>-Click on Next </br>-For training select Filter Set of Records option </br>-Specify the condition to filter the records and select field as Closed and select operator as IN and select values like true </br>-Click on Apply Changes </br>-For Set goal option select field name as Won and Select Maximize option Select true</br>-Click on next</br>-For Prepare Variable select disable Autopilot and select the follow fields like **Total Amount, Test Drive Date, Close Date, Number of Past Interactions, Car Model, Recency of Interactions, After Completing a Test Drive Status** </br>-Click on next</br>-For select Algorithm option Enable Automatic Selection. </br>-Click on next</br>-Review all the things and Click on Save and Train and specify ML Model name as Predicted Likelihood of Purchase </br>-Lets wait the model to train it successfully </br>-click on Activate button. | ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model1.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model2.png)![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model3.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model4.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model5.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model6.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model7.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model8.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model9.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model10.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model11.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model12.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model13.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model14.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Data%20Cloud%20Configuration/Create%20ML%20Model/Create%20ML%20Model15.png) |

### 5. Add ML Model into Flow (15 min)
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

[12. Add Agent User into Agent force Service Agent and Activate	](#12-add-agent-user-into-agent-force-service-agent-and-activate)

[13. Add site logo	](#13-add-site-logo)

[14. Activate Einstein Copilot	](#14-activate-einstein-copilot)

[15. Create Trusted URLS	](#15-create-trusted-urls)

[16. Create CORS	](#16-create-cors)

[17. Assign Contact,vehicle and opportunity Record Page as Org Default.](#17-assign-contact-vehicle-opportunity-record-page-as-org-default)

[18. Create a New Version of Omni-Channel Flow.](#18-create-a-new-version-of-omni-channel-flow)

[19. Add External Id into Contact as well snowflake after Self Registration contact creation.](#19-Add-External-Id-into-Contact-as-well-snowflake-after-Self-Registration-contact-creation)

[20.Create warranty contract document for vehicle record created via Self Registration form and upload into S3.](#20-Create-warranty-contract-document-for-vehicle-record-created-via-Self-Registration-form-and-upload-into-S3)

[21.Publish Calculated Insights After Self Registration.](#21-Publish-Calculated-Insights-After-Self-Registration)

[22.Connected App Configuration.](#22-Connected-App-Configuration)

[23.Named Credentials.](#23-Named-Credentials)

[24.Enable Oauth and OpenID Connect Settings](#24-Enable-Oauth-and-OpenID-Connect-Settings)

[25.Assign AutoFolio Guest Buyer Profile.  ](#25-Assign-AutoFolio-Guest-Buyer-Profile)

[26.Assign AutoFolio Buyer Group ](#26-Assign-AutoFolio-Buyer-Group)

[27.Assign Buyer Group For Self Registration ](#27-Assign-Buyer-Group-For-Self-Registration)

[28.If Strikethrough price is not populating on UI for any of the products then perform below steps ](#28-If-Strikethrough-price-is-not-populating-on-UI-for-any-of-the-products-then-perform-below-steps)

[29.Experience Site Product UI Configuration](#29-Experience-Site-Product-UI-Configuration)

[30.Experience Site Product Price as Display 1 Price Configuration  ](#30-Experience-Site-Product-Price-as-Display-1-Price-Configuration)


### 1. Refresh Snowflake Data Streams (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Refresh Snowflake Data Streams | - Navigate to Data Cloud app and the Data Streams tab </br>- Query for **Third Party Survey data** stream</br>- Using drop down control on the right against the data stream initiate update status for the **Third Party Survey data** stream </br>- Third Party Survey -8 | ![Refresh Snowflake Data Streams1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Refresh%20Snowflake%20Data%20Streams1.png) |

### 2. Run Identity Resolution Ruleset (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|   Run Identity Resolution Ruleset | - Navigate to Data Cloud app and the Identity Resolutions tab</br>- Query for Guest Profile ruleset</br>- Click on the Ruleset Name hyperlink to navigate to the ruleset’s record home page</br>- Click Run Ruleset</br>- The Last Job Status will turn to In Progress. Once the job completes successfully, this status will be set as Succeeded.  |  ![Run Identity Resolution Ruleset1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Run%20Identity%20Resolution%20Ruleset1.png)![Run Identity Resolution Ruleset2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Run%20Identity%20Resolution%20Ruleset2.png)|

### 3. Run Calculated Insights (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Run Calculated Insights | - Navigate to Data Cloud app and the Calculated Insights tab</br>- Query for Customer Lifetime Value calculated insight</br>- Using drops down control on the right against the data stream initiates refresh for the **Customer LifeTime Value** calculated insight.</br>- When the Calculated Insight is refreshed successfully, the Last Run Status will show as Success.</br>- Repeat steps b & c for the below Calculated Insights. Ensure all Insights are refreshed successfully.</br>- Customer Satisfaction Score   </br>- Customer Interest from Survey Data  </br>-   | ![Run Calculated Insights1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Run%20Calculated%20Insights1.png)|

### 4. Activate Messaging Setting (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Activate Messaging Setting | - Navigate to Setup go to messaging setting</br>-  Click on ESA Channel \-\> Click on ‘Activate’</br>- Click on Checkbox then click on Accept.</br>- Go back Messaging setting >> there is  ESA channel and scroll to right >> Click on downward arrow>> click on edit button.</br>- Scroll to downward direction>>check the “Let Customers download their conversation. </br>-Please refer the images for more understanding.  | ![Activate Messaging Setting1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Activate%20Messaging%20Setting1.png)![Activate Messaging Setting2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Activate%20Messaging%20Setting2.png)![Activate Messaging Setting3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Activate%20Messaging%20Setting3.png)![Activate Messaging Setting4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Activate%20Messaging%20Setting4.png)![Activate Messaging Setting5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Activate%20Messaging%20Setting5.png) |

### 5. Update Einstein Search Retriever (15 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Update Einstein Search Retriever |- Click on **Setup**, in the Quick Find Box, enter Prompt Builder, and then select **Prompt Builder**</br>- Search for the Prompt Template named **Generate FAQ From Automotive Industry** and click on the hyperlink</br>- Hover the cursor on text the next to ‘Question : ‘, click on Resource à click on Einstein Search à click on 'Automotive_FAQ’ à click on ‘‘Default_Automotive_FAQ’ Retriever</br>- On the right side click on default ‘Default_Automotive_FAQ Retriver click on Search Parameter click on Free Text Click on Question</br>- Hover over cursor on next text on ‘Use this information to answer the question:’, click on Resource à click on Einstein Search à click on Automotive_FAQ Retriver\_V2</br>- Click on Save As New Version click **Activate**.</br>-	Go back to Prompt Builder.</br>- Search for Prompt template names as Return Warranty Info and click on the hyperlink.</br>- Hover the cursor on text the next to ‘Input:VIN with the‘, click on Resource à click on Einstein Search à click on ‘Automotive_Warranty_Info’ click on ‘Default_Automotive_Warranty_Info Retriver.</br>- Below this line ‘You are a Warranty Expert in Autofolio, here are some documents about Warranty Information’ click on Resource à click on Einstein Search à click on ‘Automotive_Warranty_Info’ click on ‘Default_Automotive_Warranty_Info Retriver.</br>- On the right side click on default Automotive_Warranty_Info click on Search Parameter click on Free Text Click on VIN. </br>- Click on Save As New Version click Activate   | ![Update Einstein Search Retriever1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Update%20Einstein%20Search%20Retriever1.png)![Update Einstein Search Retriever2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Update%20Einstein%20Search%20Retriever2.png)![Update Einstein Search Retriever3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Update%20Einstein%20Search%20Retriever3.png)![Update Einstein Search Retriever4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Update%20Einstein%20Search%20Retriever4.png) |

### 6. Configure Digital Experience (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Configure Digital Experience. |- Click on **Setup**, in the Quick Find Box, enter Digital Experiences, and then select **All Sites**</br> -  Click on builder against the Site ***‘Autofolio’*** </br> - Click on ‘Banner’  in the right-hand panel, under Image Settings, click ‘Clear Image’</br> - Click on ‘Select Image from CMS’ \-\> Click on ‘BackgroundImnageCar’ </br> - Click on ‘Embedded Messaging ‘and update as per screenshot below </br> - Click on ‘Multilevel Navigation Menu ‘, in the right-hand panel under Default Menu select ‘Default Navigation’  |   ![Configure Digital Experience1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Configure%20Digital%20Experience1.png)![Configure Digital Experience2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Configure%20Digital%20Experience2.png)![Configure Digital Experience3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Configure%20Digital%20Experience3.png)![Configure Digital Experience4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Configure%20Digital%20Experience4.png)|

### 7. Enable Login Access (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Enable Login Access. | - Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites</br>- Against the site ‘AutoFolio’, click on Workspaces</br>- Under My Workspaces, click on Administration</br>- Click on Login & Registration menu item</br>- Under Login Page Setup, change Login Page Type to Experience Builder Page</br>- For URL, choose Login</br>- Under Password Pages, change Forgot Password to Experience Builder Page</br>- Choose Forgot Password</br>- Under Registration Page Configuration enable "Allow customers and partners to self-register"</br>- Choose Registration Page Type as Experience Builder Page</br>- Choose Register</br>- Assign users to a profile and account,choose AutoFolio Community User </br>- Assign Permission Set Group as "Commerse_Shopper"  |  ![Enable Login Access1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Enable%20Login%20Access1.png)![Enable Login Access2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Enable%20Login%20Access2.png) |

### 8. Change the layout of the Login page (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the layout of the Login page. |- Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites </br>- Against the site ‘AutoFolio’’, click on Builder</br>- From the Page dropdown, search for Login, and then select Login </br>-Remove the site logo and add a Text Box component. Enter the text as "AutoFolio’", make it bold and center</br>- Publish the changes  | <img width="233" alt="Change the layout of the Login page1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Change%20the%20layout%20of%20the%20Login%20page1.png"> |

### 9. Change the layout of the Forget Password page. (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the layout of the Forget Password page.|- Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites </br>- Against the site ‘AutoFolio’, click on Builder </br>-From the Page dropdown, search for Login, and then select Forget Password </br>- Remove the site logo and add a Text Box component. Enter the text as "AUTOFOLIO", make it bold and center </br>-Publish the changes | <img width="232" alt="Change the layout of the Forget Password page1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Change%20the%20layout%20of%20the%20Forget%20Password%20page1.png">|

### 10. Change the layout of the Register page (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the layout of the Register page. |- Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites</br>- Against the site ‘AutoFolio’’, click on Builder</br>- From the Page dropdown, search for Register, and then select Register</br>- Remove the site logo and add a Text Box component. Enter the text as "AutoFolio’", make it bold and center</br>- Publish the changes  | <img width="222" alt="Change the layout of the Register page1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Change%20the%20layout%20of%20the%20Register%20page1.png"> |

### 11. Change the email Address (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the email Address. |- Go to Setup \-\> Open All Sites</br>- Click on Workspaces (the configured Sites) \-\> Click Administrator</br>- Click on Emails</br>- Change Sender email to system admin email</br>- Click on save | <img width="234" alt="Change the email Address1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Change%20the%20email%20Address1.png">|


### 12. Add Agent User into Agent force Service Agent and Activate (10 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Add Agent User into Agent force Service Agent & Activate |- Click on setup, search for agent</br>- Click on ‘Agentforce Service Agent’</br>- Click on Open Builder</br>- Click on setting</br>-Click on company field and just give one space and remove space. </br>-Select Agent User to Service Agent User</br>-  Activate  | ![Add Agent User into Agent force Service Agent   Activate1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Add%20Agent%20User%20into%20Agent%20force%20Service%20Agent%20%26%20Activate1.png)![Add Agent User into Agent force Service Agent   Activate2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Add%20Agent%20User%20into%20Agent%20force%20Service%20Agent%20%26%20Activate2.png)![Add Agent User into Agent force Service Agent   Activate3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Add%20Agent%20User%20into%20Agent%20force%20Service%20Agent%20%26%20Activate3.png)|

### 13. Add site logo (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Add Site Logo |-Go to Setup>> Enter All sites in quick find box click on builder of "AutoFolio" site  Search for the logo of "alpine group' >> click on it Under setting>> click on Select Image from CMS> Select Content space>> select image "image name" click on Save.|   |

### 14. Activate Einstein Copilot (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Activate Einstein Copilot |- Click on setup, search for agent</br>- Click on ‘Einstein Copilot’</br>- Click on Open Builder click on Activate   |  ![Activate Einstein Copilot1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Activate%20Einstein%20Copilot1.png)![Activate Einstein Copilot2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Activate%20Einstein%20Copilot2.png)|

### 15. Create Trusted URLS (20 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Trusted URLS |- In the Quick Find\>Type Trusted URLs</br>- Click on New\>In API Name \>Type ‘‘Trusted’ </br>- In URL> Type> https://*.tile.openstreetmap.org</br>- Under CSP Directives>>check below checkbox for.</br>1. connect-src(scripts)  </br>2. frame-src (iframe content)  </br>3-img-src (images)  </br>- Save it </br>- Click on New.</br>- In API Name, type ‘TrustedSite2’. </br>- In URL, type: https://DOMAINNAME.my.site.com. </br>Replace DOMAINNAME.my.site.com with your actual org Domain Name. </br>- **To find the Domain Name** follow these steps: </br>-Search for Domain in Quick Find. </br>-Copy the domain name ending with .my.site.com (e.g., epicorgfarm79.my.site.com). </br>-Select the domain related to your Experience Cloud Sites. </br>-Click on Save. </br> **Add Trusted URL to Agent Sites:** </br>-Click on Setup. </br>-Search for Site, then click on Enable Site (if it’s not enabled already). </br>-Click on **Register My Salesforce Site Domain**.</br>-Search for Site, and click on **‘ESW_ESA_Web_Deployment_1736313145513’**.</br>-Click on Add Domain. </br>-Add DOMAINNAME with your actual org Domain Name. </br>-Prefix with https://(e.g.,https://epicorgfarm79.my.site.com). <br>-To **find the Domain Name**, follow these steps: </br>-Search for Domain in Quick Find. </br>-Copy the name ending with .my.site.com (e.g., epicorgfarm79.my.site.com). </br>**To Add Trusted Sites in Digital Experience:** </br>-Click on All Sites under Digital Experience. </br>-Click on Builder for your site (e.g., Autofolio). </br>-Click on Security & Privacy. </br>-Click on the Add Trusted Sites button. </br>-Name it ‘TrustedSite1’. </br>-Add the copied Domain URL And Click on **Publish**.</br> **Configure CORS Settings:** </br>-In Quick Find, type CORS. </br>-Click on New </br>-In Origin URL Pattern, type: (https://DOMAINNAME.my.site.com.) </br>-Replace DOMAINNAME with your actual org Domain Name. </br>-Click save. </br>-Click on New. </br>- Paste this into Origin URL Pattern:  (https://*.develop.vf.force.com)</br>Click Save</br>-Click on New And Paste this into **Origin URL Pattern:** (https://*.live-preview.salesforce-experience.com.)</br>-Click Save.</br>-Click on New. Paste this into Origin URL Pattern: (https://*.my.site.com.) And Click Save. </br>**Steps to Publish Embedded Service:**</br>-Search for Domain in Quick Find. Copy the domain name ending with .my.site.com (e.g., epicorgfarm79.my.site.com). </br>-Click on Setup</br>-Search for Embedded Service. </br>-Click on **Embedded Service Deployment**.</br>-Click on **ESA Web Deployment.**</br>-Click on Publish and wait for the confirmation message. </br></br> **Note:** After Successfully publishing the ESA EWS deployment go to In Setup Search for Embedded Service Deployments Click on ESA_Web_Deployment In the Card Code Snippet Click on Install Code Snippet and add Below Values mentioned in the Image in the LeadFlyoutConfig  Custom metadata Open LeadFlyoutConfig Custom metadata, Click on Manage LeadFlyoutConfig, Click On New to Create new Custom Metadata record. </br></br>-Add Label à Lead Flyout Configuration **LeadFlyoutConfig Name Will auto Populate** </br>-Bootstrap Link à Boostrap Link ; Refer Image </br>-ESA Deployment Link à ESA Deployment Link ;Refer Image </br>-Org Id à Organization Id ;Refer Image </br>-Srct Url à Scrt Id ;Refer Image |  ![Create Trusted URLS1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Create%20Trusted%20URLS1.png)![Create Trusted URLS2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Create%20Trusted%20URLS2.png)![Create Trusted URLS3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Create%20Trusted%20URLS3.png)| 

### 16. Create CORS (10 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create CORS |- In the Quick Find\>Type CORS</br>- Click on New\>In Origin URL Pattern\>Type ‘https://DOMAINNAME.my.site.com’ </br>- Replace DOMAINNAME with actual org Domain Name.</br></br> **To find the Domain name please follow the following steps:**</br></br>- search for Domain in Quick find → Please add https://DOMAIN from the below path</br>- Click on Save  |![Create CORS – Repeated the step1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Create%20CORS%20%E2%80%93%20Repeated%20the%20step1.png)![Create CORS – Repeated the step2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Create%20CORS%20%E2%80%93%20Repeated%20the%20step2.png)|

### 17. Assign Contact, Vehicle and Opportunity Record Page as Org Default (15 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Assign Contact Record Page as Org Default. |- Click on Setup</br>- Click on Object Manager</br>- Click on Contact</br>-  Click on Lightning Record Page</br>-  Click on Contact_Record_Page1</br>- Click on Edit \-\> Click on Activation \-\> Click on ‘Assign Org Default’ \-\> Click on Save. </br></br>-Repeat above steps for Vehicle_Record_Page1 on Vehicle object. </br>-Repeat above steps for Opportunity_Record_Page on opportunity object. </br>-Create a new workspace and name it Auto folio.</br>-Create New semantics for the 4 Dashboards.    |  ![Assign Contact, Vehicle and Opportunity Record Page as Org Default1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Assign%20Contact%2C%20Vehicle%20and%20Opportunity%20Record%20Page%20as%20Org%20Default1.png)![Assign Contact, Vehicle and Opportunity Record Page as Org Default2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Assign%20Contact%2C%20Vehicle%20and%20Opportunity%20Record%20Page%20as%20Org%20Default2.png)![Assign Contact, Vehicle and Opportunity Record Page as Org Default3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Assign%20Contact%2C%20Vehicle%20and%20Opportunity%20Record%20Page%20as%20Org%20Default3.png)![Assign Contact, Vehicle and Opportunity Record Page as Org Default4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Assign%20Contact%2C%20Vehicle%20and%20Opportunity%20Record%20Page%20as%20Org%20Default4.png)![Assign Contact, Vehicle and Opportunity Record Page as Org Default5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Assign%20Contact%2C%20Vehicle%20and%20Opportunity%20Record%20Page%20as%20Org%20Default5.png)|

### 18. Create a New Version of Omni-Channel Flow (10 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create a New Version of Omni-Channel Flow  |- Click on Setup</br>- Search for flow on Quick Button</br>- Click on Flow</br>- Click on the Flow</br>- Click on **Route To ASA** </br>- Deactivate the flow and click on the **Route To ESA** at the end</br>- Remove the Service channel and add it back (Same component)</br>- Go to the Fallback Queue🡪 Remove the Messaging Queue and add it back (Same Queue)</br>- Save as new version and activate the flow by clicking on the **Activate** button. </br>-Click on setup, search for agent </br>-Click on ‘Agentforce Service Agent’ </br>-Check under the connection tab “Route To ASA” is added or not. If not added repeat the above steps  | ![Create a New Version of Omni-Channel Flow1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Create%20a%20New%20Version%20of%20Omni-Channel%20Flow1.png)![Create a New Version of Omni-Channel Flow2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Create%20a%20New%20Version%20of%20Omni-Channel%20Flow2.png)![Create a New Version of Omni-Channel Flow3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Create%20a%20New%20Version%20of%20Omni-Channel%20Flow3.png)![Create a New Version of Omni-Channel Flow4](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Create%20a%20New%20Version%20of%20Omni-Channel%20Flow4.png) |


### 19. Add External Id into Contact as well snowflake after Self Registration contact creation (20 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
**Scenario 1: When Existing Ext Id value present in snowflake and user want to use it**
|Add External Id into Contact as well snowflake after Self Registration contact creation |-Go to App launcher>> Search for Data Explorer >> Select object type as data model>> Select Survey Response </br>-Now Result will show under Submitter column>> copy any of any of the value(eg: 48291735) </br>-Go to contact tab>> open recently created record via self registration form paste the value in EXT Id field.</br>-click on save</br>-Wait for 10 to 15 min so that data stream will refresh then refresh the page then ask the question to copilot.</br> **Scenario 2: When new Ext Id mentioned in contact , so new snowflake record need to create** </br>-Go to contact tab>> open recently created record via self registration form And Enter new EXT Id field value And click on save</br>-Same Ext id need to present in snow flake : Download the below file, use the same format to create data entries, under Response_Submitter__c column you can mention the Ext Id field new value from Contact object. [Snowflake data file](https://statics.teams.cdn.office.net/evergreen-assets/safelinks/1/atp-safelinks.html?url=https%3A%2F%2Finfosystechnologies-my.sharepoint.com%2F%3Ax%3A%2Fg%2Fpersonal%2Fsreeram_v01_ad_infosys_com%2FEZxoswyXBY5MlMlbd06UCFgBA3r8d-znvoXpCsnnIQR3kA%3Femail%3Dsnehal.salve01%2540infosys.com%26wdOrigin%3DTEAMS-MAGLEV.p2p_ns.rwc%26wdExp%3DTEAMS-TREATMENT%26wdhostclicktime%3D1743764137679%26web%3D1&locale=en-us&dest=https%3A%2F%2Fteams.microsoft.com%2Fapi%2Fmt%2Fpart%2Fapac-02%2Fbeta%2Fatpsafelinks%2Fgeturlreputationsitev2%2F&pc=6mxxgiHqn5vFNzsJ49cbVOCy1cwIWqGNW19a3A5O3dxCTHgQzQ0HIwMoGae63N5PcXQTCfy5qZ4nN9TpwSqHxIHARArUCqVOs1RYNTHrkBdKvf%252f5JnZRoREKjOReGS4vZ8dBid7oTFH0p%252b%252feojMHzx%252bxF90iCfJSbDxrpHYJCjJqRoIMOOWbzu4wuh2upaIR304oOwMCrd9oWeQkR%252flP2NVqZKPgqJCiaHhrr2tfwDm8k%252b3o9PynByaMCefP03tvUp9AyZOCbRfzzwwFpFDC9ybNXCWzYMwhbKhoHmgNNyAB7n8RUPKK66uysAteT3sd6uRvRQIYNuOv%252f8xgsQQCu16f2CoCc%252bUscuisB9HVfndpiG7HPUFzGWGc1mzjZmx%252f8jSVPzOi2hcdBvbckZuGYpP7P9pOIe%252fi%252bsaDd6I9ncNF1Zdfdwuk6uxVnBVfKzYTwpuNjSh30gK45Hb%252fL6xwVtJJGYirDvK4zaTA0Lr5enOnGxkTtyM8PFvh%252bpBPN%252b%252fcFSy%252b87bvAecLS84DGrLTn92vskDbcHghkuk5%252fngazkRQn1%252fEkVc2SR5%252fCzsWTnwk9PCdI5BvaObGiU8wajAh3E7H3oo4XyVIRGvnVYRQWqI65dhgnKQFUFKfMXgJOIgBbgcOuep3uuKdDwo2d2r1n1jN7qK6n5%252fk%252boCD%252fc8mzMMmvdxIiQNvzJ6wQ6qt53OQgeuMsrQjrUaFd0NemweLYtcyJzue1IyGFuIPPqkso5pYqMEjjlfH7FWVZua5zCQ%252bLi%252fJYoh3qraDl3INGJiQsNlObnq2O0MjGPHWyR4ElN%252b8Z8QYwQm5rvh8T4LdUTR%252bqc2HtG4bOMGKkzpAjpHBNT%252fONl1uzu%252fK4W0auPmV7LoBdUAAgvkAG1MLNa9lWaYEJDWmEOKcGk5wqsQWElvPJgR269EZt5Dk0KNWGfGcCZhWDfCZ95APTSFeVVlpo48jHBUCdGmkbeMOEp6gVNh%252fAJaHVqtw2DmdSGolnqveK%252fx4GfjR8aRSCujx979N9Ly9NhdLOOhr7wX0UcqsxB6DOGu7VGDWs%252f04%252bhFbWWOziGqPiTxYsfH3NF3HpRAvsmk%252fqjq2nJZzTCF2%252fEbr0QyUEbFpk58Fk73DUDdLVGQiZDVXaeHqzQXiNLKyqv5fCGgGxjvNjl1uVBgZ8RBwb2d%252bjMrUDiEDRzX7%252f4X1GNOKU5c%252f5MXzAQPv4ULgwFIkcwUPQPuT8bgqUjggCEUSvkfL1CGD5C%252bWqKqMGgReqVugYK5MJs06tTwYmWCTdw4phDn4BmUX7Qk%252f%252fgO7dG%252bn5VQqjcq8C05XDv4xvvjdWZL9%252b7R11jI6x7C7kf6p0WyhuzPV57h8lRr8xCJp5QsMo5iqNZ2y5wnorh0q9e%252f4X4ntxUakKP1l425a57GBqymKj%252fHX%3B%20expires%3DSat%2C%2005%20Apr%202025%2006%3A22%3A10%20GMT%3B%20path%3D%2F%3B%20SameSite%3DNone%3B%20secure%3B%20httponly&wau=https%3A%2F%2FAPC01.safelinks.protection.outlook.com%2FGetUrlReputation&si=undefined%3B1743675503279%3B19%3A4d6eb542-b0b7-41d5-a449-3f580e45842c_8d2d1e57-78a0-4125-87ef-e815e6b324f3%40unq.gbl.spaces&sd=%7BconvId%3A%2019%3A4d6eb542-b0b7-41d5-a449-3f580e45842c_8d2d1e57-78a0-4125-87ef-e815e6b324f3%40unq.gbl.spaces%2C%20messageId%3A%201743675503279%7D&ce=prod&cv=49%2F25030201010&ssid=a7b8e959-be73-42b8-8409-3d99e7242a63&ring=general&clickparams=eyJBcHBOYW1lIjoiVGVhbXMtRGVza3RvcCIsIkFwcFZlcnNpb24iOiI0OS8yNTAzMDIwMTAxMCIsIkhhc0ZlZGVyYXRlZFVzZXIiOmZhbHNlfQ==&bg=%23f0f0f0&fg=%23242424&fg2=%239092c1) </br>Go to Snowflake>> under table THIRD_PARTY_SURVEY ,upload the file Wait for 15 to 20 min to refresh the data stream named as Third Party Survey. </br>-Go to App launcher>> Search for Data Explorer >> Select object type as data model>> Select Survey Response>> Result will pop up , verify your new data entry </br>-At the end you will refresh the contact page and ask your copilot scenario. </br></br>**Note: Before asking any questions to agentforce and copilot please wait 15 to 30 min for all data stream to be refresh so that you will see the data under contact 360, vehicle 360.** </br>**2. You can only create 26 self register users.** |    |

### 20. Create warranty contract document for vehicle record created via Self Registration form and upload into S3  (10 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Create warranty contract document for vehicle record created via Self Registration form and upload into S3 |-Go to Contact>> Open the recently created record via self registration form>> </br>-Go to Related tab>> go to asset>> Open the record>> click on Vehicle field value </br>-It will redirect to vehicle record>> Go to details>> Copy the VIN </br>-Download below file , you can replace the details as per your requirement such as VIN ,warranty start date, end date but make sure your VIN should be correct.[Warranty Contract](https://statics.teams.cdn.office.net/evergreen-assets/safelinks/1/atp-safelinks.html) </br>- Create a PDF and upload into amazon S3. </br>**Note: Before asking any questions to agentforce and copilot please wait 15 to 30 min for all data stream to be refresh so that you will see the data under contact 360, vehicle 360.**</br>**2. You can only create 26 self register users.**|      |

### 21. To enable real time for the new contact on Self Registration (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|To enable real time for the new contact on Self Registration |-Go to App launcher>> Go to Data Cloud>> Go to Identity Resolution  </br>-Click on Guest Profile>>click on Run Ruleset button((once Status Succeeded then process with next step )  </br>-Go to App launcher>> Enter Data Graphs>>Click on it  </br>-Scroll to right of Automotive Real Time data graph>> click on arrow >> click on update status and wait for Status Active  </br>- Scroll to right of Web Engagement RT Profile  data graph>> click on arrow >> click on update status and wait for Status Active  </br>Go to Experience site>> login with newly created user from self registration form </br>Click on product tab>>select any product </br>-Go back to salesforce org and open Contact Record page to see the Real Time Product Details. |      |

### 22. Publish Calculated Insights After Self Registration (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Publish Calculated Insights After Self Registration |- Go to App launcher>> Go to Data cloud>> Go to Calculated Insights>> open Customer Satisfaction Score >> click on publish now. </br>-Go to Calculated Insights>> open Customer Lifetime Value >> click on publish now.  |    |

### 23. Connected App Configuration (20 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Connected App Configuration |-In the Top Right, Click on the Profile Icon then Click on the Name of the profile(for e.g OrgFarm Epic), then click on User Details, after you land on User Detail Page, click Edit </br>-Change the Email Address Of Orgfram Epic User to your Email Id </br>-Wait for 5-10 minutes till your Email is Verified  </br>-Go to Setup, search App Manager, Click on App Manager Then, search for ‘GuestUserCometD’ Connected App, scroll to the Right, click on drop-down arrow button, click on View, once you are on Connected App Page, click on ‘Manage Consumer Details’ </br>-Copy the Consumer Key and Consumer Secret and Keep it in Notepad, we will be using them in the steps below. </br>-Perform the below script from anonymous window to get the Secret key and then store in Secret_Key__mdt -->Secret_Key__c Field **‘String secretKey = EncodingUtil.base64Encode(Crypto.generateAesKey(256)); System.debug('Generated Key: ' + secretKey);’** Metadata record name must be Label=HMAC_Secret, Client_Id__c = Consumer Key Client_Secret__c= Consumer Secret </br></br>-Search for the connected app again **‘GuestUserCometD’** </br>-From Setup Go to the connected app again ‘GuestUserCometD’ Scroll to the Right, click on drop-down arrow button, click on View, once you are on Connected App Page, click on ‘Manage’, Scroll down to **‘Client Credentials Flow’ and Select Admin User for E.g( Org Farm Epic),** and Save  </br></br>-Go to Auth Provider Search for ‘GuestUserAuth’ Click on Edit and Paste the Consumer Secret and Consumer key that you have in your notepad, also If you are performing this in Sandbox change the Authorization Endpoint as [](https://test.salesforce.com/services/oauth2/authorize) and Authorization Token[](https://test.salesforce.com/services/oauth2/token ), if Performing in Production add the Authorization Endpoint as [](https://login.salesforce.com/services/oauth2/authorize) and Authorization Token[]( https://login.salesforce.com/services/oauth2/token ).</br>-Save the Auth Provider, from the same Auth Provider Scroll down to Salesforce Configuration Section, Copy the Callback URL  and Paste It in Notepad. </br>Go To Setup , Search App manager, Search for ‘GuestUserCometD’, Scroll to right Click on dropdown arrow and view, once you are in connected app, Click on Edit  Paste the callback URL you copied inThe Callback URL Field and Save the App </br>-Go to Setup Search for Named Credentials </br>-Search for GuestCometD And Click on Edit </br>-Update the URL to current org domain URL (Go to setup>>search>>MyDomain ) </br>-Save the Named Credentials and you will Get authenticated </br>-If you get an Error Wait for 10 minutes and Save the Named Credentials again. </br></br>-**Connected App Configuration 2** </br>-Go to Setup, search App Manager, Click on App Manager Then, search for ‘Data Cloud API’ Connected App Click on Manage Consumer Details </br>-Copy the Consumer Key, Consumer Secret and Keep it in Notepad, we will be using them in below steps. </br>-Go to Setup, search for Auth. Provider Auth Search for ‘Data_Cloud_Auth ‘Click on Edit and Paste the Consumer Secret and Consumer key that you have in your notepad, If you are performing this in Sandbox change the Authorization Endpoint as https://test.salesforce.com/services/oauth2/authorize and Authorization Token [](https://test.salesforce.com/services/oauth2/token ) </br>-if Performing in Production add the Authorization Endpoint as https://login.salesforce.com/services/oauth2/authorize and Authorization Token [](https://login.salesforce.com/services/oauth2/token) </br>-Save the Auth Provider, from the same Auth Provider Scroll down to Salesforce Configuration Section, Copy the Callback URL  and Paste It in Notepad. </br>-Go To Setup , Search App manager, Search for Data Cloud API, Scroll to right Click on dropdown arrow and view, once you are in connected app, Click on Edit  Paste the callback URL you copied inThe Callback URL Field and Save the App.   |     |

### 24. Named Credentials (10 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Named Credentials|-Search for Named Credentials </br>-In Named Credentials search for **‘DataCloudNew’** </br>-click on edit</br>-Update the URL to current org domain URL (Go to setup>>search>>MyDomain ) </br>-Save the Named Credentials and you will Get authenticated.</br>-If you get an Error Wait for 10 minutes and Save the Named Credentials again. |  ![Named Credentials1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Named%20Credentials1.png)![Named Credentials2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Named%20Credentials2.png)![Named Credentials3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Named%20Credentials3.png)|

### 25. Enable Oauth and OpenID Connect Settings (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Save the Named Credentials and you will Get authenticated |-Go to Setup </br>- Search for Enable OAuth and OpenId Connect Settings </br>-Enable **Allow OAuth Username-Password Flows and Allow OAuth User-Agent Flows** | ![Enable Oauth and OpenID Connect Settings1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Enable%20Oauth%20and%20OpenID%20Connect%20Settings1.png)|

### 26. Assign AutoFolio Guest Buyer Profile. (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Assign AutoFolio Guest Buyer Profile |-Click on App Launcher on the left side.  </br>- Search Commerce and click on it.  </br>-Select Store name as “AutoFolio” if not selected on the left side </br>-Click on settings on left side and expand it </br>-Click on “Buyer Access” tab on the menu. </br>-Scroll down under Enable Guest Access and Click on AutoFolio guest buyer profile And click on related tab. </br>-click on Assign buyer group and select **AutoFolio buyer group**. |   ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Assign%20AutoFolio%20Guest%20Buyer%20Profile.1.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Assign%20AutoFolio%20Guest%20Buyer%20Profile.2.png) |

### 27. Assign AutoFolio Buyer Group (15 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Assign AutoFolio Buyer Group |-Select Store name as “AutoFolio” if not selected on the left side  </br>- Click on settings on left side and expand it .  </br>-Click on “Buyer Access” tab on the menu. </br>-Click on settings on left side and expand it </br>-Under store access go to buyer group section and click on AutoFolio Buyer group. </br>-Go to related tab and click on assign on buyer group member.   </br>-select **TMZ Dealership and AutoFolio Guest Buyer Profile** and save. </br>**Enable Product tab on exp site After login(Excluding self registration user and apart from John Smith and Guest user) Follow below steps:** </br>-Go to setup>>user>>open user>> click on permission set assignment>>click on edit permission >>select Buyer from Available permission set and click on Add>>click on save </br>-Go to Contact's associated account record and click on as enable as buyer button>> click on Enable </br>-Go to Commerce Store AutoFolio>>Click on settings on left side and expand it >>Click on “Buyer Access” tab on the menu. </br>-Under store access go to buyer group section and click on AutoFolio Buyer group.  </br>-Go to related tab and click on assign from buyer group member and Select Contact's associated account  and save. | ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Assign%20AutoFolio%20Buyer%20Group1.png) ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Assign%20AutoFolio%20Buyer%20Group2.png)    |

### 28.Assign Buyer Group For Self Registration (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- | 
|Assign Buyer Group For Self Registration |-Scroll down to self-registration section </br>-Select Profile as ‘Autofolio community user’ </br>-Account record type as ‘Business Type’ </br>-Permission group set ‘Commerce_shopper’ </br>-Default buyer as ‘Autofolio Buyer Group’ </br>-Click Save|   <img width="239" alt="Assign Buyer Group For Self Registration1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Assign%20Buyer%20Group%20For%20Self%20Registration1.png">|

### 29.Configure Segment (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Configure Segment|-Go to data cloud </br>-Search for Segments And Click on hyperlink of each segment one by one </br>-click on save</br>-The segment count should be greater than 0. </br>-click on done</br>-Click on the Publish now button. |  ![Segment](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Finish%20Configuration%20Image/Segment.png) |

### 30.If Strikethrough price is not populating on UI for any of the products then perform below steps (10 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|If Strikethrough price is not populating on UI for any of the products then perform below steps|-Go to App launcher>> Enter Commerce and click on it>>Select AutoFolio >>  </br>-click on the product where strikethrough price is not present on UI (eg: Electra Model 3.2 - 2025)>> Scroll down </br>-Click on Go to Global product Record>> Once you landed on Product record page then click on Related tab </br>-Search for Pricebook>> click on edit button of Standard Pricebook (do not change any values)>> click on save.</br>-Go back to Store again>> on the left hand side >> click on Website Design>>Select product from dropdown>> click on publish button </br>- Once its successfully published then>> Go back to Store again>> on the left hand side >> Scroll down >> Expand Setting </br>-click on search >>click on update button>> Select full update>> then click on Update button. </br>-Refresh the page after 10 to 15 min and see Automatic update status mark as completed or not , if not then wait to complete it.</br>-Go back to Site url>>hard refresh it >> click on product tab>>see the price is coming or not </br>-if price is still not coming then>> Go to setup>> enter all sites under quick find box>> click on All sites </br>- Click on Builder for AutoFolio Site, click on publish button>> wait for 10 to 15 min for successful publishing the site</br>- Go back to Site url>> hard refresh it >>click on product tab>> see the price is coming or not. |    |
| |-**To proceed for testing kindly change below fields manually**</br>-We are using John Smith contact for testing purpose whose email id ends with dataclouddemo.com And Address, Email </br>-phone number, please add phone extension as well don't add plus sign please see eg(eg: 19045737373, 1 is here as usa phone number extension), |  |

### 31.Experience Site Product UI Configuration (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Experience Site Product UI Configuration |-Go to App Launcher>>Enter All Sites and click on it. </br>-For  Autofolio site click on builder </br>-click on preview>>click product>>click on back to builder again </br>-search for product images then click on it( result grid) </br>-Under Grid layout there is Number of Columns on Desktop – Select More Column Spacing – Select None Row Spacing- Select None.</br>-Publish the Site  |   |

### 32.Experience Site Product Price as Display 1 Price Configuration (15 min)
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

### 1. Create Ingestion API in Data Cloud.  (10 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Create Ingestion API in Data Cloud |  ![MuleSoft configuration For Real-Time Telematics Data1](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data1.png)|

### 2. Upload the schema file(used ‘Order’ in the yaml file format. (10 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Upload the schema file(used ‘Order’ in the yaml file format |  ![MuleSoft configuration For Real-Time Telematics Data2](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data2.png)|

### 3. Create a Data Stream for Ingestion API with Selected Schema Object that going to use. (10 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| |-Create a Data Stream for Ingestion API with Selected Schema Object that going to use. |  ![MuleSoft configuration For Real-Time Telematics Data3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data3.png)|

### 4. Configure the mapping with Primary key. (10 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Configure the mapping with Primary key. |   ![MuleSoft configuration For Real-Time Telematics Data5](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data5.png)![MuleSoft configuration For Real-Time Telematics Data6](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data6.png)![MuleSoft configuration For Real-Time Telematics Data8](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data8.png)![MuleSoft configuration For Real-Time Telematics Data9](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data9.png)| 

### 5. Configure the Mule with Salesforce Streaming Insert Object connector. (5 min) 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Configure the Mule with Salesforce Streaming Insert Object connector. |  | 

### 6. Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API. (30 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API. |-The integration starts with Scheduler component configured to trigger the flow every 30,000 milliseconds.</br>-The first Transform message generates random values for all the telematics fields.</br>-Using second Transform message prepare the payload structure required by Salesforce Data Cloud Ingestion API.</br>-Create a New Connected App for securely integrating MuleSoft with Salesforce Data Cloud via APIs using OAuth2.0 below are the details for connected app: </br>-Go to Setup and Search App Manager and Select App Manager. </br>-Provide details of Connected App name, Contact Email and enable OAuth details as follows: Callback URL: https://login.salesforce.com (depend on org, if prod then its login.salesforce.com and if Sandbox then its test.salesforce.com) Require Secret for Web Server Flow: Enable Require Secret for Refresh Token Flow: Enable Enable Client Credentials Flow: Enable</br>-Please give the Profile level of access to connected App for System Administrative profile. </br>-Go to Setup and open OAuth and OpenID Connect Settings and enable the toggle for Allow OAuth Username-Password Flows </br>-Use the Salesforce Streaming Insert Object connector – below is the configuration details: Connection between Salesforce and Mule based on Username, Password, Client Id and Client Secret. </br>-Source API Name: Ingestion API Name </br>-Object: Selected Object name (Order).  |  ![MuleSoft configuration For Real-Time Telematics Data10](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data10.png)![MuleSoft configuration For Real-Time Telematics Data11](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data11.png) ![MuleSoft configuration For Real-Time Telematics Data13](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data13.png) ![MuleSoft configuration For Real-Time Telematics Data14]([https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/8fc9d123-1586-455c-af9c-e71395348fcf](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data14.png))<img width="468" alt="MuleSoft configuration For Real-Time Telematics Data15" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data15.png"><img width="468" alt="MuleSoft configuration For Real-Time Telematics Data16" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data16.png"><img width="468" alt="MuleSoft configuration For Real-Time Telematics Data17" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data17.png">![MuleSoft configuration For Real-Time Telematics Data18](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data18.png)![MuleSoft configuration For Real-Time Telematics Data19](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data%20Images/MuleSoft%20configuration%20For%20Real-Time%20Telematics%20Data19.png)|
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

### 1. Create Ingestion API in Data Cloud. (10 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Create Ingestion API in Data Cloud |  <img width="468" alt="MuleSoft configuration For Vehicle Issues1" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues1.png">|

### 2. Upload the schema file(used ‘vehicle issue’ in the yaml file format.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Upload the schema file(used ‘Order’ in the yaml file format |  <img width="409" alt="MuleSoft configuration For Vehicle Issues2" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues2.png">![MuleSoft configuration For Vehicle Issues3](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues3.png)|

### 3. Create a Data Stream for Ingestion API with Selected Schema Object that going to use.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| |-Create a Data Stream for Ingestion API with Selected Schema Object that going to use. |   <img width="468" alt="MuleSoft configuration For Vehicle Issues4" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues4.png"><img width="468" alt="MuleSoft configuration For Vehicle Issues5" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues5.png">|

### 4. Configure the mapping with Primary key. 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Configure the mapping with Primary key. | <img width="468" alt="MuleSoft configuration For Vehicle Issues6" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues6.png">| 

### 5. Configure the Mule with Salesforce Streaming Insert Object connector. 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Configure the Mule with Salesforce Streaming Insert Object connector. |    | 

### 6. Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API. (30 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API. |-The integration starts with Scheduler component configured to trigger the flow every 30,000 milliseconds.</br>-First - Using HTTP request connector we are hitting nhsta.gov API to get the details to get the generic vehicle issue details.</br>-Second – For Specific ODI store the response and prepare the Payload using Transform Message. </br>-Third –Prepare the new payload Data that is going to use for Salesforce only those ODI numbers.</br>-Fourth – Prepare new payload as per the Salesforce standard format. </br>-Fifth – Using Data Cloud Streaming Insert Object  connector inserting the Data from Mule to Salesforce </br>-Create a New Connected App for securely integrating MuleSoft with Salesforce Data Cloud via APIs using OAuth2.0 below are the details for connected app:</br>-Go to Setup and Search App Manager and Select App Manager.</br>-Provide details of Connected App name, Contact Email and enable OAuth details as follows: Callback URL: https://login.salesforce.com (depend on org, if prod then its login.salesforce.com and if Sandbox then its test.salesforce.com **Require Secret for Web Server Flow:** **Enable. Require Secret for Refresh Token Flow:** Enable.  **Enable Client Credentials Flow:** Enable.</br>-Please give the Profile level of access to connected App for System Administrative profile. </br>-Click on Manage after creating connected app. </br>-Go to Setup and open OAuth and OpenID Connect Settings and enable the toggle for Allow OAuth Username-Password Flows.</br>-Use the Salesforce Streaming Insert Object connector – below is the configuration details:Connection between Salesforce and Mule based on Username, Password, Client Id and Client Secret.</br>-Source API Name: Ingestion API Name </br>-Object: Selected Object name (Order).| ![MuleSoft configuration For Vehicle Issues9](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues9.png)  <img width="468" alt="MuleSoft configuration For Vehicle Issues10" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues10.png"> <img width="468" alt="MuleSoft configuration For Vehicle Issues11" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues11.png"> <img width="468" alt="MuleSoft configuration For Vehicle Issues12" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues12.png"> ![MuleSoft configuration For Vehicle Issues13](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues13.png) ![MuleSoft configuration For Vehicle Issues14](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues14.png)<img width="340" alt="MuleSoft configuration For Vehicle Issues15" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues15.png"> <img width="356" alt="MuleSoft configuration For Vehicle Issues16" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues16.png"> <img width="404" alt="MuleSoft configuration For Vehicle Issues17" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues17.png"> <img width="380" alt="MuleSoft configuration For Vehicle Issues18" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues18.png"> <img width="390" alt="MuleSoft configuration For Vehicle Issues19" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues19.png"> <img width="367" alt="MuleSoft configuration For Vehicle Issues20" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/MuleSoft%20configuration%20For%20Vehicle%20Issues%20Images/MuleSoft%20configuration%20For%20Vehicle%20Issues/MuleSoft%20configuration%20For%20Vehicle%20Issues20.png"><img width="392" alt="MuleSoft configuration For Vehicle Issues21" src="https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/006e5958-5c33-4b08-8f3e-bce5e96e23c8">|
|**Mulesoft Flow Diagram**|**1**-First is the HTTP Request connector and below is the details Click on plus icon right side of configuration and fill the configuration details as per the given below snap and add the Path (URL) and in the body put “payload”</br>URL: /complaints/complaintsByVehicle?make=acura&model=rdx&modelYear=2012Method: “GET”</br></br>**2.** Second Use the Transform Message and below is the script need to use.</br>%dw 2.0</br>output application/json</br>var requiredODINumbers = [11124195 ,11074082, 10818539, 10459314] // List of required ODI numbers</br>{</br>filteredResults: payload.results filter (item) -> requiredODINumbers contains item.odiNumber</br>}</br></br>**3**. Third Use the Transform Message and below is the script need to use</br></br>%dw 2.0</br>output application/json</br>{</br>transformedResults: payload.filteredResults map (item) -> {</br>odi_number: (item.odiNumber) as String,</br>odinumber: (item.odiNumber) as String,</br>crash: item.crash as String,</br>fire: item.fire as String,</br>numberOfInjuries: item.numberOfInjuries as String,</br>numberOfDeaths: item.numberOfDeaths as String,</br>dateOfIncident: item.dateOfIncident as String,</br>dateComplaintFiled: item.dateComplaintFiled as String ,</br>components: item.components as String,</br>summary: item.summary as String,</br>timestamp: now() as DateTime,</br>}</br>}</br></br>**4.** Fourth Use the Transform Message and below is the script need to use</br>%dw 2.0</br>output application/json</br>{</br>"data":payload.transformedResults</br>}</br></br>5. Fifth use Saelsforce Streaming insert objects connector and click on plus button and select “OAuth Username Password” in the connection and then fill the all the required details and then click on Test connection.Source API Name: Vehicle_Issues_DetailsObject API Name: vehicle_issuesBody: payload|   |

 **Below is the configuration XML file so directly creating new project in Mule Anypoint and copy paste the configuration XML then update the credentials for Salesforce Data Cloud (Streaming Insert Object) connector. (Don’t forget to add the Data Cloud Insert Object Connector from Exchange)**
 </details>
<details><summary>
  
## 9. Configure Salesforce Tableau Next
</summary>

## Table of Contents

[1. Enable tableau next	](#1-enable-tableau-next)

[2. Create WorkSpace ](#2-create-workspace)

[3. Create semantic model	](#3-Create-semantic-model)

[4. Create Visualization](#4-create-visualization)

[5. Create Dashboard	](#5-Create-dashboard)

**Note:**To support the Automotive app, you can either create a new Salesforce Org or use an existing one, provided it includes the following features and licenses:
**Important Note:** Existing Trailheads playgrounds cannot be used Enable/Execute below steps in the Org.

### 1. Enable Tableau Next Beta (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Enable Tableau Next Beta |-From Setup, enter ‘Tableau Next’ in the Quick Find box. </br>-Enable Tableau Next Beta. | ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Enable%20Tableau.png)   |

### 2. Create Workspace  (5 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Workspace|-Click on App Launcher And Search Tableau Next </br>-Click on New WorkSpace.</br>-Enter Name "AutoFolio" click on create. |  ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Create%20Workspace.png)  |

### 3. Create Semantic Models  (30 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Semantic Models : Asset Contact|-Go to workspace Autofolio </br>-⦁	Click on Add > New Semantic Model and Name it Asset Contact </br>-Add the Data Objects: Asset Contact Participant. | ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Create%20Semantic%20Models%20Asset%20Contact.png)   |
|Add Logical View In Asset Contact|-	Click on + aside Logical view tab</br>-	Add Vehicle, Asset Contact Participant and Vehicle </br>-Telemetric DMOs and join them all using Common IDS. | ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Add%20Logical%20View%20in%20Asset%20Contact.png)  |
|Create Semantic Model: Lead Intelligence Model|⦁	Go to workspace Autofolio</br>⦁	Click on Add > New Semantic Model and Name it Lead Intelligence Model</br>⦁	Add the Data Objects: Lead Line Item| ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Create%20Semantic%20Model%20Lead%20Intelligence%20Model.png)  |
|Create Logical Views in Lead Intelligence Model|-	Click on + aside Logical view tab</br>⦁	Add Lead, LeadLine Item and Product DMOs and join them all using Common ID.| ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Create%20Logical%20Views%20in%20Lead%20Intelligence%20Model.png)   |
|Create Semantic Models : Vehicle Model|-⦁	Go to workspace Autofolio</br>⦁	Click on Add > New Semantic Model and Name it Asset Contact</br>⦁	Add the Data Objects: Asset Contact Participant.| ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Create%20Semantic%20Models%20Vehicle%20Model.png) |
|Add Logical View in Vehicle Model|-⦁	Click on + aside Logical view tab.</br>Add Vehicle, Vehicle Definition and Vehicle Telemetric DMOs and join them all using Common IDS.</br>**Similarly Make the remaining Semantic Models Work Order & Work Type, Logical View**| ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Add%20Logical%20View%20in%20Vehicle%20Model.png) |

### 4. Create Visualization (15 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Visualization|-Go to autofolio</br> ⦁	Click on Add > Visualization</br>⦁	Select the Semantic Models </br>⦁	Add the appropriate Fields in Rows and Columns. | ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Create%20Visualizations.png)   |
|Visualization VTD|-⦁	Add below fields on Rows: Vehicle Name, Contact,Latitute, Longitute, Gear Box Type, Fuel Level, RPM, Tire size, Front Rim Size, Engine Temp, Brake Pad Wear, Oil Pressure, Brake Pad Wear, Air Bag, Battery SOC, Battery Voltage.| ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Visualization%20VTD.png)  |
|Add Viz: Vehicle Time Line Events|-⦁	Add below fields on Rows: Odometer Reading, Timestamp,Fule Level, Airbag Status, ABS Status.|  [](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Add%20Viz%20Vehicle%20Time%20Line%20Events.png) !|

### 5. Create Dashboard (15 min)
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Dashboard|-Go to autofolio</br> ⦁	Click on Add > Dashboard> New Dashboard |    |
|Dashboard 1: Vehicle Portfolio Insights|-⦁	Add below fields on Rows: Vehicle Name, Contact,Latitute, Longitute, Gear Box Type, Fuel Level, RPM, Tire size, Front Rim Size, Engine Temp, Brake Pad Wear, Oil Pressure, Brake Pad Wear, Air Bag, Battery SOC, Battery Voltage.| ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Dashboard%201%20Vehicle%20Portfolio%20Insights.png)|
|Add Viz: Vehicle Time Line Events|⦁	Add below fields on Rows: Odometer Reading, Timestamp,Fule Level, Airbag Status, ABS Status.|  ![](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/blob/master/Automotive%20Tableau%20Next%20Images/Add%20Viz%20Vehicle%20Time%20Line%20Event.png) |

