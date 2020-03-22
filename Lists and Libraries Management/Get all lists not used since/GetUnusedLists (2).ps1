## The script assumes that unmodified == unused. That's not exactly true. A list of countries or client contacts that serve 
## as lookup for other lists may not be changed often but is still widely used. 


function Get-UnmodifiedLists  
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$password,
        [Parameter(Mandatory=$true,Position=4)]
		$olderThan
		)

# Create context and test the connection
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)

  #Use this line if you are working on SharePoint Server
  #$ctx.Credentials = New-Object System.Net.NetworkCredential($Username, $password)

  #This line is working for SHarePoint Online. Comment it out, if you are running this script on a server
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)


  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()


  $llists=$ctx.Web.Lists
  $ctx.Load($llists)
  $ctx.ExecuteQuery()

  foreach($list in $llists)
  {
    $ctx.Load($list)
    $ctx.ExecuteQuery()

    if( $list.LastItemUserModifiedDate -lt $olderThan)
    {
        Write-Host $list.Title  "Last modified: " $list.LastItemUserModifiedDate
    }
  }

  $ctx.Dispose()
}
        





#Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
#Enter the data
$username="ana@etr56.onmicrosoft.com"
$Url="https://etr56.sharepoint.com/sites/demigtest11-2"
$olderThan = "2019-09-30"

$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString

Get-UnmodifiedLists -Username $username -Url $Url -password $AdminPassword -olderThan $olderThan