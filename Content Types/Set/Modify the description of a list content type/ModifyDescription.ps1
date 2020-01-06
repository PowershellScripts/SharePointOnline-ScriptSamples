



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
		[string]$ListTitle,
[Parameter(Mandatory=$true,Position=5)]
		[string]$ContentTypeName,
[Parameter(Mandatory=$true,Position=6)]
		[string]$Description
		)
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.ExecuteQuery() 
  
  $ctx.Load($ctx.Web)
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.Load($ll.ContentTypes)
  $ctx.ExecuteQuery()


     foreach($cc in $ll.ContentTypes)
     {
        if($cc.Name -eq $ContentTypeName)
        {
          Write-Host $cc.Name
          $cc.Description=$Description
          $cc.Update($false)
          $ctx.ExecuteQuery()
        }
        
     }
     
        
        
  }
        

  
  
  


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://tenant.sharepoint.com/sites/powie1"
$ListTitle="MultipleItems"
$Description="My crazy Powershell description"
$ContentTypeName="From Powershell directly to list"
        



Set-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -ListTitle $ListTitle -ContentTypeName $ContentTypeName -Description $Description

