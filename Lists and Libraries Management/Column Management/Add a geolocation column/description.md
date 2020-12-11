Short Powershell script to create a geolocation field in SharePoint Online list.

 

The script uses the following resources:

https://docs.microsoft.com/en-us/sharepoint/dev/general-development/how-to-add-a-geolocation-column-to-a-list-programmatically-in-sharepoint

https://docs.microsoft.com/en-us/sharepoint/dev/general-development/create-a-map-view-for-the-geolocation-field-in-sharepoint

https://docs.microsoft.com/en-us/sharepoint/dev/general-development/how-to-set-the-bing-maps-key-at-the-web-and-farm-level-in-sharepoint

https://docs.microsoft.com/en-us/sharepoint/dev/general-development/create-a-map-view-for-the-geolocation-field-in-sharepoint

 

 

```PowerShell
  $list = $web.Lists.GetByTitle($ListTitle) 
  $ctx.Load($list) 
  $ctx.ExecuteQuery() 
 
  $geolocationfield=$list.Fields.AddFieldAsXml("<Field Type='Geolocation' DisplayName='Location'/>", $true, [Microsoft.SharePoint.Client.AddFieldOptions]::AddToAllContentTypes) 
  $list.Update() 
  $ctx.ExecuteQuery()
 ```
 

In order to use it, open the file and enter correct values:

```PowerShell
#Paths to SDK 
Add-Type -Path "C:\Program Files (x86)\Common Files\microsoft shared\Web Server Extensions\16\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "C:\Program Files (x86)\Common Files\microsoft shared\Web Server Extensions\16\Microsoft.SharePoint.Client.Runtime.dll" 
 
 
  
#Enter the data 
$Password=Read-Host -Prompt "Enter password" -AsSecureString 
$Username="me@testtenant.onmicrosoft.com" 
$Url="https://tenant.sharepoint.com" 
$ListTitle="test2"
```
