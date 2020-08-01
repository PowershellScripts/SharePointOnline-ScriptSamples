Powershell script that adds size of all item attachments to a list view.

First the script finds all items with attachments. Then it adds the size of all attachments in a given item. At the end it enters the value in a column. The column needs to exist beforehand.

 

You can adjust the script and display the size in MB or KB.

 

Sample results:

 



In order to use the script you need to enter your data:

```PowerShell
#Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
 
  
#Enter the data 
$username = "ana@etr56.onmicrosoft.com" 
$Url = "https://etr56.sharepoint.com" 
$ListTitle = "attatest" 
$ColumnName = "Size In KB"  #name of the column where you want to display size. 
``` 
 
 

 

 

 

 
