This file contains a few examples. Each of them can be executed separately



# Get flows older than a year

Connect-PnPOnline
$environment = Get-PnPPowerPlatformEnvironment
$CompareDate = (Get-Date).AddYears(-1)

Get-PnPFlow -Environment $environment | select -ExpandProperty Properties | Where-Object {$_.CreatedTime -gt $CompareDate}
