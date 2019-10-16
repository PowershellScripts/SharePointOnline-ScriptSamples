function Remove-SPOListColumn
{

param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
[Parameter(Mandatory=$false,Position=5)]
		[string]$FieldTitle

		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()
  $List=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.ExecuteQuery()
  $Field=$List.Fields.GetByTitle($FieldTitle)
   $ctx.ExecuteQuery()
   $Field.DeleteObject()
   $ctx.ExecuteQuery()

}






Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 




 Remove-SPOListColumn -Username user@domain.onmicrosoft.com -Url https://tenant.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "contacts list" -FieldTitle "ool"





