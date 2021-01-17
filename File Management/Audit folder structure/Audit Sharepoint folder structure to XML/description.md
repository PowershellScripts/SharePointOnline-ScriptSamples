SharePoint Server has a lot of options allowing you to organize your files. Some of them really amazing. Folders aren't necessarily one of them. 

But once you have used them and your users happily created unstructured, repeating, unrecoverable mess, you may want to audit them and find out if you can reorganize or save the day in some other way.

The audit may come in handy during migration, upgrades or company restructuring.

 

This Powershell script allows you to investigate into your folder structure in a single library and creates an XML file as a report.


 

In order to use the script you need to modify the following lines:

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
 
# Enter your data 
$admin="CORPO\Admini5" 
$site="https://etr56.corpo.com" 
$libraryTitle="test" 
$script:XMLPath = "C:\Users\Public\foldersAudit.xml" 
#Enter your data above!
 
``` 

 
