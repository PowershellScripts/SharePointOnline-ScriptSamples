A short Powershell script to set the EnableAttachments property for a SharePoint Online list. The property is responsible for the **Attach File** icon under **new item** tab. If you disable the button, you and your users will not be able to add the attachments to list items.

<img src="../Enable or disable attachments to items of a chosen list/attachments3.png">

If you disable the button, you and your users will not be able to add the attachments to list items:

 <img src="../Enable or disable attachments to items of a chosen list/attachments-nobutton.png">

Applies to lists.

 

 

It requires installed  [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038)

You have to enter the list information before running the script:

 

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and list 
$Username="trial@trialtrial123.onmicrosoft.com" 
$AdminPassword="Pass" 
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists" 
$ListName="Tasks list" 
$Attachments =$false
```

## **Related scripts**
[Set direction of the reading order for a single list](https://gallery.technet.microsoft.com/office/Set-the-direction-of-the-f17ca66a)

[Set-SPOList properties (module)](https://gallery.technet.microsoft.com/office/Set-SPOList-properties-9d16f2ba)

## **Related article**
 
[SharePoint Online: Disable or enable attachments to list items using Powershell](https://social.technet.microsoft.com/wiki/contents/articles/30024.sharepoint-online-disable-or-enable-attachments-to-list-items-using-powershell.aspx)

 
 <br/><br/>
<b>Enjoy and please share feedback!</b>
