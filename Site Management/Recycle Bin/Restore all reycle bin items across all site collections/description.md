The script loops across all site collections in the tenant and finds all deleted items and restores them all.

More variations of the script are available on [Technet Gallery](https://gallery.technet.microsoft.com/office/site/search?query=recycle%20bin&f%5B1%5D.Value=recycle%20bin&f%5B1%5D.Type=SearchText&f%5B0%5D.Value=Arleta%20Wanat&f%5B0%5D.Type=User&ac=4)

The script will notify you as it loops through the sites if there are any items at all in the site collection recycle bin; it will restore them and print out their names **in green**.

If it runs into any troubles (e.g. duplicate items already exist and the mysite host) it will notify you about it **in red**

<img src="../Restore all reycle bin items across all site collections/RestoreBasedAllSiteCollections-1.PNG"> 
<img src="../Restore all reycle bin items across all site collections/RestoreBasedAllSiteCollections2-1.PNG">

Before running the script you need to open the file and enter the correct the data:

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="t@trial765.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://trial765-admin.sharepoint.com"
``` 

```$Username``` correponds to the global admin who has access to all the site collections you want to loop through.
