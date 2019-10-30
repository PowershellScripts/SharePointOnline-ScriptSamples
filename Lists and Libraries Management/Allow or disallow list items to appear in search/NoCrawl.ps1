
#
# Created by Arleta Wanat, 2015 
#

function Set-SPOList
{
param (
        [Parameter(Mandatory=$true,Position=0)]
		[string]$ListName,
        [Parameter(Mandatory=$true,Position=1)]
		[bool]$NoCrawl  
		)

$ll=$ctx.Web.Lists.GetByTitle($ListName)
    $ll.NoCrawl = $NoCrawl
    $ll.Update()

    try
    {
        $ctx.ExecuteQuery()
        Write-Host "Done" -ForegroundColor Green
       }

       catch [Net.WebException] 
        {
            
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }


}




function Connect-SPOCSOM
{
 param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=2)]
		[string]$Url
)


$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.ExecuteQuery()  
$global:ctx=$ctx
}


$global:ctx






# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the site and list
$Username="trial@trialtrial123.onmicrosoft.com"
$AdminPassword="Pass"
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists"
$ListName="Announcements list"
$NoCrawl=$true




Connect-SPOCSOM -Username $Username -AdminPassword $AdminPassword -Url $Url

Set-SPOList -ListName $ListName -NoCrawl $NoCrawl