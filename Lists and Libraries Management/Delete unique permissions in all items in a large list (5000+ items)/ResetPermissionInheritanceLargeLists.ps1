function Restore-SPOListAllItemsInheritance
{
  
   param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[SecureString]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle
		)
  
  
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.ExecuteQuery()

  ## View XML
$qCommand = @"
<View Scope="RecursiveAll">
    <Query>
        <OrderBy><FieldRef Name='ID' Ascending='TRUE'/></OrderBy>
    </Query>
    <RowLimit Paged="TRUE">5000</RowLimit>
</View>
"@
## Page Position
$position = $null
 
## All Items
$allItems = @()
Do{
    $camlQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
    $camlQuery.ListItemCollectionPosition = $position
    $camlQuery.ViewXml = $qCommand
 ## Executing the query
    $currentCollection = $ll.GetItems($camlQuery)
    $ctx.Load($currentCollection)
    $ctx.ExecuteQuery()
 
 ## Getting the position of the previous page
    $position = $currentCollection.ListItemCollectionPosition
 
 # Adding current collection to the allItems collection
    $allItems += $currentCollection

     Write-Host "Collecting items. Current number of items: " $allItems.Count


}
 while($position -ne $null)
 

 Write-Host "Total number of items: " $allItems.Count

  for($j=0;$j -lt $allItems.Count ;$j++)
  {
        
      Write-Host "Resetting permissions for " $allItems[$j]["Title"] ".." $allItems[$j]["FileRef"]
      $allItems[$j].ResetRoleInheritance()
      $ctx.ExecuteQuery()
   
  }

 
   

  
  
  }


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"

#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="arleta@TENANT.onmicrosoft.com"
$Url="https://TENANT.sharepoint.com/sites/testID1de"
$ListTitle="testitems"


Restore-SPOListAllItemsInheritance -Username $username -Url $Url -AdminPassword $AdminPassword -ListTitle $ListTitle
