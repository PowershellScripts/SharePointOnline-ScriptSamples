Powershell script that verifies DisableFlows property of a SharePoint Online site. The script is related to and more described in an article [Verifying and modifying Flows Policy in SharePoint Online site using Powershell](https://social.technet.microsoft.com/wiki/contents/articles/39331.sharepoint-online-verifying-and-modifying-flows-policy-in-site-using-powershell.aspx) on the TechNet Wiki.

 

If the setting is set to disabled, the flows button will be missing on all lists and libraries in the site:

<img src="../Get FlowsPolicy using REST API/images/NoFlows3.PNG"> 
<img src="../Get FlowsPolicy using REST API/images/NoFlows.PNG"> 

The property can also be verified using REST API in the browser:

<img src="../Get FlowsPolicy using REST API/images/NoFlows4.PNG"> 

## How to use?
- Download and open the .ps1 file.
- Enter the correct url and admin login: 
```PowerShell
$username="admin@TENANT.onmicrosoft.com" 
$Url="https://TENANT.sharepoint.com"
``` 
- Run the script
 

 
