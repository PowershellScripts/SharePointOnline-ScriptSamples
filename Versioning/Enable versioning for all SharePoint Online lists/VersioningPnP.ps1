Written by Arleta Wanat, 2024

# Connect to the SharePoint Online site
Connect-PnPOnline -Url "https://<YourTenant>.sharepoint.com/sites/<YourSite>" -Credential (Get-Credential)

# Get all lists in the site
$lists = Get-PnPList

# Loop through each list and enable versioning
foreach ($list in $lists) {
    Write-Host "Processing list: $($list.Title)"
    Set-PnPList -Identity $list.Title -EnableVersioning $true
    Write-Host "Versioning enabled for list: $($list.Title)"

}

# Disconnect from the site
Disconnect-PnPOnline
