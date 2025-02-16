A short Powershell script to allow management of content types for all SharePoint Online lists and libraries across all sites in a site collection


It is an equivalent of **List**>>**List Settings**>>**Advanced**>>**Content types in Graphic User Interface** ([see screenshot](https://github.com/PowershellScripts/AllGalleryScriptsSamples/blob/develop/Content%20Types/Content%20Types%20Management%20Setting/Allow%20content%20type%20management%20for%20all%20lists%20in%20site%20collection/contentTypeManagement.png))
 

Applies to lists and libraries.

 

*It requires installed*  [SharePoint Online SDK](www.microsoft.com/en-us/download/details.aspx?id=42038)

You have to enter the list information before running the script:

```PowerShell
 
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and the desired setting: $true for the content types management to be allowed or $false to disable it 
$Username="trial@trialtrial123.onmicrosoft.com" 
$AdminPassword="Pass" 
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists" 
$ContentTypesEnabled=$true 
``` 

### Please share your thoughts in the Q&A section!

#### Wiki article with detailed code description:
 

[SharePoint Online: Turn on support for multiple content types in a list or library using Powershell](http://social.technet.microsoft.com/wiki/contents/articles/30038.sharepoint-online-turn-on-support-for-multiple-content-types-in-a-list-or-library-using-powershell.aspx)

 

#### Related scripts
[Set-SPOList properties (module)](https://gallery.technet.microsoft.com/office/Set-SPOList-properties-9d16f2ba)

[Disable or enable attachments to list items using Powershell](https://gallery.technet.microsoft.com/scriptcenter/Disable-or-enable-12cf3795)

[Change search setting for all lists in a site using CSOM and Powershell](https://gallery.technet.microsoft.com/scriptcenter/Change-search-setting-for-8e842a48)

[Allow content type management for all lists in a site using Powershell](https://gallery.technet.microsoft.com/scriptcenter/Allow-content-type-5bca5157)

[Set content type management setting for SharePoint Online list using Powershell](https://gallery.technet.microsoft.com/scriptcenter/Set-content-type-39ae4bce)


<br/><br/>
<b>Enjoy and please share feedback!</b>
