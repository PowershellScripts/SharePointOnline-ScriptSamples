A short script that enables versioning with minor versions for all the libraries and lists in the whole SharePoint Online tenant.

It requires SharePoint Online Management Shell and SharePoint SDK installed:

http://technet.microsoft.com/en-us/library/fp161372(v=office.15).aspx

http://www.microsoft.com/en-us/download/details.aspx?id=30722

 <img src="../Enable minor versions for all lists/minorversioning2.png">

It uses recurrence to find all sites in all site collections and then goes through all the lists.

For some lists, enabling minor versions may not be possible and you will receive a notification of that.

At the end, a csv file is generated with the lists' urls and the status whether enabling was successful or not.

 

As the script runs you will see green lists' titles for which the enabling succeeded and red for those which failed (not all lists support minor versioning).

Versioning will always fail for public site.

<img src="../Enable minor versions for all lists/minorversioning.png"> 

If you need to enable versioning in general and minor versioning for those lists that support it, first run this script for enabling versioning in general and then the one here for minor versions.  

```PowerShell
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
    $ctx.Load($ll.RootFolder) 
    $ctx.ExecuteQuery() 
    $ll.EnableMinorVersions = $versioning 
    $ll.Update() 
    $csvvalue= new-object PSObject 
        $listurl=$null 
        if($ctx.Url.EndsWith("/")) {$listurl= $ctx.Url.Remove(($ctx.Url.Length-1),1)+$ll.RootFolder.ServerRelativeUrl} 
        else { 
        $index=$ctx.Url.LastIndexOf(".com") 
        $listurl=$ctx.Url.Remove($index+4)+$ll.RootFolder.ServerRelativeUrl} 
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
$username = Read-Host -Prompt "Enter admin's login, e.g. admin@domain.onmicrosoft.com" 
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
 ```
 

### If you think, I could have improved on anything, please let me know in the Issues section!
