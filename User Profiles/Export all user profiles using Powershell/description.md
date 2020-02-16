The script retrieves all user profile properties for SharePoint Online users within one site.

 

The script uses the following endpoint to retrieve a user property:

/_api/SP.UserProfiles.PeopleManager/GetPropertiesFor(accountName=@v)?@v='<account name>'

 

For more details, please consult:

User profiles REST API reference

 

 

How to use?
 

Download, open the script and enter correct values in the following lines:

PowerShell
$SiteUrl="https://t321.sharepoint.com" 
$AdminCenter="https://t321-admin.sharepoint.com" 
$ExportTo="C:\Users\Arletka\Documents\SpUsers3.csv"
 
 
Expected results


 

 

 

 

 

 
