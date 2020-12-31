New SharePoint Online Powershell cmdlet to create list.

The list can follow any of the below templates:

 GenericList | Custom list. Value = 100. | -
 --- | --- | ---
_ | DocumentLibrary | Document library. Value = 101.
_ | Survey | Survey. Value = 102.
_ | Links | Links. Value = 103.
_ | Announcements | Announcements. Value = 104.
_ | Contacts | Contacts. Value = 105.
_ | Events | Calendar. Value = 106.
_ | Tasks | Tasks. Value = 107.
_ | DiscussionBoard | Discussion board. Value = 108.
_ | PictureLibrary | Picture library. Value = 109.
_ | DataSources | Data sources for a site. Value = 110.
_ | WebTemplateCatalog | Site template gallery. Value = 111.
_ | UserInformation | User Information. Value = 112.
_ | WebPartCatalog | Web Part gallery. Value = 113.
_ | ListTemplateCatalog | List Template gallery. Value = 114.
_ |XMLForm | XML Form library. Value = 115.
 

 [Full list of template types](https://docs.microsoft.com/en-us/previous-versions/office/sharepoint-server/ms413878(v=office.15)?redirectedfrom=MSDN)

<hr>

## **New-SPOList**

Adds a list to an existing site

 

### *Parameters*

The cmdlet is using the following parameters:
```
 [string]$Username
 ```
The string specifies admin of the site
```
[string]$Url
```
Specifies the url of the site
```
[string]$AdminPassword,       
```
Admin's password
```
[string]$Title,      
```
Specifies the title of the list
```
[int]$TemplateType=100,  
```
Optional. The template type defines whether the list will be a contact list, tasks, announcements, etc. The full list of template types can be found [here](https://docs.microsoft.com/en-us/previous-versions/office/sharepoint-server/ms413878(v=office.15)?redirectedfrom=MSDN). By default it is set to "Custom list" (generic list).
```
[string]$Description="", 
```
Optional. Sets the description of the list.
```
[Int]$DocumentTemplateType,
```
Optional. Sets the document template type
```
[GUID]$TemplateFeatureID,   
```
Optional. Sets the template feature id
```
[string]$ListUrl=""
```
Optional. Sets the url of the list. If not specified, the url will be the same as the title.

 <hr>

## **Examples**

 

+ Create a custom list titled "fromps" (template type doesn't have to be specified)

New-SPOList -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -Title "fromps" -TemplateType 100 -Description "desc" -Verbose

List  fromps  has been added to  https://trialtrial123.sharepoint.com

+ Create a contacts list entitled "contacts"

New-SPOList -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -Title "contacts" -TemplateType 105 -Description "desc" -Verbose

List  contacts  has been added to  https://trialtrial123.sharepoint.com

 

+ Trying to create a list with the same name will throw an error:

New-SPOList -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com -AdminPassword Pass -Title "contacts" -TemplateType 107 -Description "desc" -Verbose

<img src="../Create SPO list with a Powershell cmdlet/images/NEWSPOList2.PNG">

+ Create a tasks list entitled "tasks"

New-SPOList -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/psweb2/psweb2 -AdminPassword Pass -Title "tasks" -TemplateType 107 -Description "desc" -Verbose

List  tasks  has been added to  https://trialtrial123.sharepoint.com/psweb2/psweb2

+ Trying to create a list with invalid template type will throw an error 

New-SPOList -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/psweb2/psweb2 -AdminPassword Pass -Title "tasks" -TemplateType 1110 -Description "desc" -Verbose

Exception calling "ExecuteQuery" with "0" argument(s): "Modèle de liste non valide."

<img src="../Create SPO list with a Powershell cmdlet/images/NEWSPOList3.PNG">

Creating list with a url different from the title & more examples

<img src="../Create SPO list with a Powershell cmdlet/images/NEWSPOList4.PNG">

<hr>

## *Requirements*

 

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!


```PowerShell
# Paths to SDK. Please verify location on your computer.    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"     
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
``` 
 

 

<br/><br/>
<b>Enjoy and please share feedback!</b>
