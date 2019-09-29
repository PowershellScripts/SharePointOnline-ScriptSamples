New SharePoint Online Powershell cmdlet Get-SPOAllList which allows you to view and filter SPO list properties.

 

There is no equivalent in Graphic User Interface (GUI) of this cmdlet

 

 

 

Parameters

 

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of a site where you have the list

[string]$AdminPassword,       
Admin's password

[bool]$IncludeSubsites=$false
Specifies whether the cmdlet should check for lists in the subsites as well, by default it is set to $false

[bool]$IncludeAllProperties=$false
Specifies whether you should view all the available properties or just the Title, Url and Created Date. By the default it is set to $false.

 

 

 

 

Requirements

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

 

 

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
 

 

Examples

 

Get a list of all lists and libraries in a site
Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com/sites/sitecollection/subsite -AdminPassword Pass

<img alt="Edit control" src="../images/design-authoring-edit-01.png" width="850">

<br/>

Get a list of all lists and libraries in a site collection and its subsites
Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com/sites/sitecollection/subsite -AdminPassword Pass -IncludeSubsites $true

 

Export to CSV a list of all lists and libraries in a site collection and its subsites
Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com/sites/sitecollection/subsite -AdminPassword Pass -IncludeSubsites $true | export-CSV -path c:\csv.csv

 

 

Get a list of all lists and libraries with all their properties
Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com -AdminPassword Pass -IncludeAllProperties $true

 



 

 

Get a specific list
Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com -AdminPassword Pass -IncludeAllProperties $true | where {$_.Title -eq "ccc"}

 



 

 

Get lists based on criteria
Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com -AdminPassword Pass -IncludeAllProperties $true | where {$_.Hidden -eq $true} | select Title, Created

 



 

 

 

Get all document libraries
The property that defines the type of list/library is called BaseTemplate. For all the ids check the MSDN List Template Types

Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com -AdminPassword Pass -IncludeAllProperties $true | where {$_.BaseTemplate -eq 101} | select Title, Created

 

Get all lists and their corresponding types
The property that defines the type of list/library is called BaseTemplate. For all the ids check the MSDN List Template Types

Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com -AdminPassword Pass -IncludeAllProperties $true | where {$_.BaseTemplate -eq 101} | select Title, Created

 

 



 

 

 

 

 

How not to use the cmdlet:

Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com -AdminPassword Pass | where {$_.Hidden -eq $false} 



If you don't load the properties, you cannot search by them!

 

 

 

 

 

 

Let me know about your experience in the Q&A section!
