Powershell script that loops through all files and items deleted from a single site and present in the recycle bin of that site. All files are restored.

**Works with group sites!** 

The script requires [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038). After installing the SDK verify if the path to 2 libraries: Client.dll and Client.Runtime.dll are in the same location as below:

(usually if not, they will be under **16**\ISAPI\)

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="2190@sampletenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://sampletenant.sharepoint.com/sites/dgd" 
```
 Insert the credentials before running the script.
 
