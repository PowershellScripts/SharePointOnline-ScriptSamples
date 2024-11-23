# Written 2024 by Arleta Wanat
# The script looks for differences between SharePoint settings in 2 Microsoft 365 tenants. It displays the differences and on the screen and generates 2 files:
# One CSV only with differences, and one CSV with all the compared settings

# Define a function to connect to a tenant and get properties
function Get-TenantProperties {
    param (
        [string]$AdminUrl
    )

    Write-Host "Connecting to $AdminUrl..." -ForegroundColor Cyan
    Connect-SPOService -Url $AdminUrl
    $tenantProperties = Get-SPOTenant | Select-Object *
    Disconnect-SPOService
    return $tenantProperties
}

# Define a function to compare two objects
function Compare-TenantProperties {
    param (
        [PSCustomObject]$Tenant1,
        [PSCustomObject]$Tenant2
    )

    $comparison = @()
    foreach ($property in $Tenant1.PSObject.Properties) {
        $propertyName = $property.Name
        $value1 = $Tenant1.$propertyName
        $value2 = $Tenant2.$propertyName

        $comparison += [PSCustomObject]@{
            PropertyName = $propertyName
            Tenant1Value = $value1
            Tenant2Value = $value2
            IsDifferent  = $value1 -ne $value2
        }
    }
    return $comparison
}

# Enter the admin URLs for the two tenants
$Tenant1AdminUrl = "https://tenant1-admin.sharepoint.com"
$Tenant2AdminUrl = "https://tenant2-admin.sharepoint.com"

# Get properties from both tenants
$Tenant1Properties = Get-TenantProperties -AdminUrl $Tenant1AdminUrl
$Tenant2Properties = Get-TenantProperties -AdminUrl $Tenant2AdminUrl

# Compare the properties
$ComparisonResults = Compare-TenantProperties -Tenant1 $Tenant1Properties -Tenant2 $Tenant2Properties

# Filter only the differences
$Differences = $ComparisonResults | Where-Object { $_.IsDifferent -eq $true }

# Output to console
Write-Host "Comparison complete." -ForegroundColor Green

# Export all settings compared
$ComparisonResults | Format-Table -AutoSize
$ComparisonResults | Export-Csv -Path "TenantComparison_Full.csv" -NoTypeInformation -Encoding UTF8
Write-Host "Full comparison exported to TenantComparison_Full.csv" -ForegroundColor Cyan

# Export only differences
$Differences | Export-Csv -Path "TenantComparison_Differences.csv" -NoTypeInformation -Encoding UTF8
Write-Host "Differences exported to TenantComparison_Differences.csv" -ForegroundColor Cyan
