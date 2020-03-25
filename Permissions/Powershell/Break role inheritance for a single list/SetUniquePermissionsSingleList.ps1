function Set-SPOListBreakRoleInheritance
{
  
   param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle
		)
   
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $lista=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($lista)
  $ctx.ExecuteQuery()

  $lista.BreakRoleInheritance($true, $false)
  $lista.Update()

  try
  {
    $ctx.ExecuteQuery()
    Write-Host "Removed inherited permissions for " $lista.Title
  }
  catch
  {
    Write-Host "Failed to remove permissions for " $lista.Title
  }     
    
  
}


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 


$username = "anaida@etr546.onmicrosoft.com"
$siteurl = "https://etr546.sharepoint.com/sites/testflow"
$listTitle = "Customers"


# do not modify the lines below
$AdminPassword = Read-Host "Enter password" -AsSecureString
Set-SPOListBreakRoleInheritance -Username $username -Url $siteurl -AdminPassword $AdminPassword -ListTitle $listTitle