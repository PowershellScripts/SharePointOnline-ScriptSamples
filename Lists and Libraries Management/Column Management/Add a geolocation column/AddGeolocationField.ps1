function Add-GeoLocationField
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$Password,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle

		)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $web=$ctx.Web
  $ctx.Load($web)
  $ctx.ExecuteQuery()

  $list = $web.Lists.GetByTitle($ListTitle)
  $ctx.Load($list)
  $ctx.ExecuteQuery()

  $geolocationfield=$list.Fields.AddFieldAsXml("<Field Type='Geolocation' DisplayName='Location'/>", $true, [Microsoft.SharePoint.Client.AddFieldOptions]::AddToAllContentTypes)
  $list.Update()
  $ctx.ExecuteQuery()

  <#
  $ViewCreationInfo = New-Object Microsoft.SharePoint.Client.ViewCreationInformation
  $ViewCreationInfo.Title="MapView"
  $ViewCreationInfo.ViewFields=("Title","Location2")
  $ViewCreationInfo.ViewTypeKind=[Microsoft.SharePoint.Client.ViewType]::Html
  $View = $list.Views.Add($ViewCreationInfo)
  $View.JSLink="mapviewtemplate.js"
  #$View.DefaultView=$true
  $View.Update()
  $ctx.ExecuteQuery()
  $View.JSLink

  
  $ctx.Web.AllProperties["BING_MAPS_KEY"]="AjtUzWJBHlI3Ma_Ke6Qv2fGRXEs0ua5hUQi54ECwfXTiWsitll4AkETZDihjcfeI"
  $ctx.Web.Update()
  $ctx.ExecuteQuery()
    
     #>

 

}




#Paths to SDK
Add-Type -Path "C:\Program Files (x86)\Common Files\microsoft shared\Web Server Extensions\16\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files (x86)\Common Files\microsoft shared\Web Server Extensions\16\Microsoft.SharePoint.Client.Runtime.dll"


 
#Enter the data
$Password=Read-Host -Prompt "Enter password" -AsSecureString
$Username="me@testtenant.onmicrosoft.com"
$Url="https://tenant.sharepoint.com"
$ListTitle="test2"



Add-GeoLocationField -Username $username -Password $Password -Url $Url -ListTitle $ListTitle