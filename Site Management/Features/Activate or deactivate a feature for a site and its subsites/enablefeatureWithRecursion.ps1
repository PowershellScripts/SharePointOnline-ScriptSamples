function Remove-SPOFeature
{
param (
        [string]$Username,
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=2)]
		$password
)

$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  
$site=$ctx.Web
$ctx.Load($site)
$ctx.Load($ctx.Web.Webs)
$ctx.ExecuteQuery()


      $site.Features.Remove($featureguid, $true);
      $ctx.ExecuteQuery()
      Write-Host "Feature removed for" $site.Url      

      if($ctx.Web.Webs.Count -gt 0)
      {
       foreach ($web in $ctx.Web.Webs)
       {
        Remove-SPOFeature -Username $Username -Url $web.Url -password $password
       }
      }

}


function Add-SPOFeature
{
param (
        [string]$Username,
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=2)]
		$password
)

$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  
$site=$ctx.Web
$ctx.Load($site)
$ctx.Load($ctx.Web.Webs)
$ctx.ExecuteQuery()


      $site.Features.Add($featureguid, $true, [Microsoft.SharePoint.Client.FeatureDefinitionScope]::None)
      $ctx.ExecuteQuery()
      Write-Host "Feature enabled for" $site.Url

      if($ctx.Web.Webs.Count -gt 0)
      {
       foreach ($web in $ctx.Web.Webs)
       {
        Add-SPOFeature -Username $Username -Url $web.Url -password $password
       }
      }
      
}


Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

$siteUrl = Read-Host -Prompt "Enter https://tenant.sharepoint.com/sites/mysitecollection”
$username = Read-Host -Prompt "Enter admin@tenant.onmicrosoft.com"
$password = Read-Host -Prompt "Enter password" -AsSecureString 
$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl) 
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password) 
$ctx.Credentials= New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password) 

try
{
$ctx.ExecuteQuery()
}
catch [Net.WebException] 
        {
            
            Write-Host "Wrong credentials" $_.Exception.Message -ForegroundColor Red
        }

$feature=Read-Host -Prompt "Enter the feature id, e.g. for SharePoint Server Publishing it's 94c94ca6-b32f-4da9-a9e3-1f3d343d7ecb"
$featureguid=new-object System.Guid $feature 
$RemoveorAdd= Read-Host "Do you want to activate the feature to the sites (a) or deactivate it (d)? Press a or d."
$RemoveorAdd=$RemoveorAdd.Trim()

if($RemoveorAdd -like "a")
{
   
   Add-SPOFeature -Username $username -Url $siteUrl -password $password
      
}
elseif($RemoveorAdd -like "d")
{
   Remove-SPOFeature -Username $username -Url $siteUrl -password $password
   
}
else
{
Write-Host "Didn't recognize the command"
}
    
    
   
Write-Host "Done."    -ForegroundColor Green
  
