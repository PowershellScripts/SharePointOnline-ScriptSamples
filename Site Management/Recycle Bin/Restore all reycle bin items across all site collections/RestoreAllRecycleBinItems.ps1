function Get-DeletedItems{
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

	try{
		$ctx.ExecuteQuery()
	}
	catch [Net.WebException] {
		Write-Host $Url " failed to connect to the site" $_.Exception.Message.ToString() -ForegroundColor Red
	}

	$ctx.Load($ctx.Site)
	$ctx.Load($ctx.Web.Webs)
	$rb=$ctx.Site.RecycleBin
	$ctx.Load($rb)

	try{
		$ctx.ExecuteQuery()
		Write-Host $ctx.Site.Url " Items in the recycle bin: " $rb.Count.ToString()
	}
	catch [Net.WebException] {
		Write-Host $ctx.Site.Url " failed" $_.Exception.Message.ToString() -ForegroundColor Red
	}

	$myarray=@()

	for($i=0;$i -lt $rb.Count ;$i++){
		$obj = $rb[$i]
		$myarray+=$obj
	}

	Write-Host "Items to process: " $myarray.Count

	for($i=0;$i -lt $myarray.Count ; $i++){
		$myarray[$i].Restore()

		try{
			$ctx.ExecuteQuery()
			Write-Host $myarray[$i].LeafName " restored" -ForegroundColor Green
		}
		catch [Net.WebException]{
			Write-Host $myarray[$i].LeafName " failed" $_.Message.ToString() -ForegroundColor Red
		}
	}
}




# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="t@trial765.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://trial765-admin.sharepoint.com"
Connect-SPOService -Url $adminUrl
$sites=(Get-SPOSite).Url

foreach($site in $sites){
 	Get-DeletedItems -Username $Username -AdminPassword $AdminPassword -Url $site
}



