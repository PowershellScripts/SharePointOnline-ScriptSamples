function Set-SPOContentType
{  
   param (
   [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$SiteColumn
		)
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.Load($ctx.Web.Lists)
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.Load($ll.ContentTypes)
  $ctx.ExecuteQuery()
  $field=$ctx.Web.Fields.GetByInternalNameOrTitle($SiteColumn)
  
  foreach($cc in $ll.ContentTypes)
  {
    
     $link=new-object Microsoft.SharePoint.Client.FieldLinkCreationInformation
     $link.Field=$field
     $cc.FieldLinks.Add($link)
     $cc.Update($false)
     $ctx.ExecuteQuery()
   }
     

      $ctx.Dispose()
 } 

  
  

  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Publishing.dll" 
# Insert the credentials and the name of the admin site
$Username="t@trial345.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://trial345.sharepoint.com/sites/teamsitewithlists"
$ListTitle="opoo"
$SiteColumn="IMEPos"

        



Set-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -ListTitle $ListTitle -SiteColumn $SiteColumn

