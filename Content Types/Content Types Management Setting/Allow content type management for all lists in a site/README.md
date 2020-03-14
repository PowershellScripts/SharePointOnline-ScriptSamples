A short Powershell script to allow management of content types for all lists and libraries in a site.

It is an equivalent of **List**>>**List Settings**>>**Advanced**>>**Content types in Graphic User Interface** ([see screenshot](https://github.com/PowershellScripts/AllGalleryScriptsSamples/blob/develop/Content%20Types/Content%20Types%20Management%20Setting/Allow%20content%20type%20management%20for%20all%20lists%20in%20a%20site/contentTypeManagement.png))


Applies to lists and libraries.


*It requires installed*  [SharePoint Online SDK](http://www.microsoft.com/en-us/download/details.aspx?id=42038)

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

#### Related scripts</br>
[Set direction of the reading order for a single list](https://gallery.technet.microsoft.com/office/Set-SPOList-properties-9d16f2ba)

[Set-SPOList properties (module)](https://gallery.technet.microsoft.com/scriptcenter/Disable-or-enable-12cf3795)

[Disable or enable attachments to list items using Powershell](https://gallery.technet.microsoft.com/scriptcenter/Change-search-setting-for-8e842a48)

[Change search setting for all lists in a site using CSOM and Powershell](https://gallery.technet.microsoft.com/scriptcenter/Allow-content-type-5bca5157)

<br/><br/>
<b>Enjoy and please share feedback!</b>
