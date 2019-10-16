function New-SPOListItem
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=5)]
		[string]$ItemTitle,
[Parameter(Mandatory=$false,Position=6)]
		[string]$AdditionalField="",
[Parameter(Mandatory=$false,Position=7)]
		[string]$AdditionalValue=""
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.ExecuteQuery()

  $lici =New-Object Microsoft.SharePoint.Client.ListItemCreationInformation
  
  
  $listItem = $ll.AddItem($lici)
  $listItem["Title"]=$ItemTitle
  if($AdditionalField -ne "")
  {
   $listItem[$AdditionalField]=$AdditionalValue
  }
  $listItem.Update()
  $ll.Update()
  
  try
     {
       
         $ctx.ExecuteQuery()
         Write-Host "Item " $ItemTitle " has been added to list " $ListTitle
     }
     catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

     



}



Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 




 Export-ModuleMember -Function "New-SPOListItem"