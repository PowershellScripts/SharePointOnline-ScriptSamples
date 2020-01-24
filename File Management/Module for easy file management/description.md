Several new SharePoint Online cmdlets for file management:

 

Approve-SPOFile

Set-SPOFileCheckin

Set-SPOFileCheckout

Copy-SPOFile

Set-SPOFile

Remove-SPOFile

Deny-SPOFileApproval

Get-SPOFileIsPropertyAvailable

Move-SPOFile

Publish-SPOFile

Undo-SPOFileCheckout

Undo-SPOFilePublish

 

 

 

Set-SPOFileCheckout

 

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

 

 

Approve-SPOFile

 

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

[string]$ApprovalComment=""
Optional. Specifies the approval comment.

 

 

Set-SPOFileCheckin

 

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

[System.String]$CheckInType,
Specifies the checin type. You can tab through 3 of the values:

[ValidateSet('MajorCheckIn','MinorCheckIn','OverwriteCheckIn')]

[string]$CheckinComment=""
 Optional. Specifiesthe checkincomment

 

 

 

Copy-SPOFile

 

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

[string]$DestinationLibrary, 
Mandatory. Specifies the url of a destination library      

[bool]$Overwrite=$true
Optional.        

[string]$NewName=""
Optional. If no new name is provided, the file will keep its old name

 

 

Remove-SPOFile

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

 

 

 

Deny-SPOFileApproval

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

[string]$ApprovalComment
 

 

Get-SPOFileIsPropertyAvailable



Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

[string]$PropertyName
 

 

 

Move-SPOFile

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

[string]$DestinationLibrary, 
Mandatory. Specifies the url of a destination library      

[bool]$Overwrite=$true
Optional.        

[string]$NewName=""
Optional. If no new name is provided, the file will keep its old name

 

 

Publish-SPOFile

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

[string]$Comment
 

 

 

Undo-SPOFileCheckout

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

 

 

Publish-SPOFile

 

Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword, 
Admin's Password

[string]$ServerRelativeUrl
Specifies the relative url of a file

[string]$Comment
 

 

Examples

 

copy a file to another library
Copy-SPOFile -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/perm
.txt" -DestinationLibrary "/chc2/"
perm.txt  has been copied to /chc2/


Copy-SPOFile -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/perm
.txt" -DestinationLibrary "/chc2/"  -Overwrite $false

// Will return an error because such file already exists. If you want to copy the same file twice, you need either to set overwrite to $true or change the file name

Copy-SPOFile -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/perm
.txt" -DestinationLibrary "/chc2/"  -Overwrite $false -NewName "SomeNewName"

 



 

 



 

Deny approval for a file
 

 Deny-SPOFileApproval -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/c
hc1/perm.txt"
perm.txt  has been denied
Deny-SPOFileApproval -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/c
hc1/perm.txt"  -ApprovalComment "commenting...."
perm.txt  has been denied

 



 

 

Check if the file has such a property
 Get-SPOFileIsPropertyAvailable -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/perm.txt" -propertyName Name
True
Get-SPOFileIsPropertyAvailable -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/perm.txt" -propertyName Scrabble
False

 

 

 

Move file to another library (the difference between moving and copying a file is that copying creates another instance of the file, so in the end you have 2. Afer you move a file, you still have 1)
Move-SPOFile -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/Docu
ment.docx" -DestinationLibrary "/chc2/"
Document.docx  has been moved to  /chc2/Document.docx

Move-SPOFile -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc2/Docu
ment.docx" -DestinationLibrary "/chc1/"
Document.docx  has been moved to  /chc1/Document.docx

 



 

Approve a file
Approve-SPOFile -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/D

ocument.docx"
Document.docx  has been approved

 

Undo the publishing
Undo-SPOFilePublish -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/ch
c1/Document.docx"
Document.docx  has been unpublished

 

Publish a file
Publish-SPOFile -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/D
ocument.docx"
Document.docx  has been published

 

 



 



Check out a file
Set-SPOFileCheckout -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/Document.docx"
Document.docx  has been checked out

 

Check in a file
Set-SPOFileCheckin -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc
1/Document.docx" -CheckInType MinorCheckIn
Document.docx  has been checked in

Set-SPOFileCheckin -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/Document.docx" -CheckInType MajorCheckIn

 Document.docx  has been checked in

 



 

 

Undo the checkout
Undo-SPOFileCheckout -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/c

hc1/Document.docx"

 

Remove a file
Remove-SPOFile -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -ServerRelativeUrl "/chc1/Do
cument.docx"
Document.docx  has been deleted

 



 

 

 

 

 

 

 

 

 

Requirements

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer.     
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"      
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
``` 
 

 

 

 

<br/><br/>
<b>Enjoy and please share feedback!</b>
