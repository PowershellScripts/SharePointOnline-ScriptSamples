# Description
The following script copies list attachments to another library within the same site.



# Scenario:
 
List with attachments:

<img src="../Copy list attachments to a separate library/Capture.PNG">

sometimes several attachments per item:

<img src="../Copy list attachments to a separate library/Capture2.PNG">

The attachments are to be copied to another library:

<img src="../Copy list attachments to a separate library/Capture3.PNG">

# Requirements
The script requires SharePoint Online SDK.

# How to use?
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
