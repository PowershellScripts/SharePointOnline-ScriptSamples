
# Connect to SharePoint Online
Connect-PnPOnline -Url "https://yoursite.sharepoint.com/sites/yoursite" -Interactive

# Define the folder URL relative to the document library
$folderUrl = "/sites/yoursite/Shared Documents/YourFolder"
$list = "Shared Documents"

# Initialize the count for items with unique permissions
$fileCountWithUniquePermissions = 0;

# Get the folder
$folder = Get-PnPFolder -Url $folderUrl -Includes Files, Folders

foreach ($file in $folder.Files) {
    $fileItem = Get-PnPListItem -List $list -Id $file.ListItemAllFields.Id
    if ($fileItem.HasUniqueRoleAssignments) {
        $fileCountWithUniquePermissions++
    }
}


# Output the total count
Write-Host "Total files:  $fileCountWithUniquePermissions"
