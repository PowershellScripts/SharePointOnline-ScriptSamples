function Get-SPOListEventreceivers{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
		[Parameter(Mandatory=$true,Position=5)]
		[GUID]$EventReceiverGUID
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

	  $lista=$ctx.Web.Lists.GetByTitle($ListTitle)
	 $ctx.Load($lista)
	  $ctx.ExecuteQuery()
	 $recevery=$lista.EventReceivers
	 $ctx.Load($recevery)
	 $ctx.ExecuteQuery()
	 Write-Host "Found " $recevery.Count " receivers in " $lista.Title

	$recevery.GetById($EventReceiverGUID).DeleteObject()

	try{
		$ctx.ExecuteQuery()
		Write-Host "receiver removed"
	}
	catch [Net.WebException] {
		Write-Host "Failed to delete the receiver" $_.Exception.Message.ToString() -ForegroundColor Red
	}
}


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$Url="https://tenant.sharepoint.com/sites/teamsitewithlibraries"
$ListTitle="kriiv"
$EventReceiverGUID="154d2ca2-8335-464c-9059-214cdcc1c2c1"

Get-SPOListEventreceivers -Username $Username -AdminPassword $AdminPassword -Url $Url -ListTitle $ListTitle -EventReceiverGUID $EventreceiverGUID
