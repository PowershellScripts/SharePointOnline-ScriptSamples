The script retrieves a SPS-MUILanguages property for specified SharePoint Online users.

The script uses the following endpoint to retrieve a user property:

```/getuserprofilepropertyfor(accountname=@v, propertyname='<property name>')?@v='<account name>'```

For more details, please consult:

[User profiles REST API reference](https://docs.microsoft.com/en-us/previous-versions/office/developer/sharepoint-rest-reference/dn790354(v=office.15)?redirectedfrom=MSDN)

## How to use?
 
Download, open the script and enter correct values in the following lines:

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="t@t321.onmicrosoft.com" 
$Url="https://t321.sharepoint.com" 
 
 
$userLogins=("t@t321.onmicrosoft.com","user1@t321.onmicrosoft.com","user2@t321.onmicrosoft.com","user5@t321.onmicrosoft.com","yasen@t321.onmicrosoft.com") 
 ```
## Expected results
 
<img src="../Get MUI Languages for multiple users using REST/Capture68.PNG">
