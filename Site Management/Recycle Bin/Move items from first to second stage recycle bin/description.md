Powershell script which moves all items from a site's recycle bin to a second stage recycle bin:

<img src="../Move items from first to second stage recycle bin/Capture49.PNG">

After the move the items can still be restored using 'Restore Selection' button.

The script requires SharePoint Online SDK installed:

https://www.microsoft.com/en-us/download/details.aspx?id=42038

Before running the script, open the file and enter correct paths to the SDK and your tenant data:

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="t@trial098.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://trial098.sharepoint.com/sites/teamsitewithlibraries"
``` 
