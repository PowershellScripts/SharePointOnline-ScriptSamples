function GetAllSubsitesAndDelete($SiteUrl) 
{ 
   $ctx2 = New-Object Microsoft.SharePoint.Client.ClientContext($SiteUrl)     
   $ctx2.Credentials= New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password)   
   $rootWeb2 = $ctx2.Web   
   $sites2  = $rootWeb2.Webs  

   $ctx2.Load($rootWeb2)  
   $ctx2.Load($sites2)  
   $ctx2.ExecuteQuery() 
   
   if($sites2.Count -gt 0) { 
        for($i=0;$i -lt $sites2.Count ;$i++) { 
           GetAllSubsitesAndDelete($sites2[$i].Url) 
        } 
        
        try { 
            $rootWeb2.DeleteObject() 
            $ctx2.ExecuteQuery() 
            Write-Host "Subsite " $rootWeb2.Url " has been removed" 
        } 
        catch [Net.WebException] {  
           Write-Host $_.Exception.ToString() 
        } 
   } 
   else { 
        try { 
            $rootWeb2.DeleteObject() 
            $ctx2.ExecuteQuery() 
            Write-Host "Subsite " $rootWeb2.Url " has been removed" 
        } 
        catch [Net.WebException] {  
           Write-Host $_.Exception.ToString() 
        } 
   } 
} 
 
#paths to SDK (copied from Victor's comment) 
$programFiles = [environment]::getfolderpath("programfiles") 
add-type -Path $programFiles'\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.dll' 
add-type -Path $programFiles'\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.Runtime.dll' 
  
# The following script will remove not only the subsite but all its content and sub-subsites 
$siteUrl = Read-Host -Prompt "Enter the subsite url,e.g.`r`nhttps://tenant.sharepoint.com/sites/mysitecollection/subsite/subsubsite`r`n”  
$username = Read-Host -Prompt "Enter admin@tenant.onmicrosoft.com"  
$password = Read-Host -Prompt "Enter password" -AsSecureString   
$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)     
$ctx.Credentials= New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $password)   
$rootWeb = $ctx.Web   
$sites  = $rootWeb.Webs  
  
$ctx.Load($rootWeb)  
$ctx.Load($sites)  
$ctx.ExecuteQuery()  
GetAllSubsitesAndDelete($rootWeb.Url) 
 
 
