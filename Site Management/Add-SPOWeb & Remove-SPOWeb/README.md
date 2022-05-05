2 new SharePoint Online Powershell cmdlets to help you manage sites and subsites in your SharePoint Online subscription:

## Add-SPOWeb

Adds a subsite to an exisiting site collection

 

## *Parameters*

The cmdlet is using the following parameters:

- [string]$Username

The string specifies admin of the site

- [string]$ParentUrl

Specifies the url of the parent site

- [string]$AdminPassword,       

Admin's password

- [string]$Title,      

Specifies the title of the site

- [bool]$UseSamePermissionsAsParentSite=$true,   

Whether the site should use the same permissions as parent site. By default it is set to true

- [string]$Description="",    

Site description, not mandatory

- [Int]$Language,  

The language of the site. For English choose 1033. For other languages choose the correct [id](https://docs.microsoft.com/pl-pl/SharePoint/install/install-or-uninstall-language-packs?redirectedfrom=MSDN).

- [string]$Url,      

Url of the new site, avoid spaces.

- [string]$WebTemplate="STS#0"

Template of the site, e.g. teamsite, publishing portal, enterprise wiki. By default set to Teamsite template. For other template types, check [here](https://docs.microsoft.com/pl-pl/archive/blogs/)

 

## Remove-SPOWeb

Removes a subsite from a site collection.

 

 

### *Parameters*

The cmdlet is using the following parameters:

- [string]$Username

The string specifies admin of the site

- [string]$Url

Specifies the url of the site

- [string]$AdminPassword,       

Admin's password

- [bool]$RemoveSubsites=$true

If set to false, the cmdlet will ask for additional permissions if it encounters sub-sites of the site being removed. As long as one of the subsites exists, the site will never be removed. By default set to $true.

 

 

*Examples* 

 

Add-SPOWeb -Username trial@trialtrial123.onmicrosoft.com -ParentSiteUrl https://trialtrial123.sharepoint.com -AdminPassword Passs -Title psweb -UseSamePermissionsAsParentSite $true -Description psweb1 -Language 1033 -Url psweb -WebTemplate "STS#0

 

 

Add-SPOWeb -Username trial@trialtrial123.onmicrosoft.com -ParentSiteUrl https://trialtrial123.sharepoint.com -AdminPassword Pass -Title psweb2 -UseSamePermissionsAsParentSite $true -Description psweb1 -Language1036 -Url psweb2 -WebTemplate "STS#0

 

Remove-SPOWeb -Username trial@trialtrial123.onmicrosoft.com -AdminPassword Pass -Url https://trialtrial123.sharepoint.com/psweb

<img src="../Add-SPOWeb & Remove-SPOWeb/AddandRemoveSPOWeb.png">

*Requirements*

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the ```.psm1``` file!

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer.   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
 ```
 

 

## Let me know about your experience in the Q&A section!
