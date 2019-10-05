function Set-SPOWeb
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$false,Position=4)]
		[string]$Description="",
[ValidateSet("True","False","", 0, 1)]
[Parameter(Mandatory=$false,Position=5)]
		[string]$EnableMinimalDownload="",
[ValidateSet("True","False","", 0, 1)]
[Parameter(Mandatory=$false,Position=6)]
		[string]$QuickLaunchEnabled="",
[Parameter(Mandatory=$false,Position=7)]
		[string]$Title="",
[ValidateSet("True","False","", 0, 1)]
[Parameter(Mandatory=$false,Position=8)]
		[string]$TreeViewEnabled=""
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()

  

  if($Description -ne "")
  {
	  $ctx.Web.Description = $Description
	  $ctx.Web.Update()
	  $ctx.ExecuteQuery()
	  Write-Host "Description set to " $Description -ForegroundColor Green
  }


     if($EnableMinimalDownload -ne "")
  {
	  $ctx.Web.EnableMinimalDownload = $EnableMinimalDownload
	  $ctx.Web.Update()
	  $ctx.ExecuteQuery()
	  Write-Host "Minimal Download set to " $EnableMinimalDownload -ForegroundColor Green
  }

    if($QuickLaunchEnabled -ne "")
  {

	  $ctx.Web.QuickLaunchEnabled = $QuickLaunchEnabled
	  $ctx.Web.Update()
	  $ctx.ExecuteQuery()
	  Write-Host "Quick launch set to " $QuickLaunchEnabled -ForegroundColor Green
  }

 


    if($Title -ne "")
  {
	  $ctx.Web.Title = $Title
	  $ctx.Web.Update()
	  $ctx.ExecuteQuery()
	  Write-Host "Title set to " $Title -ForegroundColor Green
  }

   if($TreeViewEnabled -ne "")
  {
	  $ctx.Web.TreeViewEnabled = $TreeViewEnabled
	  $ctx.Web.Update()
	  $ctx.ExecuteQuery()
	  Write-Host "Treeview set to " $TreeViewEnabled -ForegroundColor Green
  }


}


Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 




 Export-ModuleMember -Function "Set-SPOWeb"
