# Lists only items with attachments in SharePoint Online list and exports them to "c:\users\public\Attachments.csv"

function Get-Items
{
param (
    [Parameter(Mandatory=$true,Position=0)]
		[string]$ListTitle,
    [Parameter(Mandatory=$true,Position=7)]
		[string]$ColumnName
		)

  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.ExecuteQuery()

  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
  $spqQuery.ViewXml ="<View Scope='RecursiveAll'><Query><Where><Eq><FieldRef Name='Attachments' /><Value Type='Boolean'>1</Value></Eq></Where></Query></View>";
    
  $items=$ll.GetItems($spqQuery)
  $ctx.Load($items)
  $ctx.ExecuteQuery()

  $totalSizeOfAllListAttachments

  foreach($item in $items)
  {
        Write-Host "Processing item no " $item.ID " " 
        $ctx.Load($item)
        $ctx.Load($item.AttachmentFiles)
        $ctx.ExecuteQuery()        

        $totalSizeOfItemAttachments = 0

        #gets the total size of all attachments
        foreach($itemAttachment in $item.AttachmentFiles)
        {
            $file = $ctx.Web.GetFileByServerRelativeUrl($itemAttachment.ServerRelativeUrl);
            $ctx.Load($file)
            $ctx.ExecuteQuery()
            $fileSize = [Math]::Round(($file.Length/1KB),2)
            $totalSizeOfItemAttachments+=$fileSize
        }

        $ColumnName = $ColumnName.Replace(" ","")    #getting static name of the column if the display has spaces. Will not work if the column was created using 0x2000
        $item[$ColumnName] = $totalSizeOfItemAttachments
        $item.Update()
        $ctx.ExecuteQuery()

        $totalSizeOfAllListAttachments+=$totalSizeOfItemAttachments
  }

  Write-Host 
  Write-Output "Execution finished." 
  Write-Host "Total size of all attachments: " $totalSizeOfAllListAttachments "kb"
  $ctx.Dispose()
}





#connects to SharePoint Online

function Connect-SPO()
{

param (

    [Parameter(Mandatory=$true,Position=1)]
    [string]$Username,
    [Parameter(Mandatory=$true,Position=2)]
    [string]$Url,
    [Parameter(Mandatory=$true,Position=3)]
    $AdminPassword
    )

    $global:ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
    $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
    $ctx.Load($ctx.Web)
    try
    {
        $ctx.ExecuteQuery()
    }
    catch
    {
        Write-Host "Could not connect to SharePoint" $_.Message.ToString()
    }

}





#Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  

 
#Enter the data
$username = "ana@etr56.onmicrosoft.com"
$Url = "https://etr56.sharepoint.com"
$ListTitle = "attatest"
$ColumnName = "Size In KB"  #name of the column where you want to display size. If you want size in MB instead of KB, scroll up to [Math]::Round(($file.Length/1KB),2) and change 1KB to 1MB

#Do not modify the lines below
$global:ctx
$AdminPassword = Read-Host -Prompt "Enter password" -AsSecureString
Connect-SPO -Username $username -Url $Url -AdminPassword $AdminPassword
Get-Items -ListTitle $ListTitle  -ColumnName $ColumnName
