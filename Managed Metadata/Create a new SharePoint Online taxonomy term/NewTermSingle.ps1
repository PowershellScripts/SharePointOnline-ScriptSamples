function New-SPOTerm{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		$password,
		[Parameter(Mandatory=$true,Position=4)]
		[string]$TermSetGuid,
		[Parameter(Mandatory=$true,Position=5)]
		[string]$Term,
		[Parameter(Mandatory=$true,Position=5)]
		[string]$TermLanguage
	)

	$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
	$ctx.Load($ctx.Web)
	$ctx.ExecuteQuery()

	$session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)
	$ctx.Load($session)
	$ctx.ExecuteQuery()

	$termstore = $session.GetDefaultSiteCollectionTermStore();
	$ctx.Load($termstore)
	$ctx.ExecuteQuery()

	Write-Host "Termstore" -ForegroundColor Green
	#Write-Output $termstore
	Write-Host "Term1"
	$set=$termstore.GetTermSet($TermSetGuid)
	$ctx.Load($set)
	$ctx.Load($set.GetAllTerms())
	$ctx.ExecuteQuery()
	$guid = [guid]::NewGuid()
	Write-Host $guid
	$term=$set.CreateTerm($Term, $TermLanguage,$guid)

	$termstore.CommitAll()

	$ctx.ExecuteQuery()
}

  #Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Taxonomy.dll"  
 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="trial@trial.onmicrosoft.com"
$Url="https://trial-admin.sharepoint.com"
$TermSetGuid="ee09533d-4ea4-49b2-b328-fcfb72126568"
$Term="POwershellTermmik2"
$TermLanguage=1033


New-SPOTerm -Username $Username -Url $Url -password $AdminPassword -TermSetGuid $TermSetGuid -Term $Term -TermLanguage $TermLanguage
