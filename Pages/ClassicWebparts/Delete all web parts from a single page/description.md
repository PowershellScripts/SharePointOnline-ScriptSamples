Powershell script to delete ALL web parts from a single page. If you need to delete only one web part you can find its ID using [GetAllWebParts script](https://gallery.technet.microsoft.com/office/Get-all-web-parts-and-449f1d47) and remove it using [DeleteSingleWebPart script.](https://gallery.technet.microsoft.com/Delete-single-web-part-6404fced)

 

The script requires the following SharePoint Online SDK libraries. Please confirm that the files are in the same location on your PC.

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.Runtime.dll" 
``` 
 

You need to enter your credentials and the page relative url:

 

```PowerShell
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="t@trial567.onmicrosoft.com" 
$Url="https://trial567.sharepoint.com/sites/powie64" 
 
 
Remove-SPOWebParts -Username $username -Url $Url -password $AdminPassword -pageUrl "/sites/powie64/SitePages/pgie.aspx"
``` 
 <img src="../Delete all web parts from a single page/RemoveAllWebpartsResult.PNG">

