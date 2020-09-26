A short script that retrieves all lists from a site that haven't been modified for a while.

Please mind the difference between used and modified. A list of countries or client contacts that serve as lookup for other lists may not be changed often but is still widely used.

You need SharePoint Online SDK to run it.

Please do NOT enter your password in the file! You will be asked for it during script execution.

Please adjust the following parameters before execution:

```PowerShell
#Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"

#Enter the data
$username="ana@etr56.onmicrosoft.com" 
$Url="https://etr56.sharepoint.com/sites/demigtest11-2"
\$olderThan = "2019-09-30"
```
Sample results
