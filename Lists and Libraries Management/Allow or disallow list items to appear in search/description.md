A short Powershell script to allow or disallow crawling on a SharePoint Online list.

 It corresponds to the Search setting available under **List**>**List Settings**>**Advanced in the User Interface**:

<img src="../Allow or disallow list items to appear in search/NoCrawl.png">

It requires installed  [SharePoint Online SDK](http://www.microsoft.com/en-us/download/details.aspx?id=42038)

You have to enter the list information before running the script:

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and list 
$Username="trial@trialtrial123.onmicrosoft.com" 
$AdminPassword="Pass" 
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists" 
$ListName="Announcements list" 
$NoCrawl=$true
```


 <br/><br/>
<b>Enjoy and please share your comments and questions!</b>
 
