The script retrieves all SPO users and pulls usage statistics for their ODB sites.

 

The script uses CSOM. It requires SharePoint Online SDK and SharePoint Online Management Shell. Make sure the script refers the paths on your computer:

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
``` 
 


### How to use?
1. Download the script and open it in ISE or NotePad.

2. Enter your tenant's data:

 

```PowerShell
$admin="user@tenant.onmicrosoft.com" 
$pass=Read-Host "Enter Password: " -AsSecureString 
$mysiteHost="https://tenant-my.sharepoint.com"
``` 
 

3. Run the script.

4. Expected results:

<img src="../Create OneDrive for Business usage report for all users/WithCSOM.PNG">
 
 <br/><br/>
### Acknowledgement:
The script is using Invoke-LoadMethod published here, without which it could not proceed. The method was created and belongs to a brilliant SharePointer and Guru, [Vadim Gremyachev.](https://sharepoint.stackexchange.com/users/10610/vadim-gremyachev)
