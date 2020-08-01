function Update-SPOListItem{
  param (
    [Parameter(Mandatory=$true,Position=1)]
    [string]$Username,
    [Parameter(Mandatory=$true,Position=2)]
    [string]$Url,
    [Parameter(Mandatory=$true,Position=3)]
    [string]$AdminPassword,
    [Parameter(Mandatory=$true,Position=4)]
    [string]$ListTitle,
    [Parameter(Mandatory=$true,Position=6)]
    [string]$FieldToUpdate,
    [Parameter(Mandatory=$true,Position=7)]
    [string]$ValueToUpdate
  )
  
  
  
   $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.ExecuteQuery()


  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
 $spqQuery.ViewXml ="<View Scope='RecursiveAll' />";
   $itemki=$ll.GetItems($spqQuery)
   $ctx.Load($itemki)
  $ctx.ExecuteQuery()

  $count=$itemki.Count

  Write-Host $count
  
  foreach($item in $itemki){
    $item[$FieldToUpdate]=$ValueToUpdate
   $item.Update()
  }
 
  try{
    $ctx.ExecuteQuery()
    write-host " Success"
  }
  catch [Net.WebException]{ 
        Write-Host $_.Exception.ToString() -ForegroundColor Red
  }
}

# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"


Update-SPOListItem -Username user@domain.onmicrosoft.com -Url https://tenant.sharepoint.com/sites/teamsitewithlists -AdminPassword Pass -ListTitle "contacts list" -FieldToUpdate MyColumnName -ValueToUpdate SomeRandomValue
