Powershell script to set the email for access requests.  The setting is available from SharePoint Online User Interface at:

**Site Settings** > **Site Permissions** > **Access Requests Settings**

<img src="../Set RequestAccessEmail for all subsites in one site collection/AccessRequestEmail.PNG">

The script requires the following libraries. Please confirm that the files are in the same location on your PC.

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.Runtime.dll"
``` 
You need to enter your credentials and the email address to be set:

```PowerShell
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="admin@tenante.onmicrosoft.com" 
$Url="https://tenante.sharepoint.com/sites/powie64" 
 
Set-SPOWebRequestAccessEmail -Username $username -Url $Url -password $AdminPassword -RequestAccessEmail "SecondAdmin@tenante.onmicrosoft.com"
```

