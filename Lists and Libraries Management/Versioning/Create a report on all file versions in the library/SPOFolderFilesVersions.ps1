function Get-SPOFolderFiles
{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		$password,
		[Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
		[Parameter(Mandatory=$true,Position=5)]
		[string]$CSVPath,
		[Parameter(Mandatory=$true,Position=6)]
		[string]$CSVPath2  
	)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.ExecuteQuery()
  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
 $spqQuery.ViewXml ="<View Scope='RecursiveAll' />";
   $itemki=$ll.GetItems($spqQuery)
   $ctx.Load($itemki)
  $ctx.ExecuteQuery()

  foreach($item in $itemki){

	  Write-Host $item["FileRef"]
	  $file =
		$ctx.Web.GetFileByServerRelativeUrl($item["FileRef"]);
		$ctx.Load($file)
		$ctx.Load($file.Versions)
		$ctx.ExecuteQuery()
		
        if ($file.Versions.Count -eq 0){
          $obj=New-Object PSObject
          $obj | Add-Member NoteProperty ServerRelativeUrl($file.ServerRelativeUrl)
          $obj | Add-Member NoteProperty FileLeafRef($item["FileLeafRef"])
          $obj | Add-Member NoteProperty Versions("No Versions Available")

          $obj | export-csv -Path $CSVPath2 -Append
        }


        Foreach ($versi in $file.Versions){
		$user=$versi.CreatedBy
		$ctx.Load($versi)
		$ctx.Load($user)
		$ctx.ExecuteQuery()
		$versi | Add-Member NoteProperty CreatedByUser($user.LoginName)
		$versi | Add-Member NoteProperty FileLeafRef($item["FileLeafRef"])
		 $versi |export-csv -Path $CSVPath -Append
        }
  }
}

#Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="trial@trialtrial125.onmicrosoft.com"
$Url="https://trialtrial125.sharepoint.com/sites/teamsitewithlibraries"
$ListTitle="Not-Empty-Document-Library"
$csvPath="C:\Users\ivo\Desktop\testpath4.csv"
$csvPath2="C:\Users\ivo\Desktop\FileThatShowNoVersionsAvailable4.csv"

Get-sPOFolderFiles -Username $username -Url $Url -password $AdminPassword -ListTitle $ListTitle -CSVPath $csvPath -CSVPath2 $csvPath2
