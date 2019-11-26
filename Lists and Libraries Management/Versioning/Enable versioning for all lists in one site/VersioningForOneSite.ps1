
#
# Created by Arleta Wanat, 2015 
#

function Set-SPOListsVersioning
{
param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$password,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=4)]
		[bool]$Versioning
)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.ExecuteQuery() 

$Lists=$ctx.Web.Lists
$ctx.Load($Lists)
$ctx.ExecuteQuery()

Foreach($ll in $Lists)
{
    $ll.EnableVersioning = $Versioning
    $ll.Update()
    

    try
    {
        $ctx.ExecuteQuery()
        Write-Host $ll.Title "   Done" -ForegroundColor Green
       }

       catch [Net.WebException] 
        {
            
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }

}
}










# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the site and the desired setting: $true or $false
$Username="trial@trialtrial123.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists"
$Versioning=$true




Set-SPOListsVersioning -Username $Username -password $AdminPassword -Url $Url -Versioning $Versioning