Short Powershell script to retrieve the access requests using REST.

In order to use the script, download, open the file and enter the admin's username and the site's url in the script:

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="t@t321.onmicrosoft.com" 
$Url="https://t321.sharepoint.com/polski" 
 ```
You do not need to enter the password. You will be prompted for it during script's execution.

 

Sample result:

 <img src="../Get SharePoint Online Access Requests with REST API/Capture34.PNG">

You can also check out articles on Access Requests settings and how to manage them not only with REST, but also CSOM and User Interface:

[Managing SharePoint Online Access Requests using Powershell](https://social.technet.microsoft.com/wiki/contents/articles/31157.manage-sharepoint-online-access-requests-using-powershell.aspx)

[SharePoint 2013/2016: Approve or decline Access Requests using Powershell and CSOM](https://social.technet.microsoft.com/wiki/contents/articles/37401.sharepoint-online-approve-or-decline-access-requests-using-powershell-and-csom.aspx)

 

 
