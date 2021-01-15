Powershell script that generates a report on available file versions in one SharePoint Online library. It iterates through folders and subfolders in order to retrieve all items

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
$csvPath="C:\Users\ivo\Desktop\testpath4.csv" 
$csvPath2="C:\Users\ivo\Desktop\FileThatShowNoVersionsAvailable4.csv" 
 
Get-sPOFolderFiles -Username $username -Url $Url -password $AdminPassword -ListTitle $ListTitle -CSVPath $csvPath -CSVPath2 $csvPath2
``` 
**$Url** specifies the url of the site with the library

 

**$ListTitle** specifies the title of the library, e.g. Documents

The report generates 2 files. One - the main file - with all versions available. Second - supplementary - listing all the files that have no past versions. **$csvPath** refers to the path where the first main file should be stored, while the second variable **$csvPath2** refers to where the second file with supplementary list should be stored


### Sample Report

<img src="../Create a report on all file versions in the library/ReportOnVersions2AllFolders.PNG" width="850">
 
### Related scripts

[Create a report on file versions](https://gallery.technet.microsoft.com/scriptcenter/Create-a-report-on-file-816b1bf8)


 <br/><br/>
<b>Enjoy and please share feedback!</b>
