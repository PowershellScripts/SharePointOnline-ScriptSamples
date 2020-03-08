A short Powershell script that retrieves all site groups from the root site and all subsites in a site collection. blaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

 

 

 

How to use?
1. Download and open the .ps1 file.

2. Adjust paths to SharePoint Online SDK:

 

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
 
 

3. Enter your tenant data. DO NOT enter password. You will be asked for it during script's execution:

 

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="arleta@Tenant.onmicrosoft.com" 
$Url="https://Tenant.sharepoint.com" 
$csvPath="C:\Users\Public\AllSiteGroups2.csv" 
 
 

 

 

Expected results:
 



 

 

 
