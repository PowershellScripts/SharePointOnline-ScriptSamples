# Get the environment. You can't do anything without it in Flow (Power Automate) cmdlets

$environment = Get-PnPFlowEnvironment


# Find your flow if you don't know the id by heart
# $Flow = Get-PnPFlow -Environment $environment
# or
# $Flow = Get-PnPFlow -Environment $environment | Where {$_.properties.DisplayName -match "MyFlow"}


Enable-PnPFlow -Environment $environment -Identity $Flow.Id
