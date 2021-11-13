function Set-Versioning{
    param (
        [Parameter (Mandatory)]
        [string]$Url,
        [Parameter (Mandatory)]
        [Object]$Credential,
        [Parameter (Mandatory)]
        [String]$Versioning
    )


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = $Credential
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()
  Write-Host 
  Write-Host $ctx.Url -BackgroundColor White -ForegroundColor DarkGreen

  foreach( $list in $ctx.Web.Lists){

      $ctx.Load($list.RootFolder)
      $ctx.ExecuteQuery()

      $list.EnableVersioning = $Versioning
      $list.Update()
      $csvvalue= new-object PSObject

      $csvvalue | Add-Member -MemberType NoteProperty -Name "Url" -Value $ctx.Url
      $csvvalue | Add-Member -MemberType NoteProperty -Name "ListTitle" -Value $list.Title
      $csvvalue | Add-Member -MemberType NoteProperty -Name "Status" -Value "Failed"

      try{
        $ErrorActionPreference="Stop"
        $ctx.ExecuteQuery() 
        Write-Host $list.Title -ForegroundColor DarkGreen
        $csvvalue.Status="Success"
        $Global:csv+= $csvvalue       
      }
      catch{
        $Global:csv+= $csvvalue
        Write-Host $list.Title -ForegroundColor Red
      }
      finally{
        $ErrorActionPreference="Continue"
      }

    }


    # go through all the subsites recursively
    if($ctx.Web.Webs.Count -gt 0){
      for($i=0; $i -lt $ctx.Web.Webs.Count ; $i++){
        Set-Versioning -Url ($ctx.Web.Webs[$i].Url) -Credential $Credential -Versioning $Versioning
      }
    }
}








# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Versioning will be enabled. If you prefer to disable it for the whole tenant, change to $false
$versioning = $true

# Your CSV with urls
$CSVPath = "C:\Users\Public\UrlsToEnableVersioningFor.csv"   #make sure there is a url property

#Your log path
$LogPath = "C:\Users\Public\VersioningLogPath.csv"

# You will be prompted for credentials when the script executes
$username = Read-Host -Prompt "Enter admin's login, e.g. admin@domain.onmicrosoft.com"
$password = Read-Host -Prompt "Enter password" -AsSecureString
$credential= New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password) 

$sitecollections= Import-CSV $CSVPath
$Global:csv=@()

foreach($sitecollection in $sitecollections){
    Set-Versioning -Url $sitecollection.Url -Credential $Credential -Versioning $Versioning
}


$Global:csv | Export-Csv -Path $LogPath
