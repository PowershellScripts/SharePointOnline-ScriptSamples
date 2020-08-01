

<#  Possible serviceNames:
PROJECTWORKMANAGEMENT
SWAY
INTUNE_O365
OFFICE_BUSINESS
YAMMER_ENTERPRISE
EXCHANGE_S_STANDARD
MCOSTANDARD
SHAREPOINTSTANDARD
RMS_S_ENTERPRISE
OFFICESUBSCRIPTION
MCOSTANDARD
SHAREPOINTWAC
SHAREPOINTENTERPRISE
EXCHANGE_S_ENTERPRISE
#>

<# 
If you think a service name is missing from the list above, you can use the following cmdlet on a user with ASSIGNED license to check for the internal servicename 
((Get-Msoluser -UserPrincipalName test2@trial765.onmicrosoft.com).licenses.servicestatus.serviceplan.servicename)

#>

$PlanToCheck="Exchange_S_ENTERPRISE"
$CSVPath=""      #Enter only if you want to export to csv, e.g. E:\technet\UsersWithDisabledEXO.csv 
$ChecksWhetherThePlanIs="Disabled"  #Disabled, Success or PendingActivation



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
  $serviceStatus=((Get-Msoluser -UserPrincipalName $user.userPrincipalName).licenses.servicestatus | where {$_.ServicePlan.ServiceName -eq $PlanToCheck})
  
  if($serviceStatus.ProvisioningStatus -eq "Disabled"){
    Write-Host $user.UserPrincipalName
   
   if($CSVPath){
    Export-Csv -InputObject $user -LiteralPath $CSVPath -Append
   }
  }
}


