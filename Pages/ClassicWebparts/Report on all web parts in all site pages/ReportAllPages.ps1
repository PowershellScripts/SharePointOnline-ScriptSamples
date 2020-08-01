 
 function Get-SPOWebParts{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		$password,
		[Parameter(Mandatory=$true,Position=4)]
		[bool]$Recursive
	)


	$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
	$ctx.Load($ctx.Web)
	$ctx.ExecuteQuery()

	$spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
	# $spqQuery.ViewAttributes = "Scope='Recursive'"

	if($Recursive){
		$spqQuery.ViewXml ="<View Scope='RecursiveAll' />";
	}

	$itemki=$ctx.Web.Lists.GetbyTitle("Site Pages").GetItems($spqQuery)
	$ctx.Load($itemki)
	$ctx.ExecuteQuery()

	foreach($item in $itemki){
		Write-Host "*****" $item.Client_Title
		$file = $item.File
		$ctx.Load($file)
		$ctx.ExecuteQuery()
		$page = $ctx.Web.GetFileByServerRelativeUrl($file.ServerRelativeUrl)
		$wpm = $page.GetLimitedWebPartManager("Shared")
		$ctx.Load($wpm);
		$ctx.Load($wpm.WebParts);
		$ctx.ExecuteQuery()

		foreach($webbie in $wpm.WebParts){
			$obj= New-Object PSObject
			$obj | Add-Member NoteProperty -Name Page -Value $file.ServerRelativeUrl 
			$obj | Add-Member NoteProperty -Name DefinitionID -Value $webbie.ID
			$ctx.Load($webbie.WebPart)
			$ctx.Load($webbie.WebPart.Properties)
			$ctx.ExecuteQuery()
			$obj | Add-Member NoteProperty -Name IsClosed -Value $webbie.WebPart.IsClosed
			$obj | Add-Member NoteProperty -Name Hidden -Value $webbie.WebPart.Hidden
			$obj | Add-Member NoteProperty -Name Subtitle -Value $webbie.WebPart.Subtitle
			$obj | Add-Member NoteProperty -Name Title -Value $webbie.WebPart.Title
			$obj | Add-Member NoteProperty -Name TitleUrl -Value $webbie.WebPart.TitleUrl
			$obj | Add-Member NoteProperty -Name ZoneIndex -Value $webbie.WebPart.ZoneIndex
			$obj | Add-Member NoteProperty -Name ServerObjectIsNull -Value $webbie.WebPart.ServerObjectIsNull

			foreach($fv in $webbie.WebPart.Properties.FieldValues){
				$obj | Add-Member NoteProperty -Name $fv -Value $fv
			}

			Write-Output $obj
			Write-Host "-------------------------------------------------------------------------------------------"-BackgroundColor Cyan
			Export-Csv -InputObject $obj -Append -LiteralPath C:\test634.csv
		}
		$page=$null
	}
}
 
 
 
  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.Runtime.dll"


$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="t@trial567.onmicrosoft.com"
$Url="https://trial567.sharepoint.com/sites/powie64"


Get-SPOWebParts -Username $username -Url $Url -password $AdminPassword -Recursive $true
