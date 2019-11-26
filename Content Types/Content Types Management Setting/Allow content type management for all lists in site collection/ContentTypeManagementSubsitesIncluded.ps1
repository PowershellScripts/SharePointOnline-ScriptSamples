
#
# Created by Arleta Wanat, 2015 
#

function Set-SPOListsContentTypesEnabled
{
param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=4)]
		[bool]$ContentTypesEnabled
)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.ExecuteQuery() 

$Lists=$ctx.Web.Lists
 $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
$ctx.Load($Lists)
$ctx.ExecuteQuery()

Foreach($ll in $Lists)
{
    $ll.ContentTypesEnabled = $ContentTypesEnabled
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

if($ctx.Web.Webs.Count -gt 0)
  {
     Write-Host "--"-ForegroundColor DarkGreen
     for($i=0;$i -lt $ctx.Web.Webs.Count ;$i++)
     {
        Set-SPOListsContentTypesEnabled -Username $Username -Url $ctx.Web.Webs[$i].Url -AdminPassword $AdminPassword -ContentTypesEnabled $ContentTypesEnabled
        }
     }
   
}










# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the site and the desired setting: $true for the content types management to be allowed or $false to disable it
$Username="trial@trialtrial123.onmicrosoft.com"
$AdminPassword="Pass"
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists"
$ContentTypesEnabled=$true




Set-SPOListsContentTypesEnabled -Username $Username -AdminPassword $AdminPassword -Url $Url -ContentTypesEnabled $ContentTypesEnabled