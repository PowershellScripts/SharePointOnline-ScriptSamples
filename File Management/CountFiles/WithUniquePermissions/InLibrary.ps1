


# Define the list name
$listName = "YourListName"  

# Get all list items
$items = Get-PnPListItem -List $listName -PageSize 5000

# Initialize the count for items with unique permissions
$uniquePermissionCount = 0

# Iterate through each item to check for unique permissions
foreach ($item in $items) {
    # Check if the item has unique permissions
    if ($item.HasUniqueRoleAssignments) {
        # Increment the count if unique permissions are found
        $uniquePermissionCount++
    }
}

# Output the total count of items with unique permissions
Write-Host "Total items with unique permissions: $uniquePermissionCount"
