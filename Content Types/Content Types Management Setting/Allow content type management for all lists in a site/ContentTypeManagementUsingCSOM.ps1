#
# Created by Sachchin Annam
#

# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the site and the desired setting: $true or $false
$Url = Read-Host "Enter the SharePoint Online site URL"
$Username = Read-Host "Enter your username"
$AdminPassword = Read-Host -AsSecureString "Enter your password"
$ContentTypesEnabled = $true


$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force

$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($Url)
$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
$ctx.ExecuteQuery() 

$Lists = $ctx.Web.Lists

$ctx.Load($Lists)
$ctx.ExecuteQuery()

Foreach ($ll in $Lists) {
    $ll.ContentTypesEnabled = $ContentTypesEnabled
    $ll.Update()

    try {
        $ctx.ExecuteQuery()
        Write-Host $ll.Title "   Done" -ForegroundColor Green
    }
    catch [Net.WebException] {
        Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
    }

}
