A short Powershell script to set the direction of the reading order for all lists in a site

 

You can choose between:

ltr - left to right

rtl - right to left

none 

 

 

 

It requires installed  [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038)

You have to enter the list information before running the script:

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and the desired reading order: rtl, ltr, none 
$Username="trial@trialtrial123.onmicrosoft.com" 
$AdminPassword="Pass" 
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists" 
$Direction="rtl"
``` 
 
Results:

 
<img src="../For All Lists/Direction.png" width="850">


 
<br/><br/>
<b>Enjoy and please share feedback!</b>

## **Related scripts**
[Set direction of the reading order for a single list](https://gallery.technet.microsoft.com/office/Set-the-direction-of-the-f17ca66a)

[Set-SPOList properties (module)](https://gallery.technet.microsoft.com/office/Set-SPOList-properties-9d16f2ba)

[Change permission property in lists (article)](https://social.technet.microsoft.com/wiki/contents/articles/29556.sharepoint-online-delete-unique-permissions-in-multiple-lists-using-csom.aspx)

[Other list-related scripts](https://gallery.technet.microsoft.com/office/site/search?query=list&f%5B1%5D.Value=list&f%5B1%5D.Type=SearchText&f%5B0%5D.Value=Arleta%20Wanat&f%5B0%5D.Type=User&ac=4)
