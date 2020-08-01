Test the script before usage.

 

Maybe other scripts will be more applicable to your requirements:

Copy all SharePoint Online list item attachments to a SPO library

Get the size of all attachments in SharePoint Online list

List all attachments from SharePoint Online list to CSV file

 

 

In order to use the script, you need to modify the downloaded file:

PowerShell
       for($k=0; $k -lt $itemAttachments.Count; $k++) 
        { 
           #deletes the attachment file. Uncomment it only if you are absolutely sure you want to lose this data. 
            #$itemAttachments[$k].DeleteObject() 
            try 
            { 
     
 
PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
#Please enter your data 
$Username = "ana@etr56.onmicrosoft.com" 
$Url = "https://etr56.sharepoint.com" 
$ListTitle = "attatest" 
$CSVPath = "C:\Users\Public\attachmentsreport.csv"
 
 

 

 
