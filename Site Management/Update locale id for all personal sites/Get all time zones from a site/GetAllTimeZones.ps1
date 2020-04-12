

function Get-SPOUSerTimeZones
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
  $ctx.ExecuteQuery() 
  
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.RegionalSettings.TimeZone)
  $ctx.Load($ctx.Web.RegionalSettings.TimeZones)
   $ctx.ExecuteQuery()    
   
   foreach($timezone in  $ctx.Web.RegionalSettings.TimeZones)
   {
     Write-Host $timezone.ID  $timezone.Description
   }




     }

  


  # Paths to SDK. Please verify location on your computer.
#Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
#Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll"

# Insert the credentials and the name of the admin site
$Username="user@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$url="https://tenant-my.sharepoint.com/personal/user_tenant_onmicrosoft_com"



   Get-SPOUSerTimeZones -Username $Username -AdminPassword $AdminPassword -Url $url
 
