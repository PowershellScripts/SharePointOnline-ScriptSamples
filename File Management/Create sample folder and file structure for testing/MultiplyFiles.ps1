function Multiply-Files
{


param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$fileURL,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$library
		)
  
  $Host.Runspace.ThreadOptions = “ReuseThread”
  # Connecting to particular personal site
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()
  $ll=$ctx.web.Lists.GetByTitle($library)
  $ctx.ExecuteQuery()
 
 

  $reports=@("Reports","Balance Sheets","Investments")
  $report=@("Report","Balance Sheet","Investment")

 
  $file=$ctx.web.GetFileByServerRelativeUrl($fileURL)
  $ctx.load($file)
  $ctx.ExecuteQuery()
 


  for($k=0;$k -lt $reports.Length; $k++)
  {
  $folder1=$ctx.Web.Folders.Add($library+"/"+$reports[$k])
  $ctx.Load($folder1)
  $ctx.ExecuteQuery()

  for($i=2001;$i -lt 2016;$i++)
  {
          $folderPath=$library+"/"+$reports[$k]+"/"+$reports[$k]+" "+$i.ToString()
           $folder11=$ctx.Web.Folders.Add($folderPath)
          $ctx.Load($folder11)
          $ctx.ExecuteQuery()
          for($j=0;$j -lt 35; $j++)
          {    
               $randaMin=(($i-2000)*10000000)+101000
               $randaMax=(($i-2000)*10000000)+1231000
               $randomNumber=12
               $randomNumber= Get-Random -Minimum $randaMin -Maximum $randaMax
              # Write-Host $randaMin 
               #Write-Host $randomNumber
                $newFilePath=$Url+"/"+$folderPath+"/"+$report[$k]+" no "+$randomNumber.ToString()+$fileURL.Substring($fileUrl.LastIndexOf("."))
               $file.CopyTo($newFilePath,$false)
               Write-Host "Creating file" $newFilePath
               $ctx.ExecuteQuery()

          }
  }

  }

  }







# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
$admin="t@trial890.onmicrosoft.com"
$pass=Read-Host "Enter Password: " -AsSecureString
$site="https://trial890.sharepoint.com/sites/teamsitewithlibraries"
$fileURL="/sites/TeamsiteWithLibraries/tescik2/Presentation.pptx"
$libraryTitle="tescik2"



Multiply-Files -Username $admin -Url $site -AdminPassword $pass -fileURL $fileURL -library $libraryTitle