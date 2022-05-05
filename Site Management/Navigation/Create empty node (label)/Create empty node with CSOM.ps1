function New-SPONavigationNodeEmpty{ 
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=4)]
		[string]$NavNodeTitle
	)

	$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
	# not necessary but I like to use it to check the connection and credentials
  $ctx.ExecuteQuery() 

	$ctx.Load($ctx.Web)
	$ctx.ExecuteQuery()  

  $quickLaunch = $Context.Web.Navigation.QuickLaunch
  $Context.Load($Context.Web)
  $Context.Load($quickLaunch)
  $Context.ExecuteQuery()
  
  $NavigationNode = New-Object Microsoft.SharePoint.Client.NavigationNodeCreationInformation
  $NavigationNode.Title = $NavNodeTitle
  # The main trick :)  For SharePoint Server use an empty string for url
  $NavigationNode.Url = "http://linkless.header/"
  
  $Ctx.Load($quickLaunch.Add($NavigationNode))
  $Ctx.ExecuteQuery()

}

  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll"

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$Url = "https://tenant.sharepoint.com/sites/mysite"
$NavNodeTitle = "Extra link to my site"


New-SPONavigationNodeEmpty -Username $Username -AdminPassword $AdminPassword -Url $Url -NavNodeTitle $NavNodeTitle
