The script retrieves all files and restores the LAST NOT CURRENT version of the file.

Please test the script in test environment before using it in production.
 
 The script requires SharePoint Online SDK.  Make sure that the paths below point to locations on your computer:
 
```PowerShell
#Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
``` 
 
The script needs to be edited before running. Enter the necessary data:

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="t@trial456.onmicrosoft.com" 
$Url="https://trial456.sharepoint.com/sites/teamsitewithlibraries" 
$ListTitle="uyyu"
```

 
 <img src="../Restore previous versions in the entire library/Restorelast.PNG" width="850">
 
<br/><br/>
<b>Enjoy and please share feedback!</b>
