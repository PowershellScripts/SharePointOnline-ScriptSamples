Powershell script that removes a content type by its id.


## How to find the content type id?

1. Navigate to Site>Site settings>Content types>Click on the content type you want to remove.

or

Enter the url of the site where you want to remove the content type> At the end of the url add /_layouts/15/mngctype.aspx

 

2.In the browser in the url bar you will see something like 

https://trialtrial125.sharepoint.com/_layouts/15/start.aspx#/_layouts/15/ManageContentType.aspx?ctype=0x0101009148F5A04DDD49CBA7127AADA5FB792B006973ACD696DC4858A76371B2FB2F439A&Source=https%3A%2F%2Ftrialtrial125%2Esharepoint%2Ecom%2F%5Flayouts%2F15%2Fmngctype%2Easpx

The numbers marked in red are the id of the content type (not the same as GUID). More on reading content type id: https://msdn.microsoft.com/en-us/library/office/aa543822(v=office.14).aspx

 

 

Before running the script open the .ps1 file and enter the correct information: Username of the admin,the site, where you want to remove the content type and the content type id. 

If you are struggling with removing particularly stubborn content type, the script will either manage to remove it or give you a helpful error message, e.g. "The content type "content type hub" at "/sites/firstsite" is read only."

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="mszasz@trial.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://trial.sharepoint.com/sites/firstsite" 
$ContentTypeID="0x00A7470EADF4194E2E9ED1031B61DA0884030065B86AF41E46E8408DF47ED47A09578701" 
 
 
Remove-Contenttype -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -ContentTypeID $ContentTypeID
``` 
 

 

 

<br/><br/>
<b>Enjoy and please share feedback!</b>

 
