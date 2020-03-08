function Set-SPOTenant{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		$password,
		[Parameter(Mandatory=$true,Position=4)]
		[Bool]$OwnerAnonymousNotification
	)

	$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($url)
	$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
	$ctx.Load($ctx.Web)
	$ctx.ExecuteQuery()

	$spoTenant= New-Object Microsoft.Online.SharePoint.TenantAdministration.Tenant($Ctx) 
	$ctx.Load($spoTenant)
	$ctx.ExecuteQuery()
	$spoTenant.NotificationsInOneDriveForBusinessEnabled =$true
	$spoTenant.OwnerAnonymousNotification=$OwnerAnonymousNotification
	$ctx.Load($spoTenant)
	$ctx.ExecuteQuery()
	Write-Output $spoTenant  
}

#Paths to SDK
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\SharePoint Client Components\16.0\Assemblies\Microsoft.Online.SharePoint.Client.Tenant.dll"  
 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="admin@TENANT.onmicrosoft.com"
$Url="https://TENANT-admin.sharepoint.com"
$OwnerAnonymousNotification=$true   #Whether ODB owner should be notified when anonymous link is created or changed

Set-SPOTenant -Username $username -Url $Url -password $AdminPassword -OwnerAnonymousNotification $OwnerAnonymousNotification
