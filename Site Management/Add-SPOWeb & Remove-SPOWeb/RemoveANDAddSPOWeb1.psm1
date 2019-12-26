


function Remove-SPOWeb
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$false,Position=4)]
		[bool]$RemoveSubsites=$true
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()

  try
     {
       $ctx.Web.DeleteObject()
         $ctx.ExecuteQuery()
         Write-Host "Site " $ctx.Web.Url " has been removed."
     }
     catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

if($ctx.Web.Webs.Count -gt 0)
  {
     for($i=0;$i -lt $ctx.Web.Webs.Count ;$i++)
     {
        if($RemoveSubsites)
        {
         Remove-SPOWeb -Username $Username -Url $ctx.Web.Webs[$i].Url -AdminPassword $AdminPassword -RemoveSubsites $RemoveSubsites
        }
        
        else
        {
        $yesorno=Read-Host -Prompt "Proceeding to remove subsite " $ctx.Web.Webs[$i].Url ". Press Y to proceed or N not to remove the subsite. If you choose N, the parent site won't be removed."
        if($yesorno -eq "y")
        {
          Remove-SPOWeb -Username $Username -Url $ctx.Web.Webs[$i].Url -AdminPassword $AdminPassword -RemoveSubsites $RemoveSubsites
        } 
        }
     }
   }
     



}



function Add-SPOWeb
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$ParentSiteUrl,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$Title,
        [Parameter(Mandatory=$false,Position=5)]
		[bool]$UseSamePermissionsAsParentSite=$true,
        [Parameter(Mandatory=$false,Position=6)]
		[string]$Description="",
        [Parameter(Mandatory=$true,Position=7)]
		[Int]$Language,
        [Parameter(Mandatory=$true,Position=8)]
		[string]$Url,
        [Parameter(Mandatory=$false,Position=9)]
		[string]$WebTemplate="STS#0"
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($ParentSiteUrl)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()


  $wci = New-Object Microsoft.SharePoint.Client.WebCreationInformation
  $wci.Title=$Title
  $wci.Description=$Description
  $wci.Language = $Language
  $wci.Url =$Url
  $wci.WebTemplate = $WebTemplate
  $wci.UseSamePermissionsAsParentSite=$UseSamePermissionsAsParentSite

  $SPOWeb = $ctx.Web.Webs.Add($wci) 
  $ctx.Load($SPOWeb)
  try
     {
       
         $ctx.ExecuteQuery()
         Write-Host "Site " $SPOWeb.Title " has been added to " $ParentSiteUrl
     }
     catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

     



}



Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 




 Export-ModuleMember -Function "Add-SPOWeb", "Remove-SPOWeb"



