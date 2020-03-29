This Powershell script requires only SharePoint Online Management Shell.

 

It retrieves all permission groups for all site collection users and exports them to a csv file. In Excel you can filter or sort data appropriately to your needs.

 

 

You can also remove the spaces and run it as a single Powershell cmdlet:

```PowerShell
foreach($user in $users){ $obj = New-Object PSObject;$obj | Add-Member NoteProperty User($user.LoginName);$obj | Add-Member NoteProperty Site("url");$obj | Add-Member NoteProperty Groups("");for($i=0; $i -lt $user.groups.Count; $i++){$obj.Groups+=$user.groups[$i]+", "} export-csv c:\ala9.csv -InputObject $obj -Append }
```
(for one site collection)
In order to run the script, open the file and enter the data:
 
```PowerShell
$adminUrl="https://TestTenant-admin.sharepoint.com" 
$loginName="test@TestTenant.onmicrosoft.com" 
$PathToCsv="c:\exportedgroups2.csv"
 ```
 

Expected results:

<img src="../Report on what permission group the user belongs to/PermissionGroup.PNG">
