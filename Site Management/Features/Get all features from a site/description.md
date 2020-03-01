A simple script for SharePoint Online to **retrieve all site features activated at a site level** (not site collection).

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

During its execution the script will inform you what features are activated in a given site collection.

### Related scripts

[Activate or deactivate a SPO feature for direct subsites in site collection](https://gallery.technet.microsoft.com/office/Activate-or-deactivate-a-9fe2fb34)

[Activate or deactivate a SPO feature for a single site](https://gallery.technet.microsoft.com/office/Activate-or-deactivate-a-da769f9d)

[Get all features from a site collection](https://gallery.technet.microsoft.com/Get-all-features-from-a-2954b47a)
