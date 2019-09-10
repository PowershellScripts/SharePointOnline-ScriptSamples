<#  Not a synopsis.
Old description from Technet Gallery
Powershell script.

It requires SharePoint Online Management Shell, Azure AD module and SharePoint SDK installed:

http://technet.microsoft.com/en-us/library/fp161372(v=office.15).aspx

http://msdn.microsoft.com/en-us/library/azure/jj151815.aspx

http://www.microsoft.com/en-us/download/details.aspx?id=30722

 

The commandlets:

1. Retrieve all site collections

2. For all site collections and their subsites activate the feature "Site Mailbox" from Site Settings>Site Features 

3. Add Site Mailbox app to every site collection and subsite, following the naming policy:

Prefix-SiteTitle@domain.onmicrosoft.com

4. At the end a txt file is generated with the output.

 

The code is silenced out. That means if the mailbox already exists, you will not receive an error. If you need to log all the steps and errors I recommend you:

1. Open the script in a notepad and delete the part marked in red:

$site.Features.Add($featureguid, $true, [Microsoft.SharePoint.Client.FeatureDefinitionScope]::None) | Out-Null     

new-sitemailbox -displayName $site.Title -SharePointUrl $site.Url -ErrorAction SilentlyContinue | Out-Null

2. Run the script.

 

If you need different scope, I created also similar scripts for adding Site Mailbox to a given site collection + its subsites:

https://gallery.technet.microsoft.com/scriptcenter/Add-Mailbox-to-a-1b9a7f25

and a script for adding a mailbox to a given site:

https://gallery.technet.microsoft.com/scriptcenter/How-to-add-a-mailbox-to-861e63da

#>


Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

$siteUrl = Read-Host -Prompt "Enter https://tenant-admin.sharepoint.com”
$username = Read-Host -Prompt "Enter admin's login, e.g. admin@domain.onmicrosoft.com"
$password = Read-Host -Prompt "Enter password" -AsSecureString 

$credy= New-Object System.Management.Automation.PSCredential($username,$password)
Connect-SPOService -Credential $credy -Url $siteUrl
start-transcript

#connects to Exchange Online to prepare for new-siteMailbox cmdlet
import-module msonline
connect-msolservice -credential $credy
$sesja=new-pssession -configurationname microsoft.exchange -connectionuri https://ps.outlook.com/powershell/ -credential $credy -authentication basic -allowredirection
import-pssession $sesja


$sitecollections=Get-SPOSite
Write-Host "Found site collections:" 
foreach($sitecoll in $sitecollections)
{
Write-Host $sitecoll.Url
}



function Add-MailboxToSite($urelek)
{
$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($urelek) 
$ctx.Credentials= New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password) 
$rootWeb = $ctx.Web 
$sites  = $rootWeb.Webs

$ctx.Load($rootWeb)
$ctx.Load($sites)
$ctx.ExecuteQuery()
$feature="502a2d54-6102-4757-aaa0-a90586106368"
$featureguid=new-object System.Guid $feature 

$rootWeb.Features.Add($featureguid, $true, [Microsoft.SharePoint.Client.FeatureDefinitionScope]::None) | Out-Null
 $ctx.ExecuteQuery()
new-sitemailbox -displayName $rootWeb.Title -SharePointUrl $rootWeb.Url


   foreach($site in $sites)
   {
      $site.Features.Add($featureguid, $true, [Microsoft.SharePoint.Client.FeatureDefinitionScope]::None) | Out-Null
      $ctx.ExecuteQuery()
      Write-Host "Feature enabled for" $site.Url
   }
      Write-Host "Finished enabling site mailbox feature on" $rootWeb.Title " : " $rootWeb.Url
      
   
    foreach($site in $sites)
   {
      Write-Host "Trying to add mailbox for" $site.Url
      new-sitemailbox -displayName $site.Title -SharePointUrl $site.Url -ErrorAction SilentlyContinue | Out-Null   }
   
    Write-Host "Finished adding mailboxes on" $rootWeb.Title " : " $rootWeb.Url

      
      if($ctx.Web.Webs.Count -gt 0)
  {
    for($i=0; $i -lt $ctx.Web.Webs.Count ; $i++)
    {
        Add-MailboxToSite($ctx.Web.Webs[$i].Url)
    }
  
 }
 }

 foreach($sitecoll in $sitecollections)
{
Add-MailboxToSite($sitecoll.Url)
}

#Finishes by saving a transcript of the whole run to a local folder
Stop-Transcript