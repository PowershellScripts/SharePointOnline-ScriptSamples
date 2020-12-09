A short script to remove SharePoint Online license from all the users.

 

The result for all users should be similar to:

<img src="../Remove SharePoint Online licenses for all users/NOSPO.PNG">

The script will ask you for admin credentials.

The script has no error handling - feel free to improve it:

 

 

```PowerShell
Connect-MsolService 
 
$disabledPlans= @() 
$disabledPlans +="SHAREPOINTENTERPRISE" 
$disabledPlans +="SHAREPOINTWAC" 
 
  
 
$Users = Get-MsolUser -All 
 
$Plan=(Get-MsolAccountSku).AccountSkuID.Trim() 
 
$noSPO = New-MsolLicenseOptions -AccountSkuId $Plan -DisabledPlans $disabledPlans 
 
Write-Host $Plan 
 
foreach($user in $Users) 
 { 
   Set-MsolUser -UserPrincipalName $user.UserPrincipalName -UsageLocation "US" 
   Set-MsolUserLicense -UserPrincipalName $user.UserPrincipalName -RemoveLicenses $Plan 
   Set-MsolUserLicense -UserPrincipalName $user.UserPrincipalName -AddLicenses $Plan -LicenseOptions $noSPO 
   Write-Host "Done for user " $user.UserPrincipalName 
 } 
``` 
 

 

Though a different scenario and on a different occassions, I have been using this [article](http://blogs.technet.com/b/treycarlee/archive/2013/11/01/list-of-powershell-licensing-sku-s-for-office-365.aspx) by [Trey Carlee](https://social.technet.microsoft.com/profile/Trey%20Carlee)  for a long time and the script above would not exist without Trey's initial help. I do recommend his insights for all who struggle with user licensing.

 

 

 <br/><br/>
<b>Enjoy and please share your comments and questions!</b>
