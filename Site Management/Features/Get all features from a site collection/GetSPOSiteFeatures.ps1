function Get-SPOFeature
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
$ctx.Load($site.Features)
$ctx.Load($ctx.Web.Webs)
$ctx.ExecuteQuery()


    for($i=0;$i -lt $site.Features.Count ;$i++)
{

Write-Output $site.Features[$i].DefinitionID

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




   Get-SPOFeature -Username $username -Url $siteUrl -password $password

    
    
   
Write-Host "Done."    -ForegroundColor Green
  
