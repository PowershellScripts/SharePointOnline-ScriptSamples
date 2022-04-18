# Site Policy is a special content type, inheriting from Content Type called "Project Policy"  with Content Type ID 0x010085EC78BE64F9478AAE3ED069093B9963

#url of the site where you want to check your policies
$SiteUrl = "https://EXAMPLE.sharepoint.com/sites/EXAMPLE

# Connect to your tenant
$creds = Get-Credential
Connect-PnPOnline -Url $SiteUrl -Credentials $creds

$Sites
