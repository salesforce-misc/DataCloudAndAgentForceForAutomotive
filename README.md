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
  | Enable Commerce Cloud | - From Setup, enter ‘Commerce’ in the Quick Find box.</br>- Select ‘Settings’ under ‘Commerce’.</br>- Turn on ‘Enable Commerce’. |  |
  | Enable Automotive | - From Setup, enter ‘Automotive’ in the Quick Find box.</br>- Select Automotive Settings.</br>- Turn on ‘Automotive’. </br>-Select 'Service Console for Automotive’.</br>-Turn on ‘Service Console for Automotive.’ |![Electra model 3 2 - 2025](https://git.soma.salesforce.com/gdevadoss/DataCloudAutomotiveDemo/assets/60563/393f884e-48e8-481c-b93b-0e722630099a)  |
  |Enabled System Permissions for automotive objects. |-Go to setup.</br>-Search Permissions set and click on it. </br>-Find out "Data Cloud Salesforce Connector" permission and click on it. </br>-Click on system permission. </br>-Find the "Use Automotive Foundation" Permissions name and check checkbox Enabled it. </br>-Find the "Use Vehicle and Asset Finance Features" permission name and check checkbox  enabled it. </br>-Click on Save.  ||
  | Enable Vehicle and Asset Finance Settings  | - From Setup, in the Quick Find box, enter Vehicle and Asset, and then select Vehicle and Asset Finance Settings. </br>- Enable Vehicle and Asset Finance.</br>- Make sure you’ve enabled Automotive in your org before you enable this feature. </br>- Before enabling Vehicle and Asset Finance Additional Components, enable Timeline. Click on URL. </br>- Turn on the Timeline to enable. </br>-Navigate to Vehicle and Asset Finance and enable Vehicle and Asset Finance Additional Components  |   |
  | Enable Partner Lead Management  | - Go to setup .</br>- Search Partner Lead Management and click on it. </br>- click on toggle enabled.  |  |
  | Enable Interest Tags | - Go to setup .</br>- Search Interest tags .</br>-Enable the toggle. |  |

### 3. Install Pre-Deployment Package

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Install package | - Click on this Package Installation [Link ](https://login.salesforce.com/packaging/installPackage.apexp?p0=04tPa000000W5fh)</br>- Sign-in to the Org with your credentials.</br>- Choose Install for Admins Only option</br>- Choose “Rename conflicting components in package” and click the Install button.</br>- Wait until installation is completed, you will receive a confirmation on logged in user’s email |  |
  | Verify Package installation | - Click Setup</br>- Search for package</br>- Search for 'Automotive Pre-Deployment Package' is installed  |  |
  
   | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Site Name and URL |-From Setup, enter ‘Digital Experiences’ and select ‘All Sites’ under ‘Digital Experiences’. </br>- After selecting the template, enter a site name and URL.Name the site ‘AutoFolio’ and ensure the URL ends with /AutoFolio.</br>-Click Create. Your site will be created in Preview status. |  |
  |Activate Site |-From Setup, enter ‘Digital Experiences’ and select ‘All Sites’ under ‘Digital Experiences’. </br>-Click Workspaces next to AutoFolio. Select Administration, then Emails.</br>-Under ‘Email Tabs,’ uncheck ‘Send welcome email’ and click Save. </br>-In Settings, click Activate and confirm by clicking OK. </br>-Your site will now be live and fully set up. | |
|Enable Data Cloud Setup Home |-Go to Setup → Quick box search Data Cloud Setup Home.</br>-Enable/Activate it. </br>-Note: We need to perform this step only when the below step integration data cloud button is disabled.| |
  | Enable Data Cloud on Experience Site | - Go to Setup → Digital Experiences → All Sites.</br>- Click Builder for ‘Autofolio’.</br>- Click Settings → Integrations.</br>- Click Add to Site for Data Cloud.</br>- Enable “Share site data with Data Cloud” and click Save.</br>- Once enabled, a green box will appear</br>- Click Publish in the top-right corner |  |
  | Verify Data Stream  | - Go to App Launcher → Data Cloud → Data Stream.</br>- Change List View to All Data Streams.</br>- Search for Experience\_Cloud.</br>- 6 total Data Streams should appear |  |
  | Create a Record on Custom Metadata | - Go to Setup \-\> Search for Metadata type \-\> Click on ‘Install Package Settings Enabled’ \-\>   Click on **Manage Install Package Settings Enabled** \-\>Click on ‘New’ \-\> Give Label as  **Package Settings Enabled** and **Check Checkbox of Installation Settings Enabled Field**  |  |


  ### 4. Setup the Salesforce Org

  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Assign data cloud Permissions for Standard and Custom Object  | - Click on App Launcher, search for Automotive and click on **Automotive Setup** App</br>- Click on the “**Assign Permissions for Standard Objects**” button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further.  |  |
  | Modify the Data Cloud Admin Permission Set | - Open the Setup Menu and click Setup</br>- In the Quick Find, search for ‘Permission Sets’ and click ‘Permission Sets’</br>- Click the ‘Data Cloud Admin’ permission set</br>- In the Apps section, click ‘Data Cloud Data Space Management’</br>- In the Data Spaces panel, click Edit.</br>- Check the ‘Enabled’ checkbox for the default data space and click Save</br>- Click OK in the confirmation dialog |  |
  | Create a Connection to Amazon S3 | ***NOTE:*** If you do not have an existing Amazon S3 instance, [register for the free tier](https://aws.amazon.com/free/), and then follow instructions in [How to Use the Amazon S3 Storage Connector in Data Cloud](https://developer.salesforce.com/blogs/2023/10/how-to-use-the-amazon-s3-storage-connector-in-data-cloud) to create dedicated user with required permissions for this demo.</br></br>If you already have an S3 instance, no need to sign up for a new one.</br></br>Before proceeding further, make a note of your [programmatic credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-creds.html#access-keys-and-secret-access-keys) (Access Key ID and Secret Access Key) that can be used to access the account</br></br>- Navigate to Data Cloud Setup</br>- In the menu, under EXTERNAL INTEGRATIONS, click on Other Connections</br>- Click **New**, choose **Amazon** **S3** as the source and click **Next**</br>- Name the connection **“InfosysAWSBucket”**</br>- Fill in the credentials and save. ***DO NOT CHANGE THE CONNECTION NAME*** </br>- Refer to [this](https://developer.salesforce.com/docs/data/data-cloud-int/guide/c360-a-set-up-s3-connection.html) document for more details on how to setup the connection |  |
  | Create a connection to snowflake | **NOTE:** If you do not have access to an existing Snowflake instance, please get access before proceeding further</br></br>- Follow instructions in [this article](https://developer.salesforce.com/blogs/2024/08/zero-copy-data-federation-with-snowflake-and-salesforce-data-cloud) to create a Warehouse and Integration User in Snowflake, generate a public and private key pair, and configure Salesforce Data Cloud to connect to Snowflake.</br>- Name the connection ***“SnowflakeDataFederatio”*** |  |
  | Create a connection for Mulesoft Ingestion API | - Go to **Setup** \-\> In the **Quick Find** box, type ***static***, then select ***Static Resources***</br>- In the index across the top, click the letter ***M***</br>- Click on **‘Mulesoft\_Ingestion\_API\_Scheme’**</br>- Click on **‘View File’** hyperlink. The **‘Real_Time_Telemetric_Data.txt’** And and **‘Vehicle_Issues_Details’** is downloaded to your computer.</br>- Change the file extension from ***.txt*** to ***.yaml***</br>- Go to Data Cloud Setup, click on Ingestion API → Click New</br>- Provide the Connector Name as ’Mulesoft Ingestion API’</br>- Upload **Real_Time_Telemetric_Data.yaml**  file which you have downloaded from above steps and Upload file to scheme and click on Save. |  |
  | Turn On Einstein Bots | - Navigate to Setup</br>- Search and Select ‘Einstein Bots’</br>- Turn on Einstein Bots |  |
  | Deactivate Standard Einstein CoPilot Bots | - Click on Setup</br>- Search 'Agent' and click ‘Agents’</br>- Click on 'Einstein Copilot'</br>- Click on 'Open Builder'</br>- Click on 'Deactivate'</br>- Click on ‘Ok’ |  |
  |Activate Salesforce CRM |-Go to Setup. </br>-Click on Data Cloud Setup.</br>-In quick find search for Salesforce CRM.</br>-Click on Salesforce CRM.</br>-Go to the Standard Connection section and activate it. | |

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
  | Install Automotive Base Package | - Click on this Package Installation [Link ](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t4W000002V5Bf)</br>- Sign-in to the Org with your credentials.</br>- Choose Install for Admins Only option</br>- Choose “Rename conflicting components in package” and click the Install button.</br>- Wait until installation is completed, you will receive a confirmation on logged in user’s email |  |
  | Verify Package installation | - Click Setup</br>- Search for package</br>- Search for 'AutomotiveDataKitPackage' is installed  |  |
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

[10. Create ML Model	](#10-Create-ML-Model)

[11. Create segment from data kit](#11-Create-segment-from-data-kit)

[12. Create Activation	](#11-Create-Activation)


### 1. Install the Data Kit to add Data Cloud components to the Org
The Data Kit is installed as a part of the Package installation. Once the Data is available in
the org, follow the steps below to create data streams.

 | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Data Streams from Data Bundle | - While logged into the environment where you installed the data kit</br>- Go to Data Cloud app and the Data Streams tab.</br>- Click New to create a Data Stream</br>- Select Salesforce CRM and click Next.</br>- Under Custom Data Bundles,select the SalesforceCRM01. </br>-Select your Salesforce Org and Click Next. </br>-Select the data space as ‘Default’, review the fields in your data stream, and click Next.</br>-Review details and click “Deploy”.</br>-Repeat the same step for second Data Bundles, select the SalesforceCRM02 . |  |
  | Create Website_Mobile_apps Data Stream from Data Kit |- Click on Data Stream</br>- Click on New</br>- Select ‘Installed Data Kits Package’</br>- Select ‘AutomotiveDataKitPackage’ Data Kits</br>- Select checkbox under ‘Websites_Mobile_Apps’ click on ‘Next’</br> -Select Connector type =‘website’ & connector name Experience_Cloud_Event_Connector’.</br> - Click on Deploy| |
  | Create a Data Stream for Amazon S3 from Data Kit |- Click on Data Stream Click on New</br>- Select Installed Data Kits & Packages Click on Next</br>- Select AutomotiveDataKitPackage Data Kits<br> - Select Amazon_S3_Bundle</br>- Select Connection as InfosysAWSbucket</br>- Select the data space as ‘Default’, review the fields in your data stream,and click Next</br>-Review details and click Deploy  | |

 ### 2. Create Data Stream for Snowflake
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Data Stream for Snowflake from data kit | - Click on Data Stream Click on New </br>- Select Installed Data Kits & Package Click on Next</br>-Select Snowflake Bundle</br>- Select connection as ‘SnowflakeDataFederation’ .</br>- Select Database as ‘INFOSYS_DEMO’.</br>-Select ‘PUBLIC’ on schema> On Available Object Select ‘THIRD_PARTY_SURVEY ’. |  |

  ### 3. Create Ingestion API for Mule Data Streams from Data Kit
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Ingestion API for Mule Data Streams from | - Click on Data Stream </br> - Click on New.</br>- Select Installed Data Kits & Package. </br>- Select ‘AutomotiveDataKit’ Data Kits. </br>- Click on ‘Ingestion’ Bundle.</br>- Click on Next.</br> -Select Connection as ‘Mulesoft Ingestion API’ </br>- Click Next </br> -  Click Deploy| |

  ### 4. Create Automotive_FAQ DLO Creation for Unstructured Data 
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Automotive FAQ.  | - Click on Data Lake Object Click on New</br>-Click on Create from Data Kits, Click on Next</br>-Select Automotive_FAQ, select connection. Click on Next.</br>-Click on Deploy.| |

  ### 5. Create Identity Resolution Ruleset from Data Kit
  | Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  | -Go to Data Cloud app</br> - Click on the Identity Resolutions tab </br> - Click New</br> - Select Installed from Data Kit</b>- Choose "AutomotiveDataKitPackage"</br>-Choose "AutomotiveDataKitPackage" </br>- Click on Next</br>- Click on Save |  |

### 6. Create Calculated Insights
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  Create Calculated Insights|- Go to Data Cloud app </br>- Click on Calculated Insights tab</br>- Click New</br>- Select "Create from a Data Kit" and click  Next</br>- Select ‘Customer Lifetime Value’</br>- Click on Next </br>- Click on ‘Check Syntex’</br>- Click on ‘Activate’</br>- Click Activate</br>- Select Schedule as "Scheduled for 24 hrs" </br>- Click on ‘Enable’</br>- Repeat the steps for the following metrics: ‘Customer Satisfaction Score’, 'Customer Interest from survey data’ |  |

  ### 7. Create Data Graph
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |  Create Data Graph |- Click on Data Graph Tab</br>- Click on New</br>- Select Create from Data Kits</br>-Click on AutomotiveDatakitPackage</br>- Select Web Engagement RT </br>- Select Realtime Profile. | |
  |   |- Select primary Data model object as “Unified Individual real”. |  |
  |   |- Click on Individual and go to the right side where the error is showing and uncheck the check box.</br>- Now click on Save & Build. |   |


### 8. Create Data Cloud Copy Field Enrichment
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  | Create Data Cloud Copy Field Enrichment |- Go to Object Manager.</br>- Search for Contact.</br>-Click on Contact</br>- Click on Data cloud Copy Field.</br>- Click on New.</br>- Select data space as ‘default’</br>- Select Data Cloud Object as ‘Customer_Lifetime_Value__cio’  </br>- Click on Next </br>- Select Field As ‘amt’ |  |
  |  |- Give Label as ‘Customer Lifetime Value’</br>- Click on ‘Next.</br>-On contact Select "Lifetime Value"</br>- Save and Start Sync. | |
  |Data Cloud copy field For Customer satisfaction score|- Go to Object Manager.</br>- Search for Contact.</br>Click on Contact</br>- Click on Data cloud Copy Field.</br>- Click on New.</br>- Select data space as ‘default’</br>- Select Data Cloud Object as ‘Customer_Satisfaction_Score__cio’  </br>- Click on Next </br>- Select Field As ‘CSS’ |  |
  |  |- Give Label as ‘Customer Satisfaction Score’</br>- Click on ‘Next.</br>On contact Select "Customer Satisfaction Score"</br>- Save and Start Sync. | |

### 9. Create activation targets
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create Marketing Cloud Engagement |-Go to Data Cloud app </br>-Go to setup and select data cloud setup</br>-Search for Marketing Cloud Engagement and enable it.</br>-Finally, you need to check in Select Business Units to Activate option and click on Manage button.Check inside available business units and move those values to selected business unit.</br>-Click on Save. | |
  |Create Activation Targets |-Go to Data Cloud app.</br>-Click on the Activation Targets tab </br>-Click on MCDO.</br>-Need to provide name as Marketing for activation target.</br>-And selecting data space as default.</br>-Click on Next. |  |

### 10. Create ML Model
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create Einstein Studio |-Click on App launcher and search for Einstein Studio.</br>-Click on Add Predictive Model button </br>-Select create a model from scratch </br>-click on next</br>-Select data space as Default and select Opportunity DMO for data option </br>-click on next</br>-For training select Filter Set of Records option </br>-Specify the condition to filter the records and select field as Opportunity Stage and select operator as IN and select values like Proposal/Quote, Negotiation, Discovery.</br>-Click on Apply Changes</br>-For Set goal option select field name as Probability and Select Maximize option </br>-Click on Next </br>-For Prepare Variable select disable Autopilot and select the follow fields like Test Driver Data, Close Date, Number of Past Interaction, Engagement Level, Test Driver Status, Opportunity Stage, Customer Response to Past Interactions and Recency of Interactions.</br>-Click on next</br>-For select Algorithm option Enable Automatic Selection. </br>-Click on next</br>-Review all the things and Click on Save and Train and specify ML Model name as Likelihood to Purchase.</br>-Go back to previous window </br>-Click on Likelihood to Purchase </br>-Click on Integration Tab </br>-Activate the Likelihood to Purchase </br>-Click On New Prediction Job </br>-Select data space as Default. </br>-Select Data Model as Opportunity_Home. </br>-Map all the fields </br>-Click on next</br>-Select Streaming Option </br>-click on next</br>-Review all the things here </br>-click on next </br>-And provide name as Predict Opportunity Jobs. </br>-Click on create ans go to integration tab</br>-Finally, Activate first Predict Opportunity Jobs.|   |

### 11. Create Segment From Data Kit
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create Segment |-Go to Data Cloud app and Click on the Segment tab.</br>-Click on New</br>-Select "Installed from Data Kit”</br>-Choose "AutomotiveDataKitPackage" </br>-Click on Next</br>-Select Segment as Individual and provide Segment name as Drivers visited the dealership.</br>-Select Rapid Publish</br>-Select Publish Schedule to 4 hrs and select the start and end date. </br>-Click on Save</br>-Click on the Publish now button. </br>-Needs to select the following segment from data kit</br>-Drivers who drove into the dealers. </br>-High Purchase Probability Customers v8 </br>-UpcomingWarrantyEnddate </br>-**Note:** After inserting the sample data or loading data from tool in the org. Go to Opportunity_Home data stream and click on Refresh Now button and wait for 15mins till you see Success message in Last run status. Then once again go to segment and publish it manually once.|  |

### 11. Create Activation
| Step | Action and Details | Images |
  | ----- | ----- | ----- |
  |Create Activation|-Go to Data Cloud app </br>-Click on the Activations tab</br>-Click on new</br>-Select Segment and continue </br>-By default, space is default </br>-Need to select the High Purchase Probability Customer V8 segment and activation target as marketing </br>-click on continue</br>-Select Email and Click on continue</br>-Click on add attributes </br>-And from individual select the following attributes First Name and Last Name </br>-Click on Save and provide name as High Purchase Probability Activations. |  |
  |Create Activations for Recall Customer |-Click on data cloud app</br>-Click on the Activations tab </br>-Click on new</br>-Select Segment and continue </br>-By default, space is default </br>-Need to select the Upcoming Warranty End Date segment and activation target as marketing</br>-click on continue</br>-select email and sms </br>-click on continue</br>-click on add attribute</br>-And from individual select the Following attributes First Name, Last Name, Country</br>-Click on Save and provide name as Upcoming Warranty End Date.|   |
</details>

<details><summary>

  ## 4. Commerce Cloud Configuration And Sample Data Creation
</summary>

## Table of Contents

[1. Verify Organization Wide Address Exists or not	](#1-verify-organization-wide-address)

[2. Install Agent and Experience Site Package	](#2-install-agent-and-experience-site-package)

[3. Create Sample Data 	](#3-create-sample-data)

[4. Create Commerce Data 	](#3-create-commerce-data)

[5. Search Update	](#4-turnon-search-update)

[6. Upload CMS Images into the Store And verify workspace	](#5-upload-cms-images-into-the-store-and-verify-workspace)

[7. Add CMS Product Image	](#6-add-image-to-a-product-in-cms)

[8. Enable as buyer group	](#6-Enable-as-buyer-group)

[9. Enable as guest access	](#6-Enable-as-guest-access)

[10. Create community user and assign buyer account to buyer group	](#6-create-community-user-and-assign-buyer-account-to-buyer-group)

[11. Create order and orderItem Data	](#6-create-order-and-orderitem-data)

### 1. Verify Organization Wide Address
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Verify Organization-Wide Address Exists or not |- Go to Setup \-\> Search for Organization-Wide Address \-\> Click on Organization-Wide Addresses</br>-  Verify if there is an organization-wide address with name ‘Default Email’ is created and verified or not like below.</br>- If there is none, then please create an organization-wide address by following below steps</br>- Click on **Add** button \-\> On the Display Name Add **‘Default Email’.** On the Email Address \<Add your email address\> Select ‘Default No-Reply Address’ on Purpose field \-\> click check box **‘allow all profiles to use this from address’**   |  |


### 2. Install Agent and Experience Site Package
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Install Agent & Exp Site Package | **Option 1**</br>- Install VSCode [Download](https://code.visualstudio.com/download) </br>- Setup CLI a. Install the Salesforce CLI  https://developer.salesforce.com/tools/salesforcecli or check that your installed CLI version is greater than 2.56.7 by running sf \-v in a terminal.</br>- If you need to update the Salesforce CLI, either run sf update or npm install \--global @salesforce/cli depending on how you installed the CLI.</br>- Install Extension</br>- Open VSCode \> Go To\> Extensions-\>Salesforce Extension Pack\>Install</br>- StepUp Base metadata deployment</br>- Create Project with Manifest</br>- Open VSCode\> Type Ctrl+Shift+P\>Select SFDX: Create Project with Manifest</br>- Select Standard</br>- Enter Project Name</br>- Click Enter </br>- Select the folder where you want to create a project then select ‘Create Project’.</br></br> Download the zip folder from the link below:</br>- [Download](https://github.com/dc-hospitali-demo/DCHospitalityDemo/tree/main)</br>-  Unzip the folder and copy the ‘main’ folder</br>- Go To\>The Project folder created as part of ‘Create Project with        manifest’ \>Go To\> force-app folder\>Paste the folder</br>- Authorize an Org</br>- Type Ctrl+Shift+P\>Select SFDX:Authorize an Org</br>- Select Project Default</br>- Enter the Org alias</br>- Authorize the Org</br>- Deploy the base app metadata.</br>- terminal sf deploy start \-d force-app </br></br>  **Option 2: Deploy using Code Builder**</br>-  Download the zip file and unzip locally Download the zip folder from the link below:</br>  [Download](https://github.com/dc-hospitali-demo/DCHospitalityDemo/tree/main)</br>- To Open Code Builder → Login in salesforce and search for Code builder in All tab menu.</br>- Click on Launch button</br>- Expand the force app.</br>- Right Click on Application → Upload → choose the file from the Un Zipped folder application file.</br></br> **Option 3: Using Code Builder by Cloning Repository from GitHub**</br> $${\color{orange}Waiting \space for \space Salesforce \space Github}$$ </br></br> **NOTE:** $${\color{red}Skip \space steps \space 3, \space 4, \space and \space 5 \space if \space you \space wish \space to \space bring \space in \space your \space own \space Product \space data}$$ |  |

### 3. Create Sample Data
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Create Sample Data  | - Click on App Launcher, search for Automotive Setup and click on Automotive Setup app </br>- Click on the **Create Test Data** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. |   |

### 4. Create Commerce Data
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Create Data  | - Click on App Launcher, search for Automotive and click on Automotive App</br>- Click on the **“Create Commerce Data”** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. |   |


### 5. Turn on Search Update
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Search Update |- Click on App Launcher\>\> Select commerce application\>\>Click on Store</br>- Open Autofolio Store</br>- Scroll down to Setting\>\>Expand It\>\> Click on Search</br>- Turn on Automatic Update    |   |


### 6. Upload CMS Images into the Store And Verify Workspace Shared To Site
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Upload CMS Images  |-Download Images for CMS From [download](https://drive.google.com/drive/folders/1u5evLElZJTCQFfo-QGPM3a5rhebczr8H?usp=drive_link) </br>-Click on App Launcher\>\> Select commerce application\>\> Click on Store</br>- Open Autofolio Store</br>- Scroll down to Content Manager</br>- Click on Add workspace</br>-  Enter details such as Name "AutoFolio  Store" and select Enhanced CMS Workspace and click on Next</br>-   AutoFolio Site as Public and click Next</br>- Keep language as it is and click on Finish</br>-  Click on Add and select Content \>\> select images\>\>Click on Create button\>\> click on upload button\>\>Select Image\>\>Image and Title populated\>\>Enter API name (can be the same as file name)\>\> Save it\>\> Click on Publish button\>\> Keep Details as is\>\> Click on Next\>\> Select Publish Now\>\>click on publish now button </br>- Please find the required images here \- Download images   |   |
  |Verify Workspace Shared to Site |-Open Autofolio Store </br>-Scroll down to Content Manager>> Click on Autofolio Store workspace</br>-Click on Gear Icon>> Select Workspace Sharing  </br>-Select All Commerce -Enhanced, AutoFolio Managed Content Space CianuN4G. |  |


### 7. Add Image to a Product in CMS
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
  | Add Image to a Product   |- Click on App Launcher\>\> Select commerce application\>\>Click on Store</br>- Open Autofolio Store </br>- Expand Merchandise\>\> Product\>\> open one by one product</br>- Click on eye icon (it removes Site window) after save button   </br>- Scroll down \>\> click on Go to global product record</br>-  Go to Media\>\> Click on Add image for Product details Image section \>\> Select appropriate image from Autofolio Store CMS Workspace\>\> click on Add button</br>- Repeat Step vi for product List Image  repeat step iii. to vii for rest of the product</br>- Go to store\>\> select Autofolio \>\>Scroll down to Website Design\>\> select product category from dropdown \>\> click on Publish button</br>- Go back to AutoFolio Store\>\>Click on Home\>\> click on Preview the site and see product is getting displayed |   |

### 8. Enable as a Buyer Group
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Enable as a Buyer Group |-Go to App launcher>>Enter Account and click on it>> Open TMZ Dealership account record </br>-click on Enable as Buyer>> click on enable. |  |

### 9. Enable Guest access
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Enable Guest access |-Click on App Launcher>> Select commerce application>> Click on store </br>-Open AutoFolio Store</br>-Scroll down click on Settings>>Click on Store>> Click on Buyer Access </br>-Click on Enable button under Guest Access.|   |

### 10. Create Community User and Assign Buyer Account to Buyer Group
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Create Community User and Assign Buyer Account to Buyer Group |-Click on App Launcher, search for Automotive and click on Automotive Setup App. </br>-Click on the **Create Buyer Group Member Data** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. |  |

### 11. Create Order and OrderItems Data
  | Step  | Action and Details  |  Images |
  | ----- | ----- | ----- |
|Create Order and OrderItems Data |-Click on App Launcher, search for Automotive Setup and click on Automotive Setup app </br>-Click on the **Create Order and OrderItems** button (highlighted in the screenshot below) and wait for a confirmation message before proceeding further. |  |
</details>

<details><summary>

 ## 5. Configure Amazon and Snowflake Connections
</summary>

## Table of Contents

[1. Enable Account as Buyer Account	](#1-enable-account-as-buyer-account)

[2. Setup Data in Amazon S3	](#4-setup-data-in-amazon-s3)

[3. Setup Data in Snowflake	](#5-setup-data-in-snowflake)


### 1. Enable Account as Buyer Account 
| Step | Action and Details  |  Images |
| ----- | ----- | ----- |
| Enable Account as Buyer Account | - Click on Setup </br>- Go to Object Manager.</br>-Click on account.</br>-Click on page Layout</br>-Click on ‘page layout assignment’ </br>-Click on edit assignment. </br>-Select ‘SDO-Account’ Layout under Record type ‘Account’ for System Administration Profile </br>-From Page Layout to Use dropdown Select ‘Account layout’ </br>-Click on save. </br>-Verify that, for ‘System Administrator profile’ for  Record type ‘Account’ Page layout should be ‘Account Layout’ </br>-Go Account Tab -> Search for Account Name ‘TMZ Dealership’ (Test Account created on Prev steps) -> Click on that Record.</br>-On Record Page Click on ‘Enable as Buyer’ Quick Action. |  |

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
</details>

<details><summary>

  ## 6. Finish Configuration
</summary>

## Table of Contents

[1. Refresh Snowflake Data Streams	](#2-refresh-snowflake-data-streams)

[2. Run Identity Resolution Ruleset	](#3-run-identity-resolution-ruleset)

[3. Run Calculated Insights	](#4-run-calculated-insights)

[4. Activate Messaging Setting	](#5-activate-messaging-setting)

[5. Update Einstein Search Retriever	](#6-update-einstein-search-retriever)

[6. Configure Digital Experience.	](#7-configure-digital-experience)

[7. Enable Login Access.	](#8-enable-login-access)

[8. Change the layout of the Login page.	](#9-change-the-layout-of-the-login-page)

[9. Change the layout of the Register page.	](#10-change-the-layout-of-the-register-page)

[10. Change the email Address.	](#11-change-the-email-address)

[11. Run CRM Analytics Recipes	](#12-run-crm-analytics-recipes)

[12. Add Agent User into Agent force Service Agent and Activate	](#13-add-agent-user-into-agent-force-service-agent-and-activate)

[13. Activate Einstein Copilot	](#14-activate-einstein-copilot)

[14. Create Trusted URLS	](#15-create-trusted-urls)

[15. Create CORS	](#16-create-cors)

[16. Assign Contact Record Page as Org Default.](#17-assign-contact-record-page-as-org-default)

[17. Create a New Version of Omni-Channel Flow.](#18-create-a-new-version-of-omni-channel-flow)

[18. Create Tableau Einstein Dashboards.](#18-create-tableau-einstein-dashboards)

### 1. Refresh Snowflake Data Streams
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Refresh Snowflake Data Streams | - Navigate to Data Cloud app and the Data Streams tab </br>- Query for IOT\_Transaction data stream</br>- Using drop down control on the right against the data stream initiate refresh for the IOT\_Transaction data stream</br>- Repeat steps b & c for POS\_Transaction data stream</br>- Once the data stream is refreshed validate the Total Records counts for each Data Stream</br>- IOT\_Transaction \- 8</br>- POS\_Transaction – 75  |  |

### 2. Run Identity Resolution Ruleset
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|   Run Identity Resolution Ruleset | - Navigate to Data Cloud app and the Identity Resolutions tab</br>- Query for Guest Profile ruleset</br>- Click on the Ruleset Name hyperlink to navigate to the ruleset’s record home page</br>- Click Run Ruleset</br>- The Last Job Status will turn to In Progress. Once the job completes successfully, this status will be set as Succeeded.  |  |

### 3. Run Calculated Insights
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  Run Calculated Insights | - Navigate to Data Cloud app and the Calculated Insights tab</br>- Query for Customer Lifetime Value calculated insight</br>- Using drops down control on the right against the data stream initiates refresh for the Guest Stay Metrics calculated insight.</br>- When the Calculated Insight is refreshed successfully, the Last Run Status will show as Success.</br>- Repeat steps b & c for the below Calculated Insights. Ensure all Insights are refreshed successfully.</br>- Customer Interest from Survey Data </br>- Customer Satisfaction Score</br>-   | |

### 4. Activate Messaging Setting
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Activate Messaging Setting | - Navigate to Setup go to messaging setting</br>-  Click on ESA Channel \-\> Click on ‘Activate’</br>- Click on Checkbox then click on Accept.</br>- Go back Messaging setting >> there is  ESA channel and scroll to right >> Click on downward arrow>> click on edit button.</br>- Scroll to downward direction>>check the “Let Customers download their conversation. </br>-Please refer the images for more understanding.  | |

### 5. Update Einstein Search Retriever
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Update Einstein Search Retriever |- Click on **Setup**, in the Quick Find Box, enter Prompt Builder, and then select **Prompt Builder**</br>- Search for the Prompt Template named **Generate FAQ From Automotive Industry ** and click on the hyperlink</br>- Hover the cursor on text the next to ‘Question : ‘, click on Resource à click on Einstein Search à click on 'Automotive_FAQ’ à click on ‘‘Default_Automotive_FAQ’ Retriever</br>- On the right side click on default ‘Default_Automotive_FAQ Retriver click on Search Parameter click on Free Text Click on Question</br>- Hover over cursor on next text on ‘Use this information to answer the question:’, click on Resource à click on Einstein Search à click on Automotive_FAQ Retriver\_V2</br>- Click on Save As New Version click **Activate**.</br>-	Go back to Prompt Builder.</br>- Search for Prompt template names as Return Warranty Info and click on the hyperlink.</br>- Hover the cursor on text the next to ‘Input:VIN with the‘, click on Resource à click on Einstein Search à click on ‘Automotive_Warranty_Info’ click on ‘Default_Automotive_Warranty_Info Retriver.</br>- Below this line ‘You are a Warranty Expert in Autofolio, here are some documents about Warranty Information’ click on Resource à click on Einstein Search à click on ‘Automotive_Warranty_Info’ click on ‘Default_Automotive_Warranty_Info Retriver.</br>- On the right side click on default Automotive_Warranty_Info click on Search Parameter click on Free Text Click on VIN. </br>- Click on Save As New Version click Activate   | |

### 6. Configure Digital Experience
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Configure Digital Experience. |- Click on **Setup**, in the Quick Find Box, enter Digital Experiences, and then select **All Sites**</br> -  Click on builder against the Site ***‘Autofolio’*** </br> - Click on ‘Banner’  in the right-hand panel, under Image Settings, click ‘Clear Image’</br> - Click on ‘Select Image from CMS’ \-\> Click on ‘BackgroundImnageCar’ </br> - Click on ‘Embedded Messaging ‘and update as per screenshot below </br> - Click on ‘Multilevel Navigation Menu ‘, in the right-hand panel under Default Menu select ‘Default Navigation’ |  |

### 7. Enable Login Access
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Enable Login Access. | - Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites</br>- Against the site ‘AutoFolio’, click on Workspaces</br>- Under My Workspaces, click on Administration</br>- Click on Login & Registration menu item</br>- Under Login Page Setup, change Login Page Type to Experience Builder Page</br>- For URL, choose Login</br>- Under Password Pages, change Forgot Password to Experience Builder Page</br>- Choose Forgot Password</br>- Under Registration Page Configuration enable "Allow customers and partners to self-register"</br>- Choose Registration Page Type as Experience Builder Page</br>- Choose Register</br>- Assign users to a profile and account,choose AutoFolio Community User</br>- Assign Permission Set Group as "Commerse_Shopper"  | |

### 8. Change the layout of the Login page
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the layout of the Login page. |- Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites </br>- Against the site ‘AutoFolio’’, click on Builder</br>- From the Page dropdown, search for Login, and then select Login </br>-Remove the site logo and add a Text Box component. Enter the text as "AutoFolio’", make it bold and center</br>- Publish the changes  |  |

### 9. Change the layout of the Register page
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the layout of the Register page. |- Go to Setup, in the Quick Find Box, enter Digital Experiences, and then select All Sites</br>- Against the site ‘AutoFolio’’, click on Builder</br>- From the Page dropdown, search for Register, and then select Register</br>- Remove the site logo and add a Text Box component. Enter the text as "AutoFolio’", make it bold and center</br>- Publish the changes  |  |

### 10. Change the email Address
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Change the email Address. |- Go to Setup \-\> Open All Sites</br>- Click on Workspaces (the configured Sites) \-\> Click Administrator</br>- Click on Emails</br>- Change Sender email to system admin email</br>- Click on save |  |

### 11. Run CRM Analytics Recipes
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Run CRM Analytics Recipes |- Click on App launcher, click on Analytics Studio</br>- Click on Data Manager</br>-  Click on Recipes </br>- Click on ‘Run Now’ On Analytics for Automotive Automotive Analytics RDR’ and ‘Analytics for Automotive Automotive Analytics’ Recipes.</br>- It will take some time to complete. Once It Runs Successfully, status should change to Succeed.   |  |

### 12. Add Agent User into Agent force Service Agent and Activate
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Add Agent User into Agent force Service Agent & Activate |- Click on setup, search for agent</br>- Click on ‘Agentforce Service Agent’</br>- Click on Open Builder</br>-  click on setting</br>- Select Agent User to Service Agent User</br>-   Activate  | |

### 13. Activate Einstein Copilot
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Activate Einstein Copilot |- Click on setup, search for agent</br>- Click on ‘Einstein Copilot’</br>- Click on Open Builder click on Activate  |   |

### 14. Create Trusted URLS
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create Trusted URLS |- In the Quick Find\>Type Trusted URLs</br>- Click on New\>In API Name \>Type ‘TrustedSite2’</br>- In URL\>Type\> https://DOMAINNAME.my.site.co</br>- Replace DOMAINNAME with actual org Domain Name.</br></br> **To find the Domain name please follow the following steps:** </br>- search for Domain in Quick find → Please add https://DOMAIN from the below path</br>- Click on Save</br></br> **Add Trusted URL to Agent Sites** </br>- Click on Setup</br>-  Click on Site \-\> Click on ‘ESW\_ESA\_Web\_Deployment\_1733127495782’</br>- Click on Add Domain</br>- Add DOMAINNAME with actual org Domain Name.</br></br> **To find the Domain name please follow the following steps:** </br>- Search for Domain in Quick find → Please add https://DOMAIN from the below path |  |

### 15. Create CORS
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create CORS |- In the Quick Find\>Type CORS</br>- Click on New\>In Origin URL Pattern\>Type ‘https://DOMAINNAME.my.site.com’ </br>- Replace DOMAINNAME with actual org Domain Name.</br></br> **To find the Domain name please follow the following steps:**</br></br>- search for Domain in Quick find → Please add https://DOMAIN from the below path</br>- Click on Save  |  |

### 16. Assign Contact Record Page as Org Default
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Assign Contact Record Page as Org Default. |- Click on Setup</br>- Click on Object Manager</br>- Click on Contact</br>-  Click on Lightning Record Page</br>-  Click on Contact Record Page</br>-  Click on Edit \-\> Click on Activation \-\> Click on ‘Assign Org Default’ \-\> Click on Save  |   |

### 17. Create a New Version of Omni-Channel Flow
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Create a New Version of Omni-Channel Flow  |- Click on Setup</br>- Search for flow on Quick Button</br>- Click on Flow</br>- Click on the Flow</br>- Click on **Route To ESA** </br>- Deactivate the flow and click on the **Route To ESA** at the end</br>- Remove the Service channel and add it back (Same component)</br>- Go to the Fallback Queue🡪 Remove the Messaging Queue and add it back (Same Queue)</br>- Save as new version and activate the flow by clicking on the **Activate** button.  |  |

### 18. Tableau Einstein Dashboards
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|Tableau Einstein Dashboards | - Create a new workspace and name it Auto folio</br> - Create a new workspace and name it Auto folio.</br> -	Create New semantics for the 4 Dashboards.</br> -	After semantics are created, create Calculated fields.</br> - Build visualization.</br> - Build Dashboards.</br> - Embed the Dashboards by creating Lightning app builder and related tabs.</br> - Go to setup, select Custom Tab, select Lightning page tab and create a new tab.</br> -	Embed the dashboard on Vehicle related tabs and Data cloud Home page.

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
|  |-Create Ingestion API in Data Cloud |    |

### 2. Upload the schema file(used ‘Order’ in the yaml file format.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Upload the schema file(used ‘Order’ in the yaml file format |    |

### 3. Create a Data Stream for Ingestion API with Selected Schema Object that going to use.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| |-Create a Data Stream for Ingestion API with Selected Schema Object that going to use. |    |

### 4. Configure the mapping with Primary key. 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Configure the mapping with Primary key. |    | 

### 5. Configure the Mule with Salesforce Streaming Insert Object connector. 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Configure the Mule with Salesforce Streaming Insert Object connector. |    | 

### 6. Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API. |-The integration starts with Scheduler component configured to trigger the flow every 30,000 milliseconds.</br>-The first Transform message generates random values for all the telematics fields.</br>-Using second Transform message prepare the payload structure required by Salesforce Data Cloud Ingestion API.</br>-Create a New Connected App for securely integrating MuleSoft with Salesforce Data Cloud via APIs using OAuth2.0 below are the details for connected app: </br>-Go to Setup and Search App Manager and Select App Manager. </br>-Provide details of Connected App name, Contact Email and enable OAuth details as follows: Callback URL: https://login.salesforce.com (depend on org, if prod then its login.salesforce.com and if Sandbox then its test.salesforce.com) Require Secret for Web Server Flow: Enable Require Secret for Refresh Token Flow: Enable Enable Client Credentials Flow: Enable</br>-Please give the Profile level of access to connected App for System Administrative profile. </br>-Go to Setup and open OAuth and OpenID Connect Settings and enable the toggle for Allow OAuth Username-Password Flows </br>-Use the Salesforce Streaming Insert Object connector – below is the configuration details: Connection between Salesforce and Mule based on Username, Password, Client Id and Client Secret. </br>-Source API Name: Ingestion API Name </br>-Object: Selected Object name (Order).  |    |

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
|  |-Create Ingestion API in Data Cloud |    |

### 2. Upload the schema file(used ‘vehicle issue’ in the yaml file format.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Upload the schema file(used ‘Order’ in the yaml file format |    |

### 3. Create a Data Stream for Ingestion API with Selected Schema Object that going to use.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| |-Create a Data Stream for Ingestion API with Selected Schema Object that going to use. |    |

### 4. Configure the mapping with Primary key. 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Configure the mapping with Primary key. |    | 

### 5. Configure the Mule with Salesforce Streaming Insert Object connector. 
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
|  |-Configure the Mule with Salesforce Streaming Insert Object connector. |    | 

### 6. Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API.
| Step  | Action and Details  |  Images |
| ----- | ----- | ----- |
| Flow to insert the data form Mule to Salesforce Data Cloud via Ingestion API. |-The integration starts with Scheduler component configured to trigger the flow every 30,000 milliseconds.</br>-First - Using HTTP request connector we are hitting nhsta.gov API to get the details to get the generic vehicle issue details.</br>-Second – For Specific ODI store the response and prepare the Payload using Transform Message. </br>-Third –Prepare the new payload Data that is going to use for Salesforce only those ODI numbers.</br>-Fourth – Prepare new payload as per the Salesforce standard format. </br>-Fifth – Using Data Cloud Streaming Insert Object  connector inserting the Data from Mule to Salesforce </br>-Create a New Connected App for securely integrating MuleSoft with Salesforce Data Cloud via APIs using OAuth2.0 below are the details for connected app:</br>-Go to Setup and Search App Manager and Select App Manager.</br>-Provide details of Connected App name, Contact Email and enable OAuth details as follows: Callback URL: https://login.salesforce.com (depend on org, if prod then its login.salesforce.com and if Sandbox then its test.salesforce.com **Require Secret for Web Server Flow:** **Enable. Require Secret for Refresh Token Flow:** Enable.  **Enable Client Credentials Flow:** Enable.</br>-Please give the Profile level of access to connected App for System Administrative profile. </br>-Click on Manage after creating connected app. </br>-Go to Setup and open OAuth and OpenID Connect Settings and enable the toggle for Allow OAuth Username-Password Flows.</br>-Use the Salesforce Streaming Insert Object connector – below is the configuration details:Connection between Salesforce and Mule based on Username, Password, Client Id and Client Secret.</br>-Source API Name: Ingestion API Name </br>-Object: Selected Object name (Order).|    |

 **Below is the configuration XML file so directly creating new project in Mule Anypoint and copy paste the configuration XML then update the credentials for Salesforce Data Cloud (Streaming Insert Object) connector. (Don’t forget to add the Data Cloud Insert Object Connector from Exchange)**
 </details>
<details><summary>
