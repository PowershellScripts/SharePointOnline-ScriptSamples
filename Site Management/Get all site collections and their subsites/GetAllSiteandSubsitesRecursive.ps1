function Get-SPOAllWeb
{
  
   param (
   [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url
		)
 $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.Load($ctx.Web.Webs)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()

  Write-Host $ctx.Web.Url
  if($ctx.Web.Webs.Count -eq 0)
  {
   
  }
  else{
  foreach ($web in $ctx.Web.Webs)
  {
    Get-SPOAllWeb -Username $Username -AdminPassword $AdminPassword -Url $web.Url
  }}

}

$passie=Read-Host -Prompt "Password" -AsSecureString
$adminUrelek=Read-Host -Prompt "Admin url"
$adminUserName=Read-Host -Prompt "Admin username" 
Connect-SPOService -Url $adminUrelek -Credential $adminUserName
$sites=(Get-SPOSite -Limit All).Url



foreach($url in $sites)
{

  Get-SPOAllWeb -Username $adminUserName -AdminPassword $passie -Url $url



}


