function Get-SPOAllSiteGroups
{
  
   param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[SecureString]$AdminPassword,
        [Parameter(Mandatory=$false,Position=4)]
		[string]$csvPath
		)
  
  
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.Load($ctx.Web.SiteGroups)
  $ctx.ExecuteQuery()
  #Write-Host $csvPath -ForegroundColor Green
    foreach($sg in $ctx.Web.SiteGroups)
    {
       $sg | Add-Member NoteProperty WebUrl($ctx.Web.Url)
       Export-Csv -InputObject $sg -Path $csvPath -Append
       
       # Write-Host $ctx.Web.Url "  " $sg.Title

    }

    foreach($web in $ctx.Web.Webs)
    {
        Get-SPOAllSiteGroups -Username $Username -Url $web.Url -AdminPassword $AdminPassword -csvPath $csvPath
    
   }

  
  
  }


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"

#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="arleta@Tenant.onmicrosoft.com"
$Url="https://Tenant.sharepoint.com"
$csvPath="C:\Users\Public\AllSiteGroups2.csv"



Get-SPOAllSiteGroups -Username $username -Url $Url -AdminPassword $AdminPassword -csvPath $csvPath
