#
# Created by Sachchin Annam
#

function Get-SPOUserProperty {
    param (
        [Parameter(Mandatory = $true, Position = 1)]
        [string]$Username,
        [Parameter(Mandatory = $true, Position = 2)]
        $password,
        [Parameter(Mandatory = $true, Position = 3)]
        [string]$url,
        [Parameter(Mandatory = $true, Position = 4)]
        [string]$userLogin
    )

    $Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
    $RestUrl = $url + "/_api/SP.UserProfiles.PeopleManager/GetPropertiesFor(accountName=@v)?@v='i:0%23.f|membership|" + $userLogin + "'"

    $request = [System.Net.WebRequest]::Create($RESTUrl)
    $request.Credentials = $Credentials
    $request.Headers.Add("X-FORMS_BASED_AUTH_ACCEPTED", "f")
    $request.Accept = "application/json;odata=verbose"
    [Microsoft.PowerShell.Commands.WebRequestMethod]$Method = [Microsoft.PowerShell.Commands.WebRequestMethod]::Get
    $request.Method = $Method
    $response = $request.GetResponse()
    $requestStream = $response.GetResponseStream()
    $read = New-Object System.IO.StreamReader $requestStream
    $data = $read.ReadToEnd()
    $results = $data | ConvertFrom-Json

    return ($results.d.userprofileproperties.results)
}

# NOTE: This script requires the SharePoint Online Client Components SDK.
# The paths below might need to be adjusted to your environment.
# You can download the SDK from: https://www.microsoft.com/en-us/download/details.aspx?id=42038
# --- Paths to SDK ---
Add-Type -Path "H:\\Libraries\\Microsoft.SharePoint.Client.dll"
Add-Type -Path "H:\\Libraries\\Microsoft.SharePoint.Client.Runtime.dll"

# --- Script Parameters ---
$AdminPassword = Read-Host -Prompt "Enter password" -AsSecureString
$username = "Admin@t321.onmicrosoft.com"
$Url = "https://t321.sharepoint.com"
$userLogin = "user2@t321.onmicrosoft.com"

# --- Script Body ---
Get-SPOUserProperty -Username $username -Url $Url -password $AdminPassword -userLogin $userLogin | select key, value
