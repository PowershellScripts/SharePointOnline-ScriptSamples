# The following script moves all items from a site collection and the specified subsite into second-stage recycle bin.


function Move-ToSecondStage
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
#  $ctx.Load($ctx.Site)
  $rb=$ctx.Web.RecycleBin
#  $siteRB=$ctx.Site.RecycleBin
$ctx.Load($rb)
#$ctx.load($siteRB)
$ctx.ExecuteQuery()
Write-Host $ctx.Web.Url " has "  $rb.Count.ToString() " items in the recycle bin"
#Write-Host $ctx.Site.Url " has " $SiteRB.Count.ToString() " items in the recycle bin"

Write-Host "Moving items to the second stage recycle bin..."
#$siteRB.MoveAllToSecondStage()
$rb.MoveAllToSecondStage()

$ctx.ExecuteQuery()


}


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="t@trial098.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://trial098.sharepoint.com/sites/teamsitewithlibraries"

Move-ToSecondStage -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl



