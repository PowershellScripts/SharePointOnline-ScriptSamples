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
  
$site=$ctx.Site
$ctx.Load($site)
$ctx.ExecuteQuery()


      $site.Features.Remove($featureguid, $true);
      $ctx.ExecuteQuery()
      Write-Host "Feature removed for" $site.Url      

 

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
  
$site=$ctx.Site
$ctx.Load($site)
$ctx.Load($ctx.Web.Webs)
$ctx.ExecuteQuery()


      $site.Features.Add($featureguid, $true, [Microsoft.SharePoint.Client.FeatureDefinitionScope]::None)
      $ctx.ExecuteQuery()
      Write-Host "Feature enabled for" $site.Url


      
}




Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
$csvPath= Read-Host -Prompt "Enter the path of the csv file"
$users=import-csv $csvPath
$siteUrl = Read-Host -Prompt "Enter the my site host: https://tenant-my.sharepoint.com”
$username = Read-Host -Prompt "Enter admin@tenant.onmicrosoft.com"
$password = Read-Host -Prompt "Enter password" -AsSecureString 
$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl) 
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password) 
$ctx.Credentials= New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password) 
$adminUrl=$siteUrl.Replace("-my","-admin")
Connect-SPOService -Url $adminUrl -Credential $username

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

   foreach($user in $users)
   {
     if($user.Site -ne "")
     {
     $urelek=$siteUrl+$user.Site
     $urelek=$urelek.TrimEnd("/")
     Set-SPOUser -Site $urelek -LoginName $username -IsSiteCollectionAdmin $true
   Add-SPOFeature -Username $username -Url $urelek -password $password

   #Set-SPOUser -Site $urelek -LoginName $username -IsSiteCollectionAdmin $false
      
   }
      
}
}
elseif($RemoveorAdd -like "d")
{
   foreach($user in $users)
   {
     if($user.Site -ne "")
     {
     $urelek=$siteUrl+$user.Site
     $urelek=$urelek.TrimEnd("/")
     Set-SPOUser -Site $urelek -LoginName $username -IsSiteCollectionAdmin $true
   Remove-SPOFeature -Username $username -Url $urelek -password $password
      }
   }
}
else
{
Write-Host "Didn't recognize the command"
}
    
    
   
Write-Host "Done."    -ForegroundColor Green
  
