A short one-cmdlet Powershell module that adds another cmdlet to your set of cmdlets. Import the module to make the cmdlet available.

 

New-SPOListColumnWithProperties

 

 

 

## Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of a site where you have the list

[string]$AdminPassword,       
Admin's password

[string]$ListTitle
Specifies the title of the list where you want to change the settings.

[string]$FieldDisplayName
Mandatory

[string]$Description=""
Optional.

[string]$Required="false"
Optional. Specifies whether the field is required.

[string]$Group=""
Optional.

[string]$StaticName
Mandatory

[string]$Name
Mandatory

[string]$Version="1"
Optional.

 

 

 

 

 

 

## Requirements

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer.    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"     
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
```

<br/><br/>
<b>Enjoy and please share feedback!</b>
 

