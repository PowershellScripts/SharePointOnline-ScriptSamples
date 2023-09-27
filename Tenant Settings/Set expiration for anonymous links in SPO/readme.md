After you have enabled anonymous links for SharePoint Online tenant, you can set a requirement that the links must expire after a certain number of days. The script sets the number of days using CSOM and Powershell.

It requires SharePoint Online SDK.

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
$HowManyDaysToExpire=17   #Choose 0 if the links should not expire
``` 

- Run the script
 
