
#
# Created by Arleta Wanat, 2015 
#

function Set-SPOListsDirection{
    param (
        [Parameter(Mandatory=$true,Position=1)]
	[string]$Username,
	[Parameter(Mandatory=$true,Position=2)]
	[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
	[string]$Url,
        [Parameter(Mandatory=$true,Position=4)]
	[string]$Direction
    )

    $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.ExecuteQuery() 

    $Lists=$ctx.Web.Lists
    $ctx.Load($Lists)
    $ctx.ExecuteQuery()

    Foreach($ll in $Lists){
        $ll.Direction = $Direction
        $ll.Update()
    
        try{
            $ctx.ExecuteQuery()
            Write-Host $ll.Title "   Done" -ForegroundColor Green
        }
        catch [Net.WebException] {
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }
    }
}










# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the site and the desired reading order: rtl, ltr, none
$Username="trial@trialtrial123.onmicrosoft.com"
$AdminPassword="Pass"
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists"
$Direction="rtl"




Set-SPOListsDirection -Username $Username -AdminPassword $AdminPassword -Url $Url -Direction $Direction
