Powershell script. Loops through all the folders, subfolders and files, and removes the file versions.

If you want to see which versions will be removed, you can run first [Create a report on all file versions in the library.](https://gallery.technet.microsoft.com/scriptcenter/Create-a-report-on-all-04ca555f)
 

It requires installed  [SharePoint Online SDK ](http://www.microsoft.com/en-us/download/details.aspx?id=42038)

You have to enter the library data before running the script:

 

 

```PowerShell
#Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
  
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="trial@trialtrial125.onmicrosoft.com" 
$Url="https://trialtrial125.sharepoint.com/sites/teamsitewithlibraries" 
$ListTitle="Not-Empty-Document-Library" 
$csvPath="C:\Users\ivo\Desktop\testpath114.csv" 
```
**$Url** specifies the url of the site with the library

 

**$ListTitle** specifies the title of the library, e.g. Documents

The script will generate a report that states whether any versions were found and deleted or no versions were available for the file.

 

### Sample report

<img src="../Delete all previous file versions in a library/DeleteVersionsAllFolders.PNG" width="850">


### Related scripts
 

[Create a report on file versions](https://gallery.technet.microsoft.com/scriptcenter/Create-a-report-on-file-816b1bf8)

[Create a report on all file versions in the library](https://gallery.technet.microsoft.com/scriptcenter/Create-a-report-on-all-04ca555f)

 

 

 <br/><br/>
<b>Enjoy and please share feedback!</b>

