# PnP scripts are quite simple so you may find a few examples below




#  Get all flows

$environment = Get-PnPPowerPlatformEnvironment
Get-PnPFlow -Environment $environment



# Get all flows and their properties

Get-PnPFlow -Environment $environment | select -expandProperty Properties



# Get flow actions

$props = Get-PnPFlow -Identity 5e904726-e098-41f4-a96a-066652abc113 -Environment $environment | select -ExpandProperty Properties
$props.DefinitionSummary.Actions
