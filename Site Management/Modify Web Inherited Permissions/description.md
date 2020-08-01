Powershell Module with 2 new cmdlets:

Remove-SPOWebInheritance

Restore-SPOWebInheritance

---
## Restore-SPOWebInheritance

### Parameters

The cmdlet is using the following parameters:

- [string]$Username

The string specifies admin of the site

- [string]$ParentUrl

Specifies the url of the parent site

- [string]$AdminPassword,  
 
---
## Remove-SPOWebInheritance

##Parameters

The cmdlet is using the following parameters:

- [string]$Username

The string specifies admin of the site

- [string]$ParentUrl

Specifies the url of the parent site

- [string]$AdminPassword,    

Admin's password

- [bool]$CopyRoleAssignments=$true

Whether the site should keep its current permissions

- [bool]$clearSubscopes=$false
 
---
## Examples

**Restore-SPOWebInheritance -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/psweb2/psweb2 -AdminPassword Pass**

Site  https://trialtrial123.sharepoint.com/psweb2/psweb2  inherits permissions from its parent.

**Remove-SPOWebInheritance -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/psweb2/psweb2 -AdminPassword Pass -CopyRoleAssignments $true**

<img src="../Modify Web Inherited Permissions/images/WEbInheritance.PNG">

That gives us:

<img src="../Modify Web Inherited Permissions/images/WEbInheritance2.PNG"> 

But if we set the CopyRoleAssignments to $false:

**Remove-SPOWebInheritance -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/psweb2/psweb2 -AdminPassword Pass -CopyRoleAssignments $false**

<img src="../Modify Web Inherited Permissions/images/WEbInheritance3.PNG">

### *Requirements*

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

```PowerShell
# Paths to SDK. Please verify location on your computer.    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"     
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
 ```
### Let me know about your experience in the Q&A section!

 
