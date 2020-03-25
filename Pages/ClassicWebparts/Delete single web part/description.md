Powershell script to delete SINGLE web part from a SharePoint Online page. If you need to delete all web parts, you can do it using [DeleteAllWebParts script.](https://gallery.technet.microsoft.com/office/Delete-all-web-parts-from-4c7bc264)

 

The script requires the following libraries from [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038). Please confirm that the files are in the same location on your PC.

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.Runtime.dll" 
``` 
 
<br/>
You need to enter your credentials and the page relative url:

 

```PowerShell
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="t@trial567.onmicrosoft.com" 
$Url="https://trial567.sharepoint.com/sites/powie64" 
$webPartID="b2226879-ed87-4139-836d-b52be6e4bf75" 
 
 
Remove-SPOWebParts -Username $username -Url $Url -password $AdminPassword -pageUrl "/sites/powie64/SitePages/pagie.aspx" -webPartID $webPartID
``` 
 

 

Always test behaviour of the scripts on a test site collection before using it in production!
