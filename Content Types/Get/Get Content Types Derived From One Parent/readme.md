The script below is described in the article [SharePoint Online content types in Powershell: Get](https://social.technet.microsoft.com/wiki/contents/articles/31151.sharepoint-online-content-types-in-powershell-get.aspx) and is part of various options on retrieving a single Content Type.

It retrieves the content types that derive from specific a specific content type, in the example below it is Audio. In this script the content type is recognized by its ID. If you need a script where the parent content type will be recognized by its name, view [this link](https://gallery.technet.microsoft.com/Get-Content-Types-Derived-a0e749de).

For 50+ other scripts refering to various content type functions, please click [View contributions](https://gallery.technet.microsoft.com/site/search?f%5B0%5D.Type=User&f%5B0%5D.Value=Arleta%20Wanat).


Before running the script, you need to open the file and edit the following lines, entering the Admin username, the site where you want to retrieve the content types, and the id of the content type. Do not enter the password - you will be prompted for it during the script execution. 

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/powie1" 
$Parent="0x0101009148F5A04DDD49CBA7127AADA5FB792B006973ACD696DC4858A76371B2FB2F439A" 
```        
 
 

 
For other scripts related to Content Types, you can refer to the article [Wiki: SharePoint Online content types in Powershell: Add (en-us)](https://social.technet.microsoft.com/wiki/contents/articles/31051.sharepoint-online-content-types-in-powershell-add.aspx) 

*<h3>Adding</h3>*
[SharePoint Online: Create a content type using Powershell](https://gallery.technet.microsoft.com/SharePoint-Online-Create-a-2a4d3057) </br>
[Create content type and add directly to SPO list using Powershell  ](https://gallery.technet.microsoft.com/Create-content-type-and-c5332edb) </br>
[Create and add content type to a content type hub SharePoint Online  ](https://gallery.technet.microsoft.com/Create-and-add-content-f9e8eb6f) </br>
[Create content type and add it to all lists in one site  ](https://gallery.technet.microsoft.com/Create-content-type-and-d41ece6e) </br>
[Add Content Type to Task Lists  ](https://gallery.technet.microsoft.com/Add-Content-Type-to-Task-253d3966) </br>
[Add Content Type to Lists with Workflows  ](https://gallery.technet.microsoft.com/Add-Content-Type-to-Lists-503bd493) </br>
[Add existing content type directly to SPO list using Powershell  ](https://gallery.technet.microsoft.com/Add-existing-content-type-e2cbe9b9) </br>

*<h3>Content Type Management</h3>*
[Allow content type management for all lists in site collection using Powershell  ](https://gallery.technet.microsoft.com/Allow-content-type-de3a5a09) </br>
[Allow content type management for all lists in a site using Powershell  ](https://gallery.technet.microsoft.com/Allow-content-type-5bca5157) </br>
[Set content type management setting for SharePoint Online list using Powershell  ](https://gallery.technet.microsoft.com/Set-content-type-39ae4bce) </br>
[Custom Powershell cmdlet Set-SPOList -ContentTypesEnabled  ](https://gallery.technet.microsoft.com/SharePoint-Module-for-5ecbbcf0) </br>

*<h3>Related Scripts</h3>*
[SharePoint Online: Check content types added to your lists  ](https://gallery.technet.microsoft.com/SharePoint-Online-Check-052fbdca) </br>
[SharePoint Online: Check content types added to your lists (recursive)  ](https://gallery.technet.microsoft.com/SharePoint-Online-Check-e2650578) </br>
[Get a report on lists where a given content type is added  ](https://gallery.technet.microsoft.com/Get-a-report-on-lists-c2decb62) </br>
[SharePoint Online: Remove a content type from all lists in a site collection  ](https://gallery.technet.microsoft.com/SharePoint-Online-Remove-a-3a19f5b5) </br>

[Get all properties of all content types in a SharePoint site  ](https://gallery.technet.microsoft.com/Get-all-properties-of-all-3a9c5c4bhttps://gallery.technet.microsoft.com/Get-all-properties-of-all-3a9c5c4b) </br>
[Get All Properties of All Content Types (Detailed)  ](https://gallery.technet.microsoft.com/Get-All-Properties-of-All-a067d4f2) </br>
[Get All Properties of All Content Types in All Lists (Detailed) across one site  ](https://gallery.technet.microsoft.com/Get-All-Properties-of-All-6e7de504) </br>
[Get properties of a single content type by its ID  ](https://gallery.technet.microsoft.com/Get-properties-of-a-single-eb8020a7)


<br/><br/>
<b>Enjoy and please share feedback!</b>
