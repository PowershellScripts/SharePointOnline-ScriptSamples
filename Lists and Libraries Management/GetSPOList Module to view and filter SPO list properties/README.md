New SharePoint Online Powershell cmdlet Get-SPOAllList which allows you to view and filter SPO list properties.

 

There is no equivalent in Graphic User Interface (GUI) of this cmdlet

 

## *Parameters*

 

The cmdlet is using the following parameters:
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
[bool]$IncludeSubsites=$false
```
Specifies whether the cmdlet should check for lists in the subsites as well, by default it is set to $false
```
[bool]$IncludeAllProperties=$false
```
Specifies whether you should view all the available properties or just the Title, Url and Created Date. By the default it is set to $false.

<hr>

## *Requirements*

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!
 

```powershell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
```
<hr>

## *Examples*

 

+ Get a list of all lists and libraries in a site
```powershell
Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com/sites/sitecollection/subsite -AdminPassword Pass
```
<img src="../GetSPOList Module to view and filter SPO list properties/GETSPOALLListsNoProperties.PNG" width="850">

<br/>

+ Get a list of all lists and libraries in a site collection and its subsites
```powershell
Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com/sites/sitecollection/subsite -AdminPassword Pass -IncludeSubsites $true
```
 

+ Export to CSV a list of all lists and libraries in a site collection and its subsites
```powershell
Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com/sites/sitecollection/subsite -AdminPassword Pass -IncludeSubsites $true | export-CSV -path c:\csv.csv
```
 

+ Get a list of all lists and libraries with all their properties
```powershell
Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com -AdminPassword Pass -IncludeAllProperties $true
```
 <img src="../GetSPOList Module to view and filter SPO list properties/GetSPOALLLists.PNG" width="850">


+ Get a specific list
```powershell
Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com -AdminPassword Pass -IncludeAllProperties $true | where {$_.Title -eq "ccc"}
```
 
<img src="../GetSPOList Module to view and filter SPO list properties/GetSPOListOne.PNG" width="850">


 

 

+ Get lists based on criteria
```powershell
Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com -AdminPassword Pass -IncludeAllProperties $true | where {$_.Hidden -eq $true} | select Title, Created
```
 
<img src="../GetSPOList Module to view and filter SPO list properties/GetSPOALLListsHidden.PNG" width="850">


+ Get all document libraries

The property that defines the type of list/library is called **BaseTemplate**. For all the ids check the [MSDN List Template Types](https://docs.microsoft.com/en-us/openspecs/sharepoint_protocols/ms-wssts/8bf797af-288c-4a1d-a14b-cf5394e636cf?redirectedfrom=MSDN)

Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com -AdminPassword Pass -IncludeAllProperties $true | where {$_.BaseTemplate -eq 101} | select Title, Created

 

+ Get all lists and their corresponding types

The property that defines the type of list/library is called **BaseTemplate**. For all the ids check the [MSDN List Template Types](https://docs.microsoft.com/en-us/openspecs/sharepoint_protocols/ms-wssts/8bf797af-288c-4a1d-a14b-cf5394e636cf?redirectedfrom=MSDN)

Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com -AdminPassword Pass -IncludeAllProperties $true | where {$_.BaseTemplate -eq 101} | select Title, Created

 

 <img src="../GetSPOList Module to view and filter SPO list properties/GetListTemplates.PNG" width="850">

<hr> 

# **How not to use the cmdlet:**

Get-SPOList -Username user@domain.com -Url https://domain.sharepoint.com -AdminPassword Pass | where {$_.Hidden -eq $false} 

<img src="../GetSPOList Module to view and filter SPO list properties/NOTTO.PNG" width="850">

<font color="red">If you don't load the properties, you cannot search by them!</font>


 
<br/><br/>
<b>Enjoy and please share feedback!</b>

