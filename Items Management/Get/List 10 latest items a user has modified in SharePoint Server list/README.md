Powershell script that lists the 10 latest files or items a user has modified in a given SharePoint Server list or library.

 

### How to use?
1. Download the script and open the file.

2. Modify the following lines with appropriate paths to SharePoint SDKs:

 

```PowerShell
#Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.Office.Client.Policy.dll"    
```

3. Enter your data:
```PowerShell
#Enter the data 
$username = "Domain\SPAdmin" 
$Url = "http://intranet.domain.com/sites/test" 
$ListTitle = "test" 
$UserDisplayName = "TestEditor" 
 
 $username - user who is running the script and has appropriate rights over the website and list
 $url   - the url of your site collection/subsite
 $listtitle - the titleof our list
 $UserdisplayName - the name of the user who modified the files/items
```
The script will also create a report under "c:\users\public\TenItems.csv" with file names and last modified date: 
