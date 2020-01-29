The script retrieves all files and restores the LAST NOT CURRENT version of the file.

Please test the script in test environment before using it in production.

 

The script is a modification of the existing Restore Previous Versions script created to show 2 ways on filtering the file results. The filters are only examples that need to be adjusted to your specific needs.

The first filter uses CamlQuery to retrieve only files coming from a specific folder.

The second filter takes files we have already retrieved and selects only those modified after 12/2/2017.

When dealing with large number of files CamlQuery is the preferred and more efficient way.

 

 

 The script requires SharePoint Online SDK.  Make sure that the paths below point to locations on your computer:

 

PowerShell
#Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
 
 

 

 

The script needs to be edited before running. Enter the necessary data:

 

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="t@testova365.onmicrosoft.com" 
$Url="https://testova365.sharepoint.com/sites/STS" 
$ListTitle="VersionTest"
``` 
The CamlQuery below chooses only files whose ServerRelativeUrl includes a certain path. In this way you can restore versions only from a specific folder.
PowerShell
 $spqQuery.ViewXml ="<View Scope='RecursiveAll' /><Where><Eq><FieldRef Name='ServerRelativeUrl'/><Value Type='Text'>/VersionTest/Folder2/FolderWithinFolder</Value></Eq></Where>"; 
 
 The following lines allow us to narrow the files only to those modified after 12/2/2017. 
PowerShell
        $date=Get-Date ("2/12/2017") 
         
        if($file.TimeLastModified -gt $date) 
        {
 
