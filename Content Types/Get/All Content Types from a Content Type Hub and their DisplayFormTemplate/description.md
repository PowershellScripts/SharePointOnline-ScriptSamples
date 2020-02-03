The script is part of the explanation on editing the content types available in the article here:

[SharePoint Online content types in Powershell: Edit.](https://social.technet.microsoft.com/wiki/contents/articles/31444.sharepoint-online-content-types-in-powershell-edit.aspx)
 

This example retrieves all content types from a Content Type Hub, along with their DisplayFormTemplateName property. For instruction how to find a content type hub, you can refer [here](https://social.technet.microsoft.com/wiki/contents/articles/31051.sharepoint-online-content-types-in-powershell-add.aspx#To_Content_Hub).


The script requires [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038) installed. Before running the script, enter the information:

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/contenttypehub"
``` 
You can export the results to the CSV or *.txt* file.



<br/><br/>
<b>Enjoy and please share feedback!</b>
