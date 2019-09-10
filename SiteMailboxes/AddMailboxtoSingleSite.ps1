Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 


$subsite = Read-Host -Prompt "Enter full subsite url, e.g. https://tenant.sharepoint.com/sites/mysitecollection/subsite”
$username = Read-Host -Prompt "Enter admin's login, e.g. admin@domain.onmicrosoft.com"
$password = Read-Host -Prompt "Enter password" -AsSecureString 
$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($subsite)  
$ctx.Credentials= New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password) 

$rootWeb = $ctx.Web 

$ctx.Load($rootWeb)

$ctx.ExecuteQuery()
$feature="502a2d54-6102-4757-aaa0-a90586106368"
$featureguid=new-object System.Guid $feature 

  
      $rootWeb.Features.Add($featureguid, $true, [Microsoft.SharePoint.Client.FeatureDefinitionScope]::None)
      $ctx.ExecuteQuery()
      Write-Host "Feature enabled for" $rootWeb.Url

  
      new-sitemailbox -displayName $rootWeb.Title -SharePointUrl $rootWeb.Url
 
   
    Write-Host "Mailbox added for" $rootWeb.Title " : " $rootWeb.Url
  
 