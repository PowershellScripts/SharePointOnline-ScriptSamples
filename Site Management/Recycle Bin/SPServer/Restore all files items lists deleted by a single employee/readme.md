Imagine that your employee wreaked havoc in all the Sharepoint sites he had access to, randomly deleting files, items, lists. Now you, as an admin, need to restore them. Of course you can do it one by one searching through all the recycle bins, but... there is the Powershell :)

 If you need a variation of the script, just leave a comment, how you think it could be more useful.

 

 

 

 

The script loops across all site collections' recycle bins and finds all items one user deleted and restores them all.

 

 

 

 Atfer each site the script will ask you if it should proceed to restore the items:



 

If the item is DELETED BY a specified user, it is registered in a csv file (regardless of whether you decide to restore it or not):



If you decide to restore the items from a given site collection (all or none, you can't select), enter "y" and the script will restore them and print out their names in green.

If it runs into any troubles (e.g. it cannot access site) it will notify you about it in red

 



 



 

 

 

 

Before running the script you need to open the file and enter the correct the data:

 

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
Add-PSSnapin Microsoft.SharePoint.PowerShell 
 
# Insert the credentials and the name of the admin site 
$Username="CORPO\Administrator" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
 
$csvPath="C:\Users\Public\expo3.csv" 
$userupn="i:0#.w|corpo\administrator"
 
