The script requires SharePoint Online SDK.

 

### What does it do?

The script finds all the checked out files in a single library and checks them in.

 

### How to use?

1. Download and open the file.

2. Refer the paths to the SDK:

```PowerShell
#Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
``` 
 
3. Enter your credentials, the url of the site and the name of the list

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="admin@tenant.onmicrosoft.com" 
$Url="https://tenant.sharepoint.com/sites/zxy0" 
$ListTitle="Documents" 
``` 
4. Save the file, close, and run the script in Powershell.

