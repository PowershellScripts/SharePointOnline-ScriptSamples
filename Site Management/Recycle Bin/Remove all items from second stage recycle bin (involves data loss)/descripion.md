The script removes permanently and irrevocably items from the specified site second-stage recycle bin.

The data cannot be retrieved afterwards. Test the script before using on production environment.

 

 

The script uses in-built function 'DeleteAllSecondStageItems()'

```PowerShell
Write-Host "Removing second stage items..." 
$siteRB.DeleteAllSecondStageItems() 
$ctx.ExecuteQuery()
``` 
 

The script requires SharePoint Online SDK installed:

https://www.microsoft.com/en-us/download/details.aspx?id=42038

 

 

Before running the script, open the file and enter correct paths to the SDK and correct data:

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="t@trial098.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://trial098.sharepoint.com/sites/teamsitewithlibraries/EmptySubsite1"
``` 
