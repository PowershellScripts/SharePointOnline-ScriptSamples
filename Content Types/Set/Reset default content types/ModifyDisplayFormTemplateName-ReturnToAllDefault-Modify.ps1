

function Set-SPOContentType
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
  $listy=$ctx.Web.Lists
  $ctx.Load($listy)
  $ctx.ExecuteQuery()


     $defaultoweFormaty=Import-Csv C:\Users\ivo\Desktop\Book1.csv    
     foreach($ll in $listy)
     {
  $ctx.Load($ll.ContentTypes)
  $ctx.ExecuteQuery()


  foreach($cc in $ll.ContentTypes)
  {
          
          $opo=$defaultoweFormaty | where {$_.Name -eq $cc.Name}
          Write-Host $ll.Title -ForegroundColor Green
          Write-Host $cc.Name
          Write-Host $opo.DisplayFormTemplateName
          Write-Host $cc.DisplayFormTemplateName
          
          if($opo.DisplayFormTemplateName -ne "")
          {
          $cc.DisplayFormTemplateName=$opo.DisplayFormTemplateName
          $cc.Update($false)
          $ctx.Load($cc)
          $ctx.ExecuteQuery()
          }
       Write-Host $ll.Title -ForegroundColor Green
          Write-Host $cc.Name
          Write-Host $opo.DisplayFormTemplateName
          Write-Host $cc.DisplayFormTemplateName
     Write-Host "----------------------------------------------------"
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
$AdminUrl="https://tenant.sharepoint.com/sites/powie2"

        



Set-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl 

