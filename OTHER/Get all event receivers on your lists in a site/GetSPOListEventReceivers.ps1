function Get-SPOListEventreceivers
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

try
{
$ctx.ExecuteQuery()
} catch [Net.WebException] 
        {
            
            Write-Host $Url " failed to connect to the site" $_.Exception.Message.ToString() -ForegroundColor Red
}

 $ctx.Load($ctx.Site)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()
  Write-Host $ctx.Web.Lists.Count
  for($j=0;$j -lt $ctx.Web.Lists.Count;$j++)
  {
  $lista=$ctx.Web.Lists[$j]
 $ctx.Load($lista)
  $ctx.ExecuteQuery()
 $recevery=$lista.EventReceivers
 $ctx.Load($recevery)
 $ctx.ExecuteQuery()
 Write-Host $recevery.Count  $lista.Title

 for($i=0;$i -lt $recevery.Count ; $i++)
 {
 $ctx.Load($recevery[$i])
 $ctx.ExecuteQuery()
 Write-Output $recevery[$i]
 }

 }

}


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$Url="https://tenant.sharepoint.com/sites/teamsitewithlibraries"


Get-SPOListEventreceivers -Username $Username -AdminPassword $AdminPassword -Url $Url