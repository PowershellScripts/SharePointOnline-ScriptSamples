A short script to create a content type.

The script is fully described in an article [here](http://social.technet.microsoft.com/wiki/contents/articles/31051.sharepoint-online-content-types-in-powershell.aspx).

### How to use?



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
$Description="desc" 
$Name="Name of the Content Type2" 
$ParentContentTypeID="0x01" 
$Group="List Content Types"
 ```
 
a) Find on your computer where SharePoint.Clitent.dll and SharePoint.Client.Runtime.dll libraries are located and insert the correct paths </br>
b)  Instead of "admin@tenant.onmicrosoft.com" enter you username </br>
c) Instead of "https://tenant.sharepoint.com/sites/teamsitewithlibraries" enter the name of the site collection where you want to find the content types </br>
d) Fill in the properties of the content type. </br>
 
5. Run the script in Powershell (any module). 

6. When the script has executed, Powershell will show a message *Content Type  Name of the Content Type2  has been added to Url of the Site*.

 

 

<br/><br/>
<b>Enjoy and please share feedback!</b>
