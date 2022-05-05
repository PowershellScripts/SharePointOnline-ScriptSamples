Powershell script that lists 5 latest files or items a user has created in a given SharePoint Online list or library.

 

How to use?

1.Download the script and open the file.

2. Modify the following lines with appropriate paths to SharePoint SDKs:

 

PowerShell
#Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.Office.Client.Policy.dll"    
3. Enter data about your tenant:
PowerShell
#Enter the data 
$username = "ana@etr56.onmicrosoft.com" 
$Url = "https://etr56.sharepoint.com/sites/testflow" 
$ListTitle = "Customers" 
$UserDisplayName = "FR" 
 $username - user who has administrative rights over the website/list
 $url           - url of the site collection
 $listtitle     - title of the list where you want to run the query
 $userdisplayname  - display name of the user who modified the items
The script will also create a report under "c:\users\public\FiveItems.csv" with file names and created date. 
 
 

 
