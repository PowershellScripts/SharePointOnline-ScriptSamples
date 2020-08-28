SharePoint Online has a lot of options allowing you to organize your files. Some of them really amazing. Folders aren't necessarily one of them. 

But once you have used them and your users happily created unstructured, repeating, unrecoverable mess, you may want to audit them and find out if you can reorganize or save the day in some other way.



This Powershell script allows you to investigate into your folder structure and creates an XML file as a report. It adds name, number of subfolders, itemcount and serverrelativeurl as attributes. You can remove some or all of these attributes by modifying the script.

There is also another, very similar version without the attributes available here: Audit folder structure to XML.

Sample results:  


<img src="../Audit SharePoint Online folder structure to XML/capture.PNG" width="850">
 

 

 

 

 

IN order to use the script, you need to enter your data at the bottom of the file:

```PowerShell
# Paths to SDK. Please verify location on your computer. 
 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
 
# Enter your data 
$admin="ana@etr56.onmicrosoft.com" 
$site="https://etr56.sharepoint.com" 
$libraryTitle="test" 
$script:XMLPath = "C:\Users\Public\foolders2.xml" 
#Enter your data above! 
 
 ```

 
