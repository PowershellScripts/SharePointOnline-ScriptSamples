Short Powershell script to modify the Sharing Link Type setting in SharePoint Admin Center via DefaultSharingLinkType property of Tenant object

The setting can be changed also via SharePoint Admin Center:

<img src="../Set default link type for SharePoint Online tenant sharing settings/LinkType.PNG">

The script is related to and more described in a Wiki article [SharePoint Online Sharing settings with CSOM](https://social.technet.microsoft.com/wiki/contents/articles/39365.sharepoint-online-sharing-settings-with-csom).

## How to use?

- Download and open the ```.ps1``` file.
- Add correct libraries:
 
```PowerShell
#Paths to SDK  
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.Online.SharePoint.Client.Tenant.dll"    
``` 
 
- Enter the correct url and admin login: 
 
```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="admin@TENANT.onmicrosoft.com" 
$Url="https://TENANT-admin.sharepoint.com" 
$SharingLinkType="None"  #None, Direct, Internal, AnonymousAccess
``` 

-  Run the script
