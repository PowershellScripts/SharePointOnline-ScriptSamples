The script adds a supported language to all site collections.

**1.** It retrieves the urls using Get-SPOSite.

**2.** It loops through the urls.

**3.** For each specified url, it adds a supported language.


Make sure the script is using correct paths to the SDK libraries on your machine:

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll"
``` 
 

 Enter your credentials:
```PowerShell
# Insert the credentials and the name of the admin site 
$Username="user@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$adminUrl="https://tenant-admin.sharepoint.com" 
$lcid=1031
```
$lcid refers to Locale ID. A list of Microsoft-assigned locale ids can be found [here](https://msdn.microsoft.com/en-us/goglobal/bb964664.aspx).


### The script can be modified.

**1.** If you want to add language only for a few site collections/subsites, enter the urls in the line below instead of Get-SPOSite cmdlet:
```PowerShell
$sites=(get-spoSite).Url
``` 
 
**2.** If you want to add 2 or more languages, enter more AddSupportedUILanguage() methods:
```PowerShell
   $ctx.Web.AddSupportedUILanguage($lcid)
```   
 
**3.** If you want to remove a language instead of adding it, modify the following line:
```PowerShell
   $ctx.Web.AddSupportedUILanguage($lcid)
``` 
into:
```PowerShell
   $ctx.Web.RemoveSupportedUILanguage($lcid)
```   
 
**4.** If you need to assign administrator's permissions to ODB, you can use the following [script](http://sharepoint.stackexchange.com/questions/138562/add-personal-site-collection-administrator-programmatically).

 
<br/><br/> 
<b>Enjoy and please share feedback!</b>
