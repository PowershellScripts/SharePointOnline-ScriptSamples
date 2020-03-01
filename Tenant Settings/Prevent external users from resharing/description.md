Short PowerShell script to prevent external users from sharing files, folders, and sites that they don’t own.

It is one of the 3 additional settings:

- Limit external sharing using domains 
- Prevent external users from sharing files, folders, and sites that they don’t own 
- External users must accept sharing invitations using the same account that the invitations were sent to

<img src="../Prevent external users from resharing/additionalSettings.png">

The script is related to and more described in a Wiki article [SharePoint Online Sharing settings with CSOM](https://social.technet.microsoft.com/wiki/contents/articles/39365.sharepoint-online-sharing-settings-with-csom).

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
$PreventExternalUsersFromResharing=$true
``` 

-  Run the script
 

