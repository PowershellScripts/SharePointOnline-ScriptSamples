The script is part of the explanation on editing the content types available in the article here:

[SharePoint Online content types in Powershell: Edit.](https://social.technet.microsoft.com/wiki/contents/articles/31444.sharepoint-online-content-types-in-powershell-edit.aspx)

This example changes the display form url of all content types called ITEM (so basically all items in a list) in all lists in one site to the default one.

 It allows us also to retract our changes and turn to the default form in case something went wrong with the Custom form and items are no longer viewable. (**[screenshot](https://github.com/PowershellScripts/AllGalleryScriptsSamples/blob/develop/Content%20Types/Display%20Forms/Unable%20to%20view%20items-%20modify%20the%20DisplayFormUrl%20back%20to%20default%20one/DisplayFormUrl4.png)**)
 

In order to use the script you need [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038) installed. Before running the script modify the following lines to refer to the SDK libraries installed on your computer and the content type data:

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/powie1"
``` 
 

 
<br/><br/>
<b>Please share your questions and comments!</b>
