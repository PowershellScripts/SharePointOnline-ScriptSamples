function Set-SPOListResetRoleInheritance
{
  
   param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$false,Position=4)]
		[bool]$IncludeSubsites=$false
		)
  
  
  
   $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()
  Write-Host 
  Write-Host $ctx.Url -BackgroundColor White -ForegroundColor DarkGreen
  foreach( $ll in $ctx.Web.Lists)
  {
            
        $ll.ResetRoleInheritance()
    $ll.Update()

        try
        {
        $ctx.ExecuteQuery()
        Write-Host "Restored inherited permissions for " $ll.Title
        }
        catch
        {
        Write-Host "Failed to restore permissions for " $ll.Title
        }

         
        
        }
  
        

  

  if($ctx.Web.Webs.Count -gt 0 -and $IncludeSubsites)
  {
    for($i=0; $i -lt $ctx.Web.Webs.Count ; $i++)
    {
        Set-SPOListResetRoleInheritance -Url ($ctx.Web.Webs[$i].Url) -Username $Username -AdminPassword $AdminPassword -IncludeSubsites $IncludeSubsites
    }

  }
  
  
  }


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 



Set-SPOListResetRoleInheritance -Username "trial@trialtrial123.onmicrosoft.com" -Url "https://trialtrial123.sharepoint.com" -AdminPassword "Pass" -IncludeSubsites $true