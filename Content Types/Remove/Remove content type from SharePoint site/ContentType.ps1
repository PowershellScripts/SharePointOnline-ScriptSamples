function Remove-Contenttype
{
param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
[Parameter(Mandatory=$true,Position=4)]
		$ContentTypeID

)
#$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.ExecuteQuery() 

 $ctx.Load($ctx.Web)
  $ct=$ctx.Web.ContentTypes
$ctx.Load($ct)
$ctx.ExecuteQuery()
Write-Host $ctx.Web.Url $ct.Count.ToString()
$ctx.Web.ContentTypes.GetById($ContentTypeID).DeleteObject()
$ctx.ExecuteQuery()





}




# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="mszasz@trial.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://trial.sharepoint.com/sites/firstsite"
$ContentTypeID="0x00A7470EADF4194E2E9ED1031B61DA0884030065B86AF41E46E8408DF47ED47A09578701"


Remove-Contenttype -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -ContentTypeID $ContentTypeID

