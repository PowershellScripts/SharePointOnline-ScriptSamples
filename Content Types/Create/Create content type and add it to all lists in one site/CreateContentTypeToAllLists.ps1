function New-SPOContentType
{
param(
[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
[Parameter(Mandatory=$true,Position=4)]
		[string]$Description,
[Parameter(Mandatory=$true,Position=5)]
		[string]$Name,
[Parameter(Mandatory=$true,Position=6)]
		[string]$Group,
[Parameter(Mandatory=$true,Position=7)]
		[string]$ParentContentTypeID

		)
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()

  

  $lci =New-Object Microsoft.SharePoint.Client.ContentTypeCreationInformation
  $lci.Description=$Description
  $lci.Name=$Name
  #$lci.ID="0x0108009e862727eed04408b2599b25356e7914"
  $lci.ParentContentType=$ctx.Web.ContentTypes.GetById($ParentContentTypeID)
  $lci.Group=$Group
  
  foreach($ll in $ctx.Web.Lists)
  {
  $ContentType = $ll.ContentTypes.Add($lci)
  $ctx.Load($contentType)
  try
     {
       
         $ctx.ExecuteQuery()
         Write-Host "Content Type " $Name " has been added to " $ll.Title
     }
     catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

     
     }
}



  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://tenant.sharepoint.com/sites/teamsitewithlists"
$Description="desc"
$Name="From PS directly to ALL lis4t"
$ParentContentTypeID="0x01"
$Group="List Content Types"



New-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -Description $Description -Name $Name -Group $Group -ParentContentTypeID $ParentContentTypeID 