Short Powershell script removes a column from a SharePoint Online list

## *Requirements*

Before running the script, you have to modify the last lines!


```PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
  
 
 
 
 
 Remove-SPOListColumn -Username user@domain.onmicrosoft.com -Url https://tenant.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "contacts list" -FieldTitle "ool" 
``` 

+ Enter your credentials
+ FieldTitle means the name of the column that you want to delete 
+ Verify if the [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038) is installed in the same location on your computer
 

### **Related scripts**

[Create a new column using Powershell cmdlet](https://gallery.technet.microsoft.com/scriptcenter/Create-a-new-column-for-a-501108c6)

[Create a new choice column and define choices using Powershell cmdlet](https://gallery.technet.microsoft.com/scriptcenter/Create-a-new-choice-column-34d957d8)





 <br/><br/>
<b>Enjoy and please share feedback!</b>
