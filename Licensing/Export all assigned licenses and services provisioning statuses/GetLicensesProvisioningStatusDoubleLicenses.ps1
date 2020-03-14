

<#  

#>


$CSVPath=""      #Enter only if you want to export to csv, e.g. E:\technet\UsersWithDisabledEXO.csv 




#connects to MSOL
Connect-MsolService


#Gets the users
$Users = Get-MSolUser -All  

if($Users -ne $null){
 Write-Host "Loaded all users."
}
else{
 return "Couldn't get the users."
}


if($CSVPath){
 Write-Host "Users will be saved to" $CSVPath
}


# Check each user for licenses
foreach($user in $users){
  # If user has more than 1 license assigned, he will appear twice in the report
 
  foreach($license in (Get-Msoluser -UserPrincipalName $user.userPrincipalName).licenses){
      $ss=$license.ServiceStatus
      $count=$ss.Count
      $uss=New-Object PSObject
      $uss | Add-Member -MemberType NoteProperty -Name "UPN" -Value $user.UserPrincipalName
      $uss | Add-Member -MemberType NoteProperty -Name "License" -Value $license.AccountSkuId
      $uss | Add-Member -MemberType NoteProperty -Name "Office" -Value (Get-Msoluser -UserPrincipalName $user.userPrincipalName).Office
      
      # Looping through all the services, like TEAMS1, SharePointWAC, etc.  and their statuses
      
      for($i=0;$i -lt $count; $i++){
       $uss | Add-Member -MemberType NoteProperty -Name $ss[$i].ServicePlan.ServiceName -Value $ss[$i].ProvisioningStatus
      }

      #Printing out the user info
      $uss

      # If the path to CSV is specified, all info will be exported
      if($CSVPath){
       $uss | export-csv $CSVPath -Append -Force
      }
  }
}


