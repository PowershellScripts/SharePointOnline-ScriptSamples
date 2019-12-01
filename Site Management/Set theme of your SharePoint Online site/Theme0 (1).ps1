

function Set-SPOTheme
{
  
   param (
   [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
[Parameter(Mandatory=$true,Position=4)]
		[string]$palette,
[Parameter(Mandatory=$true,Position=5)]
		[string]$font
		)
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.ExecuteQuery() 
  
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.ThemeInfo)
  $ctx.ExecuteQuery()
  $palette=$ctx.web.ServerRelativeUrl+$palette
  $font=$ctx.Web.ServerRelativeUrl+$font
  $mynu=Out-Null
        Write-Host "Current theme " $ctx.Web.ThemeInfo.AccessibleDescription
        Write-Host $ctx.Web.ThemeInfo.ThemeBackgroundImageUri
$ctx.Web.ApplyTheme($palette,$font,$mynu, $true)
$ctx.ExecuteQuery()

        
     }
     
     
        
        
  
        

  
  
  


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://tenant.sharepoint.com/sites/powie1"



$paletteUrl="_catalogs/theme/15/Palette001.spcolor"
$fontUrl="_catalogs/theme/15/fontscheme001.spfont"


Set-SPoTheme -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -palette $paletteUrl -font $fontUrl