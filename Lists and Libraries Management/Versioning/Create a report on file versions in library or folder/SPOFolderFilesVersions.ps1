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
		[string]$ServerRelativeUrl,
		[Parameter(Mandatory=$true,Position=5)]
		[string]$CSVPath,
		[Parameter(Mandatory=$true,Position=6)]
		[string]$CSVPath2  
	)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()



  $fileCollection =
        $ctx.Web.GetFolderByServerRelativeUrl($ServerRelativeUrl).Files 
        $ctx.Load($fileCollection)
        $ctx.ExecuteQuery()

        
        foreach ($file in $fileCollection){
		$ctx.Load($file.Versions)
		$ctx.ExecuteQuery()
		
		if ($file.Versions.Count -eq 0){
		  $obj=New-Object PSObject
		  $obj | Add-Member NoteProperty ServerRelativeUrl($file.ServerRelativeUrl)
		  $obj | Add-Member NoteProperty Versions("No Verions Available")
		  $obj | export-csv -Path $CSVPath2 -Append
		}


		Foreach ($versi in $file.Versions){
			$user=$versi.CreatedBy
			$ctx.Load($versi)
			$ctx.Load($user)
			$ctx.ExecuteQuery()
			$versi | Add-Member NoteProperty CreatedByUser($user.LoginName)
			 $versi |export-csv -Path $CSVPath -Append
		}
        }
}

Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 

$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="trial@trialtrial125.onmicrosoft.com"
$Url="https://trialtrial125.sharepoint.com/sites/teamsitewithlibraries"
$FolderUrl="/sites/TeamsiteWithLibraries/Not-Empty-Document-Library"
$csvPath="C:\Users\ivo\Desktop\testpath.csv"
$csvPath2="C:\Users\ivo\Desktop\FileThatShowNoVersionsAvailable.csv"

Get-sPOFolderFiles -Username $username -Url $Url -password $AdminPassword -ServerRelativeUrl $FolderUrl -CSVPath $csvPath -CSVPath2 $csvPath2
