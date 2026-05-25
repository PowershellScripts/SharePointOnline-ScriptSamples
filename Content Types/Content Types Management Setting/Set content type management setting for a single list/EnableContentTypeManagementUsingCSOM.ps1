#
# Updated by Arleta Wanat, 2023
#


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the site and list
$Url = Read-Host "Enter the SharePoint Online site URL"
$Username = Read-Host "Enter your username"
$AdminPassword = Read-Host -AsSecureString "Enter your password"
$ListName = Read-Host "Enter the list name"
$ContentTypesEnabled = Read-Host "Enable content type management? (true/false)"


# Connect
$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($Url)
$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
$ctx.ExecuteQuery() 

# Update the setting

$ll = $ctx.Web.Lists.GetByTitle($ListName)
$ll.ContentTypesEnabled = [System.Convert]::ToBoolean($ContentTypesEnabled)
$ll.Update()

try {
    $ctx.ExecuteQuery()
    Write-Host "Done" -ForegroundColor Green
}
catch {
    Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
}
