A short one-cmdlet Powershell module that adds another cmdlet to your set of cmdlets. Import the module to make the cmdlet available.

### New-SPOListColumnWithProperties
 

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

Mandatory
</br>```[string]$Description=""```

Optional.
</br>```[string]$Required="false"```

Optional. Specifies whether the field is required.
</br>```[string]$Group=""```

Optional.
</br>```[string]$StaticName```

Mandatory
</br>```[string]$Name```

Mandatory
</br>```[string]$Version="1"```

Optional.

 


## Requirements

The following libraries (SharePoint Online SDK) are required. If those libraries are in different location on your computer, please edit the .psm1 file!

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer.    
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"     
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
```

<br/><br/>
<b>Enjoy and please share feedback!</b>
 

