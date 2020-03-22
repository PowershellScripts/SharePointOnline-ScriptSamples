function Get-SPOFolderFiles   # https://gallery.technet.microsoft.com/office/Find-checked-out-files-in-0533b17c/view/Discussions#content
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$password
		)

# Create context and test the connection
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)

  #Use this line if you are working on SharePoint Server
  #$ctx.Credentials = New-Object System.Net.NetworkCredential($Username, $password)

  #This line is working for SHarePoint Online. Comment it out, if you are running this script on a server
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)


  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()

  
  $llists=$ctx.Web.Lists
  $ctx.Load($llists)
  $ctx.ExecuteQuery()


  foreach($list in $llists)
  {
    if(($list.BaseTemplate -ne 100) -and ($list.BaseTemplate -ne 112))
    {
        Write-Host $list.basetemplate $list.Title -ForegroundColor Magenta
        Get-ListItems -Ctx $ctx -ListTitle $list.Title
    }
  }

}

function Get-ListItems($Ctx, $ListTitle)
{
    
    $list = $ctx.Web.Lists.GetByTitle($ListTitle)
    $ctx.Load($list)
    $ctx.ExecuteQuery()
        
    $itemki=@()
    $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery      
    $spqQuery.ViewXml="<View Scope='RecursiveAll'><Query><Where><Geq><FieldRef Name='CheckoutUser' LookupId='TRUE' />"+
    "<Value Type='int'>0</Value></Geq></Where><GroupBy><FieldRef Name='CheckoutUser' Ascending='FALSE' /></GroupBy></Query></View>"
    
    Write-Progress $spqQuery.ViewXml
    $itemki=$List.GetItems($spqQuery)
    $ctx.Load($itemki)
        
        try
        {
            $ctx.ExecuteQuery()
            Process-Items -Ctx $ctx -Itemki $itemki
        }
        catch
        {
            Write-Host "List " $list.Title $list.BaseTemplate  " unsupported"   $_  #Remove comment to see error message
            
        }
      
}


function Process-Items($Ctx, $Itemki)
{
  $personCounter = 0
  $personEmail = "empty"
  $pathsToCheckedOutFiles = ""

  foreach($item in $itemki)
  {
    
    Write-Host (Get-Date) "Processing item out of " $itemki.Count $item["FileRef"]  $item.ID
  
  $file =
        $ctx.Web.GetFileByServerRelativeUrl($item["FileRef"]);
        $ctx.Load($file)
     
        
        $ctx.Load($file.ListItemAllFields)
        $Author=$file.Author
        $CheckedOutByUser=$file.CheckedOutByUser
        $ctx.Load($Author)
        $ctx.Load($CheckedOutByUser)
        try
        {
            $ctx.ExecuteQuery()
        }
        catch
        {
            # do nothing
        }
       
       if($CheckedOutByUser.LoginName -ne $null)
       {
          # Write-Host $file.Name $CheckedOutByUser.LoginName
           Write-Host $item["FileRef"] -f green

           if(($personEmail -eq  $CheckedOutByUser.LoginName) -or ($personEmail -eq "empty"))
           {
                Write-Host "vv" $personEmail $CheckedOutByUser.LoginName  $personCounter
                $personCounter++ 
                $pathsToCheckedOutFiles = $pathsToCheckedOutFiles + $item["FileRef"] +" , " #comma here is the separator in the last column in the csv file. You can change it to ; or a dot or just a space
                Write-Host "pc" $personCounter  
           }
           else
           {
                Write-Host "ppc" $personCounter
               [pscustomobject]@{
                CheckedOutUser = $personEmail
                "Number Of Checked Out Files" = $personCounter
                "File Paths" = $pathsToCheckedOutFiles
                } | Export-Csv -Path $script:CSV -Append

                #reset counters
                $pathsToCheckedOutFiles = ""
                $pathsToCheckedOutFiles = $pathsToCheckedOutFiles + $item["FileRef"] +" , " #comma here is the separator in the last column in the csv file. You can change it to ; or a dot or just a space
                $personCounter = 1
           }

           $personEmail = $CheckedOutByUser.LoginName
           
        }
        else
        {
         #Because of the grouping in the view (GroupBy), we can discard remaining items after the first without a checkout 
          break;
        }
  } 
  
    if($personEmail -ne "empty")
    {
        #Export the last user too
            [pscustomobject]@{
        CheckedOutUser = $personEmail
        "Number Of Checked Out Files" = $personCounter
        "File Paths" = $pathsToCheckedOutFiles
        } | Export-Csv -Path $script:CSV -Append  
    }
}



        





#Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="ana@etr56.onmicrosoft.com"
$Url="https://etr56.sharepoint.com/sites/demigtest11-2"
$ListTitle="testCheckOut"
$script:CSV = "C:\Users\Public\howmanycheckedoutperUser327.csv"


Get-sPOFolderFiles -Username $username -Url $Url -password $AdminPassword 