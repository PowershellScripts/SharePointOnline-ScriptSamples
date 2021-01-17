Powershell Module that allows you to add a new column to a SharePoint Online list, using the following cmdlet:

**New-SPOListColumn**

Import the module using import-module and use the cmdlet whenever you want!

 

## Parameters

The cmdlet is using the following parameters:
</br>```[string]$Username```

The string specifies admin of the site
</br>```[string]$Url```

Specifies the url of a site where you have the list
</br>```[string]$AdminPassword,```  

Admin's password
</br>```[string]$ListTitle```

Specifies the title of the list where you want to change the settings.
</br>```[string]$FieldDisplayName```

Mandatory. Specifies the display name of the column
</br>```[System.String]$FieldType```

Mandatory. Specifies the type of the field. You can choose among:

 'AllDayEvent','Attachments','Boolean', 'Calculate', 'Choice', 'Computed', 'ContenttypeID', 'Counter', 'CrossProjectLink', 'Currency', 'DateTime', 'Error', 'File', 'Geolocation', 'GridChoice', 'Guid', 'Integer', 'Invalid', 'Lookup', 'MaxItems', 'ModStat', 'MultiChoice', 'Note', 'Number', 'OutcomeChoice', 'PageSeparator', 'Recurrence', 'Text', 'ThreadIndex', 'Threading', 'Url','User', 'WorkflowEventType', 'WorkflowStatus'

 

It corresponds to GUI:

<img src="../Create a new column in list/NewspoList.png">

## Examples

 <img src="../Create a new column in list/SPOLisstColumn6.PNG">

 New-SPOListColumn -Username trial@trialtrial123.onmicrosoft.com -Url https://tenant.sharepoint.com -AdminPassword Pass -LisTitle "contacts list" -FieldDisplayName "Business Phone" -FieldType Number

 

 The properties will be populated later on

 

## Requirements

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

```PowerShell
# Paths to SDK. Please verify location on your computer.   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
``` 


<br/><br/>
<b>Enjoy and please share feedback!</b>

 
