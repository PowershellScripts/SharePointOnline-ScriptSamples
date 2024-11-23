# Written 2024 by Arleta Wanat
# The script looks for differences between SharePoint settings in 2 Microsoft 365 tenants. It displays the differences and on the screen and generates 2 files:
# One CSV only with differences, and one CSV with all the compared settings
# For more info go to https://powershellscripts.github.io/articles/en/spo/comparetenants


# Load required assemblies
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"

# Function to get tenant properties
function Get-TenantProperties {
    param (
        [string]$AdminUrl,
        [string]$Username,
        [string]$Password
    )

    $securePassword = ConvertTo-SecureString -String $Password -AsPlainText -Force
    $credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $securePassword)

    $context = New-Object Microsoft.SharePoint.Client.ClientContext($AdminUrl)
    $context.Credentials = $credentials

    # Load tenant properties
    $tenant = New-Object Microsoft.Online.SharePoint.TenantAdministration.Tenant($context)
    $context.Load($tenant)
    $context.ExecuteQuery()

    # Extract and return tenant properties
    return $tenant | Get-Member -MemberType Property | ForEach-Object {
        [PSCustomObject]@{
            PropertyName = $_.Name
            PropertyValue = $tenant.($_.Name)
        }
    }
}

# Connect to the first tenant
$Tenant1AdminUrl = "https://tenant1-admin.sharepoint.com"
$Tenant1Username = "admin1@tenant1.onmicrosoft.com"
$Tenant1Password = "YourPassword1"

Write-Host "Retrieving properties from Tenant 1: $Tenant1AdminUrl" -ForegroundColor Cyan
$Tenant1Properties = Get-TenantProperties -AdminUrl $Tenant1AdminUrl -Username $Tenant1Username -Password $Tenant1Password

# Connect to the second tenant
$Tenant2AdminUrl = "https://tenant2-admin.sharepoint.com"
$Tenant2Username = "admin2@tenant2.onmicrosoft.com"
$Tenant2Password = "YourPassword2"

Write-Host "Retrieving properties from Tenant 2: $Tenant2AdminUrl" -ForegroundColor Cyan
$Tenant2Properties = Get-TenantProperties -AdminUrl $Tenant2AdminUrl -Username $Tenant2Username -Password $Tenant2Password

# Compare tenant properties
Write-Host "Comparing properties..." -ForegroundColor Yellow
$Comparison = @()

foreach ($Property in $Tenant1Properties) {
    $Tenant2Value = ($Tenant2Properties | Where-Object { $_.PropertyName -eq $Property.PropertyName }).PropertyValue

    if ($Property.PropertyValue -ne $Tenant2Value) {
        $Comparison += [PSCustomObject]@{
            PropertyName  = $Property.PropertyName
            Tenant1Value  = $Property.PropertyValue
            Tenant2Value  = $Tenant2Value
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
$FullComparison = $Tenant1Properties | ForEach-Object {
    $Tenant2Value = ($Tenant2Properties | Where-Object { $_.PropertyName -eq $_.PropertyName }).PropertyValue

    [PSCustomObject]@{
        PropertyName  = $_.PropertyName
        Tenant1Value  = $_.PropertyValue
        Tenant2Value  = $Tenant2Value
    }
}

# Export full comparison to CSV
$FullComparison | Export-Csv -Path "FullTenantComparison.csv" -NoTypeInformation
Write-Host "Full comparison exported to FullTenantComparison.csv" -ForegroundColor Green
