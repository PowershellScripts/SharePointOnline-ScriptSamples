The script loops through all site collections, their subsites and retrieves all items from the recycle bin. The items can be seen in the console window or you can create an Excel report

*doesn't apply to group site collections or personal sites
 
The script is basically an extension of a more basic [Retrieve all reycle bin items across all site collections](https://gallery.technet.microsoft.com/Retrieve-all-reycle-bin-66bcab5c) script. 

The script loops through all site collections, their subsites and retrieves all items from the recycle bin and restores them. 

The items can be seen in the console window

<img src="../Detailed report on all recycle bin items across all site collections/RecycleAllSiteColl.PNG">

or you can create an Excel report using | Export-csv

```c:\users\MyUser\Desktop\whereismyfilewithdetails.ps1 | export-csv c:\users\ivo\desktop\whereismyfilewithdetails2.csv```

<img src="../Detailed report on all recycle bin items across all site collections/RecycleAllSiteCollReportWithDetails.PNG">
 
The script requires SharePoint Online Management Shell and SharePoint Online SDK:

http://technet.microsoft.com/en-us/library/fp161372(v=office.15).aspx

http://www.microsoft.com/en-us/download/details.aspx?id=30722

Before running the script enter correct paths to the SDK and your tenant data:

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="user@domain.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://domain-admin.sharepoint.com"
``` 
 
<br/><br/>
<b>Let me know about your experience in the Q&A section!</b>
