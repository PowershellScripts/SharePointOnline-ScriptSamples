This script is a temporary solution intended to work together with [Retrieve all SharePoint Online profiles and their properties using CSOM](https://gallery.technet.microsoft.com/Retrieve-all-SharePoint-357e2936).

Using [Retrieve all SharePoint Online profiles and their properties using CSOM](https://gallery.technet.microsoft.com/Retrieve-all-SharePoint-357e2936) generate a CSV file with personal sites in the format:

 

Site
|---|
/personal/t_trial234_onmicrosoft_com/
/personal/uss100_trial234_onmicrosoft_com/
/personal/t_trial234_onmicrosoft_com/
 
The Column name has to be SITE.

Run the script. It will ask you for credentials, [feature id](https://docs.microsoft.com/pl-pl/archive/blogs/), and whether you want to acivate it or de-activate.
 
Before running the script, verify the paths to SharePoint Online SDK:

```PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 ```
 

Optionally, you can edit these two lines so that the script doesn'task you for credentials at runtime:

During its execution the script will inform you, where the features have been changed.

 
### Related scripts

[Activate or deactivate a SPO feature for direct subsites in site collection](https://gallery.technet.microsoft.com/office/Activate-or-deactivate-a-9fe2fb34)

[Activate or deactivate a SPO feature for a single site](https://gallery.technet.microsoft.com/office/Activate-or-deactivate-a-da769f9d)

[Activate or deactivate a site collection feature ](https://gallery.technet.microsoft.com/Activate-or-deactivate-a-a7e12c79)

[Get all features from a site collection](https://gallery.technet.microsoft.com/Get-all-features-from-a-2954b47a)

[Get all features from a site](https://gallery.technet.microsoft.com/Get-all-features-from-a-3168e476)

 

** As a side-effect the script assigns the administrator as a site collection admin to all users. This will be improved in the next version**
