$CSVPath = yourcsvpath.csv
$credentials = Get-Credential

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
