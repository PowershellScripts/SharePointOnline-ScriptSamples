
$webUrl="http://nicename:17007/sites/devSite"
$pathToExportReport="c:\MyCSV.csv"

Add-PSSnapin Microsoft.SharePoint.PowerShell

$web=Get-SPWeb $webUrl

$lists=$web.Lists

foreach($list in $lists)
{
   Write-Host "Processing list "$list.Title 
   Write-Host "         ....  List has unique permissions: " $list.HasUniqueRoleAssignments 
   Write-Host "         ...........           Items count: " $list.ItemCount
   Write-Host "         ...........         Folders count: " $list.Folders.Count
    
    $folders=$list.Folders
    $uniqueFolders=0
    foreach($folder in $folders)
    {
        if($folder.HasUniqueRoleAssignments)
        {
            $folder | Export-Csv $pathToExportReport -Append
            $uniqueFolders++
        }

    }
    

    $items=$list.Items
    $uniqueItemsCount=0
    foreach($item in $items)
    {

        
        if($item.HasUniqueRoleAssignments)
        {

            $item | export-csv $pathToExportReport -Append
            $uniqueItemsCount++

        }

    }
    Write-Host "         ...........    Unique items count: " $uniqueItemsCount
    Write-Host "         ...........  Unique folders count: " $uniqueFolders


}