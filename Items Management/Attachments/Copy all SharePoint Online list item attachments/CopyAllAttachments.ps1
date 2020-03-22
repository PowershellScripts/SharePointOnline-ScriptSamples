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


function Copy-SPOListItemAttachments
{
   param (
    [Parameter(Mandatory=$true,Position=1)]
		[string]$ListTitle,
    [Parameter(Mandatory=$false,Position=3)]
        [switch]$Recursive,
    [Parameter(Mandatory=$false,Position=4)]
		[string]$CSVPath,
    [Parameter(Mandatory=$false,Position=5)]
		[string]$DestinationLibraryFullPath
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
           #gets the attachment file
            $file = $ctx.Web.GetFileByServerRelativeUrl($itemAttachment.ServerRelativeUrl);
            $ctx.Load($file)
            $ctx.ExecuteQuery()
            #creates object for export in csv
            $obj = New-Object PSObject
            $obj | Add-Member NoteProperty ItemID($listItems[$j].ID)
            $obj | Add-Member NoteProperty ItemTitle($listItems[$j]["Title"])
            $obj | Add-Member NoteProperty AttachmentName($file.Name)
            $obj | Add-Member NoteProperty AttachmentVersions($file.Versions.Count)

            Export-CSV -InputObject $obj -Path $CSVPath -Append

            if($DestinationLibraryFullPath.EndsWith("/"))
            {
                #do nothing
            }
            else 
            {
                $DestinationLibraryFullPath=$DestinationLibraryFullPath+"/"
            }

            Write-Host "Processing " $file.Name "from list item no "  $listItems[$j].ID $listItems[$j]["Title"]
            Write-Host ($DestinationLibraryFullPath+$file.Name)
            $file.CopyTo($DestinationLibraryFullPath+$file.Name, $Overwrite)   #copies file to a library
            try
            {
                $ctx.ExecuteQuery()        
                Write-Host $file.Name " has been copied to" $DestinationLibraryFullPath   -ForegroundColor DarkGreen 
            }
            catch [Net.WebException]
            { 
                Write-Host $_.Exception.ToString()
            }

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
$DestinationLibraryFullPath = "/test/AttachmentsFromAtta"   #  full path to destination library e.g. "/sites/powie4/Destiny2/" where powie4 is the name of
                                                            #the site collection and Destiny2 is the name of the library
                                                            #  Another example: /test/AttachmentsFromAtta where test is the name of a library in root site collection 
                                                            #and AttachmentsFromAtta is the name of a folder 

# Do not modify lines below 
Connect-SPOCSOM -Username $Username -Url $Url 
Copy-SPOListItemAttachments -ListTitle $ListTitle -CSVPath $CSVPath -DestinationLibraryFullPath $DestinationLibraryFullPath  -Recursive 


