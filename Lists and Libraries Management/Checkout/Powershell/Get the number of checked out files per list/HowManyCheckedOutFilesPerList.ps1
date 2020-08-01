function Get-SPOFolderFiles   # https://gallery.technet.microsoft.com/office/Find-checked-out-files-in-0533b17c/view/Discussions#content
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$password
		)

# Create context and test the connection
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)

  #Use this line if you are working on SharePoint Server
  #$ctx.Credentials = New-Object System.Net.NetworkCredential($Username, $password)

  #This line is working for SHarePoint Online. Comment it out, if you are running this script on a server
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)


  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()


  $llists=$ctx.Web.Lists
  $ctx.Load($llists)
  $ctx.ExecuteQuery()

  foreach($list in $llists)
  {
    $ctx.Load($list)
    $ctx.ExecuteQuery()

    #lists do not support checkout 
    if($list.BaseTemplate -eq 100) {continue;}
    
    $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery  
    $spqQuery.ViewXml="<View Scope='RecursiveAll'><Query><OrderBy><FieldRef Name='ID' Ascending='False'/></OrderBy>"+
        "</Query>"+
        "<RowLimit>1</RowLimit>"+
        "</View>"

    $maxIndex=$list.GetItems($spqQuery)
    $ctx.Load($maxIndex)
    $ctx.ExecuteQuery()
    $NumberOfItemsInTheList=$maxIndex[0].Id


    $itemki=@()
    $ViewThreshold=4500
    $TotalNumberOfCheckedOutItems = 0

    [decimal]$NoOfRuns=($NumberOfItemsInTheList/$ViewThreshold)
    $NoOfRuns=[math]::Ceiling($NoOfRuns)

    for($WhichRun=0; $WhichRun -lt $NoOfRuns; $WhichRun++)
    {
        $itemki=@()
        $startIndex=$WhichRun*$ViewThreshold
        $endIndex=$startIndex+$ViewThreshold      
        $spqQuery.ViewXml="<View Scope='RecursiveAll'><Query><Where><And><And>"+
		    "<Geq><FieldRef Name='ID'></FieldRef><Value Type='Number'>"+$startIndex+"</Value></Geq>"+
		    "<Lt><FieldRef Name='ID'></FieldRef><Value Type='Number'>"+$endIndex+"</Value></Lt>"+
		    "</And><Geq><FieldRef Name='CheckoutUser' LookupId='TRUE' /><Value Type='int'>0</Value></Geq></And></Where><GroupBy><FieldRef Name='CheckoutUser' Ascending='FALSE' /></GroupBy></Query></View>"
        
        Write-Progress $spqQuery.ViewXml
        $partialItems=$list.GetItems($spqQuery)
        $ctx.Load($partialItems)

        try
        {
            $ctx.ExecuteQuery()

            foreach($partialItem in $partialItems)
            {
                $itemki+=$partialItem
            }

            $TotalNumberOfCheckedOutItems = $TotalNumberOfCheckedOutItems + $partialItems.Count    
            #Process-Items -Ctx $ctx -Itemki $itemki
    

        }
        catch
        {
            Write-Host "List " $list.Title $list.BaseTemplate  " unsupported"  # $_  #Remove comment to see error message
            break;

        }
    }

        Write-host $list.Title $list.ParentWebUrl  $TotalNumberOfCheckedOutItems -ForegroundColor Green

        [pscustomobject]@{
        ListName = $list.Title
        ParentWebUrl = $list.ParentWebUrl
        "Number Of Checked Out Files" = $TotalNumberOfCheckedOutItems
        } | Export-Csv -Path C:\Users\Public\howmanycheckedoutperlist2.csv -Append
  }

  $ctx.Dispose()
}
        





#Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="ana@etr56.onmicrosoft.com"
$Url="https://etr56.sharepoint.com/sites/demigtest11-2"




Get-SPOFolderFiles -Username $username -Url $Url -password $AdminPassword 