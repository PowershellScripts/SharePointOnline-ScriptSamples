function Remove-SPOPermissionGroup{
   	param (
   		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
       		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        	[Parameter(Mandatory=$true,Position=3)]
		[string]$groupname
	)
  
	  # Connect and load all prerequisites
	  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
	  $ctx.Load($ctx.Web)
	  $ctx.ExecuteQuery()
	  $Groups = $ctx.Web.SiteGroups
	 $ctx.Load($Groups)
	  $ctx.ExecuteQuery()
   
	foreach($group in $Groups){
		Write-host $group.LoginName
	}

     $Groups.RemoveByLoginName($groupname)
     $ctx.Web.Update()
     $ctx.ExecuteQuery()
 } 

  
  
  


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Publishing.dll" 
# Insert the credentials and the name of the admin site
$Username="t@trial345.onmicrosoft.com"
$Username=Read-Host "Enter admin username, e.g. t@trial345.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://trial345-admin.sharepoint.com"
$AdminUrl=Read-Host -Prompt "Enter admin url, e.g. https://trial345-admin.sharepoint.com"
$groupname="sooo"
$groupname=Read-Host "Enter the group name"

Connect-SPOService -Url $AdminUrl

$mysiteUrl=$AdminUrl.Replace("-admin","-my")
        
foreach ($login in ((get-spouser -Site $mysiteUrl).LoginName)){
   	if($Login.Contains('@')) {
		Write-Host $login -ForegroundColor Green
		$login=$login.Replace('@','_'); $login=$login.Replace('.','_'); $login=$login.Replace('.','_'); $login=$mysiteUrl+"/personal/"+$login; 
		Remove-SPOPermissionGroup -Username $Username -AdminPassword $AdminPassword -Url $login -groupname $groupname
	}  
}



