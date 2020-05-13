The script loops through all site collections, all their subsites and finds lists with more than x items. You can define x.

It generates a report to csv file.

 

 

 

In order to use the script, modify the following lines. DO NOT enter password in the file:

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="ana@etr56.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$Url="https://etr56.sharepoint.com" 
 
# reporting parameters 
 # where should the report be saved 
$csvPath = "C:\Users\Public\largelists.csv" 
$itemThreshold = 20000 
``` 
 
 

Another variation of the script creates a nicer/shorter report. Check it out here:

https://gallery.technet.microsoft.com/office/Get-large-SharePoint-f2634c12
