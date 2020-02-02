The script below is described in the article [SharePoint Online content types in Powershell: Get](https://social.technet.microsoft.com/wiki/contents/articles/31151.sharepoint-online-content-types-in-powershell-get.aspx) and is part of various options on retrieving a single Content Type.

 

It retrieves the content types that belong to a specific group of your choice. In the example given it retrieves the content types belonging to Business Intelligence group.


Before running the script, you need to open the file and edit the following lines, entering the Admin username and the site where you want to retrieve the content types. Do not enter the password - you will be prompted for it during the script execution. 

```PowerShell
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/teamsitewithlibraries"
``` 
<b>If you have any questions, please open an issue!</b>
