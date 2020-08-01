function Get-SPOFolderFiles
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$password,
        [Parameter(Mandatory=$true,Position=5)]
		[string]$CSVPath,
        [Parameter(Mandatory=$true,Position=6)]
		[string]$CSVPath2  
		)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle("Documents")
  $ctx.Load($ll)
  $ctx.ExecuteQuery()

  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
  $spqQuery.ViewXml ="<View Scope='RecursiveAll' />";
  $ODBitems=$ll.GetItems($spqQuery)
  $ctx.Load($ODBitems)
  $ctx.ExecuteQuery()
  Write-Host "Found " $ODBitems.Count " folders and files"

  foreach($item in $ODBitems)
      {
            
            Write-Host $item["FileRef"] "... " -NoNewline
            $file = $ctx.Web.GetFileByServerRelativeUrl($item["FileRef"]);
            $ctx.Load($file)
            $ctx.Load($file.Versions)

            try
            {
                $ctx.ExecuteQuery()
            }
            catch
            {
                Write-Host "File not found" -ForegroundColor Red          
            }


            if ($file.Versions.Count -eq 0)
            {
                $obj=New-Object PSObject
                $obj | Add-Member NoteProperty ServerRelativeUrl($file.ServerRelativeUrl)
                $obj | Add-Member NoteProperty FileLeafRef($item["FileLeafRef"])
                $obj | Add-Member NoteProperty Versions("No Versions Available")
                $obj | export-csv -Path $CSVPath2 -Append
                Write-Host "No versions available" -ForegroundColor DarkYellow
            }

            if($file.Versions.Count -gt 0)
            {
                Write-Host $file.Versions.Count " version(s) found" -ForegroundColor Green

                foreach ($version in $file.Versions)
                {
                    $user=$version.CreatedBy               
                    $ctx.Load($version)
                    $ctx.Load($user)
                    $ctx.ExecuteQuery()
                    $version | Add-Member NoteProperty CreatedByUser($user.LoginName)
                    $version | Add-Member NoteProperty FileLeafRef($item["FileLeafRef"])
                    $version |export-csv -Path $CSVPath -Append
                }

            }
      }
  }

        

#Paths to SDK  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  


#Enter the data
#User with sufficient access to read the files
$username="german@test.onmicrosoft.com"
#Url of the site with the files (e.g. OneDrive site)
$Url="https://test-my.sharepoint.com/personal/german_test_onmicrosoft_com"

#Path for a csv where file versions will be recorded
$csvPath="C:\MyFiles\Versions.csv"
#Path for a csv where files with no version will be recorded
$csvPath2="C:\MyFiles\FileThatShowsNoVersionsAvailable4.csv"


# Do not enter password in the file. You will be prompted for it during the script execution
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
Get-SPOFolderFiles -Username $username -Url $Url -password $AdminPassword -CSVPath $csvPath -CSVPath2 $csvPath2
