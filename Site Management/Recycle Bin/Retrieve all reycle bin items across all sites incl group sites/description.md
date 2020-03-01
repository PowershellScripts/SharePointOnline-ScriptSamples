<blockqoute>* including the group sites</blockqoute>

The script loops through all site collections, their subsites and retrieves all items from the recycle bin. The items can be seen in the console window

 <img src="../Retrieve all reycle bin items across all sites incl group sites/RecycleAllSiteColl (2).PNG">

or you can create an Excel report using | Export-csv

``` C:\Users\ivo\Desktop\wiki\technet\whereismyfile.ps1 | export-csv c:\users\ivo\desktop\whereismyfile.csv```

<img src="../Retrieve all reycle bin items across all sites incl group sites/RecycleAllSiteCollReport (1).PNG">

The script requires SharePoint Online Management Shell and SharePoint Online SDK:

http://technet.microsoft.com/en-us/library/fp161372(v=office.15).aspx

http://www.microsoft.com/en-us/download/details.aspx?id=30722

Before running the script enter correct paths to the SDK and your tenant data:

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant-admin.sharepoint.com" 
``` 
 
 
