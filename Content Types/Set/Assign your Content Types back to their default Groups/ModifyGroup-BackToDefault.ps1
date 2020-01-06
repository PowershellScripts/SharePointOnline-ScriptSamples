
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
  $ctx.Load($ctx.Web.ContentTypes)

  $ctx.ExecuteQuery()


  $defaultoweGroupy=import-csv C:\Users\ivo\Desktop\CTsGroups2.csv


  foreach($cc in $ctx.Web.ContentTypes)
  {
    $opo=$defaultoweGroupy | where {$_.ContentType -eq $cc.Name}
    Write-Host $opo
    Write-Host $opo.ContentType
    Write-Host $opo.Group
    $cc.Group=$opo.Group
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
$AdminUrl="https://trial345.sharepoint.com/sites/contenttypehub"


        



Set-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl 


