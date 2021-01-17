function Set-SPOListVersioning($EnableVersioning, $Urelek)
{
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($urelek)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $Adminpassword)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()
  Write-Host 
  Write-Host $ctx.Url -BackgroundColor White -ForegroundColor DarkGreen
  foreach( $ll in $ctx.Web.Lists)
  {
    $ll.EnableVersioning = $EnableVersioning
    $ll.Update()
    $csvvalue= new-object PSObject
        $listurl=$null
        if($ctx.Url.EndsWith("/")) {$listurl= $ctx.Url+$ll.Title}
        else {$listurl=$ctx.Url+"/"+$ll.Title}
        $csvvalue | Add-Member -MemberType NoteProperty -Name "Url" -Value ($listurl)
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
            Write-Host $listurl -ForegroundColor Red
        }
        finally
        {$ErrorActionPreference="Continue"}
        

  }

  if($ctx.Web.Webs.Count -gt 0)
  {
    for($i=0; $i -lt $ctx.Web.Webs.Count ; $i++)
    {
        Set-SPOListVersioning -EnableVersioning $EnableVersioning -Urelek ($ctx.Web.Webs[$i].Url)
    }

  }
  
  

}


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll"

# Insert the credentials and the name of the admin site inthe next 3 lines
$Username="ana@etr56.onmicrosoft.com"
Connect-SPOService https://etr56-admin.sharepoint.com -Credential $Username
$myhost="https://etr56-my.sharepoint.com"


$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
# If you do not want to target all users, enter the target user names in the line below instead of Get-SPOUser cmdlet:
$users=Import-Csv -Path D:\Powershell\Questions\UserList.csv
$EnableVersioning=$true
$Global:csv=@()

foreach($user in $users)
{

  if($user.Username.Contains('@'))
  {
    $persweb=$user.Username.Replace(".","_").Replace("@","_")
    $persweb=$myhost+"/personal/"+$persweb
    Write-Host $persweb

    $AdminUrl=$persweb

    #Add the following line if you want to assign yourself, administrator or another user access to other users' personal sites
    #Set-SPOUser -Site $AdminUrl -IsSiteCollectionAdmin $true -LoginName t@trial765.onmicrosoft.com
    Set-SPOListVersioning -EnableVersioning $EnableVersioning -Urelek $AdminUrl
  }
}

# Specify the path where the log file will be published
$Global:csv | Export-Csv -Path C:\Users\Public\Versioning.csv
