<# not a synopsis. Description from Technet Gallery

Powershell script.

It requires SharePoint Online Management Shell, Azure AD module and SharePoint SDK installed:

http://technet.microsoft.com/en-us/library/fp161372(v=office.15).aspx

http://msdn.microsoft.com/en-us/library/azure/jj151815.aspx

http://www.microsoft.com/en-us/download/details.aspx?id=30722

 

 

The commandlets:

1. Retrieve the site collection and its subsites

2. For all the sites activate the feature "Site Mailbox" from Site Settings>Site Features 

3. Add Site Mailbox app to every site, following the naming policy:

Prefix-SiteTitle@domain.onmicrosoft.com

4. At the end a txt file is generated with the output.

 

The code is not silenced out. 

That means if the mailbox already exists, you will receive an error.

If the mailbox doesn't exist, upon its creation all its attributes will be displayed.

 

If you need different scope, I created also similar scripts for adding Site Mailbox to all site collections + their subsites:

 https://gallery.technet.microsoft.com/scriptcenter/Add-Mailboxes-to-all-f58e63ef

and a script for adding a mailbox to a given site:
#>


Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

$siteUrl = Read-Host -Prompt "Enter https://tenant.sharepoint.com/sites/mysitecollection”
$username = Read-Host -Prompt "Enter admin's login, e.g. admin@domain.onmicrosoft.com"
$password = Read-Host -Prompt "Enter password" -AsSecureString 
$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl) 
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password) 
$ctx.Credentials= New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password) 
start-transcript

#connects to Exchange Online to prepare for new-siteMailbox cmdlet
$credy= New-Object System.Management.Automation.PSCredential($username,$password)
import-module msonline
connect-msolservice -credential $credy
$sesja=new-pssession -configurationname microsoft.exchange -connectionuri https://ps.outlook.com/powershell/ -credential $credy -authentication basic -allowredirection
import-pssession $sesja
$rootWeb = $ctx.Web 
$sites  = $rootWeb.Webs

$ctx.Load($rootWeb)
$ctx.Load($sites)
$ctx.ExecuteQuery()
$feature="502a2d54-6102-4757-aaa0-a90586106368"
$featureguid=new-object System.Guid $feature 

# adding the feature and the mailbox for the site collection
$rootWeb.Features.Add($featureguid, $true, [Microsoft.SharePoint.Client.FeatureDefinitionScope]::None)
 $ctx.ExecuteQuery()
new-sitemailbox -displayName $rootWeb.Title -SharePointUrl $rootWeb.Url

  
  #adding the feature and the mailbox for all the subsites. It checks for first-level subsites. If your structure is more complex, you need to add more loops
   
foreach($site in $sites){
      $site.Features.Add($featureguid, $true, [Microsoft.SharePoint.Client.FeatureDefinitionScope]::None)
      $ctx.ExecuteQuery()
      Write-Host "Feature enabled for" $site.Url
}

Write-Host "Finished enabling site mailbox feature."
      
foreach($site in $sites){
      new-sitemailbox -displayName $site.Title -SharePointUrl $site.Url
}
   
Write-Host "Finished adding mailboxes."
  

  #Finishes by saving a transcript of the whole run to a local folder
 Stop-Transcript
