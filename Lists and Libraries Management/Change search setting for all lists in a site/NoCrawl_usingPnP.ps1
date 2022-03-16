# fill this bit out

$ListTitle = "MyList"
$SiteUrl = "https://contoso.sharepoint.com"


# do not touch this bit below

$credential = Get-Credential

Connect-PNPOnline -Url $SiteUrl -Credentials $credential

$list = Get-PnPList -Identity $ListTitle

if(-not $list){
  Write-Host "List does not exist"
  return;
}


$list.NoCrawl = $true
$list.Update()

try{
  $list.context.ExecuteQuery()
  Invoke-PnPQuery 
  Write-Host "Updated nicely"
}
catch{
  Write-Host "No luck this time"
}
