The script loops through all site collections recycle bins and prints out the deleted items details or creates an Excel report on them


* doesn't apply to group site collections or personal sites

 

The script is basically an extension of a more basic Retrieve all reycle bin items across all site collections script, but it does NOT restore the items.

The script loops through all site collections, their subsites and retrieves all items from the recycle bin. The items can be seen in the console window



or you can create an Excel report using | Export-csv

c:\users\MyUser\Desktop\whereismyfilewithdetails3.ps1 | export-csv c:\users\ivo\desktop\whereismyfilewithdetails2.csv

 



 

 

The script requires SharePoint Online Management Shell and SharePoint Online SDK

 

 

Before running the script enter correct paths to the SDK and your tenant data:

 

 
PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="user@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant-admin.sharepoint.com"
 
 
