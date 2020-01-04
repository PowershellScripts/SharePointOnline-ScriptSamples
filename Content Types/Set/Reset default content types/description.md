The script is part of the explanation on editing the content types available in the article here:

SharePoint Online content types in Powershell: Edit.

 

This example loops through all lists in a single site and verifies the content types' displayformtemplateName against default content types' displayformtemplateName from a CSV file. Then it proceeds to CHANGE the content types' displayformtemplateName to the default one.  You need to provide the CSV file. In order to retrieve all content types from the Content Type Hub, you can use the following scripts:

Retrieve all Content Types from a Content Type Hub and their DisplayFormTemplate - click here for direct download

Get all properties of all content types in a SharePoint site - click here for direct download

 

 

 

 

 

The script requires SharePoint Online SDK installed. Before running the script, enter the information:

 

```PowerShell
$defaultoweFormaty=Import-Csv C:\Users\ivo\Desktop\Book1.csv
 

  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/powie2" 
``` 
       
 
 

 

<br/><br/>
<b>Enjoy and please share feedback!</b>
 
