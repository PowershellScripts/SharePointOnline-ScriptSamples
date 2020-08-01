Powershell script retrieves all the item attachments from a SharePoint list and copies them to a separate library or a folder within a library.

 

In order to use the script, you need to enter your data in the downloaded file:

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
#Please enter your data 
$Username = "ana@etr56.onmicrosoft.com" 
$Url = "https://etr56.sharepoint.com" 
$ListTitle = "attatest" 
$CSVPath = "C:\Users\Public\attachmentsreport.csv" 
$DestinationLibraryFullPath = "/test/AttachmentsFromAtta"
 
Examples of $DestinationLibraryFullPath:

e.g. "/sites/powie4/Destiny2/" where powie4 is the name of the site collection and Destiny2 is the name of the library                     

e.g. "/test/AttachmentsFromAtta" where test is the name of a library in root site collection and AttachmentsFromAtta is the name of a folder 

 

 

 

#Disclaimer#

Never trust a script from internet. Test it before using in prod. My script may be perfect, but I we may have different things in mind and we may understand the description differently. Post a question if unsure.
