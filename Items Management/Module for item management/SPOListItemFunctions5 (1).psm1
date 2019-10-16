function Remove-SPOListItemInheritance
{
  
   param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=5)]
		[Int]$ItemID
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
$spqQuery.ViewXml ="<View Scope='RecursiveAll' />";


  $itemek=$ll.GetItemByID($ItemID)
  $ctx.Load($itemek)
  $ctx.ExecuteQuery()
  $itemek.BreakRoleInheritance($true, $false)
  try
  {
  $ctx.ExecuteQuery()
  write-host $itemek.Name " Success"
  }
 catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }
  
  
  }


  function Remove-SPOListItemPermissions
{
  
   param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=5)]
		[Int]$ItemID
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
$spqQuery.ViewXml ="<View Scope='RecursiveAll' />";


  $itemek=$ll.GetItemByID($ItemID)
  $ctx.Load($itemek)
  $ctx.ExecuteQuery()
  $itemek.BreakRoleInheritance($false, $false)
  try
  {
  $ctx.ExecuteQuery()
  write-host $itemek.Name " Success"
  }
catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }
  
  
  }


  function Restore-SPOListItemInheritance
{
  
   param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=5)]
		[Int]$ItemID
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
$spqQuery.ViewXml ="<View Scope='RecursiveAll' />";


  $itemek=$ll.GetItemByID($ItemID)
  $ctx.Load($itemek)
  $ctx.ExecuteQuery()
  $itemek.ResetRoleInheritance()
  try
  {
  $ctx.ExecuteQuery()
  write-host $itemek.Name " Success"
  }
 catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }
  
  
  }

  function Remove-SPOListItem
{
  
   param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=5)]
		[Int]$ItemID
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
$spqQuery.ViewXml ="<View Scope='RecursiveAll' />";


  $itemek=$ll.GetItemByID($ItemID)
  $ctx.Load($itemek)
  $ctx.ExecuteQuery()
  $itemek.DeleteObject()
  try
  {
  $ctx.ExecuteQuery()
  write-host $itemek.Name " Success"
  }
catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }
  
  
  }




  function Update-SPOListItem
{
  
   param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=5)]
		[Int]$ItemID,
[Parameter(Mandatory=$true,Position=6)]
		[string]$FieldToUpdate,
[Parameter(Mandatory=$true,Position=7)]
		[string]$ValueToUpdate
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
 $spqQuery.ViewXml ="<View Scope='RecursiveAll' />";


  $itemek=$ll.GetItemByID($ItemID)
  $ctx.Load($itemek)
  $ctx.ExecuteQuery()
  $itemek[$FieldToUpdate] = $ValueToUpdate
  $itemek.Update()
  try
  {
  $ctx.ExecuteQuery()
  write-host $itemek.Name " Success"
  }
  catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }
  
  
  }

# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"


Export-ModuleMember "Update-SPOListItem", "Remove-SPOListItem", "Remove-SPOListItemPermissions", "Remove-SPOListItemInheritance", "Restore-SPOListItemInheritance"