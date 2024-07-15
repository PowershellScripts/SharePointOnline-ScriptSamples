# Ensure you have the SharePoint PnP PowerShell module installed
# Install-Module SharePointPnPPowerShellOnline -Scope CurrentUser

function Set-PnPListsContentTypesEnabled {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Username,
        [Parameter(Mandatory = $true)]
        [string]$Password,
        [Parameter(Mandatory = $true)]
        [string]$Url,
        [Parameter(Mandatory = $true)]
        [bool]$ContentTypesEnabled
    )

    # Connect to SharePoint Online
    Connect-PnPOnline -Url $Url -Credentials (Get-Credential -UserName $Username -Message "Enter your password") 

    # Get all lists from the current web
    $Lists = Get-PnPList

    # Loop through each list and update ContentTypesEnabled
    foreach ($List in $Lists) {
        $List.ContentTypesEnabled = $ContentTypesEnabled
        $List.Update()
        Invoke-PnPQuery

        Write-Host "$($List.Title) - Done" -ForegroundColor Green
    }

    # Disconnect from SharePoint Online
    Disconnect-PnPOnline
}

# Replace these variables with your actual credentials and settings
$Username = "trial@trialtrial123.onmicrosoft.com"
$Password = ConvertTo-SecureString "Pass" -AsPlainText -Force
$Url = "https://trialtrial123.sharepoint.com/sites/teamsitewithlists"
$ContentTypesEnabled = $true

# Call the function to set ContentTypesEnabled for lists
Set-PnPListsContentTypesEnabled -Username $Username -Password $Password -Url $Url -ContentTypesEnabled $ContentTypesEnabled
