# Ensure you have the SharePoint PnP PowerShell module installed
# Install-Module SharePointPnPPowerShellOnline -Scope CurrentUser

$Url = Read-Host "Enter the SharePoint Online site URL"
$Username = Read-Host "Enter your username"

# Connect to SharePoint Online
Connect-PnPOnline -Url $Url -Credentials (Get-Credential -UserName $Username -Message "Enter your password") 

# Get all lists from the current web
$Lists = Get-PnPList

# Loop through each list and update ContentTypesEnabled
foreach ($List in $Lists) {
    $List.ContentTypesEnabled = $true
    $List.Update()
    Invoke-PnPQuery

    Write-Host "$($List.Title) - Done" -ForegroundColor Green
}

# Disconnect from SharePoint Online
Disconnect-PnPOnline
