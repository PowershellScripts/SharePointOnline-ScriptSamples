A short script to add an existing site content type directly to a SharePoint Online list. 

 

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
$AdminUrl="https://tenant.sharepoint.com/sites/teamsitewithlists" 
$ListTitle="tas1207" 
$ContentTypeID="0x01200200C44754774BD8D4449F4B7E3FE70A7E0E"
``` 
</br>a) Find on your computer where SharePoint.Clitent.dll and SharePoint.Client.Runtime.dll libraries are located and insert the correct paths
</br>b)  Instead of "admin@tenant.onmicrosoft.com" enter you username
</br>c) Instead of "https://tenant.sharepoint.com/sites/teamsitewithlibraries" enter the name of the site collection where you want to find the content types
</br>d) Enter the title of the list.
</br>e) Enter the content type id
</br>      
##### *How to find the content type id?*
* via browser </br>
Go to **Site**>**Gear Icon**>**Site Settings**>**Content Types**>**Click on the content type**. The url at this point should look like **[this](https://tenant.sharepoint.com/sites/TeamsitewithLists/_layouts/15/ManageContentType.aspx?ctype=0x0100A02B0ABDDEDC5A45AC64F100F30899CF&Source=https%3A%2F%2Ftenant%2Esharepoint%2Ecom%2Fsites%2FTeamsitewithLists%2F%5Flayouts%2F15%2Fmngctype%2Easpx)**.
```diff
https://tenant.sharepoint.com/sites/TeamsitewithLists/_layouts/15/ManageContentType.aspx?ctype=
- 0x0100A02B0ABDDEDC5A45AC64F100F30899CF
&Source=https%3A%2F%2Ftenant%2Esharepoint%2Ecom%2Fsites%2FTeamsitewithLists%2F%5Flayouts%2F15%2Fmngctype%2Easpx
```
Marked in red is the content type id.

* via another script </br>
[Get all properties of all content types in a SharePoint site](https://gallery.technet.microsoft.com/Get-all-properties-of-all-3a9c5c4b)
 
5. Run the script in Powershell (any module). 

6. When the script has executed, Powershell will show a message *Content Type  Name of the Content Type2  has been added to Url of the Site*.


<br/><br/>
<b>Enjoy and please share feedback!</b>
