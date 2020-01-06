The script is part of the explanation on editing the content types available in the article here:

SharePoint Online content types in Powershell: Edit.

 

 

The example here adds an existing site column to all list content types in a particular list. The sealed content types will return an error. 

 
 

The script requires SharePoint Online SDK installed. Before running the script, enter the information:

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Publishing.dll"  
# Insert the credentials and the name of the admin site 
$Username="t@trial345.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://trial345.sharepoint.com/sites/teamsitewithlists" 
$ListTitle="opoo" 
$SiteColumn="IMEPos"
``` 
 

 


 
<br/><br/>
<b>Enjoy and please share feedback!</b>
