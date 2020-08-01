Powershell script that generates a report on available file versions in one OneDrive for Business account. It iterates through folders and subfolders in order to retrieve all items.

 

 

 

It requires installed  SharePoint Online SDK 

You have to enter the library data before running the script:

```PowerShell
#Paths to SDK   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
 
 
#Enter the data 
#User with sufficient access to read the files 
$username="german@test.onmicrosoft.com" 
#Url of the site with the files (e.g. OneDrive site) 
$Url="https://test-my.sharepoint.com/personal/german_test_onmicrosoft_com" 
 
#Path for a csv where file versions will be recorded 
$csvPath="C:\MyFiles\Versions.csv" 
#Path for a csv where files with no version will be recorded 
$csvPath2="C:\MyFiles\FileThatShowsNoVersionsAvailable4.csv" 
 ```
You will see the following output during the script execution and 2 csv files will be generated:

