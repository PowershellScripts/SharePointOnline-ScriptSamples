function Declare-Record
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$password,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle
		)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($url)
   [Microsoft.SharePOint.Client.ClientRuntimeContext] $rctx=[Microsoft.SharePoint.Client.ClientRuntimeContext]$ctx.Site.Context
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.ExecuteQuery()
  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
  $spqQuery.ViewXml ="<View Scope='RecursiveAll' /><Where><Eq><FieldRef Name='ServerRelativeUrl'/><Value Type='Text'>/VersionTest/Folder2/FolderWithinFolder</Value></Eq></Where>";
  $itemki=$ll.GetItems($spqQuery)
  $ctx.Load($itemki)
  $ctx.ExecuteQuery()

  foreach($item in $itemki)
  {
        Write-Host "Processing item no " $item.ID
        $ctx.Load($item)
        $ctx.Load($item.File)
        $ctx.ExecuteQuery()
        [Boolean] $bool=[Microsoft.SharePoint.Client.RecordsRepository.Records]::IsRecord($rctx, $item)
      
      if($bool)
      {
           [Microsoft.SharePoint.Client.RecordsRepository.Records]::UnDeclareItemAsRecord($rctx,$item)
           $ctx.ExecuteQuery()
           Write-host $item.File.Name " " $item.File.ServerRelativeUrl "has been undeclared as a record" -ForegroundColor Green 
       }
       else
       {
          Write-Host $item.File.Name " " $item.File.ServerRelativeUrl  " is not a record."  -ForegroundColor Red
       }
                     
  }
       
}





#Paths to SDK
Add-Type -Path "H:\Libraries\Microsoft.SharePoint.Client.dll"
Add-Type -Path "H:\Libraries\Microsoft.SharePoint.Client.Runtime.dll"
Add-Type -Path "H:\Libraries\Microsoft.Office.Client.Policy.dll"   
#Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="t@testova365.onmicrosoft.com"
$Url="https://testova365.sharepoint.com/sites/STS"
$ListTitle="VersionTest"



Declare-Record -Username $username -Url $Url -password $AdminPassword -ListTitle $ListTitle 
