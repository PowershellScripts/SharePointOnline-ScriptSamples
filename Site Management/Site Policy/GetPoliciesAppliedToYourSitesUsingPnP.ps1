# Site Policy is a special content type, inheriting from Content Type called "Project Policy"  with Content Type ID 0x010085EC78BE64F9478AAE3ED069093B9963



### For a single site
#url of the site where you want to check your policies
$SiteUrl = "https://EXAMPLE.sharepoint.com/sites/EXAMPLE

# Connect to your tenant
$creds = Get-Credential
Connect-PnPOnline -Url $SiteUrl -Credentials $creds

Get-PnPContentType | where {($_.Id -match "0x010085EC78BE64F9478AAE3ED069093B9963") -and ($_.Id -notlike "0x010085EC78BE64F9478AAE3ED069093B9963")} | select name, id









### For multiple sites with export to csv

$ContentTypeID = "0x010085EC78BE64F9478AAE3ED069093B9963"
$Sites = Get-PnPTenantSite

foreach($site in $sites){ 
  Connect-PnPOnline -Url $site.Url -Credentials $creds; 
  Get-PnPContentType `
  | where {($_.Id -match $ContentTypeID) -and ($_.Id -notlike $ContentTypeID)} `
  | Export-CSV -Path C:\Users\ArletaWanat\Exportedpolicies.csv -Append}
