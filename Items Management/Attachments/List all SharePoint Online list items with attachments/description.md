Powershell script that lists all SharePoint Online items with attachments. It is limited to a single list with less than 5000 items.

All suggestions, code changes and improvements are welcome.

 

Sample results:



 

In order to use the script, modify the following lines at the bottom of the downloaded file:

 

PowerShell
#Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
 
  
#Enter the data 
$username = "ana@etr56.onmicrosoft.com" 
$Url = "https://etr56.sharepoint.com" 
$ListTitle = "attatest" 
$CSVPath = "c:\users\public\attachmentsonly.csv"
 
 

 
