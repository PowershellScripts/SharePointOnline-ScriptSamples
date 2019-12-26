function Restore-DeletedItem
{
param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=4)]
		[GUID]$ItemGuid
)
#$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.ExecuteQuery() 

 $ctx.Load($ctx.Web)
  $rb=$ctx.Site.RecycleBin
$ctx.Load($rb)
$ctx.ExecuteQuery()

$rb.GetById($ItemGuid).Restore()

$ctx.ExecuteQuery()





}




# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="2190@s190.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://s190.sharepoint.com/sites/dgd"
$ItemGUID="0cedd774-8d46-4c94-8f31-a4d71f741579"

if($ItemGUID -eq "") {$ItemGUID=Read-Host -Prompt "Enter correct item guid, e.g. 2043e1e3-f2f7-4316-8e4d-c4dd9d6cf97d"}



Restore-DeletedItem -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -ItemGuid $ItemGUID

