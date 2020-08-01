
#
# Created by Arleta Wanat, 2015 
#

function Set-SPOListsNoCrawl{
    param (
        [Parameter(Mandatory=$true,Position=1)]
	[string]$Username,
	[Parameter(Mandatory=$true,Position=2)]
	[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
	[string]$Url,
        [Parameter(Mandatory=$true,Position=4)]
	[bool]$NoCrawl
    )

    $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.ExecuteQuery() 

    $Lists=$ctx.Web.Lists
    $ctx.Load($Lists)
    $ctx.ExecuteQuery()

    Foreach($ll in $Lists){
        $ll.NoCrawl = $NoCrawl
        $ll.Update()
    }

    try{
        $ctx.ExecuteQuery()
        Write-Host "Done" -ForegroundColor Green
    }
    catch [Net.WebException] {
        Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
    }
}










# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the site and list
$Username="trial@trialtrial123.onmicrosoft.com"
$AdminPassword="Pass"
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists"
$NoCrawl=$true




Set-SPOListsNoCrawl -Username $Username -AdminPassword $AdminPassword -Url $Url -NoCrawl $NoCrawl
