Powershell script to restore inherited permissions for all items in a SharePoint Online list.

 

The script works with large (5000+) lists.

In order to make it possible script uses a solution published here: http://www.sptrenches.com/2016/06/get-all-items-in-5000-large-list-with.html and commented by Sharath Aluri here: https://gallery.technet.microsoft.com/office/Delete-unique-permissions-c6ea2b57/view/Discussions#content.

 

The script is a variation of Delete unique permissions in all items in one single list using Powershell  script available on the Technet Gallery.

 

Before you run it, you have to modify the last lines of the script!

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
 
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="arleta@TENANT.onmicrosoft.com" 
$Url="https://TENANT.sharepoint.com/sites/testID1de" 
$ListTitle="testitems" 
``` 

Enter your credentials and the site where you want to modify the inheritance. 
Verify if the SharePoint Online SDK is installed in the same location on your computer
 

