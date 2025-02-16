

Connect-PnPOnline -Url "https://yourtenant.sharepoint.com/sites/yoursite" -UseWebLogin
Set-PnPList -Identity "Documents" -ContentTypesEnabled $true