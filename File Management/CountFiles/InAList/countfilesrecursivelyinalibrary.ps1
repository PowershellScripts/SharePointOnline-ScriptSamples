# count files recursively in the entire library

Install-Module -Name PnP.PowerShell -Force -AllowClobber
Import-Module PnP.PowerShell

Connect-PnPOnline -Url "https://yourtenant.sharepoint.com/sites/yoursite" -Interactive


# Define the document library name
$libraryName = "Documents"  # Change this to your document library name

# Get the root folder of the document library
$rootFolder = Get-PnPList -Identity $libraryName | Get-PnPProperty -Property RootFolder

# Initialize file count
$fileCount = 0

# Function to count files recursively in a folder
function Count-Files($folder) {
    param ($folder)
    
    # Count files in the current folder
    $fileCount += ($folder | Get-PnPFolderItem -ItemType File).Count
    
    # Get all subfolders and recurse into each one
    $subFolders = Get-PnPFolderItem -FolderSiteRelativeUrl $folder.ServerRelativeUrl -ItemType Folder
    foreach ($subFolder in $subFolders) {
        Count-Files -folder $subFolder
    }
}

# Start counting files from the root folder of the document library
Count-Files -folder $rootFolder

# Output the total count
Write-Host "Total files in the document library '$libraryName': $fileCount"


