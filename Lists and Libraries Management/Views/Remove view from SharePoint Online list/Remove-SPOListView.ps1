function Remove-SPOListView
{
 param (
        [Parameter(ParameterSetName="seta", Mandatory=$true,Position=0)]
		[string]$ListName="",
        [Parameter(ParameterSetName="seta", Mandatory=$true,Position=0)]
		[string]$ViewName="",
        [Parameter(ParameterSetName="setb", Mandatory=$true,Position=0)]
		[string]$ListGUID="",
        [Parameter(ParameterSetName="setb", Mandatory=$true,Position=0)]
		[string]$ViewGUID="",
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url
		)
$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ll
  $vv
   switch ($PsCmdlet.ParameterSetName) 
    { 
    "seta"  { 
    $ll=$ctx.Web.Lists.GetByTitle($ListName)
    $vv=$ll.Views.GetByTitle($ViewName); break} 
    "setb"  { 
    $ll=$ctx.Web.Lists.GetByID($ListGUID)
    $vv=$ll.Views.GetByID($ViewGUID); break} 
    }
    $ctx.Load($vv)
    $ctx.ExecuteQuery()
    $vv.DeleteObject()
    $ctx.ExecuteQuery

}


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="t@trial456.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://trial456.sharepoint.com/sites/teamsitewithlibraries"
$ListTitle="quick2"
$viewName="formattte"


Remove-SPOListView -ListName $ListTitle -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -ViewName $viewName