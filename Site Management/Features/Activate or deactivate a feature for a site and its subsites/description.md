A simple script for SharePoint Online that activates or de-activates a feature for a site,then finds all its subsites and enables/disables the chosen SharePoint feature for all of them. You need to have the required permissions for the site and known the feature guid. The list of guids can be found [here](http://blogs.msdn.com/b/razi/archive/2013/10/28/listing-all-sharepoint-2013-features-including-name-title-scope-id-and-description.aspx).

Before running the script, verify the paths to [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038):

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

 

 

 

 

### Related scripts

[Activate or deactivate a SPO feature for direct subsites in site collection](https://gallery.technet.microsoft.com/office/Activate-or-deactivate-a-bc6534e9)

[Activate or deactivate a SPO feature for a single site](https://gallery.technet.microsoft.com/office/Activate-or-deactivate-a-9fe2fb34)
