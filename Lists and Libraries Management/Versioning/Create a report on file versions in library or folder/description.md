Powershell script that generates a report on available file versions in one SharePoint Online library or one library folder.

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
$FolderUrl="/sites/TeamsiteWithLibraries/Not-Empty-Document-Library" 
$csvPath="C:\Users\ivo\Desktop\testpath.csv" 
$csvPath2="C:\Users\ivo\Desktop\FileThatShowNoVersionsAvailable.csv"
``` 
**$FolderUrl** in the example is a root folder. If you need to retrieve files from any other folder, you need to add /FolderName, e.g. 

"/sites/TeamsiteWithLibraries/Not-Empty-Document-Library/MySampleFolder"

 

The report generates 2 files. One - the main file - with all versions available. Second - supplementary - listing all the files that have no past versions. **$csvPath** refers to the path where the first main file should be stored, while the second variable **$csvPath2** refers to where the second file should be stored

 

 

## Sample report

 

<img src="../Create a report on file versions in library or folder/ReportOnVersions.PNG" width="850">
 


 <br/><br/>
<b>Enjoy and please share feedback!</b>
