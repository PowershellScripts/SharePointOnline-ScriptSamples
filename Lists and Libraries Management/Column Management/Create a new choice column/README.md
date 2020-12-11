Powershell module with a new cmdlet 

```New-SPOListChoiceColumn```

 

Import the module to make the cmdlet available.

 

## Parameters

The cmdlet is using the following parameters:
</br>``` [string]$Username```

The string specifies admin of the site
</br>```[string]$Url```

Specifies the url of a site where you have the list
</br>```[string]$AdminPassword``` 

Admin's password
</br>```[string]$ListTitle```

Specifies the title of the list where you want to change the settings.
</br>```[string]$FieldDisplayName```

Mandatory
</br>```[String[]]  $ChoiceNames```

Choices that you want to add as options for users to choose. Add each choice after a comma - you can add as many as you like.

e.g. -ChoiceNames choice1, choice2, option3, option5, option100
</br>```[string]$Description=""```

Optional.
</br>```[string]$Required="false"```

Optional. Specifies whether the field is required.
</br>```[ValidateSet('Dropdown','Radiobuttons', 'Checkboxes')] [string]$Format="Dropdown"```

Optional. Specifies the format of the field. By default set to "dropdown"
</br>```[string]$Group=""```

Optional.
</br>```[string]$StaticName```

Mandatory
</br>```[string]$Name```

Mandatory
</br>```[string]$Version="1"```

Optional.


## Examples

```PowerShell 
New-SPOListChoiceColumn -Username  -Url https://tenant.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "Contacts list" -FieldDisplayName elp -Description "desdes"-Required true -ChoiceNames bio, ewe, ewe, ewewe
```

 <img src="../Create a new choice column/choicecolumn.png" width="850">
 
Results:

<img src="../Create a new choice column/choicecolumn2.png" width="850">



## Requirements

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

```PowerShell
# Paths to SDK. Please verify location on your computer.   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
``` 


<br/><br/>
<b>Enjoy and please share feedback!</b>
