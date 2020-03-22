<#
.SYNOPSIS
  Checks on what sites a site design is applied
  
.DESCRIPTION
  https://social.technet.microsoft.com/wiki/contents/articles/53517.sharepoint-online-site-designs-verify-what-site-designs-are-applied-where.aspx
  
.OUTPUTS
  
.NOTES
  Version:        1.0
  Author:         Arleta Wanat
  Creation Date:  2019 
#>


import-module microsoft.online.sharepoint.powershell
 
Connect-SPOService -Url https://etr56-admin.sharepoint.com
 
$AllSites = Get-SPOSite -Limit All

#Here all the search results will be stored 
$AllAppliedDesigns = @()
 
$AllSites | Foreach-Object{
    $siteDesignRuns = Get-SPOSiteDesignRun -WebUrl $_.Url
     
    if($siteDesignRuns){
        Write-Host $_.Url -ForegroundColor Green
        Write-Host $siteDesignRuns.Count
        Write-Host $siteDesignRuns.sitedesignid
 
        foreach($siteDesign in $siteDesignRuns)
        {
             
            $SingleAppliedDesign = New-Object PSObject -Property @{
                SiteDesignID       = $siteDesign.SiteDesignID
                SiteUrl             = $_.Url
            }
 
            $AllAppliedDesigns+=$SingleAppliedDesign
        }
    }
}
 
Write-host $AllAppliedDesigns.count
 
$AllAppliedDesigns | sort SiteDesignID

$SitesWithXYZSiteDesign = $AllAppliedDesigns | where {$_.SiteDesignID -eq "e76d1988-181f-4911-9f52-1759d5ee9220"}

Write-Output $SitesWithXYZSiteDesign
