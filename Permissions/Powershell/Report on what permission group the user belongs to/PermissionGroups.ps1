
$adminUrl="https://TestTenant-admin.sharepoint.com"
$loginName="test@TestTenant.onmicrosoft.com"
$PathToCsv="c:\exportedgroups2.csv"

Connect-SPOService -Url $adminUrl -Credential $loginName
$sites=(get-sposite).Url


foreach($site in $sites){
  $users=(get-spouser -Site $site)

  foreach($user in $users){ 

                       $obj = New-Object PSObject;
                       $obj | Add-Member NoteProperty User($user.LoginName);
                       $obj | Add-Member NoteProperty Site($site);
                       $obj | Add-Member NoteProperty Groups("");

                       for($i=0; $i -lt $user.groups.Count; $i++)                                 
                                      {
                                          $obj.Groups+=$user.groups[$i]+", "
                                      } 

                       Export-csv $PathToCsv -InputObject $obj -Append

                   }
 }
