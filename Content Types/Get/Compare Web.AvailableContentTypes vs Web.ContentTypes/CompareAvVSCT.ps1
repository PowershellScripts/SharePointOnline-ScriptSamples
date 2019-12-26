

function Get-SPOContentType
{
  
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
  
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.AvailableContentTypes)
  $ctx.ExecuteQuery()
  Write-Host 
#  Write-Host $ctx.Url -BackgroundColor White -ForegroundColor DarkGreen
  $i=0
  foreach( $cc in $ctx.Web.AvailableContentTypes)
  {
            
           $i++
     
     } 
     Write-Host "Available content types " $i
        
       $ctx.Load($ctx.Web.ContentTypes)
  $ctx.ExecuteQuery()
  Write-Host 
 # Write-Host $ctx.Url -BackgroundColor White -ForegroundColor DarkGreen
  $i=0
  foreach( $cc in $ctx.Web.ContentTypes)
  {
            
           $i++
     
     } 
     Write-Host "Content types in this site " $i   


        
     }



     
     
      
        
        
  
        

  
  
  


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://tenant.sharepoint.com/sites/teamsitewithlibraries/subsite"



Get-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl