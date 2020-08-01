#  Sets a SINGLE LIST to new or classic experience. Scroll down to enter the correct data and choose "NewExperience",
# "ClassicExperience","Auto" experience option 
#

function Set-ExperienceOptions
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
    [Parameter(Mandatory=$true,Position=3)]
		$Password,
    [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
    [Parameter(Mandatory=$true, Position=5)]
    [ValidateSet("NewExperience", "ClassicExperience","Auto")]
    $ExperienceOption
		)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.ExecuteQuery()

  $ll.ListExperienceOptions = $ExperienceOption
  $ll.Update()
  $ctx.ExecuteQuery() 
}


#Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.Office.Client.Policy.dll"

 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="t@testova365.onmicrosoft.com"
$Url="https://testova365.sharepoint.com/sites/STS"
$ListTitle = "MyList"

Set-ExperienceOptions -Username $username -Url $Url -password $AdminPassword -ExperienceOption NewExperience -ListTitle $ListTitle