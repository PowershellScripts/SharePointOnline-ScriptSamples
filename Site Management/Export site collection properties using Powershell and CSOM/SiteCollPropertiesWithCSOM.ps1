function Get-SiteColl{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		$password
	)


	$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($url)
	$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
	$ctx.Load($ctx.Web)
	$ctx.ExecuteQuery()

	$spoTenant= New-Object Microsoft.Online.SharePoint.TenantAdministration.Tenant($Ctx) 
	$spoTenantSiteCollections=$spoTenant.GetSiteProperties(0,$true) 
	$ctx.Load($spoTenantSiteCollections) 
	$ctx.ExecuteQuery() 

	foreach($siteColl in $spoTenantSiteCollections){
		Write-Output $siteColl
	}     
}




#Paths to SDK
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.Online.SharePoint.Client.Tenant.dll"  


 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="admin@TENANT.onmicrosoft.com"
$Url="https://TENANT-admin.sharepoint.com"




Get-SiteColl -Username $username -Url $Url -password $AdminPassword | Export-Csv C:\Users\Arleta.Wanat\Desktop\'August 2017'\testcsv.csv
