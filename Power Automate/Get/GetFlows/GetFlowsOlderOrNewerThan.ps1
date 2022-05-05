# This file contains a few examples. Each of them can be executed separately.
# Mind that when talking about flows older or newer than, the created time is considered, not the last time they were in use.



# Get flows older than a year

Connect-PnPOnline
$environment = Get-PnPPowerPlatformEnvironment
$CompareDate = (Get-Date).AddYears(-1)

Get-PnPFlow -AsAdmin -Environment $environment | select -ExpandProperty Properties | Where-Object {$_.CreatedTime -lt $CompareDate}






# Export flows older than a year to a CSV file

$CSVPath = "D:\HereIStoreMyData\Flows.csv"

Connect-PnPOnline
$environment = Get-PnPPowerPlatformEnvironment
$CompareDate = (Get-Date).AddYears(-1)

Get-PnPFlow -AsAdmin -Environment $environment | select -ExpandProperty Properties | Where-Object {$_.CreatedTime -lt $CompareDate} | Export-CSV -Path $CSVPath -Append






# Export flows newer than a month to a CSV file

$CSVPath = "D:\HereIStoreMyData\Flows.csv"

Connect-PnPOnline
$environment = Get-PnPPowerPlatformEnvironment
$CompareDate = (Get-Date).AddMonths(-1)

Get-PnPFlow -AsAdmin -Environment $environment | select -ExpandProperty Properties | Where-Object {$_.CreatedTime -gt $CompareDate} | Export-CSV -Path $CSVPath -Append






# Get flows last modified more than a year ago

Connect-PnPOnline
$environment = Get-PnPPowerPlatformEnvironment
$CompareDate = (Get-Date).AddYears(-1)

Get-PnPFlow -AsAdmin -Environment $environment | select -ExpandProperty Properties | Where-Object {$_.LastModifiedTime -lt $CompareDate}


