A short Powershell script to set the EnableFolderCreation property for all lists in a site. The property is responsible for the folder icon under Files tab (see screenshot). The button allows you to create folders in a given lists.

If you disable the button, you and your users will not be able to create folders.

Applies to lists and libraries

 

 

It requires installed  SharePoint Online SDK

You have to enter the list information before running the script:

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and the desired reading order: rtl, ltr, none 
$Username="trial@trialtrial123.onmicrosoft.com" 
$AdminPassword="Pass" 
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists" 
$EnableFolderCreation=$false 
 ```

 

### Results

 

 

### Related scripts
Set direction of the reading order for a single list

Set-SPOList properties (module)


 <br/><br/>
<b>Enjoy and please share your comments and questions!</b>