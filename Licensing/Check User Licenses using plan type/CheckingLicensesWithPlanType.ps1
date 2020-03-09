<#
This script works only in limited number of scenarios. If you have more than one subscription, use another script 'CheckLicensesWithServiceName' also published on Technet Gallery
((Get-Msoluser -UserPrincipalName test2@trial765.onmicrosoft.com).licenses.servicestatus | where {$_.ServicePlan.ServiceType -eq "Exchange"})

#>

$PlanToCheck="Exchange"
$CSVPath=""  #E:\technet\UsersWithDisabledEXO.csv Enter only if you want to export to csv
$ChecksWhetherThePlanIs="Disabled"  #Disabled, Success or PendingActivation


<#Plans to choose from. Please enter only one value above 
ProjectWorkManagement
Sway
SCO
YammerEnterprise
RMSOnline
MicrosoftOffice
MicrosoftCommunicationsOnline
Exchange



With SharePoint you may prefer to use ServiceName property and SharePointEnterprise and SharePointWAC values 
#>

#connects to MSOL
Connect-MsolService


#Gets the users
$Users = Get-MSolUser -All  

if($Users -ne $null){
  Write-Host "Loaded all users."
}
else{
  Write-Host "Couldn't get the users."
}


if($CSVPath){
  Write-Host "Users will be saved to" $CSVPath
}

foreach($user in $users){
  #returns ServicePlan and ProvisioningStatus
  $serviceStatus=((Get-Msoluser -UserPrincipalName $user.userPrincipalName).licenses.servicestatus | where {$_.ServicePlan.ServiceType -eq $PlanToCheck})
  if($serviceStatus.ProvisioningStatus -eq "Disabled"){
    Write-Host $user.UserPrincipalName
   if($CSVPath){
    Export-Csv -InputObject $user -LiteralPath $CSVPath -Append
   }
  }
}


