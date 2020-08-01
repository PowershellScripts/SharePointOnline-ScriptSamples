A short script to copy folder structure from one library to another.

 <hr>

## How to use?

1. Download the script and open the file (you can use Powershell ISE or e.g. NotePad).

2. Edit the following lines, entering your values:

```PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
 
$admin="t@trial890.onmicrosoft.com" 
$pass=Read-Host "Enter Password: " -AsSecureString 
$site="https://trial890.sharepoint.com/sites/teamsitewithlibraries" 
$libraryTitle="tescik2" 
$destLibr="lib4"
 
$site  - url of the site where both libraries are

$libraryTitle - title of the original library where you want to copy the structure FROM

$destLibr - title of the destination library where you want to copy the structure TO
```
 
3. Save and run the script. During execution it will ask you for a password.


 <hr>

## Technicalities

The scripts works with libraries, not lists.



<br/><br/>
<b>Enjoy and please share feedback!</b>A short script to copy folder structure from one library to another.

 <hr>

## How to use?

1. Download the script and open the file (you can use Powershell ISE or e.g. NotePad).

2. Edit the following lines, entering your values:

```PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
 
$admin="t@trial890.onmicrosoft.com" 
$pass=Read-Host "Enter Password: " -AsSecureString 
$site="https://trial890.sharepoint.com/sites/teamsitewithlibraries" 
$libraryTitle="tescik2" 
$destLibr="lib4"
 
$site  - url of the site where both libraries are

$libraryTitle - title of the original library where you want to copy the structure FROM

$destLibr - title of the destination library where you want to copy the structure TO
```
 
3. Save and run the script. During execution it will ask you for a password.


 <hr>

## Technicalities

The scripts works with libraries, not lists.



<br/><br/>
<b>Enjoy and please share feedback!</b>
