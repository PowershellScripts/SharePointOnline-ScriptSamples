# Written 2024 by Arleta Wanat
# The script looks for differences between SharePoint settings in 2 Microsoft 365 tenants. It displays the differences and on the screen and generates 2 files:
# One CSV only with differences, and one CSV with all the compared settings
# For more info go to https://powershellscripts.github.io/articles/en/spo/comparetenants


# Ensure PnP PowerShell module is installed
# Install-Module -Name PnP.PowerShell -Force

# Connect to the first tenant
$Tenant1Url = "https://tenant1-admin.sharepoint.com"
$Tenant2Url = "https://tenant2-admin.sharepoint.com"

Write-Host "Connecting to Tenant 1: $Tenant1Url" -ForegroundColor Cyan
Connect-PnPOnline -Url $Tenant1Url -Interactive
$Tenant1Properties = Get-PnPTenant | Select-Object -Property *

# Connect to the second tenant
Write-Host "Connecting to Tenant 2: $Tenant2Url" -ForegroundColor Cyan
Connect-PnPOnline -Url $Tenant2Url -Interactive
$Tenant2Properties = Get-PnPTenant | Select-Object -Property *

# Compare the tenant properties
Write-Host "Comparing properties..." -ForegroundColor Yellow
$Comparison = @()
$AllProperties = $Tenant1Properties.PSObject.Properties.Name

foreach ($Property in $AllProperties) {
    $Value1 = $Tenant1Properties.$Property
    $Value2 = $Tenant2Properties.$Property
    
    if ($Value1 -ne $Value2) {
        $Comparison += [PSCustomObject]@{
            PropertyName = $Property
            Tenant1Value = $Value1
            Tenant2Value = $Value2
        }
    }
}

# Output the differences
if ($Comparison.Count -gt 0) {
    Write-Host "Differences found:" -ForegroundColor Green
    $Comparison | Format-Table -AutoSize
    
    # Export differences to CSV
    $Comparison | Export-Csv -Path "TenantDifferences.csv" -NoTypeInformation
    Write-Host "Differences exported to TenantDifferences.csv" -ForegroundColor Green
} else {
    Write-Host "No differences found between the two tenants." -ForegroundColor Green
}

# Output all properties for full comparison
$FullComparison = @()
foreach ($Property in $AllProperties) {
    $FullComparison += [PSCustomObject]@{
        PropertyName = $Property
        Tenant1Value = $Tenant1Properties.$Property
        Tenant2Value = $Tenant2Properties.$Property
    }
}

# Export full comparison to CSV
$FullComparison | Export-Csv -Path "FullTenantComparison.csv" -NoTypeInformation
Write-Host "Full comparison exported to FullTenantComparison.csv" -ForegroundColor Green
