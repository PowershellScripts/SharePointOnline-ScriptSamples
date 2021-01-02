Powershell script to restore inherited permissions for all lists in a site collection.

 

<font color="red">Before you run it, you have to modify the last line of the script!</font>


```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
 
 
Set-SPOListResetRoleInheritance -Username "trial@trialtrial123.onmicrosoft.com" -Url "https://trialtrial123.sharepoint.com" -AdminPassword "Pass" -IncludeSubsites $true
``` 

Enter your credentials and the site where you want to modify the inheritance.
Set -IncludeSubsites $true  if you want to restore inherited permissions also in the subsites 
Set -IncludeSubsites $false if you want to restore inherited permissions only in the main/root site  
Verify if the [SharePoint Online SDK](http://www.microsoft.com/en-us/download/details.aspx?id=30722) is installed in the same location on your computer
 
 <hr>

## **Related scripts**

[Break inheritance for all lists](https://gallery.technet.microsoft.com/scriptcenter/Break-inheritance-for-all-ded251fa)

[Modify inherited permissions for a SharePoint Online site (module)](https://gallery.technet.microsoft.com/scriptcenter/Modify-Web-Inherited-125aaa54)

[Modify list permissions with Powershell cmdlets (module)](https://gallery.technet.microsoft.com/scriptcenter/Powershell-Module-for-b88bc2d9)

[Delete unique permissions (C# program)](https://gallery.technet.microsoft.com/scriptcenter/ResetRoleInhertienace-04f5c544)

[Get lists with unique permissions (C# program)](https://gallery.technet.microsoft.com/scriptcenter/Get-Lists-with-Unique-90c4321b)



<br/><br/>
<b>Enjoy and please share feedback!</b>
