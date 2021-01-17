 # Vadim Gremyachev's function
Function Invoke-LoadMethod() {
	param(
	   [Microsoft.SharePoint.Client.ClientObject]$Object = $(throw "Please provide a Client Object"),
	   [string]$PropertyName
	) 

	$ctx = $Object.Context
	$load = [Microsoft.SharePoint.Client.ClientContext].GetMethod("Load") 
	$type = $Object.GetType()
	$clientLoad = $load.MakeGenericMethod($type) 

	$Parameter = [System.Linq.Expressions.Expression]::Parameter(($type), $type.Name)
	$Expression = [System.Linq.Expressions.Expression]::Lambda(
		[System.Linq.Expressions.Expression]::Convert(
			[System.Linq.Expressions.Expression]::PropertyOrField($Parameter,$PropertyName),
			[System.Object]
		),
		$($Parameter)
	)
	
	$ExpressionArray = [System.Array]::CreateInstance($Expression.GetType(), 1)
	$ExpressionArray.SetValue($Expression, 0)
	$clientLoad.Invoke($ctx,@($Object,$ExpressionArray))
}

function Set-SPOUserRegionalSettings{ 
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$LocaleID
	)

	$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
	$ctx.ExecuteQuery() 

	$ctx.Load($ctx.Web)

	$ctx.Load($ctx.Web.RegionalSettings.TimeZones)
	Invoke-LoadMethod -Object $ctx.Web.RegionalSettings -PropertyName "LocaleID"
	$ctx.ExecuteQuery()    

	Write-Host "Old locale id: " $ctx.Web.RegionalSettings.LocaleId.ToString()

	$ctx.Web.RegionalSettings.LocaleId=$LocaleID
	$ctx.Web.Update()
	$ctx.ExecuteQuery()
}

  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll"

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
Connect-SPOService https://tenant-admin.sharepoint.com -Credential $Username
$myhost="https://tenant-my.sharepoint.com"
$LocaleID=1033


$users=get-SPOUser -Site $myhost

foreach($user in $users){
	if($user.LoginName.Contains('@')){
		    $persweb=$user.LoginName.Replace(".","_").Replace("@","_")
		    $persweb=$myhost+"/personal/"+$persweb
		    Write-Host $persweb

		    $AdminUrl=$persweb


		   Set-SPOUserRegionalSettings -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -LocaleID $LocaleID
  	}
}
