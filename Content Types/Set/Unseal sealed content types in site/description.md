What does it do?
 

The script changes the setting of .Sealed from $true to $false.

 

It targets all site collections, which are Sealed. During its execution it displays the names of the content types it processes and errors for the read-only content types.

 

 



 

 

 

It updates all dependent (child) content types as well. If you want the script not to modify the child content types, open the file and modify the following part:

 

 

with

PowerShell
$cc.Update($false)
 
 

 

 

How to use?
Before running the script, modify the following lines:

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/powie1" 
```         
 



<br/><br/>
<b>Enjoy and please share feedback!</b>