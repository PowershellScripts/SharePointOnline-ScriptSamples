A short Powershell script to allow management of content types for all lists and libraries in a site.

 

It is an equivalent of List>>List Settings>>Advanced>>Content types in Graphic User Interface (see screenshot)

 



 

 

Applies to lists and libraries.

 

 

It requires installed  SharePoint Online SDK

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

Please share your thoughts in the Q&A section!

 

Related scripts
Set direction of the reading order for a single list

Set-SPOList properties (module)

Disable or enable attachments to list items using Powershell

Change search setting for all lists in a site using CSOM and Powershell

<br/><br/>
<b>Enjoy and please share feedback!</b>
