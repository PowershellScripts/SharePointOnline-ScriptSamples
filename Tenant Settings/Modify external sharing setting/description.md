Short Powershell script sets the external sharing setting in SharePoint Online and controls how users share content with people outside the organization.

It sets sharing outside the organization using CSOM to Disabled, ExternalUserSharingOnly, ExternalUserAndGuestSharing, or ExistingExternalUserSharingOnly.
It requires SharePoint Online SDK.

The script is part of and more described in a TechNet Wiki [SharePoint Online Sharing settings with CSOM](https://social.technet.microsoft.com/wiki/contents/articles/39365.sharepoint-online-sharing-settings-with-csom.aspx?Sort=MostRecent&PageIndex=1) article.

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
$SharingCapability="Disabled"  # Disabled, ExternalUserSharingOnly, ExternalUserAndGuestSharing, ExistingExternalUserSharingOnly 
```
- Run the script
