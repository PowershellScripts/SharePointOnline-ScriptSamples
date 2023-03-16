Short Powershell script that hides Sync button in OneDrive for Business for all users.

 

The script uses CSOM and requires SharePoint Online SDK.

 

This button will be removed with the script:

<img src="../Hide OneDrive for Business Sync button using PS and CSOM/ODBAccessRequests.222ENG.PNG">

### How to use?
- Download and open the ```.ps1``` file.
- Add correct SharePoint Online SDK libraries:

```PowerShell
#Paths to SDK 
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "C:\Program Files\SharePoint Client Components\16.0\Assemblies\Microsoft.Online.SharePoint.Client.Tenant.dll" 
``` 

- Enter the correct url, the setting for the sync button, and admin login. You will be additionally prompted for the password. Do not enter it in the file: 

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="arleta@TENANT.onmicrosoft.com" 
$Url="https://TENANT-admin.sharepoint.com" 
$HideSyncButtonOnODB=$true   #Whether the sync button should be hidden
``` 
 
-  Run the script
 
