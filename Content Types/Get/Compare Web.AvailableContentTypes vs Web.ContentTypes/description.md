Script is part of the explanation of the difference between Web.AvailableContentTypes and Web.ContentTypes as described in the article:

 

SharePoint Online content types in Powershell: Get
 

The script compares the number of items in the two content type collections.

 



 

Before running, don't forget to open the file and enter your data:

 

 

PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/teamsitewithlibraries/subsite"
 
 
<br/><br/>
<b>Enjoy and please share feedback!</b>