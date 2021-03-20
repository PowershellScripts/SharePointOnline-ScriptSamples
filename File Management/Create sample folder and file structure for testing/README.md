A short script to create folder and file structure in a library.

 

How to use?

1. Download the script.

2. Create a library.

3. In the library create a sample file (.docx, .xlsx or .pptx) that will serve as a template for all other files.

4. Open the script file (you can use Powershell ISE or e.g. NotePad).

5. Edit the following lines, entering your values:

 

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
$admin="t@trial890.onmicrosoft.com" 
$pass=Read-Host "Enter Password: " -AsSecureString 
$site="https://trial890.sharepoint.com/sites/teamsitewithlibraries" 
$fileURL="/sites/TeamsiteWithLibraries/tescik2/Presentation.pptx" 
$libraryTitle="tescik2" 
``` 
 

6. Save and run the script. During execution it will ask you for a password.

 

 

End results

 



 

 



 

Not enough?

Of course you can modify or expand the script. E.g. adding more values to these arrays will create more folders:

 

```PowerShell
$reports=@("Reports","Balance Sheets","Investments") 
  $report=@("Report","Balance Sheet","Investment") 
``` 
Feel free also to adjust the naming to fit your scenario, e.g. $reports=@("Beaches","Tropical Islands","Seas","Yachts")  :) 

 

 

 

Technicalities - how did it work?

 I simply took the file and copied it under different names. All the file properties (managed metadata, lookup values, etc.) are copied as well.




<br/><br/>
<b>Enjoy and please share feedback!</b>
