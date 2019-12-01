Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

$siteUrl = Read-Host -Prompt "Enter https://tenant.sharepoint.com/sites/mysitecollection”
$username = Read-Host -Prompt "Enter admin@tenant.onmicrosoft.com"
$password = Read-Host -Prompt "Enter password" -AsSecureString 
$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl) 
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password) 
$ctx.Credentials= New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password) 

$rootWeb = $ctx.Web 
$sites  = $rootWeb.Webs

$ctx.Load($rootWeb)
$ctx.Load($sites)
$ctx.ExecuteQuery()
$feature=Read-Host -Prompt "Enter the feature id, e.g. for SharePoint Server Publishing it's 94c94ca6-b32f-4da9-a9e3-1f3d343d7ecb"
$featureguid=new-object System.Guid $feature 
$RemoveorAdd= Read-Host "Do you want to activate the feature to the sites (a) or deactivate it (d)? Press a or d."
$RemoveorAdd=$RemoveorAdd.Trim()

if($RemoveorAdd -like "a")
{
   
   foreach($site in $sites)
   {
      $site.Features.Add($featureguid, $true, [Microsoft.SharePoint.Client.FeatureDefinitionScope]::None)
      #$site.Features.Remove($featureguid, $true);
      $ctx.ExecuteQuery()
      Write-Host "Feature enabled for" $site.Url
      }
      Write-Host "Done."
}
elseif($RemoveorAdd -like "d")
{
   
   foreach($site in $sites)
   {
      $site.Features.Remove($featureguid, $true);
      $ctx.ExecuteQuery()
      Write-Host "Feature removed for" $site.Url
      }
      Write-Host "Done."
}
else
{
Write-Host "Didn't recognize the command"
}
    
    
   
    
  
