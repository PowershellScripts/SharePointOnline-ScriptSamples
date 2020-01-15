# The following script permanently removes all items from a site collection second-stage recycle bin.
# The items cannot be retrieved afterwards with Powershell, User Interface, or any programmatic way.

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
Write-Host $ctx.Web.Url " has "  $rb.Count.ToString() " items in the recycle bin"
Write-Host $ctx.Site.Url " has " $SiteRB.Count.ToString() " items in the recycle bin"

Write-Host "Removing second stage items..."
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



