Short Powershell script that enables flows for all lists and libraries in SharePoint Online modern site.

It modifies DisableFlows property of a SharePoint Online site. The script is related to and more described in an article [Verifying and modifying Flows Policy in SharePoint Online site using Powershell](https://social.technet.microsoft.com/wiki/contents/articles/39331.sharepoint-online-verifying-and-modifying-flows-policy-in-site-using-powershell.aspx) on the TechNet Wiki.

 

If the setting is set to disabled, the flows button will be missing on all lists and libraries in the site:

<img src="../Enable Microsoft Flow in all lists on SharePoint modern site/NoFlows3.PNG">
<img src="../Enable Microsoft Flow in all lists on SharePoint modern site/NoFlows.PNG">

## How to use?
- Download and open the .ps1 file.
- Add correct libraries:
 

```PowerShell
#Paths to SDK 
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
 
Add-Type -Path "C:\Program Files\SharePoint Client Components\16.0\Assemblies\Microsoft.Online.SharePoint.Client.Tenant.dll" 
 ```
 
- Enter the correct url and admin login: 
 
```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="admin@TENANT.onmicrosoft.com" 
$AdminUrl="https://TENANT-admin.sharepoint.com" 
$Url="https://TENANT.sharepoint.com"
 ```
 - Run the script
