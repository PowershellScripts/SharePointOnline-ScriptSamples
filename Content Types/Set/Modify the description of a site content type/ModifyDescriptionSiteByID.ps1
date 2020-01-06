



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
		[string]$ContentTypeGUID,
[Parameter(Mandatory=$true,Position=5)]
		[string]$Description
		)
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.ExecuteQuery() 
  
  $ctx.Load($ctx.Web)
  $cc=$ctx.Web.ContentTypes.GetByID($ContentTypeGUID)
  $ctx.Load($cc)
  $ctx.ExecuteQuery()


          Write-Host $cc.Name
          $cc.Description=$Description
          $cc.Update($true)
          $ctx.ExecuteQuery()
        
        
     
     
        
       
     
      
        
        
  }
        

  
  
  


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://tenant.sharepoint.com/sites/powie1"
$Description="My crazy Powershell description2"
$ContentTypeGUID="0x0116006288692BD2247D48BA5D55B164C79F51"
        



Set-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -ContentTypeGUID $ContentTypeGUID -Description $Description

