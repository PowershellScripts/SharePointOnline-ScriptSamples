SharePoint Online Module with 2 new cmdlets:

 

Get-SPOFolderByServerRelativeUrl
Get-SPOFileByServerRelativeUrl
 

 

 

Get-SPOFolderByServerRelativeUrl

Get-SPOFileByServerRelativeUrl

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$ParentUrl
Specifies the url of the parent site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file/folder

 

 

Examples

 

Get a file
PS C:\Windows\system32> Get-SPOFileByServerRelativeUrl -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/perm.txt"



 

 

Get folders 
Get-SPOFolderByServerRelativeUrl -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1"



 

 

Requirements

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

 

PowerShell
# Paths to SDK. Please verify location on your computer.    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"     
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
 
 

 

 

 

Let me know about your experience in the Q&A section!
