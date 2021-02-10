Powershell script that disables comments on entire modern page in SharePoint Online. The script uses CommentsOnSitePagesDisabled property of the web object.

Its functionality is described also in an article on Social Technet: Powershell in SharePoint: Disable comments on modern pages in entire site using CSOM

 

 

 

### How to use?
1. Download the script and open the file.

2. Modify the following lines with appropriate paths to SharePoint SDKs:

 

``` PowerShell
#Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.Office.Client.Policy.dll"    
```

3. Enter your data:
``` PowerShell
# Insert the credentials and the name of the admin site 
$Username="ana@etr56.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$Url="https://etr56.sharepoint.com/sites/commsite" 
``` 
If the property is disabled, users with edit rights will be able to switch comments on and off. If the property is enabled, users will not see the comments section when editing the page:
