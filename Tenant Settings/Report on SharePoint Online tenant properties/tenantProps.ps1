function Get-SiteColl
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$password,
		[Parameter(Mandatory=$true,Position=4)]
		[string]$CSVPath
		)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()

  $spoTenant= New-Object Microsoft.Online.SharePoint.TenantAdministration.Tenant($Ctx) 
  $ctx.Load($spoTenant)
  $ctx.ExecuteQuery()
  
  $spoTenant  | Export-Csv -Path $CSVPath

}




#Paths to SDK
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.Online.SharePoint.Client.Tenant.dll"  
#Microsoft.Online.SharePoint.TenantAdministration.SiteProperties.AllowLimitedAccess

 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="arleta@TENANT.onmicrosoft.com"
$Url="https://Tenant-admin.sharepoint.com"
$CSVPath="C:\Users\Public\testTenantSettings.csv"



Get-SiteColl -Username $username -Url $Url -password $AdminPassword -CSVPath $CSVPath
