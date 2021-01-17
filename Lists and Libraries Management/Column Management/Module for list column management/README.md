SharePoint Online Powershell Module for list column management:

 ```
New-SPOListColumn

New-SPOListChoiceColumn

Set-SPOListColumn

Get-SPOListColumn

Remove-SPOListColumn

Get-SPOListColumnFieldIsObjectPropertyInstantiated

Get-SPOListColumnFieldIsPropertyAvailable
```
 

<hr>

## **New-SPOListColumn**

Creates a new columnin that list

### *Parameters*

The cmdlets share most of the parameters. Use tab to search through them all.
```powershell
 [string]$Username
```
The string specifies admin of the site
```powershell
[string]$Url
```
Specifies the url of a site where you have the list
```powershell
[string]$AdminPassword,
```
Admin's password
```powershell
[string]$ListTitle
```
Specifies the title of the list where you want to add/change the column.
```powershell
[string]$FieldDisplayName
```
Mandatory
```powershell
[string]$Description=""
```
Optional.
```powershell
[string]$Required="false"
```
Optional. Specifies whether the field is required.
```powershell
[string]$Group=""
```
Optional.
```powershell
[string]$StaticName
```
Optional. If not specified, will be set to FieldDisplayName
```powershell
[string]$Name
```
Optional. If not specified, will be set to FieldDisplayName
```powershell
[string]$Version="1"
```
Optional.

<hr>

## **New-SPOListChoiceColumn**

### *Parameters*

The cmdlet is using the following parameters:
```powershell
 [string]$Username
 ```
The string specifies admin of the site
```powershell
[string]$Url
```
Specifies the url of a site where you have the list
```powershell
[string]$AdminPassword,       
```
Admin's password
```powershell
[string]$ListTitle
```
Specifies the title of the list where you want to change the settings.
```powershell
[string]$FieldDisplayName
```
Mandatory
```powershell
[String[]]  $ChoiceNames,
```
Choices that you want to add as options for users to choose. Add each choice after a comma - you can add as many as you like.

e.g. -ChoiceNames choice1, choice2, option3, option5, option100
```powershell
[string]$Description=""
```
Optional.
```powershell
[string]$Required="false"
```
Optional. Specifies whether the field is required.
```powershell
[ValidateSet('Dropdown','Radiobuttons', 'Checkboxes')] [string]$Format="Dropdown",
```
Optional. Specifies the format of the field. By default set to "dropdown"
```powershell
[string]$Group=""
```
Optional.
```powershell
[string]$StaticName
```
Mandatory
```powershell
[string]$Name
```
Mandatory
```powershell
[string]$Version="1"
```
Optional.

 <hr>

## **Set-SPOListColumn**

Sets properties of a column

### *Parameters*

The cmdlet is using the following parameters:
```powershell
 [string]$Username
 ```
The string specifies admin of the site
```powershell
[string]$Url
```
Specifies the url of a site where you have the list
```powershell
[string]$AdminPassword,       
```
Admin's password
```powershell
[string]$ListTitle
```
Specifies the title of the list where you want to change the settings.
```powershell
[string]$FieldDisplayName
```
Mandatory
```powershell
[string]$Description
```
Optional.
```powershell
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
```
Exact descriptions can be found [here](https://docs.microsoft.com/en-us/sharepoint/dev/schema/field-element-field?redirectedfrom=MSDN)

<hr>

## **Get-SPOListColumn**

Gets a column by title or id and displays all its properties

### *Parameters*

The cmdlets share most of the parameters. Use tab to search through them all.
```powershell
 [string]$Username
 ```
The string specifies admin of the site
```powershell
[string]$Url
```
Specifies the url of a site where you have the list
```powershell
[string]$AdminPassword,       
```
Admin's password
```powershell
[string]$ListTitle
```
Specifies the title of the list where you want to add/change the column.
```powershell
[string]$FieldDisplayName
```
Mandatory
```powershell
[string]$ID
```
Optional.

<img src="../Module for list column management/images/getspolistcolumn.png">

<hr> 

## **Remove-SPOListColumn**

Removes a column

### *Parameters*

The cmdlets share most of the parameters. Use tab to search through them all.
```powershell
 [string]$Username
 ```
The string specifies admin of the site
```powershell
[string]$Url
```
Specifies the url of a site where you have the list
```powershell
[string]$AdminPassword,       
```
Admin's password
```powershell
[string]$ListTitle
```
Specifies the title of the list where you want to add/change the column.
```powershell
[string]$FieldDisplayName
```
Mandatory

<hr>

## Examples

 

+ Get Column properties

Get-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Contacts list" -FieldTitle extra_field

<img src="../Module for list column management/images/SPOLisstColumn.PNG">
<hr>

+ Get Column properties and export them to CSV file

Get-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Contacts list" -FieldTitle extra_field  | export-csv c:\csvfilepath.csv
<hr>

+ Set Column properties to $ReadOnly

Set-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pas
ListTitle "contacts list" -FieldTitle "Business Phone" -ReadOnly $true

<img src="../Module for list column management/images/SPOLisstColumn3.PNG"> 
<hr>

+ Require unique values in the column

Set-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass
ListTitle "contacts list" -Indexed $true -EnforceUniqueValues $true -FieldTitle "Business Phone"
 
<img src="../Module for list column management/images/SPOLisstColumn4.PNG">
<hr>

+ Create a new list column  - you can choose any type you want!

New-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass
ListTitle "contacts list" -FieldDisplayName "Business Phone" -FieldType Number

<img src="../Module for list column management/images/SPOLisstColumn6.PNG">

<font color="red">* the properties will be populated automatically</font>
<hr>

+ Set the direction of text in the column from right to left

Set-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass
ListTitle "contacts list" -FieldTitle "Business Phone" -Direction RTL
 
<img src="../Module for list column management/images/SPOLisstColumn7.PNG">
<hr>

+ Remove column

Remove-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Contacts list" -FieldTitle extra_field

<hr>

+ Create a new choice column and set available choices
 
New-SPOListChoiceColumn -Username  -Url https://tenant.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Contacts list" -FieldDisplayName elp -Description "desdes"-Required true -ChoiceNames bio, ewe, ewe, ewewe

<img src="../Module for list column management/images/choicecolumn.png">

Results:

<img src="../Module for list column management/images/choicecolumn2.png">


## Requirements

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

```PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
 ```
 
Let me know about your experience in the Q&A section!

EDITS:

25/01/15 Fixed the checkboxes thanks to [this blog](http://svengillis.blogspot.com/2008/03/display-choices-using-checkboxes-allow.html)
