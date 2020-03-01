The script removes permanently and irrevocably items from the specified site recycle bin and its corresponding site collection recycle bin. 

The data cannot be retrieved afterwards. Test the script before using on production environment.
 
```PowerShell
 $ctx.Load($ctx.Web) 
  $ctx.Load($ctx.Site) 
  $rb=$ctx.Web.RecycleBin 
  $siteRB=$ctx.Site.RecycleBin 
$ctx.Load($rb) 
$ctx.load($siteRB) 
$ctx.ExecuteQuery() 
Write-Host $ctx.Web.Url $rb.Count.ToString() 
Write-Host $ctx.Site.Url $SiteRB.Count.ToString() 
 
$rb.DeleteAll() 
$siteRB.DeleteAll() 
$siteRB.DeleteAllSecondStageItems() 
 
$ctx.ExecuteQuery()
 ```

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
$AdminUrl="https://trial098.sharepoint.com/sites/teamsitewithlibraries/EmptySubsite1"
``` 
 

If under $AdminUrl you enter a url of a subsite, like in the example, the script will remove items from the recycle bin in EmptySubsite1 and from the teamsitewithlibraries site collection.

If you want to remove only items from a subsite, open the Powershell script file and remove all lines relating to site collection recycle bin ($siteRB).

 
