Powershell script that verifies DisableFlows property of a SharePoint Online site. The script is related to and more described in an article Verifying and modifying Flows Policy in SharePoint Online site using Powershell on the TechNet Wiki.

 

If the setting is set to disabled, the flows button will be missing on all lists and libraries in the site:





 

 

The property can also be verified using REST API in the browser:



 

 

 

 

 

 

How to use?
Download and open the .ps1 file.
Enter the correct url and admin login: 
PowerShell
$username="admin@TENANT.onmicrosoft.com" 
$Url="https://TENANT.sharepoint.com"
 Run the script
 

 
