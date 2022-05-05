Short Powershell script that prevents external users from downloading the files that have been shared with them using guest link. The script uses CSOM and requires SharePoint Online SDK. The script is described in and is part of Wiki Technet article OneDrive for Business sharing settings with PowerShell .

Modifying these settings is currently not possible with SharePoint Online Management Shell.

 

 


From August 2016 and the CSOM version 16.1.5626.1200 there is an option to prevent external users from downloading the files that have been shared with them using guest link:
  

 

 

 

 

 

 

<h3>How to use?</h3>
Download and open the .ps1 file. <br/>
Add correct SharePoint Online SDK libraries:
 

```PowerShell
#Paths to SDK 
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "C:\Program Files\SharePoint Client Components\16.0\Assemblies\Microsoft.Online.SharePoint.Client.Tenant.dll" 
``` 
Enter the correct url, the setting for the sync button, and admin login. You will be additionally prompted for the password. Do not enter it in the file: 
 

```PowerShell
 #Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="admin@TENANT.onmicrosoft.com" 
$Url="https://TENANT-admin.sharepoint.com" 
$BlockDownloadOfAllFilesForGuests=$false   #Whether the download should be allowed 
``` 
  Run the script
 

 

 
