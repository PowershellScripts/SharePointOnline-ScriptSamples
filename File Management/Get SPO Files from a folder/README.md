Powershell Module with a new cmdlet:

 

<h1>Get-SPOFolderFiles</h1>

Retrieves all files from a folder.  Not recursive.

 
<br/>
<h3>Parameters</h3>

The cmdlet is using the following parameters:

```powershell 
[string]$Username
```
The string specifies admin of the site

```powershell
[string]$Url
```
Specifies the url of the parent site

```powershell
[string]$AdminPassword
```       
Admin's password

```powershell
[string]$ServerRelativeUrl
```
Specifies the relative url of the folder, eg. "/Library/FolderName"


<br/><br/>
<h3>Examples</h3>

Get all files from a folder and their properties
```powershell
Get-SPOFolderFiles -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/fff" 
```

  <img src="../Module for checking in and checking out the files/Filefile1.PNG" width="850">



--- 
Get all files from a folder and list their names and dates of creation
```powershell
Get-SPOFolderFiles -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/fff" | select name, timecreated
```



 
---
Get all files from a folder and export their names and dates of creation to a CSV file
```powershell
Get-SPOFolderFiles -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/fff" | select name, timecreated | export-csv c:\filename.csv
```
 



 

 
---
If you want to get all files from all the folders, you can use Get-SPOFolder cmdlet to retrieve the folders and then for each folder retrieve the files.

 

 

 
<br/>
<h3>Requirements</h3>

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

```powershell
# Paths to SDK. Please verify location on your computer.    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"     
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  ```
```


 

 

<br/><br/>
<b>Enjoy and please share feedback!</b>
