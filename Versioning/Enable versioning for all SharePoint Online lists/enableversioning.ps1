function getall($urelek) 
{ 
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($urelek) 
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password) 
  $ctx.Load($ctx.Web.Lists) 
  $ctx.Load($ctx.Web) 
  $ctx.Load($ctx.Web.Webs) 
  $ctx.ExecuteQuery() 
  Write-Host  
  Write-Host $ctx.Url -BackgroundColor White -ForegroundColor DarkGreen 
  foreach( $ll in $ctx.Web.Lists) 
  { 
    $ll.EnableVersioning = $versioning 
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
        getall($ctx.Web.Webs[$i].Url) 
    } 
 
  } 
   
   
 
} 
 
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Versioning will be enabled. If you prefer to disable it for the whole tenant, change to $false 
$versioning = $true 
 
# You can also enter credentials directly: $siteUrl="https://tenant-admin.sharepoint.com" 
$siteUrl = Read-Host -Prompt "Enter https://tenant-admin.sharepoint.com” 
$username = Read-Host -Prompt "Enter admin login, e.g. admin@domain.onmicrosoft.com" 
$password = Read-Host -Prompt "Enter password" -AsSecureString 
$credy= New-Object System.Management.Automation.PSCredential($username,$password)  
Connect-SPOService -Credential $credy -Url $siteUrl  
 
$sitecollections=get-SPOSite 
$Global:csv=@() 
 
foreach($sitecoll in $sitecollections) 
{ 
    getall($sitecoll.Url) 
} 
 
# Specify the path where the log file will be published 
$Global:csv | Export-Csv -Path C:\Users\Public\Versioning.csv 
