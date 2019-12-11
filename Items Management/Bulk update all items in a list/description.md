Short Powershell script to bulk update all items in a list

 

 

 

Example

 



 

 Result:



 

 

 

 

Requirements

 

Before running the script, you have to modify the last lines!

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
 
 
Update-SPOListItem -Username user@tenant.onmicrosoft.com -Url https://tenant.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "contacts list" -FieldToUpdate elp -ValueToUpdate bio
``` 

Enter your credentials
FieldToUpdate specifies the name of the list column which you want to update
ValueToUpdate means the value that you want to enter in that column for each item
Verify if the SharePoint Online SDK is installed in the same location on your computer
 

 

Related Scripts

Powershell Module with Update-SPOListItem cmdlet

 
