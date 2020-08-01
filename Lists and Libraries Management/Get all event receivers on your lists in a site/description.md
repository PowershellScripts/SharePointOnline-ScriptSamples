A short solution to find event receivers on your SPO lists.

 

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
 
 
Get-SPOListEventreceivers -Username $Username -AdminPassword $AdminPassword -Url $Url
```
4. Check if the 2 libraries are in the same location on your computer. If yes, proceed on. If no, change the paths in the file. Usually you will be required to change folder name "15" into "16".

5. Instead of admin@tenant.onmicrosoft.com, enter the name of your site collection admin.

6. Instead of https://tenant.sharepint.com/sites/teamsitewithlibraries enter name of the site where the unwanted app is located

7. Run the script in any Powershell module.

It should ask you for your admin password

 

If you want to export the event-receivers' data to a .csv file, use PathToTheScript | export-csv c:\users\MyUsers\Desktop\CSVReport.csv

<img src="../Get all event receivers on your lists in a site/GetSPOEventReceivers.PNG">

### Sample Report

ReceiverAssembly |	ReceiverClass |	ReceiverId |	ReceiverName |	SequenceNumber |	Synchronization |	EventType |	ReceiverUrl |	Context |	Tag |	Path |	ObjectVersion |	ServerObjectIsNull |	TypedObject	 	
---|---|---|---|---|---|---|---|---|---|---|---|---|---
Microsoft.SharePoint.Portal, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c |	Microsoft.SharePoint.Portal.CommunityEventReceiver |	f13fb801-b306-42ea-bb1e-2f4c1e4a8e81 |	  |	10000 |	Synchronous |	ItemAdding |	Microsoft.SharePoint.Client.ClientContext |	Microsoft.SharePoint.Client.ObjectPathIdentity |	False |	Microsoft.SharePoint.Client.EventReceiverDefinition
Microsoft.SharePoint.Portal, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c |	Microsoft.SharePoint.Portal.CommunityEventReceiver |	cebe300c-50ac-4d88-8a4b-a63b9d6da400 |	 |	10000 |	Synchronous |	ItemUpdating |	Microsoft.SharePoint.Client.ClientContext |	Microsoft.SharePoint.Client.ObjectPathIdentity |	False |	Microsoft.SharePoint.Client.EventReceiverDefinition
Microsoft.SharePoint.Portal, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c |	Microsoft.SharePoint.Portal.CommunityEventReceiver |	bfc4ca11-32d6-4248-923c-fe16bcf8145d |	  |	10000 |	Synchronous |	ItemDeleting |	Microsoft.SharePoint.Client.ClientContext |	Microsoft.SharePoint.Client.ObjectPathIdentity |	False |	Microsoft.SharePoint.Client.EventReceiverDefinition
Microsoft.SharePoint.Portal, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c |	Microsoft.SharePoint.Portal.CommunityEventReceiver |	6f2b105a-4834-40df-a450-c480c5c94ef0 |	  |	10000 |	Asynchronous |	ItemAdded |	Microsoft.SharePoint.Client.ClientContext |	Microsoft.SharePoint.Client.ObjectPathIdentity |	False |	Microsoft.SharePoint.Client.EventReceiverDefinition
 
