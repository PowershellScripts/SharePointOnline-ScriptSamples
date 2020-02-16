function Get-folders()

{

param (

[Parameter(Mandatory=$true,Position=0)]
$foolders,
[Parameter(Mandatory=$true,Position=1)]
[string]$OriginalLibrary,
[Parameter(Mandatory=$true,Position=2)]
[string]$DestinationLibrary

)

$Host.Runspace.ThreadOptions = “ReuseThread”

foreach($foolder in $foolders)

{

$ctx.Load($foolder.Folders)
$ctx.ExecuteQuery()

#Write-host $foolder.ServerRelativeUrl $foolder.folders.count
if($foolder.ServerRelativeUrl -match $OriginalLibrary)
{
$urel= $foolder.ServerRelativeUrl.Replace($OriginalLibrary,$DestinationLibrary)
Write-Host $urel
$newFolder=$ctx.Web.Folders.Add($foolder.ServerRelativeUrl.Replace($OriginalLibrary,$DestinationLibrary))
$ctx.Load($newFolder)
$ctx.ExecuteQuery()
}


if($foolder.Folders.Count -gt 0){

Get-folders -foolders $foolder.Folders -OriginalLibrary $OriginalLibrary -DestinationLibrary $DestinationLibrary

}

}

}

function Get-Webfolders()

{
param (

[Parameter(Mandatory=$true,Position=0)]
[string]$OriginalLibrary,
[Parameter(Mandatory=$true,Position=2)]
[string]$DestinationLibrary

)

$Host.Runspace.ThreadOptions = “ReuseThread”

$folderro=$ctx.Web.Folders
$ctx.Load($folderro)
$ctx.ExecuteQuery()
$OriginalLibrary="/"+$OriginalLibrary+"/"
$DestinationLibrary="/"+$DestinationLibrary+"/"
foreach($fodler in $folderro)

{

$ctx.Load($fodler.Folders)
$ctx.ExecuteQuery()

#Write-host $fodler.ServerRelativeUrl $fodler.folders.count
if($fodler.ServerRelativeUrl -match $OriginalLibrary)
{
$urel= $fodler.ServerRelativeUrl.Replace($OriginalLibrary,$DestinationLibrary)
Write-Host $urel
$newFolder=$ctx.Web.Folders.Add($fodler.ServerRelativeUrl.Replace($OriginalLibrary,$DestinationLibrary))
$ctx.Load($newFolder)
$ctx.ExecuteQuery()
}



if($fodler.Folders.Count -gt 0){
Get-folders -foolders $fodler.Folders -OriginalLibrary $OriginalLibrary -DestinationLibrary $DestinationLibrary
}
}
}

function Connect-SPO()

{

param (

[Parameter(Mandatory=$true,Position=1)]
[string]$Username,
[Parameter(Mandatory=$true,Position=2)]
[string]$Url,
[Parameter(Mandatory=$true,Position=3)]
$AdminPassword

)

$global:ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)

$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
$ctx.Load($ctx.Web)
$ctx.ExecuteQuery()

}

# Paths to SDK. Please verify location on your computer.

Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 


$admin="t@trial890.onmicrosoft.com"
$pass=Read-Host "Enter Password: " -AsSecureString
$site="https://trial890.sharepoint.com/sites/teamsitewithlibraries"
$libraryTitle="tescik2"
$destLibr="lib2"
$global:ctx

Connect-SPO -Username $admin -Url $site -AdminPassword $pass

Get-Webfolders -DestinationLibrary $destLibr -OriginalLibrary $libraryTitle -ErrorAction Continue