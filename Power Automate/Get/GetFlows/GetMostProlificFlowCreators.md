
Enter the path to CSV file, if you want to export your results. I recommend it, if you expect a lot of users
```
$CSVPath = yourcsvpath.csv
$credentials = Get-Credential
```

Connect to services. PnP is needed for flow details. Msol for user details.
```
Connect-PnPOnline -Credential $Credentials
Connect-Msolservice -Credential $Credentials

$environment = Get-PnPPowerPlatformEnvironment
$flowprops = Get-PnPFlow -AsAdmin -Environment $environment | select -ExpandProperty Properties
$MostProlific = $flowprops.Creator | Group-Object -Property ObjectId | sort
 
$MostProlific | Foreach-Object {
    $FlowCreator = $_ 
    $user = Get-MsolUser | where {
        $_.ObjectId -eq $FlowCreator.Name
    }
    $user | Add-Member -MemberType NoteProperty -Name NoOfFlow -Value $FlowCreator.Count
    Write-Host $user.DisplayName $user.NoOfFlow
    $user | Export-CSV -Path $CsvPath  -Append
}
```

## Results
![flow21](https://user-images.githubusercontent.com/42035526/166932049-69a86296-d907-4913-b415-fd0e26fcb1d3.png)


