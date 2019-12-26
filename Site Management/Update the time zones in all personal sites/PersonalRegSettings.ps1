function Set-SPOUserRegionalSettings
{  
   param (
   	[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
	[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$TimeZoneID
		)
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.ExecuteQuery() 
  
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.RegionalSettings.TimeZone)
  $ctx.Load($ctx.Web.RegionalSettings.TimeZones)
  $ctx.ExecuteQuery()    


   $ctx.Web.RegionalSettings.TimeZone=$ctx.Web.RegionalSettings.TimeZones.GetbyID($TimeZoneID)
   $ctx.Web.Update()
   $ctx.ExecuteQuery()

}
     

  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll"

# Insert the credentials and the name of the admin site
$Username="t@t321.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
Connect-SPOService https://tenant-admin.sharepoint.com -Credential $Username
$myhost="https://t321-my.sharepoint.com"
$users=get-SPOUser -Site $myhost
$TimeZoneID=63

foreach($user in $users)
{
	  if($user.LoginName.Contains('@'))
	  {
	    $persweb=$user.LoginName.Replace(".","_").Replace("@","_")
	    $persweb=$myhost+"/personal/"+$persweb
	    Write-Host $persweb

	    $AdminUrl=$persweb

	    Set-SPoUserRegionalSettings -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -TimeZoneID $TimeZoneID
	  }
}

