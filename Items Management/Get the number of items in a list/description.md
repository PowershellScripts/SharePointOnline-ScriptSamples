New SharePoint Online Powershell cmdlet Get-SPOListItemCount which allows you to view the number of items in a list.

 

 

 

 

Parameters

 

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of a site where you have the list

[string]$AdminPassword,       
Admin's password

[string]$ListTitle
Specifies the title of a list

 

 

Requirements

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

PowerShell
# Paths to SDK. Please verify location on your computer.  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 

 

 

Examples

 



 

 

 

 

 

Let me know about your experience in the Q&A section!
