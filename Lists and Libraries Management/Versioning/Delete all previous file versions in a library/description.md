Powershell script. Loops through all the folders, subfolders and files, and removes the file versions.

 

If you want to see which versions will be removed, you can run first Create a report on all file versions in the library.

 

 

 

 

It requires installed  SharePoint Online SDK 

You have to enter the library data before running the script:

 

 

PowerShell
#Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
  
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="trial@trialtrial125.onmicrosoft.com" 
$Url="https://trialtrial125.sharepoint.com/sites/teamsitewithlibraries" 
$ListTitle="Not-Empty-Document-Library" 
$csvPath="C:\Users\ivo\Desktop\testpath114.csv" 
$Url specifies the url of the site with the library

 

$ListTitle specifies the title of the library, e.g. Documents

The script will generate a report that states whether any versions were found and deleted or no versions were available for the file.

 

Sample report:

 



 

 

 

 

Related scripts:
 

Create a report on file versions

Create a report on all file versions in the library

 

 

 

Please share your feedback in the Q&A section!
