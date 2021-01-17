function Set-SPOSiteAllowMasterPageEditing{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=4)]
		[bool]$setting
	)

	  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)

	try{
		$ctx.ExecuteQuery()
	}
	catch [Net.WebException] {      
		Write-Host $Url " failed to connect to the site" $_.Exception.Message.ToString() -ForegroundColor Red
	}

	$ctx.Load($ctx.Site)
	$ctx.Load($ctx.Web.Webs)
	$ctx.Site.AllowMasterPageEditing=$setting


	try{
		$ctx.ExecuteQuery()
		$ctx.Load($ctx.Site)
		$ctx.ExecuteQuery()
		Write-Host "Success. AllowMasterPageEditing is now set to " $ctx.Site.AllowMasterPageEditing -ForegroundColor Green
	}
	catch [Net.WebException] {
		Write-Host "Failed to set the setting" $_.Exception.Message.ToString() -ForegroundColor Red
	}
}


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$Url="https://tenant.sharepoint.com/sites/teamsitewithlibraries"
$setting=$true


Set-SPOSiteAllowMasterPageEditing -Username $Username -AdminPassword $AdminPassword -Url $Url -setting $setting
