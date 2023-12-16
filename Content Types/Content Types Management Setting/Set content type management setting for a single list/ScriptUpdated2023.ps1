
#
# Created by Arleta Wanat, 2023
#


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the site and list
$Username="trial@trialtrial123.onmicrosoft.com"
$AdminPassword="Pass"
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists"
$ListName="Tasks list"
$ContentTypesEnabled =$false   # change it to true if you want to enable the setting

# Connect
	$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
	$ctx.ExecuteQuery() 

# Update the setting

$ll=$ctx.Web.Lists.GetByTitle($ListName)
$ll.ContentTypesEnabled = $ContentTypesEnabled
$ll.Update()

try{
		$ctx.ExecuteQuery()
		Write-Host "Done" -ForegroundColor Green
	}
catch(){
		Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
	}
