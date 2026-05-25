#
# Created by Sachchin Annam
#

# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

function Set-SPOListsContentTypesEnabledRecursive {
    param (
        [Parameter(Mandatory=$true)]
        [Microsoft.SharePoint.Client.ClientContext]$Context,
        [Parameter(Mandatory=$true)]
        [bool]$ContentTypesEnabled
    )

    $Lists = $Context.Web.Lists
    $Context.Load($Context.Web)
    $Context.Load($Context.Web.Webs)
    $Context.Load($Lists)
    $Context.ExecuteQuery()

    foreach ($List in $Lists) {
        $List.ContentTypesEnabled = $ContentTypesEnabled
        $List.Update()

        try {
            $Context.ExecuteQuery()
            Write-Host $List.Title "   Done" -ForegroundColor Green
        }
        catch [Net.WebException] {
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }
    }

    if ($Context.Web.Webs.Count -gt 0) {
        Write-Host "--" -ForegroundColor DarkGreen

        foreach ($subWeb in $Context.Web.Webs) {
            $subWebUrl = $subWeb.Url
            $subWebContext = New-Object Microsoft.SharePoint.Client.ClientContext($subWebUrl)
            $subWebContext.Credentials = $Context.Credentials
            Set-SPOListsContentTypesEnabledRecursive -Context $subWebContext -ContentTypesEnabled $ContentTypesEnabled
        }
    }
}

# Insert the credentials and the name of the site and the desired setting: $true for the content types management to be allowed or $false to disable it
$Url = Read-Host "Enter the SharePoint Online site URL"
$Username = Read-Host "Enter your username"
$AdminPassword = Read-Host -AsSecureString "Enter your password"
$ContentTypesEnabled = $true

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force

$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($Url)
$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)

Set-SPOListsContentTypesEnabledRecursive -Context $ctx -ContentTypesEnabled $ContentTypesEnabled
