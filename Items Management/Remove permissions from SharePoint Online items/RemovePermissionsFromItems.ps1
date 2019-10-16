<#Powershell script to remove permissions for all items in a SharePoint Online list. As a result, only the user running this script will have access to the files. Before you run it, you have to modify the last line of the script! #>
function Remove-SPOListAllItemsInheritance
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
  
  
  
  $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.ExecuteQuery()


  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
  $spqQuery.ViewXml ="<View Scope='RecursiveAll' />"


  $itemki=$ll.GetItems($spqQuery)
  $ctx.Load($itemki)
  $ctx.ExecuteQuery()


  for($j=0;$j -lt $itemki.Count ;$j++)
  {    
      $itemki[$j].BreakRoleInheritance($false, $false)  
  }

 
   $ctx.ExecuteQuery()

  }


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"




Remove-SPOListAllItemsInheritance -Username "trial@trialtrial123.onmicrosoft.com" -Url "https://trialtrial123.sharepoint.com" -AdminPassword "Pass" -ListTitle "chc1"
