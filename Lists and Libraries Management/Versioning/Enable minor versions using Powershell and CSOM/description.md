Powershell script that enables major and minor versioning for SharePoint Online library.

 

 

It requires installed  SharePoint Online SDK 

You have to enter the library data before running the script:

 

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and list 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="trial@trialtrial125.onmicrosoft.com" 
$Url="https://trialtrial125.sharepoint.com/sites/teamsitewithlibraries" 
$ListTitle="Not-Empty-Document-Library" 
$Versioning=$true
 
 

Full description of the script is available in the article  Versioning and SharePoint: the Powershell perspective

 

 

Related scripts
 

Enable minor versions for all SharePoint Online lists using Powershell

Enable versioning for all SharePoint Online lists using Powershell

Powershell Module for Managing SPO Lists

SharePoint Module for lists, items and files

Disable versioning for all lists in SharePoint Online tenant (C#)

Enable versioning for all lists in SharePoint Online tenant (C#)
