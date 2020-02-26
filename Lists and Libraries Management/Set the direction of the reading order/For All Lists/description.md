A short Powershell script to set the direction of the reading order for all lists in a site

 

You can choose between:

ltr - left to right

rtl - right to left

none 

 

 

 

It requires installed  SharePoint Online SDK

You have to enter the list information before running the script:

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and the desired reading order: rtl, ltr, none 
$Username="trial@trialtrial123.onmicrosoft.com" 
$AdminPassword="Pass" 
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists" 
$Direction="rtl"
``` 
 

 

Results:

 
<img src="../For All Lists/Direction.PNG" width="850">


 
<br/><br/>
<b>Enjoy and please share feedback!</b>

Related scripts
Set direction of the reading order for a single list

Set-SPOList properties (module)

Change permission property in lists (article)

Other list-related scripts
