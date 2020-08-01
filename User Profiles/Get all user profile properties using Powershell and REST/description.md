The script retrieves all user profile properties for the specified SharePoint Online user. 

The script uses the following endpoint to retrieve a user property:

```/_api/SP.UserProfiles.PeopleManager/GetPropertiesFor(accountName=@v)?@v='<account name>'```

For more details, please consult:

[User profiles REST API reference](https://docs.microsoft.com/en-us/previous-versions/office/developer/sharepoint-rest-reference/dn790354(v=office.15)?redirectedfrom=MSDN)

## How to use?
 
Download, open the script and enter correct values in the following lines:

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="Admin@t321.onmicrosoft.com" 
$Url="https://t321.sharepoint.com" 
$userLogin="user2@t321.onmicrosoft.com"
``` 

## Expected result
 
<img src="../Get all user profile properties using Powershell and REST/Capture69.PNG">
