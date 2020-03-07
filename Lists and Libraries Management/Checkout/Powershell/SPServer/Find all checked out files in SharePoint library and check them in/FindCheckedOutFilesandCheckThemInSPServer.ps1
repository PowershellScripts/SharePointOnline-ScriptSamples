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
		[string]$ListTitle
		)

# Create context and test the connection
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object System.Net.NetworkCredential($Username, $password)
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

  foreach($item in $itemki)
  {

  Write-Host $item["FileRef"] $item.ElementType
  
  $file =
        $ctx.Web.GetFileByServerRelativeUrl($item["FileRef"]);
        $ctx.Load($file)
        $ctx.Load($file.Versions)     
        
         $ctx.Load($file.ListItemAllFields)
        $Author=$file.Author
        $CheckedOutByUser=$file.CheckedOutByUser
        $LockedByUser=$file.LockedByUser
        $ModifiedBy=$file.ModifiedBy
        $ctx.Load($Author)
        $ctx.Load($CheckedOutByUser)
        $ctx.Load($LockedByUser)
        $ctx.Load($ModifiedBy)
        $ctx.Load($file.EffectiveInformationRightsManagementSettings)
        $ctx.Load($file.Properties)
        try
        {
        $ctx.ExecuteQuery()
        }
        catch
        {}
       
       if($CheckedOutByUser.LoginName -ne $null){
       Write-Host $file.Name
       Write-Host $CheckedOutByUser.LoginName
       $file.CheckIn('Checked in automatically', 'MajorCheckIn')
  $ctx.Load($file)
  try
  {
  $ctx.ExecuteQuery()        
  Write-Host $file.Name " has been checked in"     -ForegroundColor DarkGreen 
  }
        catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }
       
       }
        

        
     }   
  }



        





#Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="AwesomeMachine\administrator"
$Url="http://ThisIsSharePoint/sites/site1"
$ListTitle="Documents"



Get-sPOFolderFiles -Username $username -Url $Url -password $AdminPassword -ListTitle $ListTitle 