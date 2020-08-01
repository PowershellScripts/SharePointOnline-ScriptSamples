function Get-SPOSiteProperties{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url
	)

	# Connect and load all prerequisites
	$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials				($Username, $AdminPassword)
	$ctx.ExecuteQuery()
	$ctx.Load($ctx.Web)
	$ctx.Load($ctx.Web.AllProperties)
	$ctx.ExecuteQuery()

	foreach ($ap in $ctx.Web.AllProperties.FieldValues){
			Write-Output $ap
	}
}




  Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Publishing.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.Online.SharePoint.Client.Tenant.dll" 
# Insert the credentials and the name of the admin site
$Username="t@trial345.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$SiteUrl="https://trial345.sharepoint.com/sites/teamsitewithlibraries"

        

        Get-SPOSiteProperties -Username $Username -AdminPassword $AdminPassword -Url $SiteUrl
