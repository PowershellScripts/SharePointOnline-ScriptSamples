A simple script for SharePoint Online that enables a feature in a single SPO site (site collection or a subsite). You need to have the required permissions for the site and known the feature guid. The list of guids can be found [here](http://blogs.msdn.com/b/razi/archive/2013/10/28/listing-all-sharepoint-2013-features-including-name-title-scope-id-and-description.aspx).

Before running the script, verify the paths to SharePoint Online SDK:

```PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 ```
 
Optionally, you can edit these two lines so that the script doesn'task you for credentials at runtime:

```PowerShell
$siteUrl = Read-Host -Prompt "Enter https://tenant.sharepoint.com/sites/mysitecollection” 
$username = Read-Host -Prompt "Enter admin@tenant.onmicrosoft.com"
 ```
 

During its execution the script will inform you, where the features have been changed.

 
### Related scripts:

[Activate or deactivate a feature for a site and its subsites](https://gallery.technet.microsoft.com/office/Activate-or-deactivate-a-bc6534e9)

[Activate or deactivate a SPO feature for direct subsites in site collection](https://gallery.technet.microsoft.com/office/Activate-or-deactivate-a-9fe2fb34)

 

 
