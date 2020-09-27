Powershell script to set unique permissions on a single SharePoint Online list.

It breaks role inheritance for one specified list.

 

 

How to use?
 

1. Download and open the file.

2. Enter the paths to appropriate SDKs:

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
``` 
 3. Enter the data to your tenant. Do not enter your password:
```PowerShell
$username = "anaida@etr546.onmicrosoft.com" 
$siteurl = "https://etr546.sharepoint.com/sites/testflow" 
$listTitle = "Customers"
```
 4. Do not enter your password. You will be prompted for it during the script execution.
 5. Run the script.
 
