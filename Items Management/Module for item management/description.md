5 cmdlets for item management:

Update-SPOListItem

Remove-SPOListItem

Remove-SPOListItemPermissions

Remove-SPOListItemInheritance

Restore-SPOListItemInheritance

 

Update-SPOListItem

Updates a property of an item

Parameters

 

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ListTitle
Mandatory. Specifies list title where the item is located

[Int]$ItemID
Mandatory. Specifies item ID

[string]$FieldToUpdate
Mandatory. Specifies the name of the field to update. In order to get the internal names of the fields (more often than not they are different from column titles), you can use Get-SPOListFields

[string]$ValueToUpdate
Mandatory. Specifies the value of the field for this item

 

Example:

 

Change the name of an item (file in this example)


 

Update a column for all items using Get-SPOListItems cmdlet
(Here we will be updating Title column to be called "Title" + the item ID number


 

And the result:



 

 

 

 

 

 

 

 

 

Remove-SPOListItem

 Removes an item

 

Parameters

 

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ListTitle
Mandatory. Specifies list title where the item is located

[Int]$ItemID
Mandatory. Specifies item ID

 

Example:

 

Remove the item no 16 located in one of the subfolders


 

 

 

 

 

 

 

 

Remove-SPOListItemPermissions

 Removes all permissions for an item. Only the user running the cmdlet will have access

 

Parameters

 

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ListTitle
Mandatory. Specifies list title where the item is located

[Int]$ItemID
Mandatory. Specifies item ID

 

Example:

 

Remove the permissions
Remove-SPOListItemPermissions -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ListTitle chc1 -ItemID 4

 



 

 

 

 

Remove-SPOListItemInheritance

Stops inheriting permissions for an item

 

Parameters

 

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ListTitle
Mandatory. Specifies list title where the item is located

[Int]$ItemID
Mandatory. Specifies item ID

 

 

 

Restore-SPOListItemInheritance

Deletes unique permissions for an item

 

Parameters

 

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ListTitle
Mandatory. Specifies list title where the item is located

[Int]$ItemID
Mandatory. Specifies item ID

 

 

 

 

 

 

 

Requirements

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
 
 

 
