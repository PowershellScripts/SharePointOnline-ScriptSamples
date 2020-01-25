A short script to create a single term in a specific term set of the default taxonomy store. The script applies to SharePoint Online tenants.
  
 

You need to open the file and specify the following data:

 

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="trial@trial.onmicrosoft.com" 
$Url="https://trial-admin.sharepoint.com" 
$TermSetGuid="ee09533d-4ea4-49b2-b328-fcfb72126568" 
$Term="POwershellTermmik2" 
$TermLanguage=1033
``` 
 

The script requires SharePoint Online SDK. Open the file and refer the appropriate libraries here:

 

```PowerShell
  #Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Taxonomy.dll"   
``` 
The script can be adapted to create multiple terms for test purposes.
