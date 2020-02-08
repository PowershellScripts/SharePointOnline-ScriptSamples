Short script to retrieve SharePoint Online objects, such as

lists
content types
fields/columns
alerts
event receivers
features
site groups
users
workflow associations 
 

 

How does it work?
Open the file, enter your tenant's data:

 

PowerShell
  
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="t@t321.onmicrosoft.com" 
$Url="https://t321.sharepoint.com/standard" 
$object="lists" 
 
 

$object refers to object you want to retrieve. Example objects are:

lists
contenttypes
availablefields
alerts
eventreceivers
features
sitegroups
siteusers
workflowassociations 
but you can also use anything that would work with the REST api in the browser, such as :

lists/getbytitle('biblioteka')
""  (empty string to retrieve the web object properties)
allproperties
lists/getbytitle('biblioteka')/files
 

You will be asked for password during execution. Do not enter your password in the file. 

 

Then you can modify the last cmdlet:

 

PowerShell
Get-SPOObject -Username $username -Url $Url -password $AdminPassword -object $object 
 
 

To retrieve whatever you need in a friendly and familiar Powershell fashion, e.g.:

 

PowerShell
Get-SPOObject -Username $username -Url $Url -password $AdminPassword -object "lists" | select title
 
PowerShell
Get-SPOObject -Username t@t321.onmicrosoft.com -password $password -url https://t321.sharepoint. 
com/standard -object "lists/getbytitle('biblioteka')/files"  | where {$_.CreatedBy.Name -eq "Ana Trial"} | select Name, 
CreatedBy
 
 

 

The script can serve to pull all kinds of data from SharePoint Online in an admin-friendly Powershell way and can help deliver this data in a report form:

 

```PowerShell
Get-SPOObject -Username t@t321.onmicrosoft.com -password $password -url https://t321.sharepoint. 
com/standard -object "lists/getbytitle('biblioteka')/files"  | where {$_.CreatedBy.Name -eq "Ana Trial"} | export-csv c:\MyReport.csv
``` 
 

 

 

If you plan on using it more often, I recommend a module with a cmdlet that serves the same purpose. After importing the module, a cmdlet can be reused multiple times directly from Shell and is generally faster than executing script every time we need to pull data.

You can find the REST module in 3 versions:

- one with suggestions, limited but helpful when you are starting and don't know what your options are

- 2nd for users who have idea about REST and will be able to define their objects within web without any hints (most recommended)

- 3rd one free-style allowing you to pull anything under /_api/ so not only web but also site objects  

 

 
