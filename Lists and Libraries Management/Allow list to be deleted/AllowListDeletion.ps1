#My advice is don't. That flag is there for a reason and make sure you know what you are doing and are aware of the consequences before you use this script

function Allow-SPOListDeletion
{
param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle
)

  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)

    try
    {
        $ctx.ExecuteQuery()
    } 
    catch [Net.WebException] 
    {            
        Write-Host $Url " failed to connect to the site" $_.Exception.Message.ToString() -ForegroundColor Red
    }

  $ctx.Load($ctx.Site)
  $lista=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($lista)
  $ctx.ExecuteQuery()
  $lista.AllowDeletion = $false
  $lista.Update()
  $ctx.ExecuteQuery()


}


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="ana@etr56.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$Url="https://etr56.sharepoint.com/sites/testflow"
$ListTitle="Customers"


Allow-SPOListDeletion -Username $Username -AdminPassword $AdminPassword -Url $Url -ListTitle $ListTitle 