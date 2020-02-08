The script is part of the explanation on editing the content types available in the article here:

[SharePoint Online content types in Powershell: Edit.](https://social.technet.microsoft.com/wiki/contents/articles/31444.sharepoint-online-content-types-in-powershell-edit.aspx)

This example gets all content types in a single list from a single site, and changes their display form names, using:

```PowerShell
$cc.DisplayFormTemplateName="DocumentLibraryForm"
``` 
The script requires [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038) installed. Before running the script, enter the information:

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/powie1" 
$ListTitle="notf--ked"
``` 
 
<br/><br/>
<b>Enjoy and please share feedback!</b>
