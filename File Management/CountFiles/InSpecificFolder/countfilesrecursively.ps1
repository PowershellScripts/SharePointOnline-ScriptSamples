### Count all files recursively inside a specific folder


Install-Module -Name PnP.PowerShell -Force -AllowClobber
Import-Module PnP.PowerShell


Connect-PnPOnline -Url "https://yourtenant.sharepoint.com/sites/yoursite" -Interactive


# Define the folder URL relative to the document library
$folderUrl = "/sites/yoursite/Shared Documents/YourFolder"

# Get the folder
$folder = Get-PnPFolder -Url $folderUrl -Includes Files, Folders

# Initialize file count
$fileCount = 0

# Function to count files recursively
function Count-Files($folder) {
    param ($folder)
    
    # Count files in the current folder
    $fileCount += $folder.Files.Count
    
    # Recurse into each subfolder
    foreach ($subFolder in $folder.Folders) {
        Count-Files -folder $subFolder
    }
}

# Start counting files from the root folder
Count-Files -folder $folder

# Output the total count
Write-Host "Total files: $fileCount"
