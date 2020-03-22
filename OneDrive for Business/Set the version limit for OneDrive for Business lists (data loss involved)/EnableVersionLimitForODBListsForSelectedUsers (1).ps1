function Set-VersionLimit
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$Password,
		[Parameter(Mandatory=$true,Position=4)]
		[int]$VersionLimit,
		[Parameter(Mandatory=$false,Position=5)]
		[bool]$Versioning
		)

  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $Password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()

  Write-Host $ctx.Url -BackgroundColor White -ForegroundColor DarkGreen
  
  foreach($list in $ctx.Web.Lists)
  {
    $csvvalue= New-Object PSObject
    $csvvalue | Add-Member -MemberType NoteProperty -Name "Previous Versioning Status" -Value $list.EnableVersioning
    
    $list.EnableVersioning = $Versioning

    #the next line will delete surplus versions. Make sure you know what you are doing and have tested the script before uncommenting it
    #$list.MajorVersionLimit = $VersionLimit
    $list.Update()    
    $listurl=$null
        
    if($ctx.Url.EndsWith("/")) 
    {
        $listurl= $ctx.Url+$list.Title
    }
    else 
    {
        $listurl=$ctx.Url+"/"+$list.Title
    }


    $csvvalue | Add-Member -MemberType NoteProperty -Name "Url" -Value ($listurl)
    $csvvalue | Add-Member -MemberType NoteProperty -Name "Title" -Value $list.Title
    $csvvalue | Add-Member -MemberType NoteProperty -Name "Status" -Value "Failed"

    try
    {
        $ErrorActionPreference="Stop"
        $ctx.ExecuteQuery() 
        Write-Host $listurl -ForegroundColor DarkGreen
        $csvvalue.Status="Success"
        $Global:csv+= $csvvalue       
    }
    catch
    {
        $Global:csv+= $csvvalue
        Write-Host $listurl $_.Exception.Message -ForegroundColor Red 
    }
    finally
    {
        $ErrorActionPreference="Continue"
    }
        

  }

  if($ctx.Web.Webs.Count -gt 0)
  {
    for($i=0; $i -lt $ctx.Web.Webs.Count ; $i++)
    {
        Set-VersionLimit -Username $Username -Url $ctx.Web.Webs[$i].Url -Password $Password -VersionLimit $VersionLimit -Versioning $Versioning
    }
  }
  
  

}

# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 



# Versioning will be enabled. If you prefer to disable it for the whole tenant, change to $false
$Versioning = $true

#Number of major versions to keep. !! All the surplus versions will be deleted !!
$VersionLimit = 14

# You can also enter credentials directly: $siteUrl="https://tenant-admin.sharepoint.com"
$AdminUrl = "https://etr56-admin.sharepoint.com”
$Username = "ana@etr56.onmicrosoft.com"
$Password = Read-Host -Prompt "Enter password" -AsSecureString


$Creds= New-Object System.Management.Automation.PSCredential($username,$password) 
Connect-SPOService -Credential $Creds -Url $AdminUrl
$Global:csv=@()


$users=Import-Csv -Path D:\Powershell\Questions\UserList.csv


foreach($user in $users)
{

  if($user.Username.Contains('@'))
  {
    $persweb=$user.Username.Replace(".","_").Replace("@","_")
    $persweb=$myhost+"/personal/"+$persweb
    Write-Host $persweb

    #Add the following line if you want to assign yourself, administrator or another user access to other users' personal sites
    #Set-SPOUser -Site $AdminUrl -IsSiteCollectionAdmin $true -LoginName t@trial765.onmicrosoft.com
    Set-VersionLimit -Url $persweb -Username $Username -Password $Password -Versioning $Versioning -VersionLimit $VersionLimit
  }
}


# Specify the path where the log file will be published
$Global:csv | Export-Csv -Path C:\Users\Public\Versioninglimitversion.csv
