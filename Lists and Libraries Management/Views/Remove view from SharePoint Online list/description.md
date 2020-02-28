### Requirements
 

The following script requires:

[SharePoint Online SDK](http://www.microsoft.com/en-us/download/details.aspx?id=42038)

## How to use?
**1.** Open the following location:

"c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\"

If the location exists and you can see

Microsoft.SharePoint.Client.dll    

and

Microsoft.SharePoint.Client.Runtime.dll

Skip the next step and go to Step 3.

 

**2.** If the dlls are not in this location, find them, open the file with the script and correct the following paths to the locations on your computer:

 

```PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 ```
 
**3.** Edit the file to add the necessary parameters

 

```PowerShell
# Insert the credentials and the name of the admin site 
$Username="t@trial456.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://trial456.sharepoint.com/sites/teamsitewithlibraries" 
$ListTitle="quick2" 
$viewName="formattte"
``` 
**3.** Run the script. It will ask you for your password.

This and many other cmdlets are available in 

# SharePoint Module for managing lists, items and files

available for free download at Technet Gallery.
