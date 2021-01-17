The scenario is: You fired an employee and he wreaked havoc in all the SPO sites he had access to, randomly deleting files, items, lists. Now you need to restore them, and of course you can do it one by one searching through all the recycle bins, but... there is the Powershell :)

 

 

The script loops across all site collections in the tenant and finds all items one user deleted and restores them all.

 

More variations on the script and more options are coming so click on View Contributions under my name to check if they are already available.

 

 

 

The script will notify you as it loops through the sites if there are any items at all in the site collection recycle bin; if it finds items DELETED BY the specified user, it will restore them and print out their names **in green**.

If it runs into any troubles (e.g. it cannot access the public site and the mysite host) it will notify you about it **in red**

<img src="../Restore all files, items, lists deleted by a single employee/RestoreBasedAllSiteCollections.PNG">

<img src="../Restore all files, items, lists deleted by a single employee/RestoreBasedAllSiteCollections2.PNG">

Before running the script you need to open the file and enter the correct the data:

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant-admin.sharepoint.com" 
$userupn="i:0#.f|membership|uss2@arletka.cloudns.org"
 ```
$Username correponds to the global admin who has access to all the site collections you want to loop through. $userupn is the naughty employee's SharePoint loginname who deleted the items. Pay attention to the format and DO NOT remove i:0#.f|membership| part unless you are 100% sure that your SharePoint user loginname includes something else than this.

 
