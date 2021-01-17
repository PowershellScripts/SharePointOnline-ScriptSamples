function Set-ExperienceOptions{
    param (
        [Parameter(Mandatory=$true,Position=1)]
	[string]$Username,
	[Parameter(Mandatory=$true,Position=2)]
	[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
	$password,
        [Parameter(Mandatory=$true, Position=4)]
        [ValidateSet("NewExperience", "ClassicExperience","Auto")]
        $ExperienceOption
    )


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()
  $lls=$ctx.Web.Lists
  $ctx.Load($lls)
  $ctx.ExecuteQuery()

  foreach($ll in $lls){
        Write-Host $ll.Title
        $ll.ListExperienceOptions = $ExperienceOption
        $ll.Update()
        $ctx.ExecuteQuery()
    }
}




# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="ana@etr45.onmicrosoft.com"
$Url="https://etr45.sharepoint.com/sites/test1234/test1"


Set-ExperienceOptions -Username $username -Url $Url -password $AdminPassword -ExperienceOption  NewExperience
