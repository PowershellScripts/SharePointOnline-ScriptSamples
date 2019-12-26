SharePoint Online Powershell Module for list column management:

 

New-SPOListColumn

New-SPOListChoiceColumn

Set-SPOListColumn

Get-SPOListColumn

Remove-SPOListColumn

Get-SPOListColumnFieldIsObjectPropertyInstantiated

Get-SPOListColumnFieldIsPropertyAvailable

 

 

New-SPOListColumn

Creates a new columnin that list

Parameters

The cmdlets share most of the parameters. Use tab to search through them all.

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of a site where you have the list

[string]$AdminPassword,       
Admin's password

[string]$ListTitle
Specifies the title of the list where you want to add/change the column.

[string]$FieldDisplayName
Mandatory

[string]$Description=""
Optional.

[string]$Required="false"
Optional. Specifies whether the field is required.

[string]$Group=""
Optional.

[string]$StaticName
Optional. If not specified, will be set to FieldDisplayName

[string]$Name
Optional. If not specified, will be set to FieldDisplayName

[string]$Version="1"
Optional.

 

 

 

 

New-SPOListChoiceColumn

 

 

Parameters

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

[String[]]  $ChoiceNames,
Choices that you want to add as options for users to choose. Add each choice after a comma - you can add as many as you like.

e.g. -ChoiceNames choice1, choice2, option3, option5, option100

[string]$Description=""
Optional.

[string]$Required="false"
Optional. Specifies whether the field is required.

[ValidateSet('Dropdown','Radiobuttons', 'Checkboxes')] [string]$Format="Dropdown",
Optional. Specifies the format of the field. By default set to "dropdown"

[string]$Group=""
Optional.

[string]$StaticName
Mandatory

[string]$Name
Mandatory

[string]$Version="1"
Optional.

 

 

 

 

Set-SPOListColumn

Sets properties of a column

 

 

 

Parameters

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

[string]$Description
Optional.

[string]$Direction
$EnforceUniqueValues
[string]$Group
[bool]$Hidden
[bool]$Indexed
[string]$JSLink
[bool]$ReadOnlyField
[bool]$Required
[string]$SchemaXML
[string]$StaticName
[string]$Tag
[string]$FieldTitle
Exact descriptions can be found here

 

 

 

Get-SPOListColumn

Gets a column by title or id and displays all its properties

 

Parameters

The cmdlets share most of the parameters. Use tab to search through them all.

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of a site where you have the list

[string]$AdminPassword,       
Admin's password

[string]$ListTitle
Specifies the title of the list where you want to add/change the column.

[string]$FieldDisplayName
Mandatory

[string]$ID
Optional.

 

 

 



 

 

 

 

 

 

 

Remove-SPOListColumn

 

Removes a column

 

Parameters

The cmdlets share most of the parameters. Use tab to search through them all.

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of a site where you have the list

[string]$AdminPassword,       
Admin's password

[string]$ListTitle
Specifies the title of the list where you want to add/change the column.

[string]$FieldDisplayName
Mandatory

 

 

 

 

 

Examples

 

Get Column properties
Get-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Contacts list" -FieldTitle extra_field

 

 



 

 

Get Column properties and export them to CSV file
Get-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Contacts list" -FieldTitle extra_field  | export-csv c:\csvfilepath.csv

 

 

Set Column properties to $ReadOnly
Set-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pas
ListTitle "contacts list" -FieldTitle "Business Phone" -ReadOnly $true



 

 

Require unique values in the column
Set-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass
ListTitle "contacts list" -Indexed $true -EnforceUniqueValues $true -FieldTitle "Business Phone"
 



 

 

 

 

 

Create a new list column  - you can choose any type you want!
New-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass
ListTitle "contacts list" -FieldDisplayName "Business Phone" -FieldType Number
 

 



* the properties will be populated automatically

 

 

 

 

 

 

 

Set the direction of text in the column from right to left
Set-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass
ListTitle "contacts list" -FieldTitle "Business Phone" -Direction RTL
 



 

 

 

Remove column
Remove-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Contacts list" -FieldTitle extra_field

 

 

Create a new choice column and set available choices
 

New-SPOListChoiceColumn -Username  -Url https://tenant.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Contacts list" -FieldDisplayName elp -Description "desdes"-Required true -ChoiceNames bio, ewe, ewe, ewewe

 



 

 

Results:

 



 

 

 

 

 

 

Requirements

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

 

PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
 
 
 

 

 

 

 

 

 

 

 

Let me know about your experience in the Q&A section!

 

 

 

 

EDITS:

25/01/15 Fixed the checkboxes thanks to this blog
