
#
# Created by Arleta Wanat, 2015 
#

function Set-SPOListVersioning{
	param (
		[Parameter(Mandatory=$true,Position=0)]
		[string]$ListName,
		[Parameter(Mandatory=$true,Position=1)]
		[bool]$Versioning,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=4)]
		$password
	)

	$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
	  $ctx.Load($ctx.Web)
	  $ctx.ExecuteQuery()
	  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
	  $ctx.Load($ll)

	$ll.EnableVersioning = $Versioning  
	    $ll.Update()

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
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="trial@trialtrial125.onmicrosoft.com"
$Url="https://trialtrial125.sharepoint.com/sites/teamsitewithlibraries"
$ListTitle="Not-Empty-Document-Library"
$Versioning=$true




Set-SPOListVersioning -ListName $ListTitle -Versioning $Versioning -Username $username -Url $Url -password $AdminPassword 
