
function Remove-Comments
{
param (
  	[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
	[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url
)

  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)

    try
    {
        $ctx.ExecuteQuery()
    } 
    catch [Net.WebException] 
    {            
        Write-Host $Url " failed to connect to the site" $_.Exception.Message.ToString() -ForegroundColor Red
    }

  $web = $ctx.Web  
  $ctx.Load($web)
  $ctx.ExecuteQuery()

  $web.CommentsOnSitePagesDisabled = $true
  $web.Update()
  $ctx.ExecuteQuery()


}


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="ana@etr56.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$Url="https://etr56.sharepoint.com/sites/commsite"


Remove-Comments -Username $Username -AdminPassword $AdminPassword -Url $Url
