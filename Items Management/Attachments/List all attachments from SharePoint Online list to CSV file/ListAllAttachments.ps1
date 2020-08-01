  function Connect-SPOCSOM
{
    param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url


)

  $password = Read-Host "Password" -AsSecureString
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.ExecuteQuery()  
    $global:ctx=$ctx
}


function Get-SPOListItems
{
   param (
    [Parameter(Mandatory=$true,Position=1)]
		[string]$ListTitle,
    [Parameter(Mandatory=$false,Position=3)]
        [switch]$Recursive,
    [Parameter(Mandatory=$false,Position=4)]
		[string]$CSVPath
		)
  
  
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.Load($ll.Fields)
  $ctx.ExecuteQuery()

  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
  $spqQuery.ViewXml = "<Where><Eq><FieldRef Name='Attachments' /><Value Type='Boolean'>1</Value></Eq></Where>";
 
  if($Recursive)
  {
     $spqQuery.ViewXml +="<View Scope='RecursiveAll' />";
  }

  $listItems=$ll.GetItems($spqQuery)
  $ctx.Load($listItems)
  $ctx.ExecuteQuery()

  for($j=0;$j -lt $listItems.Count ;$j++)
    {        
        $itemAttachments=$listItems[$j].AttachmentFiles
        $ctx.Load($itemAttachments)
        $ctx.ExecuteQuery()

        foreach($itemAttachment in $itemAttachments)
        {
           #Write-Output $att
            $file = $ctx.Web.GetFileByServerRelativeUrl($itemAttachment.ServerRelativeUrl);
            $ctx.Load($file)
            $ctx.ExecuteQuery()

            $obj = New-Object PSObject
            $obj | Add-Member NoteProperty ItemID($listItems[$j].ID)
            $obj | Add-Member NoteProperty ItemTitle($listItems[$j]["Title"])
            $obj | Add-Member NoteProperty AttachmentName($file.Name)
            $obj | Add-Member NoteProperty AttachmentVersions($file.Versions.Count)

            Export-CSV -InputObject $obj -Path $CSVPath -Append

        }
    }

}


$global:ctx


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

#Please enter your data
$Username = "ana@etr56.onmicrosoft.com"
$Url = "https://etr56.sharepoint.com"
$ListTitle = "attatest"
$CSVPath = "C:\Users\Public\attachmentsreport.csv"

# Do not modify lines below 
Connect-SPOCSOM -Username $Username -Url $Url 
Get-SPOListItems -ListTitle $ListTitle -CSVPath $CSVPath -Recursive 