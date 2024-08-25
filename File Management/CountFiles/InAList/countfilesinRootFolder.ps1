# count files in the entire library   (not recursive!)

Install-Module -Name PnP.PowerShell -Force -AllowClobber
Import-Module PnP.PowerShell

Connect-PnPOnline -Url "https://yourtenant.sharepoint.com/sites/yoursite" -Interactive

# Define the document library name
$libraryName = "Documents"  # Change this to your document library name

# Get the root folder of the document library
$Folder = Get-PnPList -Identity $libraryName | Get-PnPProperty -Property RootFolder

$items = Get-PnPFolderItem -FolderSiteRelativeUrl $folder.ServerRelativeUrl

# Output the total count
Write-Host "Total files in the document library '$libraryName': $($items.Count)"
