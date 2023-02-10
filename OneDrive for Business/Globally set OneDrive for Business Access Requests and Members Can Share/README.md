Short Powershell script that modifies the following settings on every user's OneDrive for Business:



 

On- Users with edit permissions can re-share.

Off- Only OneDrive for Business owner can share. The value of ODBAccessRequestsdefines whether a request to share gets sent to the owner.

Unspecified- Let each OneDrive for Business owner enable or disable re-sharing behavior on their OneDrive.

 

 

The script is part of Technet Wiki article OneDrive for Business sharing settings with Powershell.

## How to use?
Download and open the .ps1 file.
Add correct SharePoint Online SDK libraries:
 

```PowerShell
#Paths to SDK 
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "C:\Program Files\SharePoint Client Components\16.0\Assemblies\Microsoft.Online.SharePoint.Client.Tenant.dll" 
``` Enter the correct url, the setting for the sync button, and admin login. You will be additionally prompted for the password. Do not enter it in the file: 
```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="admin@TENANT.onmicrosoft.com" 
$Url="https://TENANT-admin.sharepoint.com" 
$ODBMembersCanShare="On"  # On, Off, Unspecified 
$ODBAccessRequests="Unspecified" #On, Off, Unspecified 
``` 
 

  Run the script
 

 

 
