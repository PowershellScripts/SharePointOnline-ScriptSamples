A short script to get all properties of all content types in one SharePoint site collection.

The script is fully described in an article [here](http://social.technet.microsoft.com/wiki/contents/articles/31051.sharepoint-online-content-types-in-powershell.aspx). 

The script is similar to [Get all properties of all content types in a SharePoint site](https://gallery.technet.microsoft.com/Get-all-properties-of-all-3a9c5c4bhttps://gallery.technet.microsoft.com/Get-all-properties-of-all-3a9c5c4b). In addition to all the default properties it adds also every workflow, field, and fieldLink instance as an additional custom property.

 

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
d) Fill in the properties of the content type. </br>

5. Run the script in Powershell (any module). 

6. Results can be viewed either in Powershell window or exported to csv as a report:

<img src="../Get All Detailed Properties of All Content Types/GetPropertiesWITHOUTExtr.PNG" width="850">
<img src="../Get All Detailed Properties of All Content Types/GetPropertiesWITHOUTExtr2.PNG" width="850">



 



<br/><br/>
<b>Enjoy and please share feedback!</b>
