Powershell script that enables versioning for SharePoint Online list or library.

 

 

It requires installed  SharePoint Online SDK 

You have to enter the library/list data before running the script:

 

```PowerShell
# Insert the credentials and the name of the site and list 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="trial@trialtrial125.onmicrosoft.com" 
$Url="https://trialtrial125.sharepoint.com/sites/teamsitewithlibraries" 
$ListTitle="Not-Empty-Document-Library" 
$Versioning=$true 
``` 
 

 

Full description of the script is available in the article  Versioning and SharePoint: the Powershell perspective

 

 

## Related scripts
 

Enable minor versions for all SharePoint Online lists using Powershell

Enable versioning for all SharePoint Online lists using Powershell

Powershell Module for Managing SPO Lists

SharePoint Module for lists, items and files

Disable versioning for all lists in SharePoint Online tenant (C#)

Enable versioning for all lists in SharePoint Online tenant (C#)



 <br/><br/>
<b>Enjoy and please share feedback!</b>