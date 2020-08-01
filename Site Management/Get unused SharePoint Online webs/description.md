Powershell script that checks when a website was last modified and shows / exports to CSV those that haven't been used in a while.

Useful if you are cleaning up your environment. 

The script works within 1 site collection and iterates through all of the subsites. It can be expanded to go through all sites collections in the tenant.

 

You can define what your company regards as sell-by-date for the websites, by modifying the parameter $date:

PowerShell
 # In other words, unused sites are sites where last change was made earlier than ...? 
 
$date = "2019-08-30"
 The script does not delete or modify the webs in any way.
 

 

The script requires SharePoint Online SDK and your credentials. Please do NOT enter your password in the file!  You will be asked for it during script execution.

Please adjust the following parameters before execution:

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="ana@etr56.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$Url="https://etr56.sharepoint.com" 
 
# reporting parameters 
 # where should the report be saved 
$csvPath = "C:\Users\Public\unusedwebs.csv" 
 # do you want to see all websites there or only unused?  
$onlyUnused = $true 
 # if only unused, what's the border date that defines your unused sites.  
 # In other words, unused sites are sites where last change was made earlier than ...? 
$date = "2019-08-30" 
 
 

 

 

 
