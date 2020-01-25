A short script to undeclare all records from a list.

 

The script retrieves all items from the list, verifies whether they are declared as records, and if yes, undeclares them.

While executing, it displays the Name and Server Relative Url of the files. 

 

 

The script requires the newest libraries.  The required libraries can be downloaded from https://www.nuget.org/packages/Microsoft.SharePointOnline.CSOM/ 

 

You need to enter your tenant's data before running the script and paths to SDK.

 

```PowerShell
#Paths to SDK 
Add-Type -Path "H:\Libraries\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "H:\Libraries\Microsoft.SharePoint.Client.Runtime.dll" 
Add-Type -Path "H:\Libraries\Microsoft.Office.Client.Policy.dll"    
 
 
  
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="t@testova365.onmicrosoft.com" 
$Url="https://testova365.sharepoint.com/sites/STS" 
$ListTitle="VersionTest" 
``` 
