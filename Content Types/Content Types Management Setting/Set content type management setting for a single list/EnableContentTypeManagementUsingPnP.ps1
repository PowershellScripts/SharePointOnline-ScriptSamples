# Prompt for site URL, list name, and content type setting
$Url = Read-Host "Enter the SharePoint Online site URL"
$ListName = Read-Host "Enter the list name"
$ContentTypesEnabled = Read-Host "Enable content type management? (true/false)"

# Connect to SharePoint Online
Connect-PnPOnline -Url $Url -UseWebLogin

# Set the content type management setting for the specified list
Set-PnPList -Identity $ListName -ContentTypesEnabled [System.Convert]::ToBoolean($ContentTypesEnabled)
