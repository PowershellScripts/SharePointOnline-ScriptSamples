A simple solution to uninstall an unwanted app from a Sharepoint Online site using Powershell and the app GUID.

 

1. Install [SharePoint Online SDK](http://www.microsoft.com/en-us/download/details.aspx?id=42038)

2. Download the file and open (e.g. in NotePad)

3. Scroll down to these lines

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$Url="https://tenant.sharepoint.com/sites/teamsitewithlibraries" 
$GUID="126d911b-b274-4b69-a52e-2a9e5bbae91b"
 ```
4. Check if the 2 libraries are in the same location on your computer. If yes, proceed on. If no, change the paths in the file. Usually you will be required to change folder name "15" into "16".

5. Instead of admin@tenant.onmicrosoft.com, enter the name of your site collection admin.

6. Instead of https://tenant.sharepint.com/sites/teamsitewithlibraries enter name of the site where the unwanted app is located

7. Under GUID enter the app's guid. 


Run the script in any Powershell module.

It should ask you for your admin password and report success or detailed error:

<img src="../Uninstall unwanted app from your site using Powershell/RemoveSPOApp.PNG"> 

**Please share your feedback in the Q&A section!**
