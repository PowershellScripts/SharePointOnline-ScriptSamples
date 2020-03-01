### *Description*

The script goes through all SharePoint Online site collections and retrieves a change log for them. The change log is DECRYPTED and published to an Excel file.

What do I mean by decrypted?

Whenever possible and applicable:
- User Id is read and dispalyed as SharePoint Online user' LoginName
- Document id is read and displayed as Document Name (e.g. title of the Word document)
- List id is read and displayed as List Name
- Each change is preceded by the name of the site on which it occurred

Whenever the element was not applicable for the particular change "N/A" will be displayed, e.g.
When a user deleted a document, alert ID will display N/A because there was no alert created at this activity.
When a system sent an alert, user ID and LoginName will display "N/A", because no user was involved.
The script is very time-consuming. It needs time to retrieve all logs.
For faster script retrieving change logs from only one site collection please consult my other contributions.

### *Instructions*

**1.** Install SharePoint Online SDK.
**2.** Before running the script, open the file in Powershell or NotePad and edit the lines below:
```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="2190@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant-admin.sharepoint.com" 
$CSVPath="C:\users\ivo\Desktop\changecollectiontry3.csv"
``` 
a) verify where Microsoft.SharePoint.Client.dll and Microsoft.SharePoint.Client.Runtime.dll libraries are located on your computer and enter the correct paths.

b) instead of 2190@tenant.onmicrosoft.com enter the name of your administrator

c) instead of https://tenant-admin.sharepoint.com, enter the url for your SharePoint Online admin Center

d) instead of "c:\users\...."  enter the path where you want the file to be generated on your local PC

**3.** Run the script. 
**4.** During the execution you may receive the error "Such list does no longer exist". It is because some of the changes refer to deleted items/lists.

<img src="../Create a report on all changes for all your site collections/error.PNG">

**5.** When the script is ready, open the created file. The results should be similar to:

<img src="../Create a report on all changes for all your site collections/results.PNG">

### Please share your comments in the Q&A section!
### Related scripts
[Create a report on all changes for your site collection (Powershell)](https://gallery.technet.microsoft.com/Create-a-report-on-all-fe377c62)
