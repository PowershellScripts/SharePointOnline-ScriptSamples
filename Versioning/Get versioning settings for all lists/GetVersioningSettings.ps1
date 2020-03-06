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
  foreach( $list in $ctx.Web.Lists)
  {
    $ctx.Load($list)
    
        try
        {
        $ctx.ExecuteQuery() 
        $VersioningDetails = New-Object PSObject -Property @{
        'List' = $list.Title
        'Url'= $list.ParentWebUrl
        'Require Content Approval' = $list.EnableModeration
        'Versioning Enabled' = $list.EnableVersioning
        'Major Version limit' = $list.MajorVersionLimit
        'Draft Version limit' = $list.MajorWithMinorVersionsLimit
        'Drafts visible to' = $list.DraftVersionVisibility
        'Checkout required' = $list.ForceCheckout
        }
        Write-Host $list.Title -ForegroundColor DarkGreen
        
        $Global:csv+= $VersioningDetails       
        }

        catch
        {
            #$Global:csv+= $csvvalue
            Write-Host $list.Title -ForegroundColor Red
        }
        
        

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
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 



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
$Global:csv | Export-Csv -Path C:\Users\Public\Versioning5.csv
