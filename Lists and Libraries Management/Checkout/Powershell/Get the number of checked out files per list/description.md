Powershell script that gets the number of checked out files per list.

 

It outputs the results to the console and a csv file. Helpful if you want to identify which lists have a large number of checked out files.



You can modify it to run through all your sites. It can work for both SharePoint Server 2013/2016 and SharePoint Online:

 

PowerShell
  #Use this line if you are working on SharePoint Server 
  #$ctx.Credentials = New-Object System.Net.NetworkCredential($Username, $password) 
 
  #This line is working for SHarePoint Online. Comment it out, if you are running this script on a server 
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
 
 

In order to use it, you need SharePoint Online SDK:

 

PowerShell
#Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
  
#Enter the data 
$username="ana@etr56.onmicrosoft.com" 
$Url="https://etr56.sharepoint.com/sites/demigtest11-2"
 
 
