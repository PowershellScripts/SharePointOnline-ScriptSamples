function Get-SPOListCount
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
  $i=0

  foreach( $ll in $ctx.Web.Lists)
  {
        $i++
        }
  
        $obj = New-Object PSObject
        $obj | Add-Member NoteProperty Url($ctx.Web.Url)
        $obj | Add-Member NoteProperty Count($i)
        
        Write-Output $obj
  

  if($ctx.Web.Webs.Count -gt 0 -and $IncludeSubsites)
  {
    for($i=0; $i -lt $ctx.Web.Webs.Count ; $i++)
    {
        Get-SPOListCount -Url ($ctx.Web.Webs[$i].Url) -Username $Username -AdminPassword $AdminPassword -IncludeSubsites $IncludeSubsites
    }
  }
  
}


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"





Export-ModuleMember -Function "Get-SPOListCount"
