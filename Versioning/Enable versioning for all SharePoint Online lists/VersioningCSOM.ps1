
# Script to enable versioning for all SharePoint Online lists across site collections
# Created by Arleta Wanat, 2014.  Updated 2024



# Load CSOM libraries. Ensure these paths are correct on your machine.
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"

# Define versioning setting: $true enables versioning; $false disables it.
$enableVersioning = $true

# Function to process all lists in a site and its subsites
function Process-SiteLists {
    param (
        [string]$siteUrl
    )

    # Create a client context and authenticate
    $clientContext = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
    $clientContext.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password)

    # Load site and list data
    $clientContext.Load($clientContext.Web)
    $clientContext.Load($clientContext.Web.Lists)
    $clientContext.Load($clientContext.Web.Webs)
    $clientContext.ExecuteQuery()

    Write-Host "`nProcessing site: $siteUrl" -BackgroundColor White -ForegroundColor DarkGreen

    # Process each list in the current site
    foreach ($list in $clientContext.Web.Lists) {
        # Set versioning and update list
        $list.EnableVersioning = $enableVersioning
        $list.Update()

        # Prepare log entry
        $listLog = New-Object PSObject
        $listUrl = if ($siteUrl.EndsWith("/")) { "$siteUrl$list.Title" } else { "$siteUrl/$list.Title" }
        $listLog | Add-Member -MemberType NoteProperty -Name "ListUrl" -Value $listUrl
        $listLog | Add-Member -MemberType NoteProperty -Name "Status" -Value "Failed"

        try {
            $ErrorActionPreference = "Stop"
            $clientContext.ExecuteQuery()
            Write-Host "Updated: $listUrl" -ForegroundColor Green
            $listLog.Status = "Success"
        } catch {
            Write-Host "Failed: $listUrl" -ForegroundColor Red
        } finally {
            $ErrorActionPreference = "Continue"
            $Global:logEntries += $listLog
        }
    }

    # Recursively process subsites
    foreach ($subsite in $clientContext.Web.Webs) {
        Process-SiteLists -siteUrl $subsite.Url
    }
}

# Prompt for tenant admin URL and credentials
$adminUrl = Read-Host -Prompt "Enter your tenant admin URL (e.g., https://tenant-admin.sharepoint.com)"
$username = Read-Host -Prompt "Enter your admin username (e.g., admin@domain.onmicrosoft.com)"
$password = Read-Host -Prompt "Enter your password" -AsSecureString
$credentials = New-Object System.Management.Automation.PSCredential($username, $password)
Connect-SPOService -Credential $credentials -Url $adminUrl

# Get all site collections
$siteCollections = Get-SPOSite

# Initialize log storage
$Global:logEntries = @()

# Process each site collection
foreach ($siteCollection in $siteCollections) {
    Process-SiteLists -siteUrl $siteCollection.Url
}

# Export log to a CSV file
$logFilePath = "C:\Users\Public\VersioningLog.csv"
$Global:logEntries | Export-Csv -Path $logFilePath -NoTypeInformation
Write-Host "`nLog exported to $logFilePath" -ForegroundColor Cyan
