The script gets all columns associated to a SINGLE content type in a list.

You can either display the column name or all of its properties. If you want to display all proeprties, uncomment line: # Write-Output $fieldlink

 

The script requires SharePoint Online SDK installed. Before running the script, enter the information:

PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="ana@etr56.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://etr56.sharepoint.com/sites/commsite" 
$ListTitle = "Site Pages" 
$CTName = "Repost Page"  # name of the content type, e.g. Item, Folder, Site Page
 
Results example:

1. Only names 



 

2. All properties of a fieldlink/column



 

 
