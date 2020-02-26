Short Powershell script to retrieve the access requests from a SharePoint Server site using REST.

 

In order to use the script, download, open the file and enter the admin's username and the site's url in the script:

 

PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="administrator" 
$Url="http://dva"
 
You do not need to enter the password. You will be prompted for it during script's execution.

 

Sample result:



 

 

You can also check out articles on Access Requests settings and how to manage them not only with REST, but also CSOM and User Interface:

Managing SharePoint Online Access Requests using Powershell

 SharePoint 2013/2016: Approve or decline Access Requests using Powershell and CSOM

 

 
