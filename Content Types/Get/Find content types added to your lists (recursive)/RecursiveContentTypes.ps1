function Get-SPOContentType{
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
	  $ctx.ExecuteQuery() 

	  $ctx.Load($ctx.Web.Lists)
	  $ctx.Load($ctx.Web.Webs)
	  $ctx.ExecuteQuery()
	  Write-Host 
	  Write-Host $ctx.Url -BackgroundColor White -ForegroundColor DarkGreen

	foreach( $ll in $ctx.Web.Lists){     
	   $ctx.Load($ll.ContentTypes)

		try{
		   $ctx.ExecuteQuery()
		}
		catch{
			#do nothing
		}


		foreach($cc in $ll.ContentTypes){
		     $obj = New-Object PSObject
		     $obj | Add-Member NoteProperty Title($cc.Name)
		     $obj | Add-Member NoteProperty  List($ll.Title)
		     $obj | Add-Member NoteProperty Web($url)

		     Write-Output $obj
		} 
	}


	if($ctx.Web.Webs.Count -gt 0){
	       foreach ($web in $ctx.Web.Webs){
		  Get-SPOContentType -Username $Username -Url $web.Url -AdminPassword $AdminPassword
	       }
	}     
}
  
        

  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://tenant.sharepoint.com/sites/teamsitewithlibraries"



Get-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl
