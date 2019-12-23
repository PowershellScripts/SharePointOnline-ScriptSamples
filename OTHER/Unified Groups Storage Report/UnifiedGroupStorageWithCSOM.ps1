
# Vadim Gremyachev's method. It is briliant

Function Invoke-LoadMethod() {
param(
   [Microsoft.SharePoint.Client.ClientObject]$Object = $(throw "Please provide a Client Object"),
   [string]$PropertyName
) 
   $ctx = $Object.Context
   $load = [Microsoft.SharePoint.Client.ClientContext].GetMethod("Load") 
   $type = $Object.GetType()
   $clientLoad = $load.MakeGenericMethod($type) 


   $Parameter = [System.Linq.Expressions.Expression]::Parameter(($type), $type.Name)
   $Expression = [System.Linq.Expressions.Expression]::Lambda(
            [System.Linq.Expressions.Expression]::Convert(
                [System.Linq.Expressions.Expression]::PropertyOrField($Parameter,$PropertyName),
                [System.Object]
            ),
            $($Parameter)
   )
   $ExpressionArray = [System.Array]::CreateInstance($Expression.GetType(), 1)
   $ExpressionArray.SetValue($Expression, 0)
   $clientLoad.Invoke($ctx,@($Object,$ExpressionArray))
}


function Get-SPOWeb
{

<#
	.link
	http://social.technet.microsoft.com/wiki/contents/articles/32334.sharepoint-online-spomod-cmdlets-resources.aspx

  #>
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$AdminPassword

		)
  
  # Connecting to particular personal site
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Site)
  $ctx.ExecuteQuery()
  
  # loading usage data for the site
  Invoke-LoadMethod -Object $ctx.Site -PropertyName "Usage"
  $ctx.ExecuteQuery()
  $outputty=1099511627776-$ctx.Site.Usage.StoragePercentageUsed

  # User output, feel free to modify the message content
  Write-Host "Storage: " $ctx.Site.Usage.Storage
  Write-Host "Percentage used: "  $ctx.Site.Usage.StoragePercentageUsed
  Write-Host "Storage free: " $outputty

     
     
   
     $ctx.Dispose()



}









# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
$admin=Read-Host "Enter admin's upn, e.g.  admin@SuperCompany.onmicrosoft.com:"
$pass=Read-Host "Enter Password: " -AsSecureString





$spocred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $admin, $pass

$sesyja=New-PSSession -ConfigurationName Microsoft.Exchange -Credential $spocred -Authentication Basic -ConnectionUri https://ps.outlook.com/powershell -AllowRedirection
Import-PSSession $sesyja


#Get all the groups
$grupki=(get-unifiedgroup).sharepointsiteurl



foreach($group in $grupki)
{

Write-Host "Processing "$group
Get-SPOWeb -Username $admin -Url $group -AdminPassword $pass
}