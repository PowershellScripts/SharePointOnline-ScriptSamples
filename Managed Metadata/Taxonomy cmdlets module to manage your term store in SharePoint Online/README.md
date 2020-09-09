A module with new cmdlets for Taxonomy written in an easily-modifiable Powershell file

 

 ### The cmdlets include:

 New-SPOTerm

 Get-SPOTermGroups

 Get-SPOTermSets

 Get-SPOTermStore

 Get-SPOHashTagsTermSet

 Get-SpoHashTagsTerms

 Get-SPOKeyWordsTermSet

 New-SPOTermGroup

 Set-SPOTermGroup

 New-SPOTermSet

 Set-SPOTermSet

 Get-SPOTerm

 Connect-SPOCSOM

 

Exact syntax and cmdlet descriptions with examples will be available here at [SharePoint Online SPOMod cmdlets & resources.](https://social.technet.microsoft.com/wiki/contents/articles/32334.sharepoint-online-spomod-cmdlets-resources.aspx)

One of the cmdlets:

 

```PowerShell
  function New-SPOTermSet 
  { 
    param( 
    [Parameter(ParameterSetName="ByName",Mandatory=$true)] 
    [string]$TermGroupName="", 
    [Parameter(ParameterSetName="ByID",Mandatory=$true)] 
    [string]$TermGroupID="", 
    [Parameter(ParameterSetName="ByGroup",Mandatory=$true,ValueFromPipeline=$true)] 
    $TermGroup="", 
    [Parameter(Mandatory=$true)] 
    [string]$TermSetName, 
    [Parameter(Mandatory=$false)] 
    [int]$LanguageID=1033, 
    [Parameter(Mandatory=$false)] 
    $GUID="" 
     
    ) 
 
    BEGIN{ 
        $session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx) 
        $ctx.Load($session) 
        $ctx.ExecuteQuery() 
         
        } 
    PROCESS{ 
        $termstore = $session.GetDefaultSiteCollectionTermStore() 
        if($TermGroupName -ne "") 
        { $group=$termstore.Groups.GetByName($TermGroupName)} 
        elseif($TermGroupID -ne "") 
        { $group=$termstore.Groups.GetById($TermGroupID)} 
        elseif($group -ne "") 
        {  
            $group=$TermGroup 
        } 
        else 
        { 
          Write-Host "Could not retrieve the group. Missing parameters" 
        } 
         
        $ctx.Load($group) 
        $ctx.Load($group.TermSets) 
        $ctx.ExecuteQuery() 
        if($GUID -eq ""){$GUID = [guid]::NewGuid()} 
         
        $termSet=$group.CreateTermSet($TermSetName, $GUID, $LanguageID) 
        $ctx.ExecuteQuery() 
        return $termset 
        } 
         
 
  }
 ```
