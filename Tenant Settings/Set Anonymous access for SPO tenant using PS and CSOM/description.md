After you have enabled anonymous links for SharePoint Online tenant, you can set what access level the links can give: edit or only view. The setting is global for the entire tenant.

The script sets tenant sharing to allow anonymous links, and the allowed access levels for files and folders. 

For folders you can choose between View and Edit.

For files you can choose between

**Edit** - anonymous links will allow to edit documents

**View** - anonymous links will allow only to view documents

**None** - users can decide about the access level on per-document basis  (no global setting)

 

 

The script is related to and more described in a Wiki article [SharePoint Online Sharing settings with CSOM](https://social.technet.microsoft.com/wiki/contents/articles/39365.sharepoint-online-sharing-settings-with-csom).

 It requires SharePoint Online SDK.

## How to use?

- Download and open the .ps1 file.
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
$LinkType="View"  #Edit, View or None 
$FolderLinkType="Edit" # View or Edit 
``` 
- Run the script
 
