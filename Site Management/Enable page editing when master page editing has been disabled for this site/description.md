When you receive the error "Master page editing has been disabled for this site. Contact the site collection administrator to request permission." like described here, you need to enable master page editing.

 

## How to use?

**1.** Download and install [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038).

**2.** Download the ```.ps1``` file.

**3.** Open the file (you can do it also in NotePad)

**4.** Insert your data in these lines:

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$Url="https://tenant.sharepoint.com/sites/teamsitewithlibraries" 
$setting=$true
```
a) Find on your computer where SharePoint.Clitent.dll and SharePoint.Client.Runtime.dll libraries are located and insert the correct paths

b)  Instead of "admin@tenant.onmicrosoft.com" enter you username

c) Instead of "https://tenant.sharepoint.com/sites/teamsitewithlibraries" enter the name of the site collection where you want to change the setting

d) If you want to ENABLE master page editing, skip the next line. If you want to DISABLE master page editing, change it to $false

**5.** Run the script in Powershell (any module). 
**6.** At the end you should receive a confirmation message like this:

 <img src="../Enable page editing when master page editing has been disabled for this site/AllowMasterPageEditing.PNG">

Please share your feedback in the Q&A section
