My advice is don't. That flag is there for a reason and make sure you know what you are doing and are aware of the consequences before you use this script.

 

The script allows a SharePoint Online list or library to be deleted. If under list settings a button "Delete this list" or "Delete this document library" is missing, it should return.

Please beware that the button is missing for a reason. Do not execute the script if you do not want the list to be deleted.

The script does not delete the list itself.

 

How to use the script?

1. Download and open the file.

2. Enter the connection data to your tenant and the paths to appropriate SDK libraries:

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="ana@etr56.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$Url="https://etr56.sharepoint.com/sites/testflow" 
$ListTitle="Customers" 
 
3. Define whether you want to allow the list to be deleted ($true):

PowerShell
$lista.AllowDeletion = $false
 
