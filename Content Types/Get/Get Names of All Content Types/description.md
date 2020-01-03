The script retrieves the names of all content types for a site (as opposed to AVAILABLE content types).

 

The script is part of the explanation on retrieving the content types as described in the article:

 

SharePoint Online content types in Powershell: Get
 

Before running, don't forget to open the file and enter your data:

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/teamsitewithlibraries" 
``` 
 

The results can be displayed in the Powershell console:



 

or exported to a csv file using Out-File cmdlet:

 

 

 

For a script that retrieves available content types from a given site (as opposed to content types from a patricular site), please enter here: https://gallery.technet.microsoft.com/Get-Names-of-all-Available-ada26a47

 

 

For other scripts related to Content Types, you can refer to the article Wiki: SharePoint Online content types in Powershell: Add (en-us) 

 Adding
SharePoint Online: Create a content type using Powershell  
Create content type and add directly to SPO list using Powershell  
Create and add content type to a content type hub SharePoint Online  
Create content type and add it to all lists in one site  
Add Content Type to Task Lists  
Add Content Type to Lists with Workflows  
Add existing content type directly to SPO list using Powershell  

 Content Type Management
Allow content type management for all lists in site collection using Powershell  
Allow content type management for all lists in a site using Powershell  
Set content type management setting for SharePoint Online list using Powershell  
Custom Powershell cmdlet Set-SPOList -ContentTypesEnabled  

 Related Scripts
SharePoint Online: Check content types added to your lists  
SharePoint Online: Check content types added to your lists (recursive)  
Get a report on lists where a given content type is added  
SharePoint Online: Remove a content type from all lists in a site collection  

Get all properties of all content types in a SharePoint site  
Get All Properties of All Content Types (Detailed)  
Get All Properties of All Content Types in All Lists (Detailed) across one site  
Get properties of a single content type by its ID  



<br/><br/>
<b>Enjoy and please share feedback!</b>