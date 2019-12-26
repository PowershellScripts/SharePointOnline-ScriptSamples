function Add-SPOContentType
{
param(
[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
	[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
	[Parameter(Mandatory=$true,Position=7)]
		[string]$ContentTypeID
		)
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()

  $contentType=$ctx.Web.ContentTypes.GetById($ContentTypeID)
  $ctx.Load($contentType)

 $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
 $ctx.load($ll)
 $ctx.load($ll.ContentTypes)
 $ctx.ExecuteQuery()
  $ll.ContentTypesEnabled=$true
 $AddedContentType=$ll.ContentTypes.AddExistingContentType($contentType)
 $ll.Update()
  
  try
     {
       
         $ctx.ExecuteQuery()
         Write-Host "Adding content type " $AddedContentType.Name " to " $ll.Title
     }
     catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

     
     
}



  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://tenant.sharepoint.com/sites/teamsitewithlists"
$ListTitle="tas1207"
$ContentTypeID="0x01200200C44754774BD8D4449F4B7E3FE70A7E0E"



Add-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -ListTitle $ListTitle -ContentTypeID $ContentTypeID
