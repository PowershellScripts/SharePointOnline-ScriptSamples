Powershell script that enables versioning for all SharePoint Online lists and libraries in one site.

 

 

It requires installed  SharePoint Online SDK 

You have to enter the library/list data before running the script:

 

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and the desired setting: $true or $false 
$Username="trial@trialtrial123.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists" 
$Versioning=$true
 
 

Full description of the script is available in the article  Versioning and SharePoint: the Powershell perspective

 

 

Related scripts
 

Enable minor versions for all SharePoint Online lists using Powershell

Enable versioning for all SharePoint Online lists using Powershell

Powershell Module for Managing SPO Lists

SharePoint Module for lists, items and files

Disable versioning for all lists in SharePoint Online tenant (C#)

Enable versioning for all lists in SharePoint Online tenant (C#)

 
