function Set-SPOContentType
{
   param (
   	[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
	[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
	[Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle
		)
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.Load($ll.ContentTypes)
  $ctx.ExecuteQuery()


  foreach($cc in $ll.ContentTypes)
  {     
     Write-Host $cc.DisplayFormTemplateName
     $cc.DisplayFormTemplateName="DocumentLibraryForm"
     $cc.Update($false)
     $ctx.ExecuteQuery()  
  }
        
      $ctx.Dispose()
   
}
        


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://tenant.sharepoint.com/sites/powie1"
$ListTitle="notf--ked"
        

Set-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -ListTitle $ListTitle

