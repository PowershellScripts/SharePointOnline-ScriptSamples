A short solution to remove a single event receiver from your SPO lists.

 

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
$ListTitle="kriiv" 
$EventReceiverGUID="154d2ca2-8335-464c-9059-214cdcc1c2c1" 
 
Get-SPOListEventreceivers -Username $Username -AdminPassword $AdminPassword -Url $Url -ListTitle $ListTitle -EventReceiverGUID $EventreceiverGUID
```
4. Check if the 2 libraries are in the same location on your computer. If yes, proceed on. If no, change the paths in the file. Usually you will be required to change folder name "15" into "16".

5. Instead of admin@tenant.onmicrosoft.com, enter the name of your site collection admin.

6. Instead of https://tenant.sharepint.com/sites/teamsitewithlibraries enter name of the site where the list with unwanted event receiver 

7. Under $EventReceiverGUID, enter the guid of the receiver. If you need to find it, you can use [Get all event receivers on your lists in a SharePoint Online site](https://gallery.technet.microsoft.com/Get-all-event-receivers-on-479a1e8d)

 

Run the script in any Powershell module.

It should ask you for your admin password.

<img src="../Remove a single event receiver/deletesinglereceiver.PNG">

The script will inform you how many receivers it found on the list and if it encountered any issues.

**Please share your feedback in the Q&A section!**

Should you need any assistance or a different script, please let me know - I will be happy to help
