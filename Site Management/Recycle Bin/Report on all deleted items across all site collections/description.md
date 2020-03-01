The script loops through all site collections recycle bins and prints out the deleted items details or creates an Excel report on them


<blockqoute>* doesn't apply to group site collections or personal sites</blockqoute>

The script is basically an extension of a more basic [Retrieve all reycle bin items across all site collections](https://gallery.technet.microsoft.com/Retrieve-all-reycle-bin-66bcab5c) script, but it does NOT restore the items.

The script loops through all site collections, their subsites and retrieves all items from the recycle bin. The items can be seen in the console window

<img src="../Report on all deleted items across all site collections/RecycleAllSiteCollReportOnly.PNG">

or you can create an Excel report using | Export-csv

c:\users\MyUser\Desktop\whereismyfilewithdetails3.ps1 | export-csv c:\users\ivo\desktop\whereismyfilewithdetails2.csv

 <img src="../Report on all deleted items across all site collections/RecycleAllSiteCollReportOnly2.PNG">


The script requires [SharePoint Online Management Shell](https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-online/connect-sharepoint-online?view=sharepoint-ps&redirectedfrom=MSDN) and [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038)

Before running the script enter correct paths to the SDK and your tenant data:
 
```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="user@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant-admin.sharepoint.com"
 ```
 
