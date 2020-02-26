The script below is described in the article [SharePoint Online content types in Powershell: Get](https://social.technet.microsoft.com/wiki/contents/articles/31151.sharepoint-online-content-types-in-powershell-get.aspx) and is part of various options on retrieving a single Content Type.

 

It retrieves the content types that are hidden. If you want to retrieve the content types that are NOT hidden, modify this line, changing the $true setting to $false:

```PowerShell
if($cc.Hidden -eq $true)
``` 

Before running the script, you need to open the file and edit the following lines, entering the Admin username and the site where you want to retrieve the content types. Do not enter the password - you will be prompted for it during the script execution. 

```PowerShell
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/teamsitewithlibraries"
``` 
<br/>
<b>If you have any questions or comments, please do not hesitate to post an issue! </b>
