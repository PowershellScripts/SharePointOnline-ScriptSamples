The script is part of the explanation on editing the content types available in the article here:

SharePoint Online content types in Powershell: Edit.

 

 

The example below sets the .Group property of all content types in one site collection back to the default ones. You need to provide the list of the default groups. You may use SharePoint Online content types in Powershell: Group property article for suggestions.

 

 

 

 

The script requires SharePoint Online SDK installed. Before running the script, enter the information:

 

```PowerShell
$defaultoweGroupy=import-csv C:\Users\ivo\Desktop\CTsGroups2.csv 
 
 
 
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Publishing.dll"  
# Insert the credentials and the name of the admin site 
$Username="t@trial345.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://trial345.sharepoint.com/sites/contenttypehub" 
``` 
 


 

<br/><br/>
<b>Enjoy and please share feedback!</b>
