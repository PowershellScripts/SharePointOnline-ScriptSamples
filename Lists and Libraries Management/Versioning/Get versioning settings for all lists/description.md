A short script that checks versioning settings for all the libraries and lists in the whole tenant.

 

It requires SharePoint Online Management Shell and SharePoint SDK installed.

 

It uses recurrence to find all sites in all site collections and then goes through all the lists.

At the end, a csv file is generated with the lists' urls and settings:



 

As the script runs you will see green lists' titles for which the setting was successfully retrieved and red for those which failed.

 

 

### How to use?
Download and open the .ps1 file.
Add correct SharePoint Online SDK libraries:
 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
