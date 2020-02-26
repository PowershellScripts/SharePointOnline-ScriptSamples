New SharePoint Online Powershell cmdlet

 

Get-SPOFolderFilesCount

Retrieves the number of files in a given folder 

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword,       
Admin's password

[string]$ServerRelativeUrl,      
Specifies the relative url of the folder

 

 

 

 

Examples 

 

Get-SPOFolderFilesCount -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1" -Verbose
4



 

 

 

 

Requirements

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

````PowerShell
# Paths to SDK. Please verify location on your computer.  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
``` 
 

 

 

<br/><br/>
<b>Enjoy and please share feedback!</b>