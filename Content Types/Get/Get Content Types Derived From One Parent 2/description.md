The script below is described in the article SharePoint Online content types in Powershell: Get and is part of various options on retrieving a single Content Type.
It is also available on Technet Gallery: [Get Content Types Derived From One Parent 2](https://gallery.technet.microsoft.com/office/Get-Content-Types-Derived-a0e749de)
 

It retrieves the content types that derive from specific a specific content type, in the example below it is Audio. In this script the content type is recognized by its name. If you need a script where the parent content type will be recognized by its ID, view this link.

For 50+ other scripts refering to various content type functions, please view other scripts in this repository.

Before running the script, you need to open the file and edit the following lines, entering the Admin username, the site where you want to retrieve the content types, and the id of the content type. Do not enter the password - you will be prompted for it during the script execution. 

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/powie1" 
$Parent="Audio"
``` 
 

 
For other scripts related to Content Types, you can refer to the article Wiki: SharePoint Online content types in Powershell: Add (en-us) 

#### Adding
SharePoint Online: Create a content type using Powershell  
Create content type and add directly to SPO list using Powershell  
Create and add content type to a content type hub SharePoint Online  
Create content type and add it to all lists in one site  
Add Content Type to Task Lists  
Add Content Type to Lists with Workflows  
Add existing content type directly to SPO list using Powershell  

#### Content Type Management
Allow content type management for all lists in site collection using Powershell  
Allow content type management for all lists in a site using Powershell  
Set content type management setting for SharePoint Online list using Powershell  
Custom Powershell cmdlet Set-SPOList -ContentTypesEnabled  

#### Related Scripts
SharePoint Online: Check content types added to your lists  
SharePoint Online: Check content types added to your lists (recursive)  
Get a report on lists where a given content type is added  
SharePoint Online: Remove a content type from all lists in a site collection  

Get all properties of all content types in a SharePoint site  
Get All Properties of All Content Types (Detailed)  
Get All Properties of All Content Types in All Lists (Detailed) across one site  
Get properties of a single content type by its ID  

 

 
 
 

<b>If you have any questions, please open an issue!</b>
