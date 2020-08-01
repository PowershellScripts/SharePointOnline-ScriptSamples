
function Get-SingleWeb
{
param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url
)

  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)

  $web = $ctx.Web
  $ctx.Load($web)
  $ctx.Load($web.Webs)
  $ctx.ExecuteQuery()
  $ctx.Dispose()
  
  foreach($singleweb in $web.Webs)
  {
    Write-Progress "Processing web " $singleweb.Url 
    Get-SingleWeb -Username $Username -AdminPassword $AdminPassword -Url $singleweb.Url 
  }

  ####  LastItemUserModifiedDate vs. LastItemModifiedDate: I haven't found anywhere official documentation on the subject, 
  ####  but I'd suggest that LastItemUserModifiedDate defines a user-made change while LastItemModifiedDate includes also timer jobs

  return [pscustomobject]@{
            Url = $web.Url
            LastModified = $web.LastItemUserModifiedDate
        }

}


function Show-Results($webs, $csvPath, $onlyUnused, $date)
{
    
    if($onlyUnused)
    {
        $unusedWebs = @()
        $dateFormatted =  Get-Date $date

        foreach($web in $webs)
        {
            if($web.LastModified -lt $date)
            {
                Write-Progress ($web.Url +" last used $web.LastModified")
                $unusedWebs += $web
                $unusedWebs   #remove it if you don't want the output
            }
        }
    }
    else
    {
        $webs | Export-Csv -Path $csvPath
        $webs  #comment it out if you don't want the output
    }

}



# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="ana@etr56.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$Url="https://etr56.sharepoint.com"

# reporting parameters
 # where should the report be saved
$csvPath = "C:\Users\Public\unusedwebs.csv"
 # do you want to see all websites there or only unused? 
$onlyUnused = $true
 # if only unused, what's the border date that defines your unused sites. 
 # In other words, unused sites are sites where last change was made earlier than ...?
$date = "2019-08-30"



# Do not modify lines below
$webs =@()
$webs+=Get-SingleWeb -Username $Username -AdminPassword $AdminPassword -Url $Url

Show-Results -webs $webs -csvPath $csvPath -onlyUnused $onlyUnused -date $date

