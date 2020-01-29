
$webUrl="Enter here the url of your site, e.g. https://intra.Company.com"
$pathToExportReport="c:\MyCSV.csv"

Add-PSSnapin Microsoft.SharePoint.PowerShell

$web=Get-SPWeb $webUrl

$lists=$web.Lists

foreach($list in $lists)
{
   Write-Host "Processing list "$list.Title 
   Write-Host "         ...........           Items count: " $list.ItemCount
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



}
