Powershell script to break inherited permissions for all lists in a site collection.

**Before you run it, you have to modify the last line of the script!**

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
 
 
Set-SPOListBreakRoleInheritance -Username "trial@trialtrial123.onmicrosoft.com" -Url "https://trialtrial123.sharepoint.com" -AdminPassword "Pass" -IncludeSubsites $false 
 ```

+ Enter your credentials and the site where you want to modify the inheritance.
+ Set -IncludeSubsites $true  if you want to break inheritance also in the subsites 
+ Set -IncludeSubsites $false if you want to break inheritance only in the main/root site  
+ Verify if the [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038) is installed in the same location on your computer
 
<img src="../Break inheritance for all SPO lists in a site/uniquepermS.png">

## **Related scripts:**

[Restore inheritance for all lists](https://gallery.technet.microsoft.com/scriptcenter/Delete-Unique-Permissions-91be8246)

[Modify inherited permissions for a SharePoint Online site (module)](https://gallery.technet.microsoft.com/scriptcenter/Modify-Web-Inherited-125aaa54)

[Modify list permissions with Powershell cmdlets (module)](https://gallery.technet.microsoft.com/scriptcenter/Powershell-Module-for-b88bc2d9)

[Delete unique permissions (C# program)](https://gallery.technet.microsoft.com/scriptcenter/ResetRoleInhertienace-04f5c544)

[Get lists with unique permissions (C# program)](https://gallery.technet.microsoft.com/scriptcenter/Get-Lists-with-Unique-90c4321b)

 <br/><br/>
<b>Enjoy and please share your comments and questions!</b>
