SharePoint Online Powershell module including several cmdlets useful for SharePoint Online lists and libraries management.

The cmdlets allow you to set several settings available under Library/List Settings on the portal:

<img src="../Powershell Module for Managing SPO Lists/LibSettings.png">

## *The Cmdlets*
```
Remove-ListInheritance

Remove-SPOList

Restore-ListInheritance

Set-ListCheckout

Set-ListContentTypesEnabled

Set-ListFolderCreationEnabled

Set-ListIRMEnabled

Set-ListMinorVersioning

Set-ListVersioning
```
 

 

The cmdlets are using common parameters:
```
 [string]$Username
 ```
The string specifies admin of the site
```
[string]$Url
```
Specifies the url of a site where you have the list
```
[string]$AdminPassword,       
```
Admin's password
```
[bool]$Enabled=$true
```
Specifies whether the setting should be enabled ($true) or disabled ($false)
```
[string]$ListName
```
Specifies the title of the list where you want to change the settings.

<hr>

## **Requirements** 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!


```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 ```
 
<hr>

## **Examples**

 

**PS C:\Windows\system32**> **Import-Module d:\Powershell\SetListFunctions5.psm1 -Verbose**
```
VERBOSE: Loading module from path 'D:\Powershell\SetListFunctions5.psm1'.

VERBOSE: Importing function 'Remove-ListInheritance'.

VERBOSE: Importing function 'Remove-SPOList'.

VERBOSE: Importing function 'Restore-ListInheritance'.

VERBOSE: Importing function 'Set-ListCheckout'.

VERBOSE: Importing function 'Set-ListContentTypesEnabled'.

VERBOSE: Importing function 'Set-ListFolderCreationEnabled'.

VERBOSE: Importing function 'Set-ListIRMEnabled'.

VERBOSE: Importing function 'Set-ListMinorVersioning'.

VERBOSE: Importing function 'Set-ListVersioning'.
```
**PS C:\Windows\system32**> **Remove-SPOList -Username admin@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -ListName docc -AdminPassword Password**

Done!

<img src="../Powershell Module for Managing SPO Lists/lif.png">

<br/><br/>
<b>Enjoy and please share feedback!</b>

 
