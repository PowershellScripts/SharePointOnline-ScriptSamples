SharePoint Online Module with 2 new cmdlets:

 
```powershell
Get-SPOFolderByServerRelativeUrl
Get-SPOFileByServerRelativeUrl
 ```

 

 

Get-SPOFolderByServerRelativeUrl

Get-SPOFileByServerRelativeUrl

 

<h3>Parameters</h3>

The cmdlet is using the following parameters:
```powershell
 [string]$Username
 ```
The string specifies admin of the site
```powershell
[string]$ParentUrl
```
Specifies the url of the parent site
```powershell
[string]$AdminPassword 
```
Admin's Password
```powershell
[string]$ServerRelativeUrl
```
Specifies the relative url of a file/folder

 

 

<h3>Examples</h3>

 

Get a file
```powershell
 Get-SPOFileByServerRelativeUrl -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/perm.txt"
```


 

 

Get folders 
```powershell
Get-SPOFolderByServerRelativeUrl -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1"
```


 

 

<h3> Requirements </h3>

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

```powershell
# Paths to SDK. Please verify location on your computer.    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"     
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
``` 
 

 
 

<br/><br/>
<b>Enjoy and please share feedback!</b>
