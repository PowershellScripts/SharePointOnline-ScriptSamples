A short script that sets the major version limit for OneDrive for Business libraries and lists for ALL users. It requires SharePoint Online Management Shell and SharePoint SDK.

A short script that sets the major version limit for the OneDrive for Business libraries and lists. 

It requires SharePoint Online Management Shell and SharePoint SDK installed:

http://technet.microsoft.com/en-us/library/fp161372(v=office.15).aspx

http://www.microsoft.com/en-us/download/details.aspx?id=30722

 

If the list doesn't have versioning enabled, modifying the major version limit is not possible and you will receive the following error message:

Exception calling "ExecuteQuery" with "0" argument(s): "Specified method is not supported."For some lists, enabling version may not be possible and you will receive a notification of that.

At the end, a csv file is generated with the lists' urls and the status whether the setting was successful or not.

 

As the script runs you will see green lists' titles for which the setting succeeded and red for those which failed:



 

 

In order to use the script, adjust the data inside:

 

 

PowerShell
#the next line will delete surplus versions. Make sure you know what you are doing and have tested the script before uncommenting it  
    #$list.MajorVersionLimit = $VersionLimit  
      
.  
.  
.  
  
  
# Paths to SDK. Please verify location on your computer.  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
  
  
  
# Versioning will be enabled. If you prefer to disable it for the whole tenant, change to $false  
$Versioning = $true  
  
#Number of major versions to keep. !! All the surplus versions will be deleted !!  
$VersionLimit = 14  
  
# You can also enter credentials directly: $siteUrl="https://tenant-admin.sharepoint.com"  
$AdminUrl = "https://etr56-admin.sharepoint.com”  
$Username = "ana@etr56.onmicrosoft.com"
 
There is another version of this script that sets versioning limit for SELECTED users: 

https://gallery.technet.microsoft.com/office/Set-the-version-limit-for-370ae6ec
