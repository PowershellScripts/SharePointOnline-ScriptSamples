The script is part of the explanation on editing the content types available in the article here:

[SharePoint Online content types in Powershell: Edit.](https://social.technet.microsoft.com/wiki/contents/articles/31444.sharepoint-online-content-types-in-powershell-edit.aspx)


This example loops through all lists in a single site and verifies the content types against default content types from a CSV file. You need to provide the CSV file. In order to retrieve all content types from the Content Type Hub, you can use the following scripts:

[Retrieve all Content Types from a Content Type Hub and their DisplayFormTemplate](https://gallery.technet.microsoft.com/Retrieve-all-Content-Types-31f14c8b) - click [here](https://gallery.technet.microsoft.com/Get-all-properties-of-all-3a9c5c4b/file/137804/1/ContentTypesWithoutPSObjectWithoutEXtraProperties.ps1) for direct download

[Get all properties of all content types in a SharePoint site](https://gallery.technet.microsoft.com/Get-all-properties-of-all-3a9c5c4b) - click [here](https://gallery.technet.microsoft.com/Get-all-properties-of-all-3a9c5c4b/file/137804/1/ContentTypesWithoutPSObjectWithoutEXtraProperties.ps1) for direct download

The script requires [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038) installed. Before running the script, enter the information:

```PowerShell
     $defaultoweFormaty=Import-Csv C:\Users\ivo\Desktop\Book1.csv
 

  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/powie1"
``` 
 

 

<b>Please share your feedback!</b>
