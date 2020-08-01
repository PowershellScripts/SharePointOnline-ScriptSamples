# Lists only items with attachments in SharePoint Online list and exports them to "c:\users\public\Attachments.csv"

function Get-Items
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
		[string]$CSVPath
		)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.ExecuteQuery()

  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
  $spqQuery.ViewXml ="<View Scope='RecursiveAll'><Query><Where><Eq><FieldRef Name='Attachments' /><Value Type='Boolean'>1</Value></Eq></Where></Query></View>";
    
  $items=$ll.GetItems($spqQuery)
  $ctx.Load($items)
  $ctx.ExecuteQuery()

  foreach($item in $items)
  {
        Write-Host "Processing item no " $item.ID " " -NoNewline
        $ctx.Load($item)
        $ctx.Load($item.AttachmentFiles)
        $ctx.ExecuteQuery()        

        #The output object is customized because I am only interested in title and ID. If you want you can export the entire $item object to CSV
        $Object = New-Object PSObject 
        $Object | add-member ID $item.ID                                     
        $Object | add-member ItemTitle $item["Title"]
        $Object | add-member NumberOfAttachments $item.AttachmentFiles.Count #.AttachmentFiles.Count
        Export-Csv -InputObject $object -Path $CSVPath -Append
  }

  Write-Host 
  Write-Output "Execution finished." 
  $ctx.Dispose()
}


#Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.Office.Client.Policy.dll"   

 
#Enter the data
$username = "ana@etr56.onmicrosoft.com"
$Url = "https://etr56.sharepoint.com"
$ListTitle = "attatest"
$CSVPath = "c:\users\public\attachmentsonly.csv"

#Do not modify the lines below
$AdminPassword = Read-Host -Prompt "Enter password" -AsSecureString
Get-Items -Username $username -Url $Url -password $AdminPassword -ListTitle $ListTitle -CSVPath $CSVPath
