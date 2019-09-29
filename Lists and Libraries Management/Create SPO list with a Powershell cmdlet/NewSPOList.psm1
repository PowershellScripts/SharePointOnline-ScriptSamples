function New-SPOList
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$Title,
        [Parameter(Mandatory=$false,Position=5)]
		[int]$TemplateType=100,
        [Parameter(Mandatory=$false,Position=6)]
		[string]$Description="",
        [Parameter(Mandatory=$false,Position=7)]
		[Int]$DocumentTemplateType,
        [Parameter(Mandatory=$false,Position=8)]
		[GUID]$TemplateFeatureID,
        [Parameter(Mandatory=$false,Position=9)]
		[string]$ListUrl=""
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()
  $ListUrl=$Title

  $lci =New-Object Microsoft.SharePoint.Client.ListCreationInformation
  $lci.Description=$Description
  $lci.Title=$Title
  $lci.Templatetype=$TemplateType
  if($ListUrl -ne "")
  {
  $lci.Url =$ListUrl
  }
  if($DocumentTemplateType.IsPresent)
  {
  $lci.DocumentTemplateType=$DocumentTemplateType
  }
  if($TemplateFeatureID.IsPresent)
  {
  $lci.TemplateFeatureID=$TemplateFeatureID
  }
  $list = $ctx.Web.Lists.Add($lci)
  $ctx.Load($list)
  try
     {
       
         $ctx.ExecuteQuery()
         Write-Host "List " $Title " has been added to " $Url
     }
     catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

}



Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 




 Export-ModuleMember -Function "New-SPOList"
