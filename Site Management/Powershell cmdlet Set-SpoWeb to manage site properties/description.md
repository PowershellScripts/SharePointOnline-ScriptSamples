SharePoint Online cmdlet

---
## Set-SPOWeb

<h3>Parameters</h3>

The cmdlet is using the following parameters:

- [string]$Username

The string specifies admin of the site

- [string]$Url

Specifies the url of the parent site

- [string]$AdminPassword,       

Admin's password

- [string]$Description=""

Optional. 

- [string]$EnableMinimalDownload=""

Optional.

- [string]$QuickLaunchEnabled=""

Optional

- [string]$Title=""

Optional.

- [string]$TreeViewEnabled=""

Optional.

<h3>Examples</h3>

- Set the site description and title

Set-SPOWeb -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/psweb2/psweb2 -AdminPassword Pass -Description "none" -Title "Sososos23"Description set to  noneTitle set to  Sososos23PS

 

- Enable tree view for the site

Set-SPOWeb -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/psweb2/psweb2 -AdminPassword Pass -TreeViewEnabled $true

<img src="../Powershell cmdlet Set-SpoWeb to manage site properties/setspoweb.png">

<h3>Requirements</h3>

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

```PowerShell
# Paths to SDK. Please verify location on your computer.    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"     
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
``` 

### Let me know about your experience in the Q&A section!

