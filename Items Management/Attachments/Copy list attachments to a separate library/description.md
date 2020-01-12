Description
The following script copies list attachments to another library within the same site.

 

 

Scenario:
 

List with attachments:



 

sometimes several attachments per item:



 

The attachments are to be copied to another library:



 

Requirements
The script requires SharePoint Online SDK.

 

How to use?
1. Download and open the file.

2. Enter correct paths to the SDK:

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
``` 
3. Enter credentials and list data and save the file:
 
```PowerShell
Connect-SPOCSOM -Username "user@tenant.onmicrosoft.com" -Url "https://tenant.sharepoint.com/sites/powie4"  
 
  Get-SPOListItems -ListTitle withatt -IncludeAllProperties $true -Recursive -DestinationLibrary "/sites/powie4/Destiny2/" -Overwrite $true
```  
 4. Run it in Powershell.


<br/><br/>
<b>Enjoy and please share feedback!</b>