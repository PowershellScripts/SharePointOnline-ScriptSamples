# This file contains a few examples. Each of them can be executed separately.

##
# Get the id of the user who created your flows
##

Connect-PnPOnline
$environment = Get-PnPPowerPlatformEnvironment

$Flows = Get-PnPFlow -AsAdmin -Environment $environment | select -ExpandProperty Properties 
$Flows.Creator




##
# Get the name of the user who created your flows 
##

# enter credentials for your admin user
$creds = Get-Credential   

# connect to get your Power Platform Environment
Connect-PnPOnline -Credential $creds
$environment = Get-PnPPowerPlatformEnvironment
$Flows = Get-PnPFlow -AsAdmin -Environment $environment | select -ExpandProperty Properties 

# Connect to get your user details 
Connect-MsolService -Credential $creds

foreach($flow in $flows){ 
  Get-MsolUser | where {$_.ObjectId -eq $flow.Creator.ObjectId} 
}

