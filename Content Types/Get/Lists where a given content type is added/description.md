A short script to find all lists across a site collection and its subsites where a given content is added

Very useful if you receive an error message:

<img src="../Lists where a given content type is added/Error.PNG" width="850">

when trying to remove a content type.

 

 

 

### *How to use?*

1. Download and install [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038).

2. Download the *.ps1* file.

3. Open the file (you can do it also in NotePad)

4. Insert your data in these lines:

 

 

```PowerShell
 # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/teamsitewithlibraries" 
 ```
a) Find on your computer where SharePoint.Clitent.dll and SharePoint.Client.Runtime.dll libraries are located and insert the correct paths </br>
b)  Instead of "admin@tenant.onmicrosoft.com" enter you username </br>
c) Instead of "https://tenant.sharepoint.com/sites/teamsitewithlibraries" enter the name of the site collection where you want to find the content types </br>

5. Run the script in Powershell (any module). 

6. The result should show the table of names of the associated lists and websites where those lists are located

<img src="../Lists where a given content type is added/resultName.PNG" width="850">

You can also export it to CSV:

<img src="../Lists where a given content type is added/resultName2.PNG" width="850">
 

<br/><br/>
<b>Enjoy and please share feedback!</b>
