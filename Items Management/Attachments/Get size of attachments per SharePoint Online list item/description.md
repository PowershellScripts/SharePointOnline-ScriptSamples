Powershell script retrieves all attachments from a SharePoint list (not library) and exports the results to a csv file. It also sums up the total size of all list item attachments and displays it at the end of script execution:



 

The csv file contains itemID, item title, number of attachments and their size (summed up per item). Each item is listed in a separate line.  Sample results:



 

 

In order to use the script, enter your data:

PowerShell
#Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
 
  
#Enter the data 
$username = "ana@etr56.onmicrosoft.com" 
$Url = "https://etr56.sharepoint.com" 
$ListTitle = "attatest" 
$CSVPath = "c:\users\public\attachmentsonly.csv"
 
Have a look at my other scripts related to attachments:

Delete all your list attachments (data loss involved)

Copy all SharePoint Online list item attachments to a SPO library

Get the size of all attachments in SharePoint Online list

List all attachments from SharePoint Online list to CSV file
