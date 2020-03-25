function Get-SPOListView
{
param(
[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=5)]
		[string]$ViewTitle

		)
  
 $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
 $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
 $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
 $ctx.load($ll)
 $ctx.load($ll.Views)
 $ctx.ExecuteQuery()

 $view = $ll.Views.GetByTitle($ViewTitle)
 $ctx.Load($view)
 $ctx.Load($view.ViewFields)
 $ctx.ExecuteQuery()

 Write-Output $view
}



  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username = "ana@etr56.onmicrosoft.com"
$AdminUrl = "https://etr56.sharepoint.com/sites/testflow"
$ListTitle = "Customers"
$ViewTitle = "FR"


#do not change the lines below
$AdminPassword = Read-Host -Prompt "Password" -AsSecureString
Get-SPOListView -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -ListTitle $ListTitle -ViewTitle $ViewTitle