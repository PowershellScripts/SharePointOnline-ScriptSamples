function Set-SPOContentType{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url
	)

	  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
	  $ctx.Load($ctx.Web.Lists)
	  $ctx.ExecuteQuery() 

	  foreach($ll in $ctx.Web.Lists){
		  Write-Host $ll.Title -ForegroundColor Green
		  $ctx.Load($ll.ContentTypes)
		  $ctx.ExecuteQuery()
	     foreach($cc in $ll.ContentTypes){
		  if($cc.DisplayFormUrl -ne ""){
			  Write-Host "Content type name: "$cc.Name
			  Write-Host "The Custom url: " $cc.DisplayFormUrl
		  }
		 # $cc.DisplayFormTemplateName="DocumentForm"
		#  $cc.Update($false)
		 # $ctx.ExecuteQuery()
	     }
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

        



Set-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl 

