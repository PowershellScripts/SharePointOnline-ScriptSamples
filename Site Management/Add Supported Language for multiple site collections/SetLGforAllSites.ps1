

function Add-SPOUILanguages
{
  
   param (
   [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[Int]$lcid
		)
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
   $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery() 


   Write-Host $ctx.Web.Url
   $ctx.Web.IsMultilingual=$true
   $ctx.Web.Update()
   $ctx.ExecuteQuery()
   $ctx.Web.AddSupportedUILanguage($lcid)
  
   $ctx.Web.Update()
   

$ctx.ExecuteQuery()
 
 $ctx.Dispose()
}

     
     
 


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll"
# Insert the credentials and the name of the admin site
$Username="user@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$adminUrl="https://tenant-admin.sharepoint.com"
$lcid=1031

Connect-SPOService $adminUrl -Credential $Username

$sites=(get-spoSite).Url

foreach($site in $sites)
{

Add-SPOUILanguages -Username $Username -AdminPassword $AdminPassword -Url $site -lcid $lcid
}