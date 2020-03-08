Powershell Module with one new cmdlet 

 

## **New-SPOListItem**

### *Parameters*

The cmdlet is using the following parameters:
```powershell
 [string]$Username
 ```
The string specifies admin of the site
```powershell
[string]$Url
```
Specifies the url of a site where you have the list
```powershell
[string]$AdminPassword,
```
Admin's password
```powershell
[string]$ListTitle
```
Specifies the title of the list where you want to change the settings.
```powershell
[string]$ItemTitle
```
Specifies the title of the list item. In case of a contact list it will be the LastName, task list -> task name, etc.
```powershell
[string]$AdditionalField=""
```
Optional. If you want to add some additional attribute to the item at the moment of creation. For more attributes use Update-SPOListItem. This parameter defines the internal name of the column
```powershell
[string]$AdditionalValue=""
```
Optional. If you want to add some additional attribute to the item at the moment of creation. For more attributes use Update-SPOListItem. This parameter defines the value that you want to input.

### *Examples*

<img src="../Create new list item using Powershell/Newlistitem.PNG">

### *Requirements*

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the ```.psm1``` file!

```PowerShell
# Paths to SDK. Please verify location on your computer.  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
``` 
 
 <br/><br/>
<b>Enjoy and please share feedback!</b>

 

 
