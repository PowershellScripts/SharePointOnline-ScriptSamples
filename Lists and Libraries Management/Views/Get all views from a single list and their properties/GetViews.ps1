function Get-SPOListView{
	param(
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle
	)
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
 $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
 $ctx.load($ll)
 $ctx.load($ll.Views)
 $ctx.ExecuteQuery()

 foreach($vv in $ll.Views){
  $ctx.Load($vv)
  $ctx.Load($vv.ViewFields)
  $ctx.ExecuteQuery()
  Write-Output $vv
 } 
}



  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="t@trial456.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://trial456.sharepoint.com/sites/teamsitewithlibraries"
$ListTitle="quick2"




Get-SPOListView -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -ListTitle $ListTitle
