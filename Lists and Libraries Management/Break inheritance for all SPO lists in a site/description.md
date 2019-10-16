Powershell script to break inherited permissions for all lists in a site collection.

 

Before you run it, you have to modify the last line of the script!

 

 

PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
 
 
Set-SPOListBreakRoleInheritance -Username "trial@trialtrial123.onmicrosoft.com" -Url "https://trialtrial123.sharepoint.com" -AdminPassword "Pass" -IncludeSubsites $false 
 

Enter your credentials and the site where you want to modify the inheritance.
Set -IncludeSubsites $true  if you want to break inheritance also in the subsites 
Set -IncludeSubsites $false if you want to break inheritance only in the main/root site  
Verify if the SharePoint Online SDK is installed in the same location on your computer
 

 



 

 

 

Related scripts:

Restore inheritance for all lists

Modify inherited permissions for a SharePoint Online site (module)

Modify list permissions with Powershell cmdlets (module)

Delete unique permissions (C# program)

Get lists with unique permissions (C# program)
