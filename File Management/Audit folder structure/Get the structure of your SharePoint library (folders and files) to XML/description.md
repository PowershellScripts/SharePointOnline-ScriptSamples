SharePoint Online has a lot of options allowing you to organize your files. Some of them really amazing. Folders aren't necessarily one of them. 

But once you have used them and your users happily created unstructured, repeating, unrecoverable mess, you may want to audit them and find out if you can reorganize or save the day in some other way.

This Powershell script investigates into your SharePoint Online folder and file structure and creates an XML file as a report.

The file contains:

Folder Attributes:

itemCount
ServerRelativeUrl
Name
Number of Subfolders
File attributes:

Name
Date Modified
Date Created
Modified By
Size in MB
 

Sample results:

 

 

 

In order to use the script you need to enter your data:

 

PowerShell
# Paths to SDK. Please verify location on your computer. 
 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
 
# Enter your data 
$admin="ana@etr56.onmicrosoft.com" 
$site="https://etr56.sharepoint.com" 
$libraryTitle="test" 
$script:XMLPath = "C:\Users\Public\foolders2new2.xml" 
#Enter your data above! 
 
