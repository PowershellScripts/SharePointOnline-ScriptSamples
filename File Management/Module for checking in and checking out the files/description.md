3 new Powershell cmdlets for SharePoint Online

 

<h1>Set-SPOFileCheckout</h1>

 

<h3>Parameters</h3>

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

 

 

<h1>Approve-SPOFile</h1>


<h3>Parameters</h3>

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file/folder

[string]$ApprovalComment=""
Optional. Specifies the approval comment.

 

 

<h1>Set-SPOFileCheckin</h1>


<h3>Parameters</h3>

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

[System.String]$CheckInType,
Specifies the checin type. You can tab through 3 of the values:

[ValidateSet('MajorCheckIn','MinorCheckIn','OverwriteCheckIn')]

 

[string]$CheckinComment=""
 Optional. Specifiesthe checkincomment

 

 

 

<h1>Examples</h1>

 

 

* Check-out a file
```powershell
Set-SpoFileCheckout -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/perm.txt" -Verbose
```
perm.txt  has been checked out

 <img src="../Module for checking in and checking out the files/Filefile1.PNG" width="850">



 

 

 

* Check-in a file
```powershell
Set-SpoFileCheckin -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/perm.txt" -CheckInType MinorCheckIn
```
perm.txt  has been checked in

 

* Approve a file
```powershell
Approve-SpoFile -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/perm.txt"
```
perm.txt  has been approved

 

* Approve all files in a folder using Get-SPOFolderFiles cmdlet
 
```powershell
 $serverurls=(Get-SPOFolderFiles -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/fff").ServerRelativeUrl

foreach( $url in $serverurls) {Approve-SPOFile -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl $url -ApprovalComment "comm"}
```
 <img src="../Module for checking in and checking out the files/Filefile11.PNG" width="850">

 
 

<h1>Requirements</h1>

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 
```powershell
# Paths to SDK. Please verify location on your computer.     
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"      
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
```
 

 

<br/><br/>
<b>Enjoy and please share feedback!</b>
 
