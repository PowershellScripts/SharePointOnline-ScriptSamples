New SharePoint Online Powershell cmdlet Get-SPOListCount which allows you to get the number of SPO lists and libraries. In order to use the cmdlet, you have to import the module using  [Import-Module](https://docs.microsoft.com/pl-pl/powershell/module/Microsoft.PowerShell.Core/Import-Module?view=powershell-5.1) cmdlet.

 

There is no equivalent in Graphic User Interface (GUI) of this cmdlet

### *Parameters*

 

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

<hr>

<h2>Requirements</h2>

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

```powershell
# Paths to SDK. Please verify location on your computer.  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
``` 
<hr> 

<h2>Examples</h2>

 

+ Get a count of lists and libraries in a site
```powershell
Get-SPOListCount -Username user@domain.com -Url https://domain.sharepoint.com/sites/sitecollection/subsite -AdminPassword Pass
```
 

+ Get a count of lists and libraries across a site collection and its subsites
```powershell
Get-SPOListCount -Username user@domain.com -Url https://domain.sharepoint.com/sites/sitecollection -AdminPassword Pass -IncludeSubsites $true
```
 <img src="../GetSPOListCount cmdlet/GetListCount.PNG" width="850">


+ Get a count of lists and libraries across a site collection and its subsites and export it to CSV file
```powershell
Get-SPOListCount -Username user@domain.com -Url https://domain.sharepoint.com/sites/sitecollection -AdminPassword Pass -IncludeSubsites $true | export-CSV C:\listcount.csv
```
 
 <img src="../GetSPOListCount cmdlet/GetListCountCSV.PNG" width="850">



+ Get a count of lists and libraries across whole tenant
```powershell
$colls=Get-SPOSite

for($i=0;$i -lt $colls.Count ;$i++) {Get-SPOListCount -Username user@domain.com -Url $colls[$i].Url -AdminPassword Pass -IncludeSubsites $true }
```
  <img src="../GetSPOListCount cmdlet/GetListCounttenant.PNG" width="850">



You get the count for all sites and subsite + the error for public site.

 
<br/><br/>
<b>Enjoy and please share feedback!</b>

 

### ***For other list management cmdlets:***

[Set-List and 8 others](https://gallery.technet.microsoft.com/scriptcenter/Powershell-Module-for-b88bc2d9)

[Get-SPOList to view and filter list properties](https://gallery.technet.microsoft.com/scriptcenter/GetSPOList-Module-to-view-cc4d3e9e)
