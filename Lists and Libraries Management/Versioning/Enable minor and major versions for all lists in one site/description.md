Powershell script that enables major and minor versions for all SharePoint Online libraries in one site.

Powershell script that enables major and minor versions for all SharePoint Online libraries in one site.

 

 

It requires installed  SharePoint Online SDK 

You have to enter the site data before running the script:

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and the desired setting: $true or $false 
$Username="trial@trialtrial125.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$Url="https://trialtrial125.sharepoint.com/sites/teamsitewithlibraries" 
$Versioning=$true
``` 
Minor versions are avilable for libraries mainly, so trying to enable it in a list will throw an error (behaviour by design)


 

 

Full description of the script is available in the article  Versioning and SharePoint: the Powershell perspective

 

 

## Related scripts
 

Enable versioning for all lists in one site

Enable minor versions for all SharePoint Online lists using Powershell

Enable versioning for all SharePoint Online lists using Powershell

Powershell Module for Managing SPO Lists

SharePoint Module for lists, items and files

Disable versioning for all lists in SharePoint Online tenant (C#)

Enable versioning for all lists in SharePoint Online tenant (C#)




 <br/><br/>
<b>Enjoy and please share feedback!</b>