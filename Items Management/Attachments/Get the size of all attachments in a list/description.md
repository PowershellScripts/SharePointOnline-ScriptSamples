Powershell script lists all the item attachments from a SharePoint list and exports them to a csv file.

 

 

The csv file contains itemID, item title and the name of the file. Each file is listed in a separate line (so items with several attachments will be listed several times, once per each file). 



 

 

 

In order to use the script you need to modify the file:

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
#Please enter your data 
$Username = "ana@etr56.onmicrosoft.com" 
$Url = "https://etr56.sharepoint.com" 
$ListTitle = "attatest" 
$CSVPath = "C:\Users\Public\attachmentsreport.csv"
 
