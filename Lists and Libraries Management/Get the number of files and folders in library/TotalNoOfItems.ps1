function Get-SPOListItemCount
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle  
		)

  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()

  $list=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($list)
  $ctx.ExecuteQuery()

  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
  $spqQuery.ViewXml ="<View Scope='RecursiveAll' />";
  $listItems=$list.GetItems($spqQuery)
  $ctx.Load($listItems)
  $ctx.ExecuteQuery()
  
<# Uncomment if you want to see the split between files and folders  
  
  $NoOfFiles=0
  $NoOfFolders=0

  foreach($item in $listItems)
  {
    if($item.FileSystemObjectType -eq "File")
    {
        $NoOfFiles++;
    }
    if($item.FileSystemObjectType -eq "Folder")
    {
        $NoOfFolders++;
    }
  }
  
  Write-Host "Total number of items: " $list.ItemCount
  Write-Host "Number of files:" $NoOfFiles
  Write-Host "Number of folders:" $NoOfFolders 
       
  #>

  return $list.ItemCount 


}

Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 


 $Username="test@tenant.onmicrosoft.com"
 $Url = "https://tenant.sharepoint.com/sites/test"
 $ListTitle = "noci"
 $Password = Read-Host -Prompt "Enter password" -AsSecureString

 Get-SPOListItemCount -Username $Username -AdminPassword $Password -Url $Url -ListTitle $ListTitle
