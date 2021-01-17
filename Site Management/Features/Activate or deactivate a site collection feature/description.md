A simple script for SharePoint Online that activates or de-activates a feature for a site collection. You need to have the required permissions for the site collection and know the feature guid. The list of guids can be found [here](
http://blogs.msdn.com/b/razi/archive/2013/10/28/listing-all-sharepoint-2013-features-including-name-title-scope-id-and-description.aspx).

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

During its execution the script will inform you, when the feature has been changed.

 

### Related scripts

[Activate or deactivate a SPO feature for direct subsites in site collection](https://gallery.technet.microsoft.com/office/Activate-or-deactivate-a-9fe2fb34)

[Activate or deactivate a SPO feature for a single site](https://github.com/PowershellScripts/AllGalleryScriptsSamples/tree/master/Site%20Management/Features/Activate%20or%20deactivate%20a%20SPO%20feature%20for%20a%20single%20site) 

[TechnetGallery](https://gallery.technet.microsoft.com/office/Activate-or-deactivate-a-da769f9d)
