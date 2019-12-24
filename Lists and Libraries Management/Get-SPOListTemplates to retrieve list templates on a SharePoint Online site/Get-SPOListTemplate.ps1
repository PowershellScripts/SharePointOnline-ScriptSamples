function Get-SPOListTemplate
{

 $ctx.Load($ctx.Web.ListTemplates)
 $ctx.ExecuteQuery()

 foreach($lt in $ctx.Web.ListTemplates){
 Write-Output $lt
 }
}


function Connect-SPOCSOM
{

<#
	.link
	http://social.technet.microsoft.com/wiki/contents/articles/32334.sharepoint-online-spomod-cmdlets-resources.aspx

  #>

 param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url


)

  $password = Read-Host "Password" -AsSecureString
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.ExecuteQuery()  
$global:ctx=$ctx
}


$global:ctx






# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

$adminLogin="admin@tenant.onmicrosoft.com"
$url="https://tenant.sharepoint.com/sites/invoices"

Connect-SPOCSOM -Username $adminLogin -Url $url
Get-SPOListTemplate 
