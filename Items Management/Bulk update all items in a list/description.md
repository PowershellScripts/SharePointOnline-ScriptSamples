Short Powershell script to bulk update all items in a list

### **Example**


 Result:

<img src="../Bulk update all items in a list/bulkupdate2.png">

## **Requirements**
 
Before running the script, you have to modify the last lines!

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
 
 
Update-SPOListItem -Username user@tenant.onmicrosoft.com -Url https://tenant.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "contacts list" -FieldToUpdate elp -ValueToUpdate bio
``` 

+ Enter your credentials </br>
+ FieldToUpdate specifies the name of the list column which you want to update </br>
+ ValueToUpdate means the value that you want to enter in that column for each item </br>
+ Verify if the [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038) is installed in the same location on your computer </br>
 

 

Related Scripts

[Powershell Module with Update-SPOListItem cmdlet](https://gallery.technet.microsoft.com/scriptcenter/Powershell-Module-for-easy-5d590623)

 
 <br/><br/>
<b>Enjoy and please share feedback!</b>
