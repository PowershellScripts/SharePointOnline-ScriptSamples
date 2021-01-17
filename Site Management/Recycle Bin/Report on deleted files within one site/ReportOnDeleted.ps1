function Get-DeletedItem{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url
	)
	#$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
	$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
	$ctx.ExecuteQuery() 

	$ctx.Load($ctx.Site)
	$rb=$ctx.Site.RecycleBin
	$ctx.Load($rb)
	$ctx.ExecuteQuery()

	for($i=0;$i -lt $rb.Count ;$i++){
		$obj = $rb[$i]

		Write-Output $obj
	}

	#$ctx.Web.RecycleBin.RestoreAll()
	$ctx.ExecuteQuery()
}




# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="2190@sampletenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://sampletenant.sharepoint.com/sites/dgd"



Get-DeletedItem -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl

