Short Powershell script that enables or disables a setting to send emails to OneDrive for Business owners when someone further shares the ODB owner's content with external users.

It uses CSOM and requires SharePoint Online SDK. The script is part of and more explained in a Technet Wiki article:

[OneDrive for Business notification settings with Powershell](https://social.technet.microsoft.com/wiki/contents/articles/39385.onedrive-for-business-notifications-with-powershell.aspx)

## How to use?

- Download and open the .ps1 file.
- Add correct libraries:

```PowerShell
#Paths to SDK 
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "C:\Program Files\SharePoint Client Components\16.0\Assemblies\Microsoft.Online.SharePoint.Client.Tenant.dll" 
``` 

- ter the correct url and admin login: 

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="admin@TENANT.onmicrosoft.com" 
$Url="https://TENANT-admin.sharepoint.com" 
$NotifyOwnersWhenItemsReshare=$true   #Whether ODB owner should be notified the content is reshared with external users
``` 

- Run the script
