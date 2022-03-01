
Connect-PnPOnline

$environment = Get-PnPPowerPlatformEnvironment

# lists all the flows in environment
Get-PnPFlow -Environment $environment -AsAdmin

#lists all the flows available to you as a user
Get-PnPFlow -Environment $environment


# I am afraid that's it :)    PnP is really simple
