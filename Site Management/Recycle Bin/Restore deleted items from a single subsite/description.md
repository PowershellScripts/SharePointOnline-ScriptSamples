The script retrieves deleted items from a single site, displays them and restores.

 

The script first displays the items to be restored. You can then decide whether to restore them all or not:



 



 

The script requires SharePoint Online SDK.

 

 

How to use?
1. Download and open the file.

2. Verify the paths to SDK are correct:

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
3. Enter the data. DO NOT enter your password. You will be asked for it during the script execution.

PowerShell
# Insert the credentials and the name of the admin site 
$Username="arleta@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$Site="https://tenant.sharepoint.com/sub1"
 
 

 
