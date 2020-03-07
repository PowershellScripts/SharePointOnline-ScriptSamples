function Uninstall-SPOApp{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=4)]
		[GUID]$SPOAppGUID
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
	  $ctx.Web.GetAppInstanceById($SPOAppGUID).Uninstall()

  	try{
	  	$ctx.ExecuteQuery()
	  	Write-Host "Success" -ForegroundColor Green
  	}
  	catch [Net.WebException] {
  		Write-Host "Failed to uninstall the app" $_.Exception.Message.ToString() -ForegroundColor Red
  	}
}


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$Url="https://tenant.sharepoint.com/sites/teamsitewithlibraries"
$GUID="126d911b-b274-4b69-a52e-2a9e5bbae91b"

Uninstall-SPOApp -Username $Username -AdminPassword $AdminPassword -Url $Url -SPOAppGUID $GUID 
