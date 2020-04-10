Powershell script that enables versioning for SharePoint Online list or library.

 

 

It requires installed  [SharePoint Online SDK ](http://www.microsoft.com/en-us/download/details.aspx?id=42038)

You have to enter the library/list data before running the script:

 

```PowerShell
# Insert the credentials and the name of the site and list 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="trial@trialtrial125.onmicrosoft.com" 
$Url="https://trialtrial125.sharepoint.com/sites/teamsitewithlibraries" 
$ListTitle="Not-Empty-Document-Library" 
$Versioning=$true 
``` 
 

 

Full description of the script is available in the article  [Versioning and SharePoint: the Powershell perspective](https://social.technet.microsoft.com/wiki/contents/articles/30115.versioning-and-sharepoint-the-powershell-perspective-part-1.aspx)

 

 

## Related scripts
 

[Enable minor versions for all SharePoint Online lists using Powershell](https://gallery.technet.microsoft.com/scriptcenter/Enable-minor-versions-for-431d4a7e)

[Enable versioning for all SharePoint Online lists using Powershell](https://gallery.technet.microsoft.com/scriptcenter/Enable-versioning-for-all-ae5cfb5d)

[Powershell Module for Managing SPO Lists](https://gallery.technet.microsoft.com/scriptcenter/Powershell-Module-for-b88bc2d9)

[SharePoint Module for lists, items and files](https://gallery.technet.microsoft.com/scriptcenter/SharePoint-Module-for-5ecbbcf0)

[Disable versioning for all lists in SharePoint Online tenant (C#)](https://gallery.technet.microsoft.com/scriptcenter/Disable-versioning-for-all-c8d11c71)

[Enable versioning for all lists in SharePoint Online tenant (C#)](https://gallery.technet.microsoft.com/scriptcenter/Enable-versioning-for-all-e17ebcd0)



 <br/><br/>
<b>Enjoy and please share feedback!</b>
