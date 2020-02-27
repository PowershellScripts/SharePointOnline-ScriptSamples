5 cmdlets for item management:
</br><b>
Update-SPOListItem

Remove-SPOListItem

Remove-SPOListItemPermissions

Remove-SPOListItemInheritance

Restore-SPOListItemInheritance
</b>
 

## **Update-SPOListItem**

Updates a property of an item

### *Parameters*

The cmdlet is using the following parameters:
```powershell
 [string]$Username
```
The string specifies admin of the site
```powershell
[string]$Url
```
Specifies the url of the site
```powershell
[string]$AdminPassword,
```
Admin's Password
```powershell
[string]$ListTitle
```
Mandatory. Specifies list title where the item is located
```powershell
[Int]$ItemID
```
Mandatory. Specifies item ID
```powershell
[string]$FieldToUpdate
```
Mandatory. Specifies the name of the field to update. In order to get the internal names of the fields (more often than not they are different from column titles), you can use [Get-SPOListFields](https://gallery.technet.microsoft.com/scriptcenter/GetSpoListItems-and-a8ecd5fa)
```powershell
[string]$ValueToUpdate
```
Mandatory. Specifies the value of the field for this item

 <hr>

## *Example:*

 

+ Change the name of an item (file in this example)

<img src="../Module for item management/images/LisItemFunctionsUpdate.png">
 

+ Update a column for all items using [Get-SPOListItems cmdlet](https://gallery.technet.microsoft.com/scriptcenter/GetSpoListItems-and-a8ecd5fa)

(Here we will be updating Title column to be called "Title" + the item ID number

<img src="../Module for item management/images/LisItemFunctionsUpdate2.png">
 

And the result:

<img src="../Module for item management/images/LisItemFunctionsUpdate3.png">

<hr>

## **Remove-SPOListItem**

 Removes an item

### *Parameters*

The cmdlet is using the following parameters:
```powershell
 [string]$Username
 ```
The string specifies admin of the site
```powershell
[string]$Url
```
Specifies the url of the site
```powershell
[string]$AdminPassword,
```
Admin's Password
```powershell
[string]$ListTitle
```
Mandatory. Specifies list title where the item is located
```powershell
[Int]$ItemID
```
Mandatory. Specifies item ID

## *Example:*


+ Remove the item no 16 located in one of the subfolders

<img src="../Module for item management/images/LisItemFunctionsRemove.png"> 

## **Remove-SPOListItemPermissions**

 Removes all permissions for an item. Only the user running the cmdlet will have access

### *Parameters* 

The cmdlet is using the following parameters:
```powershell
 [string]$Username
 ```
The string specifies admin of the site
```powershell
[string]$Url
```
Specifies the url of the site
```powershell
[string]$AdminPassword,
```
Admin's Password
```powershell
[string]$ListTitle
```
Mandatory. Specifies list title where the item is located
```powershell
[Int]$ItemID
```
Mandatory. Specifies item ID

 

## *Example:*

 

+ Remove the permissions

Remove-SPOListItemPermissions -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ListTitle chc1 -ItemID 4

<img src="../Module for item management/images/RemoveItemPermissions.png">

<hr>

## **Remove-SPOListItemInheritance**

Stops inheriting permissions for an item

### *Parameters*

The cmdlet is using the following parameters:
```powershell
 [string]$Username
 ```
The string specifies admin of the site
```powershell
[string]$Url
```
Specifies the url of the site
```powershell
[string]$AdminPassword,
```
Admin's Password
```powershell
[string]$ListTitle
```
Mandatory. Specifies list title where the item is located
```powershell
[Int]$ItemID
```
Mandatory. Specifies item ID

<hr>

## **Restore-SPOListItemInheritance**

Deletes unique permissions for an item

### *Parameters*

 

The cmdlet is using the following parameters:
```powershell
 [string]$Username
 ```
The string specifies admin of the site
```powershell
[string]$Url
```
Specifies the url of the site
```powershell
[string]$AdminPassword, 
```
Admin's Password
```powershell
[string]$ListTitle
```
Mandatory. Specifies list title where the item is located
```powershell
[Int]$ItemID
```
Mandatory. Specifies item ID

## *Requirements*

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
```


 <br/><br/>
<b>Enjoy and please share feedback!</b>
 

 
