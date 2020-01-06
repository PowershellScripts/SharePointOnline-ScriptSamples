Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.Runtime.dll"

function Set-SPOWebRequestAccessEmail
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$password,
		[Parameter(Mandatory=$true,Position=4)]
		[string]$RequestAccessEmail
		)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()
     Write-Host "Changing for " $ctx.Web.Url
  $ctx.Web.RequestAccessEmail=$RequestAccessEmail
  $ctx.Web.Update()
   $ctx.ExecuteQuery()

  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()

  if($ctx.Web.Webs.Count -ne 0)
  {
     foreach($webbie in $ctx.Web.Webs)
     {
        

        Set-SPOWebRequestAccessEmail -Username $Username -Url $webbie.Url -password $password -RequestAccessEmail $RequestAccessEmail


     }

  }

  }


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.Runtime.dll"


$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="admin@tenante.onmicrosoft.com"
$Url="https://tenante.sharepoint.com/sites/powie64"

Set-SPOWebRequestAccessEmail -Username $username -Url $Url -password $AdminPassword -RequestAccessEmail "SecondAdmin@tenante.onmicrosoft.com"
