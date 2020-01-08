# The following script permanently removes all items from a site collection recycle bins.
# The items cannot be retrieved afterwards with Powershell, user interface or any programmatic way.
<# 
.DESCRIPTION
The script removes permanently and irrevocably items from the specified site recycle bin and
its corresponding site collection recycle bin. The data cannot be retrieved afterwards. 
Test the script before using on production environment. 
#>

function Remove-DeletedItems
{
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

 $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Site)
  $rb=$ctx.Web.RecycleBin
  $siteRB=$ctx.Site.RecycleBin
$ctx.Load($rb)
$ctx.load($siteRB)
$ctx.ExecuteQuery()
Write-Host $ctx.Web.Url $rb.Count.ToString()
Write-Host $ctx.Site.Url $SiteRB.Count.ToString()

$rb.DeleteAll()
$siteRB.DeleteAll()
$siteRB.DeleteAllSecondStageItems()

$ctx.ExecuteQuery()


}


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="t@trial098.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://trial098.sharepoint.com/sites/teamsitewithlibraries/EmptySubsite1"

Remove-DeletedItems -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl



