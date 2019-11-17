function Get-DeletedItems
{
param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url
)
#$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.ExecuteQuery() 

 $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $rb=$ctx.Web.RecycleBin
$ctx.Load($rb)
$ctx.ExecuteQuery()
Write-Host $ctx.Web.Url $rb.Count.ToString()

for($i=0;$i -lt $rb.Count ;$i++)
{
        
        $ctx.Load($rb[$i].Author)
        $ctx.Load($rb[$i].DeletedBy)
        $ctx.ExecuteQuery()
        $obj = $rb[$i]
        $obj | Add-Member NoteProperty AuthorLoginName($rb[$i].Author.LoginName)
        $obj | Add-Member NoteProperty DeletedByLoginName($rb[$i].DeletedBy.LoginName)
        Write-Output $obj


}
#$ctx.Web.RecycleBin.RestoreAll()
$ctx.ExecuteQuery()



if($ctx.Web.Webs.Count -gt 0)
  {
     Write-Host "--"-ForegroundColor DarkGreen
     for($i=0;$i -lt $ctx.Web.Webs.Count ;$i++)
     {
        Get-DeletedItems -Username $Username -AdminPassword $AdminPassword -Url $ctx.Web.Webs[$i].Url
        }
     }

}




# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="user@domain.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://domain-admin.sharepoint.com"
Connect-SPOService -Url $adminUrl
$sites=(Get-SPOSite).Url

foreach($site in $sites)
{

 Get-DeletedItems -Username $Username -AdminPassword $AdminPassword -Url $site

}



