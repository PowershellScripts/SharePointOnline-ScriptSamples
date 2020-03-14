function Get-Items
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$password,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=5)]
		[string]$UserDisplayName
		)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.ExecuteQuery()
  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery

 # use this line if you want to limit the files to a specific folder 
 # $spqQuery.ViewXml ="<View Scope='RecursiveAll' /><Where><Eq><FieldRef Name='ServerRelativeUrl'/><Value Type='Text'>/Customers/blank</Value></Eq></Where>";

  $spqQuery.ViewXml ="<View Scope='RecursiveAll'><Query><OrderBy><FieldRef Name='Modified' Ascending='FALSE'/></OrderBy><Where><Eq><FieldRef Name='Editor' /><Value
Type='User'>"+$UserDisplayName+"</Value></Eq></Where></Query><RowLimit>10</RowLimit></View>";
  
  
    $items=$ll.GetItems($spqQuery)
    $ctx.Load($items)
    $ctx.ExecuteQuery()




  foreach($item in $items)
  {
        Write-Host "Processing item no " $item.ID " " -NoNewline
        $ctx.Load($item)
        $ctx.Load($item.File)
        $ctx.Load($item.Fieldvaluesastext)
        $ctx.ExecuteQuery()
        Write-Host $item.Fieldvaluesastext.FieldValues["FileDirRef"] "/"$item.Fieldvaluesastext.FieldValues["FileLeafRef"]  
        

        $Object = New-Object PSObject 
        $Object | add-member ID $item.ID                                     
        $Object | add-member FileDirRef $item.Fieldvaluesastext.FieldValues["FileDirRef"]
        $Object | add-member FileLeafRef $item.Fieldvaluesastext.FieldValues["FileLeafRef"]
        $Object | add-member LastModified $item.Fieldvaluesastext.FieldValues["Last_x0020_Modified"]
        Export-Csv -InputObject $Object -Path "c:\users\public\TenItems.csv" -Append
  }

  Write-Host 
  Write-Output "Execution finished." 
  $ctx.Dispose()
}






#Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.Office.Client.Policy.dll"   

 
#Enter the data
$username = "ana@etr56.onmicrosoft.com"
$Url = "https://etr56.sharepoint.com/sites/testflow"
$ListTitle = "Customers"
$UserDisplayName = "FR"



#Do not modify the lines below
$AdminPassword = Read-Host -Prompt "Enter password" -AsSecureString
Get-Items -Username $username -Url $Url -password $AdminPassword -ListTitle $ListTitle -UserDisplayName $UserDisplayName