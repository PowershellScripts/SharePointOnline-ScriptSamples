This script is a temporary solution intended to work together with Retrieve all SharePoint Online profiles and their properties using CSOM.

Using Retrieve all SharePoint Online profiles and their properties using CSOM generate a CSV file with personal sites in the format:

 

Site
/personal/t_trial234_onmicrosoft_com/
/personal/uss100_trial234_onmicrosoft_com/
/personal/t_trial234_onmicrosoft_com/
 

The Column name has to be SITE.

 

Run the script. It will ask you for credentials, feature id, and whether you want to acivate it or de-activate.

 

Before running the script, verify the paths to SharePoint Online SDK:

 

PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
 

Optionally, you can edit these two lines so that the script doesn'task you for credentials at runtime:

 

During its execution the script will inform you, where the features have been changed.

 

 

 

 

Related scripts
 

Activate or deactivate a SPO feature for direct subsites in site collection

Activate or deactivate a SPO feature for a single site

Activate or deactivate a site collection feature 

Get all features from a site collection

Get all features from a site

 

** As a side-effect the script assigns the administrator as a site collection admin to all users. This will be improved in the next version**
