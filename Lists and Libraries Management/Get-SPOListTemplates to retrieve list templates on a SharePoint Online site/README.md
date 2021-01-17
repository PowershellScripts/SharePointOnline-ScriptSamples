A short script to retrieve default list templates from a given site. It does NOT retrieve custom list templates.

<hr>

## **How to use?**

1. The script requires SharePoint Online SDK. Make sure you have those libraries on your machine:

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
``` 
2. Download the file and open it (in NotePad or ISE).

3. Verify the paths to SDK.

4. Enter the admin's login and url of the site:

```PowerShell
$adminLogin="admin@tenant.onmicrosoft.com" 
$url="https://tenant.sharepoint.com/sites/invoices" 
``` 
5. Run the script in ANY Powershell. It will ask you for password.

 

 

## *Expected results*

 
<img src="../Get-SPOListTemplates to retrieve list templates on a SharePoint Online site/Get-SPOListTemplate.PNG" width="850">


<br/><br/>
<b>Enjoy and please share feedback!</b>
