

<#  

#>


$CSVPath=""      #Enter only if you want to export to csv, e.g. E:\technet\UsersWithDisabledEXO.csv 




#connects to MSOL
Connect-MsolService


#Gets the users
$Users = Get-MSolUser -All  

if($Users -ne $null)
{
Write-Host "Loaded all users."
}
else
{
 return "Couldn't get the users."
}


if($CSVPath)
{
 Write-Host "Users will be saved to" $CSVPath
}

foreach($user in $users)
{
  
  $ss=(Get-Msoluser -UserPrincipalName $user.userPrincipalName).licenses.servicestatus
  $count=$ss.Count
  $uss=New-Object PSObject
  $uss | Add-Member -MemberType NoteProperty -Name "UPN" -Value $user.UserPrincipalName
  $uss | Add-Member -MemberType NoteProperty -Name "License" -Value (Get-Msoluser -UserPrincipalName $user.userPrincipalName).licenses.accountskuid
  $uss | Add-Member -MemberType NoteProperty -Name "Office" -Value (Get-Msoluser -UserPrincipalName $user.userPrincipalName).Office
  for($i=0;$i -lt $count; $i++)
  {
  $uss | Add-Member -MemberType NoteProperty -Name $ss[$i].ServicePlan.ServiceName -Value $ss[$i].ProvisioningStatus
  }

  $uss
  if($CSVPath)
  {
  $uss | export-csv $CSVPath -Append -Force
  }
  #(Get-Msoluser -UserPrincipalName $user.userPrincipalName) | select UserPrincipalName, licenses | export-csv C:\Users\Arleta.Wanat\Documents\userrr4.csv -Append -Force #.servicestatus 
 
}


