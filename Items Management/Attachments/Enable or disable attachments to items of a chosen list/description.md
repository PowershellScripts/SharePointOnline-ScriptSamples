A short Powershell script to set the EnableAttachments property for a SharePoint Online list. The property is responsible for the Attach File icon under new item tab. If you disable the button, you and your users will not be able to add the attachments to list items.

A short Powershell script to set the EnableAttachments property for a SharePoint Online list. The property is responsible for the Attach File icon under new item tab (see screenshot). The button allows you to add attachments to the list item.



 

 

 

If you disable the button, you and your users will not be able to add the attachments to list items:

 



 

Applies to lists.

 

 

It requires installed  SharePoint Online SDK

You have to enter the list information before running the script:

 

 

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and list 
$Username="trial@trialtrial123.onmicrosoft.com" 
$AdminPassword="Pass" 
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists" 
$ListName="Tasks list" 
$Attachments =$false
Related scripts
Set direction of the reading order for a single list

Set-SPOList properties (module)

 

 

Related article
 

SharePoint Online: Disable or enable attachments to list items using Powershell

 
