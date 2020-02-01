The script below is described in the article [SharePoint Online content types in Powershell: Get](https://social.technet.microsoft.com/wiki/contents/articles/31151.sharepoint-online-content-types-in-powershell-get.aspx) and is part of various options on retrieving a single Content Type.

It retrieves content type which have among their columns, one particular column of your choice. In the example below the column is called *Copyright*.

 

Before running the script, you need to open the file and edit the following lines, entering the Admin username, the site where you want to retrieve the content types, and the name of the column you are looking for. Do not enter the password - you will be prompted for it during the script execution. 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/powie1" 
$NameOrTitle="Copyright"
``` 
 

 

 

 

For 50+ other scripts refering to various content type functions, please click [View contributions](https://gallery.technet.microsoft.com/site/search?f%5B0%5D.Type=User&f%5B0%5D.Value=Arleta%20Wanat) or refer to the scripts below:

 

### *Adding*
[SharePoint Online: Create a content type using Powershell ](https://gallery.technet.microsoft.com/SharePoint-Online-Create-a-2a4d3057) </br>
[Create content type and add directly to SPO list using Powershell ](https://gallery.technet.microsoft.com/Create-content-type-and-c5332edb) </br>
[Create and add content type to a content type hub SharePoint Online](https://gallery.technet.microsoft.com/Create-and-add-content-f9e8eb6f) </br>
[Create content type and add it to all lists in one site ](https://gallery.technet.microsoft.com/Create-content-type-and-d41ece6e) </br>
[Add Content Type to Task Lists ](https://gallery.technet.microsoft.com/Add-Content-Type-to-Task-253d3966) </br>
[Add Content Type to Lists with Workflows ](https://gallery.technet.microsoft.com/Add-Content-Type-to-Lists-503bd493) </br>
[Add existing content type directly to SPO list using Powershell ](https://gallery.technet.microsoft.com/Add-existing-content-type-e2cbe9b9) </br>

### *Getting*
[Get all properties of all content types in a SharePoint site ](https://gallery.technet.microsoft.com/Get-all-properties-of-all-3a9c5c4b) </br>

[Get All Properties of All Content Types (Detailed) ](https://gallery.technet.microsoft.com/Get-All-Properties-of-All-a067d4f2) </br>
[Get All Properties of All Content Types in All Lists (Detailed) across one site ](https://gallery.technet.microsoft.com/Get-All-Properties-of-All-6e7de504) </br>
[Get properties of a single content type by its ID ](https://gallery.technet.microsoft.com/Get-properties-of-a-single-eb8020a7https://gallery.technet.microsoft.com/Get-properties-of-a-single-eb8020a7) </br>
[Get content types belonging to a group ](https://gallery.technet.microsoft.com/Get-content-types-eb59774a) </br>
[Get All Hidden Content Types added to the site ](https://gallery.technet.microsoft.com/Get-All-Hidden-Content-83a588a5) </br>
[Get Single Content Type - Array Method ](https://gallery.technet.microsoft.com/Get-Single-Content-Type-1f79888b) </br>
[Get Names of all content types added to your SPO lists ](https://gallery.technet.microsoft.com/Get-Names-of-all-content-67a79dac) </br>
[Get Names of All Content Types ](https://gallery.technet.microsoft.com/Get-Names-of-All-Content-58bfdd29) </br>
[Get Names of all Available Content Types ](https://gallery.technet.microsoft.com/Get-Names-of-all-Available-ada26a47) </br>
[Get Content Types Derived From One Parent ](https://gallery.technet.microsoft.com/Get-Content-Types-Derived-b48e7f5f) </br>
[Get Content Types Derived From One Parent 2](https://gallery.technet.microsoft.com/Get-Content-Types-Derived-a0e749de) </br>

[Get content types which cannot be modified](https://gallery.technet.microsoft.com/Get-content-types-which-029b1968) </br>

### *Content Type Management*
[Allow content type management for all lists in site collection using Powershell](https://gallery.technet.microsoft.com/Allow-content-type-de3a5a09) </br>
[Allow content type management for all lists in a site using Powershell](https://gallery.technet.microsoft.com/Allow-content-type-5bca5157) </br>
[Set content type management setting for SharePoint Online list using Powershell](https://gallery.technet.microsoft.com/Set-content-type-39ae4bce) </br>
[Custom Powershell cmdlet Set-SPOList -ContentTypesEnabled](https://gallery.technet.microsoft.com/SharePoint-Module-for-5ecbbcf0) </br>

### *Related Scripts*
[SharePoint Online: Check content types added to your lists](https://gallery.technet.microsoft.com/SharePoint-Online-Check-052fbdca) </br>
[SharePoint Online: Check content types added to your lists (recursive)](https://gallery.technet.microsoft.com/SharePoint-Online-Check-e2650578) </br>
[Get a report on lists where a given content type is added](https://gallery.technet.microsoft.com/Get-a-report-on-lists-c2decb62) </br>
[SharePoint Online: Remove a content type from all lists in a site collection](https://gallery.technet.microsoft.com/SharePoint-Online-Remove-a-3a19f5b5) </br>
[Compare Web.AvailableContentTypes vs Web.ContentTypes](https://gallery.technet.microsoft.com/Compare-WebAvailableContent-cf03617a) </br>

<br/><br/>
<b>Enjoy and please share feedback!</b>
