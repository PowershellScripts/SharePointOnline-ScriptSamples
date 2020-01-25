New SharePoint Online Powershell cmdlet to create list.

The list can follow any of the below templates:

 GenericList	Custom list. Value = 100.
 	DocumentLibrary	Document library. Value = 101.
 	Survey	Survey. Value = 102.
 	Links	Links. Value = 103.
 	Announcements	Announcements. Value = 104.
 	Contacts	Contacts. Value = 105.
 	Events	Calendar. Value = 106.
 	Tasks	Tasks. Value = 107.
 	DiscussionBoard	Discussion board. Value = 108.
 	PictureLibrary	Picture library. Value = 109.
 	DataSources	Data sources for a site. Value = 110.
 	WebTemplateCatalog	Site template gallery. Value = 111.
 	UserInformation	User Information. Value = 112.
 	WebPartCatalog	Web Part gallery. Value = 113.
 	ListTemplateCatalog	List Template gallery. Value = 114.
 	XMLForm	XML Form library. Value = 115.
 

 Full list of template types

 

 

New-SPOList

Adds a list to an existing site

 

## Parameters

The cmdlet is using the following parameters:

 [string]$Username
The string specifies admin of the site

[string]$Url
Specifies the url of the site

[string]$AdminPassword,       
Admin's password

[string]$Title,      
Specifies the title of the list

[int]$TemplateType=100,  
Optional. The template type defines whether the list will be a contact list, tasks, announcements, etc. The full list of template types can be found here. By default it is set to "Custom list" (generic list).

[string]$Description="", 
Optional. Sets the description of the list.

[Int]$DocumentTemplateType,
Optional. Sets the document template type

[GUID]$TemplateFeatureID,   
Optional. Sets the template feature id

[string]$ListUrl=""
Optional. Sets the url of the list. If not specified, the url will be the same as the title.

 

 

 

## Examples 

 

Create a custom list titled "fromps" (template type doesn't have to be specified)
New-SPOList -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -Title "fromps" -TemplateType 100 -Description "desc" -Verbose

List  fromps  has been added to  https://trialtrial123.sharepoint.com

 

Create a contacts list entitled "contacts"
New-SPOList -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -Title "contacts" -TemplateType 105 -Description "desc" -Verbose

List  contacts  has been added to  https://trialtrial123.sharepoint.com

 

Trying to create a list with the same name will throw an error:
New-SPOList -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -Title "contacts" -TemplateType 107 -Description "desc" -Verbose

 



 

Create a tasks list entitled "tasks"
New-SPOList -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/psweb2/psweb2 -AdminPassword Pass -Title "tasks" -TemplateType 107 -Description "desc" -Verbose

List  tasks  has been added to  https://trialtrial123.sharepoint.com/psweb2/psweb2

Trying to create a list with invalid template type will throw an error 
New-SPOList -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/psweb2/psweb2 -AdminPassword Pass -Title "tasks" -TemplateType 1110 -Description "desc" -Verbose

Exception calling "ExecuteQuery" with "0" argument(s): "Modèle de liste non valide."

 



 

 

Creating list with a url different from the title & more examples


 

 

 

## Requirements

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer.    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"     
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
``` 
 

 

<br/><br/>
<b>Enjoy and please share feedback!</b>
