
function Get-LargeLists
{
param (
  	[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
	[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$CSVPath,
        [Parameter(Mandatory=$true,Position=5)]
		[int]$itemThreshold
)

  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)

  $web = $ctx.Web
  $ctx.Load($web)
  $ctx.Load($web.Webs)
  $ctx.ExecuteQuery()
  $ctx.Dispose()
  
  foreach($singleweb in $web.Webs)
  {
    Write-Progress "Processing web " $singleweb.Url 
    Get-LargeLists -Username $Username -AdminPassword $AdminPassword -Url $singleweb.Url -CSVPath $CSVPath -itemThreshold $itemThreshold
  }

  $lists = $web.Lists
  $ctx.Load($lists)
  $ctx.ExecuteQuery()

  foreach($list in $lists)
  {
    if($list.ItemCount -gt $itemThreshold)
    {
        Export-Csv -InputObject $list -Path $CSVPath -Append
        Write-host $list.Title $list.ItemCount
    }
  }

}


function Get-SPOSites($Username, $AdminPassword, $Url)
{
    $adminUrl = $url.Insert($Url.IndexOf(".sharepoint.com"), "-admin")
    $cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $Username, $AdminPassword
    Connect-SPOService -Url $adminUrl -Credential $cred

    return Get-SPOSite
}

  


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="ana@etr56.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$Url="https://etr56.sharepoint.com"

# reporting parameters
 # where should the report be saved
$csvPath = "C:\Users\Public\largelists.csv"
$itemThreshold = 20000



# Do not modify lines below

$sites = Get-SPOSites -Username $Username -AdminPassword $AdminPassword -Url $Url
$webs =@()
foreach($site in $sites)
{
    Write-host "goes again" $site.Url
    $webs+=Get-LargeLists -Username $Username -AdminPassword $AdminPassword -Url $site.Url -CSVPath $csvPath -itemThreshold $itemThreshold
}


