A short script that sets the major version limit for all the libraries and lists in the whole site collection or in the whole tenant.

It requires SharePoint Online Management Shell and SharePoint SDK installed:

http://technet.microsoft.com/en-us/library/fp161372(v=office.15).aspx

http://www.microsoft.com/en-us/download/details.aspx?id=30722

 

It uses recurrence to find all sites in all site collections and then goes through all the lists.

If the list doesn't have versioning enabled, modifying the major version limit is not possible and you will receive the following error message:

Exception calling "ExecuteQuery" with "0" argument(s): "Specified method is not supported."For some lists, enabling version may not be possible and you will receive a notification of that.

At the end, a csv file is generated with the lists' urls and the status whether the setting was successful or not.

 

As the script runs you will see green lists' titles for which the setting succeeded and red for those which failed:



 

 



 

 

In order to use the script, adjust the data inside:

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
 
 
# Versioning will be enabled. If you prefer to disable it for the whole tenant, change to $false 
$Versioning = $true 
 
#Number of major versions to keep 
$VersionLimit = 14 
 
# You can also enter credentials directly: $siteUrl="https://tenant-admin.sharepoint.com" 
$AdminUrl = "https://tenant-admin.sharepoint.com” 
$Username = "test@tenant.onmicrosoft.com" 
$Password = Read-Host -Prompt "Enter password" -AsSecureString 
$Creds= New-Object System.Management.Automation.PSCredential($username,$password)  
Connect-SPOService -Credential $Creds -Url $AdminUrl 
 
$sitecollections=Get-SPOSite 
$Global:csv=@() 
 
#Uncomment the foreach loop if you want to change the settings in all site collections  
#foreach($sitecoll in $sitecollections) 
#{ 
    Set-VersionLimit -Url ("https://test.sharepoint.com/sites/test") -Username $Username -Password $Password -Versioning $Versioning -VersionLimit $VersionLimit 
#} 
 
 
 
# Specify the path where the log file will be published 
$Global:csv | Export-Csv -Path C:\Users\Public\Versioninglimitversion.csv 
 ```
