function Get-ExperienceOptions
{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		$password
	)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()
  $lls=$ctx.Web.Lists
  $ctx.Load($lls)
  $ctx.ExecuteQuery()


  foreach($ll in $lls){
    $obj = New-Object PSObject
    $obj | Add-Member NoteProperty "Title" ($ll.Title) -Force
    $obj | Add-Member NoteProperty "Experience" ($ll.ListExperienceOptions) -Force
    Write-Output ($obj)
  }
}



        
        




#Paths to SDK
Add-Type -Path "H:\Libraries\Microsoft.SharePoint.Client.dll"
Add-Type -Path "H:\Libraries\Microsoft.SharePoint.Client.Runtime.dll"
Add-Type -Path "H:\Libraries\Microsoft.Office.Client.Policy.dll"   
#Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="t@testova365.onmicrosoft.com"
$Url="https://testova365.sharepoint.com/sites/STS"




Get-ExperienceOptions -Username $username -Url $Url -password $AdminPassword
