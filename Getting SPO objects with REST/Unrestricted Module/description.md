Powershell module with Get-SPOObject cmdlet to retrieve SharePoint Online objects, such as

lists
webs
content types
fields/columns
alerts
event receivers
features
site groups
users
workflow associations 
 

How does it work?
 

1. Download the file and import the module.

2. Run the cmdlet.



 

 

Sample uses:
 

 

PowerShell
Get-SPOObject -Username t@t321.onmicrosoft.com -password $password -url https://t321.sharepoint.com -object "web/lists/getbytitle('biblioteka')/files"
 
 

 



 

 

 

PowerShell
Get-SPOObject -Username t@t321.onmicrosoft.com -password $password -url https://t321.sharepoint.com/standard -object "web/lists/getbytitle('biblioteka')/files"  | where {$_.CreatedBy.Name -eq "Ana Trial"}
 
 

 

PowerShell
Get-SPOObject -Username t@t321.onmicrosoft.com -password $password -url https://t321.sharepoint.com/standard -object "web/allproperties"
 



 

 

 

 

PowerShell
Get-SPOObject -Username t@t321.onmicrosoft.com -url https://t321.sharepoint.com -object "site" 
password $password
 
 

 

 

 

 

 

You can find this Powershell module in 2 other versions:

- one with suggestions, limited but helpful when you are starting and don't know what your options are:

Module for getting SharePoint Online objects with Powershell (limited)

- one a little more restricted, calling only objects from within web:

Module for getting SharePoint Online objects with Powershell

 

 

There is also a script available under:

Get SharePoint Online objects with REST
