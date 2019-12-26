The script is part of the explanation on editing the content types available in the article here:

SharePoint Online content types in Powershell: Edit.

This example gets the list of all content types in all lists from a single site, which have custom display forms deployed. 

 

The ~list/Item/displayifs.aspx is the url of the custom form that the list is using for adding new items:

 

 

 

In order to use the script you need SharePoint Online SDK installed. Before running the script modify the following lines to refer to the SDK libraries installed on your computer and the content type data:

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/powie1"
``` 
