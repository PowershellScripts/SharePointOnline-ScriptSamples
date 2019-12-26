The cmdlet Get-SPOWeb retrieves subsites and their properties

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the parent site

[string]$AdminPassword,       
Admin's password

[bool]$IncludeSubsites=$false
Specifies whether the sub-subsites and subs-subsubsites should be included as well. By default set to $false.

 

Examples

 

Get the subsites and their properties
Get-SPOWeb -Username trial@trialtrial123.onmicrosoft.com -AdminPassword Pass -Url https://trialtrial123.sharepoint.com

 



 

 

 

Get the subsites and the sub-subsites
Get-SPOWeb -Username trial@trialtrial123.onmicrosoft.com -AdminPassword Pass -Url https://trialtrial123.sharepoint.com -IncludeSubsites $true | select url

 



 

 

Get properties of a site in the site collection
Get-SPOWeb -Username trial@trialtrial123.onmicrosoft.com -AdminPassword Pass -Url https://trialtrial123.sharepoint.com -IncludeSubsites $true | where {$_.Title -eq "SomeTitle"}

 



 

 

 

Get all sites in a site collecton based on some criteria
Get-SPOWeb -Username trial@trialtrial123.onmicrosoft.com -AdminPassword Pass -Url https://trialtrial123.sharepoint.com -IncludeSubsites $true | where {$_.Language -eq 1033} | select  url

 



 

 

 

 

<h3> Requirements</h3>

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

PowerShell
# Paths to SDK. Please verify location on your computer.   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
 
 

 

 

Let me know about your experience in the Q&A section!
