function Restore-AllItems{
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

	$rb=$ctx.Site.RecycleBin
	$ctx.Load($rb)
	$ctx.ExecuteQuery()
	Write-Host $ctx.Site.Url $rb.Count.ToString()
	$ctx.Site.RecycleBin.RestoreAll()
	$ctx.ExecuteQuery()
}




# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="2190@s2190.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://s2190.sharepoint.com/sites/dgd"



Restore-AllItems -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl

