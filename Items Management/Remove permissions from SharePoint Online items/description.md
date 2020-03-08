Powershell script to remove permissions for all items in a SharePoint Online list.

As a result, only the user running this script will have access to the files.

### *Result*

<img src="../Remove permissions from SharePoint Online items/RemoveItemPermissions.png">

<hr>

### *Requirements*

**Before you run it, you have to modify the last line of the script!**

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
 

Remove-SPOListAllItemsInheritance -Username "trial@trialtrial123.onmicrosoft.com" -Url "https://trialtrial123.sharepoint.com" -AdminPassword "Pass" -ListTitle "chc1" 
```
+ Enter your credentials and the site where you want to modify the inheritance. 
+ Verify if the [SharePoint Online SDK](http://www.microsoft.com/en-us/download/details.aspx?id=30722) is installed in the same location on your computer




 <br/><br/>
<b>Enjoy and please share feedback!</b>s
