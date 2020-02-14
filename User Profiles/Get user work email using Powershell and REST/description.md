The script retrieves a WorkEmail property for a single SharePoint Online user.

 

The script uses the following endpoint to retrieve a user property:

/getuserprofilepropertyfor(accountname=@v, propertyname='<property name>')?@v='<account name>'

 

For more details, please consult:

User profiles REST API reference

 

 

### How to use?
 

Download, open the script and enter correct values in the following lines:

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="t@t321.onmicrosoft.com" 
$Url="https://t321.sharepoint.com/polski" 
$userLogin="t@t321.onmicrosoft.com"
``` 
Expected result


 

