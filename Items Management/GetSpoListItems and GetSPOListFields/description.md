2 new SharePoint Online Powershell cmdlets to help you view items in a SharePoint Online list:

 

 

 

<h1>Get-SPOListItems</h1>

Retrieves all items in a given list

<h3>Parameters</h3>

 

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of a site where you have the list

[string]$AdminPassword,       
Admin's password

[string]$ListName       
ListName. To retrieve a table of list names, you can use Get-SPOList

[bool]$IncludeAllProperties=$false
Specifies whether you should view all the available properties or just the Id and Title. By the default it is set to $false.

 

 

 

The equivalent in Graphic User Interface (GUI) of this cmdlet would be a list view.

 

<h3>Examples</h3>

Get all items in an announcements list
```powershell
Get-SPOListItems -Username  -Url -AdminPassword -ListName
```


 

Get all items in a contacts list and their properties
```powershell
Get-SPOListItems -Username  -Url -AdminPassword -ListName -IncludeAllProperties $true   (example shows only one of multiple retrieved items)
```


Get all items in a list and their properties and export to CSV
```powershell
Get-SPOListItems -Username  -Url -AdminPassword -ListName -IncludeAllProperties $true | Export-CSV 
```
 

Get all contacts from a contact list that belong to a specific company 
```powershell
Get-SPOListItems -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Contacts list" -IncludeAllProperties $true | where {$_.Company -eq "Uogiavv"} | select Title, Company
```


 

 

Get all properties of a document as a list item* 


 

 

 

Get a list of all documents in a document library
```powershell
Get-SPOListItems -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Documents" -IncludeAllProperties $true | select FileLeafRef
```


 

 

Get a list of all documents in a document library, including folders and subfolders
```powershell
Get-SPOListItems -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Documents" -IncludeAllProperties $true -Recursive | select FileLeafRef
```
 

Get a list of all Excel documents in a document library
```powershell
Get-SPOListItems -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Documents"  -IncludeAllProperties $true | where {$_.File_x0020_Type -eq "xlsx"} |select FileLeafRef
```
 



 

Get a list of all Excel documents in a document library and export to CSV
```powershell
Get-SPOListItems -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Documents"  -IncludeAllProperties $true | where {$_.File_x0020_Type -eq "xlsx"} |select FileLeafRef | export-csv
```
 

 

 

 

 

<h1>Get-SPOListFields</h1>

Retrieves all columns in a given list. This includes hidden columns and excluded from views.

 

 

 

<h3>Parameters</h3>

 

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of a site where you have the list

[string]$AdminPassword,       
Admin's password

[string]$ListName       
 

 

<h2>Examples</h2>

Get all fields of a links list
```powershell
Get-SPOListFields -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Links list"
```


 

 



<h2>Requirements</h2>

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

```powershell
# Paths to SDK. Please verify location on your computer.  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
``` 



Technicalities
Get-SPOListItems is using InternalName for item properties
18.01.15 Added recursion and -Recursive switch parameter
