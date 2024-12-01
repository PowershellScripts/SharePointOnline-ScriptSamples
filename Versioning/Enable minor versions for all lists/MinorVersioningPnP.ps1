# Written by Arleta Wanat 2024

# Connect to the SharePoint Online site
Connect-PnPOnline -Url "https://<YourTenant>.sharepoint.com/sites/<YourSiteCollection>" -UseWebLogin

# Retrieve all lists in the site collection
$lists = Get-PnPList

# Iterate through each list to enable minor versioning
foreach ($list in $lists) {
    # Check if the list allows versioning
    if ($list.BaseType -eq "GenericList" -or $list.BaseType -eq "DocumentLibrary") {
        Write-Host "Processing list: $($list.Title)"
        Set-PnPList -Identity $list.Title -EnableVersioning $true -EnableMinorVersions $true -MinorVersionLimit 10
        Write-Host "Minor versioning enabled for: $($list.Title)"
    }
}

# Disconnect from the site
Disconnect-PnPOnline
