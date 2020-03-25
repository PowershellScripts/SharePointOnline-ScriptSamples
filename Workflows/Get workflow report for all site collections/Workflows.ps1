function Get-Workflows{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$CSVPath
	)
	#$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
	$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
	$ctx.ExecuteQuery() 

	$Lists=$ctx.Web.Lists
	$ctx.Load($ctx.Web)
	$ctx.Load($ctx.Web.Webs)
	$ctx.Load($Lists)
	$ctx.ExecuteQuery()

	foreach ( $ll in $Lists){  
		$workflo = $ll.WorkflowAssociations;
		$ctx.Load($workflo);

		try{
			$ctx.ExecuteQuery();
			Write-host $ll.Title $workflo.Count -ForegroundColor Green 
		}
		catch [Net.WebException] {
			Write-Host "Failed for " $ll.Title -ForegroundColor Red
		}

		foreach ($workfloek in $workflo){
			$workfloek | Add-Member NoteProperty "SiteUrl"($ctx.Web.Url)
			$workfloek | Add-Member NoteProperty "ListTitle"($ll.Title)
			Write-Output $workfloek

			$workfloek | export-csv $CSVPath -Append
		}
	}

	if($ctx.Web.Webs.Count -gt 0){
		Write-Host "--"-ForegroundColor DarkGreen

		for($i=0;$i -lt $ctx.Web.Webs.Count ;$i++){
			Get-Workflows -Username $Username -AdminPassword $AdminPassword -Url $ctx.Web.Webs[$i].Url -CSVPath $CSVPath
		}
	}
}




# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="user@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://tenant-admin.sharepoint.com"
$CSVPath="C:\Users\ivo\Desktop\SomePath.csv"

Connect-SPOService -Url  $AdminUrl
$sites=get-spoSite
foreach ($site in $sites){
	Get-Workflows -Username $Username -AdminPassword $AdminPassword -Url $site.Url -CSVPath $CSVPath
}
