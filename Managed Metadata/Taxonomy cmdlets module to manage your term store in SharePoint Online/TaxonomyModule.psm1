function New-SPOTerm{
	param (
		#[Parameter(Mandatory=$true,Position=4)]
		#[string]$TermSetGuid,
		[Parameter(Mandatory=$true,Position=5)]
		[string]$Term,
		[Parameter(Mandatory=$true,Position=6)]
		[string]$TermLanguage
	)


	$session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)
	$ctx.Load($session)
	$ctx.ExecuteQuery()

	$termstore = $session.GetDefaultSiteCollectionTermStore();
	$ctx.Load($termstore)
	$ctx.ExecuteQuery()

	Write-Host "Termstore" -ForegroundColor Green
	Write-Host "Term1"
	$set=$termstore.GetTermSet($TermSetGuid)
	$ctx.Load($set)
	$ctx.Load($set.GetAllTerms())
	$ctx.ExecuteQuery()
	$guid = [guid]::NewGuid()
	Write-Host $guid
	$term=$set.CreateTerm($Term, $TermLanguage,$guid)

	$termstore.CommitAll()

	$ctx.ExecuteQuery()
}


function Get-SPOTermGroups{
	$session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)
	$ctx.Load($session)
	$ctx.ExecuteQuery()

	$termstore = $session.GetDefaultSiteCollectionTermStore();
	$ctx.Load($termstore)
	$ctx.ExecuteQuery()

	$groups=$termstore.Groups
	$ctx.Load($groups)

	$ctx.ExecuteQuery()

	foreach($group in $groups){
	    $ctx.Load($group)
	    $ctx.Load($group.TermSets)
	    $ctx.ExecuteQuery()
	    Write-Output $group
	}
}

  
function Get-SPOTermSets{
	param (
		[Parameter(ParameterSetName="groupName",Mandatory=$true)]
		[string]$TermGroupName="",
		[Parameter(ParameterSetName=’groupId’, Mandatory=$false)]
		[string]$TermGroupId=""
	)
  

	$session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)
	$ctx.Load($session)
	$ctx.ExecuteQuery()

	$termstore = $session.GetDefaultSiteCollectionTermStore();
	$ctx.Load($termstore)
	$ctx.ExecuteQuery()
       
	if($TermGroupName -eq "" -and ($TermGroupId -eq "")){
		$groups=$termstore.Groups
		$ctx.Load($groups)
		$ctx.ExecuteQuery()

		foreach($group in $groups){
			$ctx.Load($group)
			$ctx.Load($group.TermSets)
			$ctx.ExecuteQuery()

			foreach($termset in $group.TermSets){
				$ctx.Load($termset)
				$ctx.Load($termset.Terms)
				$ctx.ExecuteQuery()
				Write-Output $termset  
			}
		}
	}
	else {
		$group;

		if($TermGroupName -ne ""){
			$group=$termstore.Groups.GetByName($TermGroupName)
		}
		elseif($TermGroupId -ne ""){
			$group=$termstore.Groups.GetById($TermGroupId)
		}
		else{
			$group=$termstore.Groups[0]
		}

		$ctx.Load($group)
		$ctx.Load($group.TermSets)
		$ctx.ExecuteQuery()

		foreach($termset in $group.TermSets){
			$ctx.Load($termset)
			$ctx.Load($termset.Terms)
			$ctx.ExecuteQuery()
			Write-Output $termset  
		}
	}
}


function Get-SPOTermStore{
	$session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)
	$ctx.Load($session)
        $ctx.ExecuteQuery()

        $termstore = $session.GetDefaultSiteCollectionTermStore();
        $ctx.Load($termstore)
        $ctx.Load($termstore.Groups)
        $ctx.ExecuteQuery() 

        Write-Output $termstore
}

function Get-SPOHashTagsTermSet{
        $session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)
        $ctx.Load($session)
        $ctx.ExecuteQuery()

        $termstore = $session.GetDefaultSiteCollectionTermStore();
        $ctx.Load($termstore)
        $ctx.Load($termstore.HashTagsTermSet)
        $ctx.Load($termstore.HashTagsTermSet.Terms)
        $ctx.ExecuteQuery()
        Write-Output $termstore.HashTagsTermSet
}

function  Get-SPOHashTagsTerms{
        $session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)
        $ctx.Load($session)
        $ctx.ExecuteQuery()

        $termstore = $session.GetDefaultSiteCollectionTermStore();
        $hashtagtermset=$termstore.HashTagsTermSet
        $ctx.Load($termstore)
        $ctx.Load($hashtagtermset)
        $ctx.Load($hashtagtermset.Terms)
        $ctx.ExecuteQuery()
        
	foreach($term in $hashtagtermset.Terms){
          $ctx.Load($term)
          $ctx.Load($term.Terms)
          $ctx.Load($term.TermSets)
          $ctx.Load($term.Labels)
          $ctx.Load($term.ReusedTerms)
          $ctx.ExecuteQuery()
          Write-Output $term
        }
}

function Get-SPOKeyWordsTermSet{
        $session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)
        $ctx.Load($session)
        $ctx.ExecuteQuery()

        $termstore = $session.GetDefaultSiteCollectionTermStore();
        $keywordsTermStore=$termstore.KeywordsTermSet
        $ctx.Load($termstore)
        $ctx.Load($keywordsTermStore)
        $ctx.Load($keywordsTermStore.Terms)
        $ctx.ExecuteQuery()
        Write-Output $keywordsTermStore
}

  function New-SPOTermGroup{
        param(
		[Parameter(Mandatory=$true)]
		[string]$Name,
		[Parameter(Mandatory=$false)]
		[string]$GUID=""
        )
	
        $session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)
        $ctx.Load($session)
        $ctx.ExecuteQuery()

        $termstore = $session.GetDefaultSiteCollectionTermStore();
	
        if($GUID -eq ""){$GUID = [guid]::NewGuid()}
	
	$group=$termstore.CreateGroup($Name,$GUID)

	try{
		$ctx.ExecuteQuery()
		Write-Host "Group " $Name " created successfully."
	}
	catch [Net.WebException]{
		Write-Host "Couldn't create a group "$Name $_.Exception.ToString() -ForegroundColor Red
	}
}

function Set-SPOTermGroup{
        param(
		[Parameter(ParameterSetName="ByGUID",Mandatory=$true)]
		[string]$GUID="",
		[Parameter(ParameterSetName="FromPipeline", ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
		$group=$null,
		[Parameter(Mandatory=$false)]
		[string]$Description
        )
        BEGIN{
		$session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)
		$ctx.Load($session)
		$ctx.ExecuteQuery()

		$termstore = $session.GetDefaultSiteCollectionTermStore();
        }
        PROCESS{
                if($group -eq $null){
                        $group=$termstore.GetGroup($GUID)
                        $ctx.Load($termstore)
                        $ctx.Load($group)
                        $ctx.ExecuteQuery()
                }
		
                $group.Description=$Description
                $ctx.ExecuteQuery()
        }
}

function New-SPOTermSet{
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
		{ $group=$TermGroup}
		else
		{ Write-Host "Could not retrieve the group. Missing parameters"}

		$ctx.Load($group)
		$ctx.Load($group.TermSets)
		$ctx.ExecuteQuery()

		if($GUID -eq ""){$GUID = [guid]::NewGuid()}

		$termSet=$group.CreateTermSet($TermSetName, $GUID, $LanguageID)
		$ctx.ExecuteQuery()

		return $termset
	}
}

function Set-SPOTermSet{
	param(
		[Parameter(Mandatory=$true, Position=1)]
		[Microsoft.SharePoint.Client.Taxonomy.TermSet]$TermSet,
		[Parameter(Mandatory=$false)]
		[string]$Description="",
		[Parameter(Mandatory=$false)]
		[bool]$IsOpenForTermCreation,
		[Parameter(Mandatory=$false)]
		[bool]$IsAvailableForTagging,
		[Parameter(Mandatory=$false)]
		[string]$Name,
		[Parameter(Mandatory=$false)]
		[string]$Owner,
		[Parameter(Mandatory=$false)]
		[string]$StakeholderToAdd,
		[Parameter(Mandatory=$false)]
		[string]$StakeholderToRemove
	)
	
	if($Description -ne ""){
		$TermSet.Description=$Description
	}
	if($PSBoundParameters.ContainsKey("IsOpenForTermCreation")){
		$TermSet.IsOpenForTermCreation=$IsOpenForTermCreation
	}
	if($PSBoundParameters.ContainsKey("IsOpenForTermCreation")){
		$TermSet.IsAvailableForTagging=$IsAvailableForTagging
	}
        if($PSBoundParameters.ContainsKey("Name")){
		$TermSet.Name=$Name
   	}
        if($PSBoundParameters.ContainsKey("Owner")){
        	$TermSet.Owner=$Owner
    	}
        if($PSBoundParameters.ContainsKey("StakeholderToAdd")){
        	$TermSet.AddStakeholder($StakeholderToAdd)
   	}
        if($PSBoundParameters.ContainsKey("StakeholderToRemove")){
        	$TermSet.DeleteStakeholder($StakeholderToRemove)
    	}

	try{
		$ctx.ExecuteQuery()
	}
	catch [Net.WebException] {
	      Write-Host "Could not update the termset. " $_.Exception.ToString() -ForegroundColor Red
	}
}

function Get-SPOTerm{
	    param(
		    [Parameter(Mandatory=$true, Position=1)]
		    [GUID]$Guid
	    )
		$session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)
		$ctx.Load($session)
		$ctx.ExecuteQuery()
		$termstore = $session.GetDefaultSiteCollectionTermStore();
		$term=$termstore.GetTerm($Guid)
		$ctx.Load($termstore)
		$ctx.Load($term)
		$ctx.Load($term.Terms)
		$ctx.Load($term.TermSets)
		$ctx.ExecuteQuery()
		Write-Output $term
}

function Connect-SPOCSOM{
	<#
		.link
		http://social.technet.microsoft.com/wiki/contents/articles/32334.sharepoint-online-spomod-cmdlets-resources.aspx

	  #>

	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url
	)

	  $password = Read-Host "Password" -AsSecureString
	  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
	  $ctx.ExecuteQuery()  
	$global:ctx=$ctx
}


$global:ctx






# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Taxonomy.dll" 

