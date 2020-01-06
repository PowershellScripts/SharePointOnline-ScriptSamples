The script is part of the explanation on editing the content types available in the article here:

SharePoint Online content types in Powershell: Edit.

This example sets description of a single content type belonging to a site collection and retrieved by its GUID. 

 

The description property can get or set the description of the content type. In order to view or modify it from the User Interface, you need to go 

 

Site Settings>> Site Content Types >> Choose the Content type>> Settings: Name and description   for site content types
 

 

 

In order to use the script you need SharePoint Online SDK installed. Before running the script modify the following lines to refer to the SDK libraries installed on your computer and the content type data:

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/powie1" 
$Description="My crazy Powershell description2" 
$ContentTypeGUID="0x0116006288692BD2247D48BA5D55B164C79F51"
``` 



<br/><br/>
<b>Enjoy and please share feedback!</b>