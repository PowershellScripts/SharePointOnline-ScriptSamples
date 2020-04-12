function Get-folders(){
    param (
        [Parameter(Mandatory=$true,Position=0)]
        $foolders,
        [Parameter(Mandatory=$true,Position=1)]
        [string]$OriginalLibrary,
        [Parameter(Mandatory=$true,Position=2)]
        [string]$DestinationLibrary,
        [Parameter(Mandatory=$true,Position=3)]
        [string]$SourceSite,
        [Parameter(Mandatory=$true,Position=4)]
        [string]$DestinationSite
    )

    $Host.Runspace.ThreadOptions = “ReuseThread”
    $ll2=$ctx2.Web.Lists.GetByTitle($DestinationLibrary.Replace("/",""))

    foreach($foolder in $foolders){
        $ctx.Load($foolder.Folders)
        $ctx.ExecuteQuery()
        $urel2=$foolder.ServerRelativeUrl.Substring($foolder.ServerRelativeUrl.ToLower().LastIndexOf($OriginalLibrary)+$OriginalLibrary.Length)
        $urele= $foolder.ServerRelativeUrl.toLower().Replace($OriginalLibrary,$DestinationLibrary).Replace($SourceSite.Remove(0,($SourceSite.IndexOf(".sharepoint.com")+15)),$DestinationSite.Remove(0,($DestinationSite.IndexOf(".sharepoint.com")+15)))
        $urel1=$urele.Substring(0,($urele.LastIndexOf($DestinationLibrary)+$DestinationLibrary.Length))
        $urel=$urel1+$urel2
        Write-Host $urel
        $newFolder=$ll2.RootFolder.Folders.Add($urel)
        $ctx2.Load($newFolder)
        $ctx2.ExecuteQuery()

        if($foolder.Folders.Count -gt 0){
            Get-folders -foolders $foolder.Folders -OriginalLibrary $OriginalLibrary -DestinationLibrary $DestinationLibrary -SourceSite $SourceSite -DestinationSite $DestinationSite
        }
    }
}



function Prep-Rec(){
    param (
        [Parameter(Mandatory=$true,Position=0)]
        [string]$OriginalLibrary,
        [Parameter(Mandatory=$true,Position=2)]
        [string]$DestinationLibrary,
        [Parameter(Mandatory=$true,Position=3)]
        [string]$SourceSite,
        [Parameter(Mandatory=$true,Position=4)]
        [string]$DestinationSite
    )

    $Host.Runspace.ThreadOptions = “ReuseThread”

    $ll=$ctx.Web.Lists.GetByTitle($OriginalLibrary)
    $ll2=$ctx2.Web.Lists.GetByTitle($DestinationLibrary)
    $folderro=$ll.RootFolder.Folders
    $ctx.load($ll)
    $ctx.Load($folderro)
    $ctx.ExecuteQuery()
    $OriginalLibrary="/"+$OriginalLibrary.ToLower()+"/"
    $DestinationLibrary="/"+$DestinationLibrary.ToLower()+"/"
    $SourceSite=$SourceSite.ToLower()
    $DestinationSite=$DestinationSite.ToLower()
    Get-folders -foolders $folderro -OriginalLibrary $OriginalLibrary -DestinationLibrary $DestinationLibrary -SourceSite $SourceSite -DestinationSite $DestinationSite
}

function Connect-SPO(){
    param (
        [Parameter(Mandatory=$true,Position=1)]
        [string]$Username,
        [Parameter(Mandatory=$true,Position=2)]
        [string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
        $AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
        [string]$Url2
    )

    $global:ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)

    $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
    $ctx.Load($ctx.Web)
    $ctx.ExecuteQuery()

    $global:ctx2=New-Object Microsoft.SharePoint.Client.ClientContext($Url2)

    $ctx2.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
    $ctx2.Load($ctx2.Web)
    $ctx2.ExecuteQuery()
}

# Paths to SDK. Please verify location on your computer.

Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 


$admin="t@trial890.onmicrosoft.com"
$pass=Read-Host "Enter Password: " -AsSecureString
$Sourcesite="https://trial890.sharepoint.com/sites/TeamsitewithLibraries"
$destinationSite="https://trial890.sharepoint.com/sites/teamsitewithlists"
$sourceLibrary="tescik2"
$destLibr="docLib3"
$global:ctx
$global:ctx2

Connect-SPO -Username $admin -Url $Sourcesite -AdminPassword $pass -Url2 $destinationSite

Prep-Rec -DestinationLibrary $destLibr -OriginalLibrary $sourceLibrary -ErrorAction Continue -SourceSite $Sourcesite -DestinationSite $destinationSite
