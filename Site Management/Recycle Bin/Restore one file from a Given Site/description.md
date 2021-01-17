Powershell script that restores a single file deleted and present in the recycle bin of that site. If you want to restore all files or see a report on them first, please refer to **Related Scripts** section.

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

### Please share your thoughts in the Q&A section!

 
## Related scripts
[Create a report on deleted files within one site using Powershell](https://gallery.technet.microsoft.com/scriptcenter/Create-a-report-on-deleted-496ce018)

[Restore All Files from a Given Site using Powershell](https://gallery.technet.microsoft.com/scriptcenter/Restore-All-Files-from-a-bc3037ac)
