function Disable-Flows{
	param (
        	[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$AdminUrl,
        	[Parameter(Mandatory=$true,Position=3)]
		$Password,
        	[Parameter(Mandatory=$true,Position=4)]
		$Url
	)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Adminurl)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.ExecuteQuery()

  $spoTenant= New-Object Microsoft.Online.SharePoint.TenantAdministration.Tenant($Ctx) 
  $siteColl=$spoTenant.GetSitePropertiesByUrl($Url, $true)
  
  $ctx.Load($siteColl) 
  $ctx.ExecuteQuery() 

  $siteColl.DisableFlows= [Microsoft.Online.SharePoint.TenantAdministration.FlowsPolicy]::Disabled
  $siteColl.Update()
  $ctx.ExecuteQuery()
  Write-Output $siteColl  

}


#Paths to SDK
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
#Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
add-type -Path "C:\Program Files\SharePoint Client Components\16.0\Assemblies\Microsoft.Online.SharePoint.Client.Tenant.dll"
#Microsoft.Online.SharePoint.TenantAdministration.SiteProperties.AllowLimitedAccess

 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="admin@TENANT.onmicrosoft.com"
$AdminUrl="https://TENANT-admin.sharepoint.com"
$Url="https://TENANT.sharepoint.com"



Disable-Flows -Username $username -AdminUrl $AdminUrl -password $AdminPassword -Url $Url
