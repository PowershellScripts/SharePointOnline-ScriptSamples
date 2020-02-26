Short Powershell script to allow management of content types for a SharePoint Online list or library.  It is an equivalent of **List**>>**List Settings**>>**Advanced**>>**Content types in User Interface Applies to lists and libraries**.

A short Powershell script to allow management of content types for a SharePoint Online list or library.

It is an equivalent of **List**>>**List Settings**>>**Advanced**>>**Content types in Graphic User Interface** ([see screenshot](https://github.com/PowershellScripts/AllGalleryScriptsSamples/blob/develop/Content%20Types/Content%20Types%20Management%20Setting/Set%20content%20type%20management%20setting%20for%20a%20single%20list/contentTypeManagement.png))

Applies to lists and libraries.

*It requires installed*  [SharePoint Online SDK](http://www.microsoft.com/en-us/download/details.aspx?id=42038)

You have to enter the list information before running the script:

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and list 
$Username="trial@trialtrial123.onmicrosoft.com" 
$AdminPassword="Pass" 
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists" 
$ListName="Tasks list" 
$ContentTypesEnabled =$false 
```


### Please share your thoughts in the Q&A section!

#### Wiki article with detailed code description:

[SharePoint Online: Turn on support for multiple content types in a list or library using Powershell](social.technet.microsoft.com/wiki/contents/articles/30038.sharepoint-online-turn-on-support-for-multiple-content-types-in-a-list-or-library-using-powershell.aspx)

#### Related scripts
[Set direction of the reading order for a single list](https://gallery.technet.microsoft.com/office/Set-the-direction-of-the-f17ca66a)

[Set-SPOList properties (module)](https://gallery.technet.microsoft.com/office/Set-SPOList-properties-9d16f2ba)

[Disable or enable attachments to list items using Powershell](https://gallery.technet.microsoft.com/scriptcenter/Disable-or-enable-12cf3795)

[Change search setting for all lists in a site using CSOM and Powershell](https://gallery.technet.microsoft.com/scriptcenter/Change-search-setting-for-8e842a48)

 
 
<br/><br/>
<b>Enjoy and please share feedback!</b>
