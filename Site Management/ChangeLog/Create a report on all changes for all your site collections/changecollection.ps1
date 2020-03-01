function Get-DeletedItems{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=4)]
		[string]$CSVPath
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
	$changeQuery = New-Object Microsoft.SharePoint.Client.ChangeQuery $true,$true

	$changeCollection = $ctx.Site.GetChanges($changeQuery)
	$ctx.Load($changeCollection)

	try{
		$ctx.ExecuteQuery()
		Write-Host $ctx.Site.Url " loaded changes"
	} 
	catch [Net.WebException] {
		    Write-Host $ctx.Site.Url " failed" $_.Exception.Message.ToString() -ForegroundColor Red
	}

	foreach ($change in $changeCollection){
		$change | Add-Member SiteCollection($Url)
		$change | Add-Member ItemName("N/A")
		$change | Add-Member ListName("N/A")
		$change | Add-Member WebName("N/A")
		$change | Add-Member UserName("N/A")
		$change | Add-Member UserTitle("N/A")

		if(! $change.IsPropertyAvailable("ItemId")) { $change | Add-Member ItemId("N/A")} 
		else{ 
			$leeafyname=$ctx.Web.Lists.GetById($change.ListId).GetItemById($change.ItemId)
			$ctx.Load($leeafyname)
			$ctx.ExecuteQuery()
			$change.ItemName=$leeafyname.LeafName
		}

		if(! $change.IsPropertyAvailable("ListId")) { $change | Add-Member ListId("N/A")}
		else{ 
			$listka=$ctx.Web.Lists.GetById($change.ListId)
			$ctx.Load($listka)
			$ctx.ExecuteQuery()
			$change.ListName=$listka.Title
		}
		
		if(! $change.IsPropertyAvailable("WebId")) { $change | Add-Member WebId("N/A")}
		else { $change.WebName=$ctx.Web.Url}

		if(! $change.IsPropertyAvailable("UserId")) { $change | Add-Member UserId("N/A")}
		else { $ctx.Load($ctx.Web.GetUserById($change.UserId))
			$ctx.ExecuteQuery()
			$change.UserName=$ctx.Web.GetUserById($change.UserId).LoginName
			$change.UserTitle=$ctx.Web.GetUserById($change.UserId).Title
		}

		if(! $change.IsPropertyAvailable("AlertId")) { $change | Add-Member AlertId("N/A")}

		if(! $change.IsPropertyAvailable("Activate")) { $change | Add-Member Activate("N/A")}

		$change | export-csv $CSVPath -Append
	}
}




# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="2190@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://tenant-admin.sharepoint.com"
$CSVPath="C:\users\ivo\Desktop\changecollectiontry3.csv"





Connect-SPOService -Url $adminUrl
$sites=(Get-SPOSite).Url

foreach($site in $sites){
 	Get-DeletedItems -Username $Username -AdminPassword $AdminPassword -Url $site -CSVPath $CSVPath
}



