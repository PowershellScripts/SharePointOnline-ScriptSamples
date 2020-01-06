Connect-MsolService
# Disabled Plans
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
