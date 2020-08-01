function Get-SPOList{
    param (
        [Parameter(Mandatory=$true,Position=1)]
	[string]$Username,
	[Parameter(Mandatory=$true,Position=2)]
	[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
	[string]$AdminPassword,
        [Parameter(Mandatory=$false,Position=4)]
	[bool]$IncludeSubsites=$false,
        [Parameter(Mandatory=$false,Position=5)]
	[bool]$IncludeAllProperties=$false
    )
  
  
  
   $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()
  Write-Host 
  Write-Host $ctx.Url -BackgroundColor White -ForegroundColor DarkGreen
  
    foreach( $ll in $ctx.Web.Lists){
        $ctx.Load($ll.RootFolder)
        $ctx.Load($ll.DefaultView)
        $ctx.Load($ll.Views)
        $ctx.Load($ll.WorkflowAssociations)

        try{
            $ctx.ExecuteQuery()
        }
        catch{}

        if($IncludeAllProperties){
        
                    $obj = New-Object PSObject
            $obj | Add-Member NoteProperty Title($ll.Title)
            $obj | Add-Member NoteProperty Created($ll.Created)
            $obj | Add-Member NoteProperty Tag($ll.Tag)
            $obj | Add-Member NoteProperty RootFolder.ServerRelativeUrl($ll.RootFolder.ServerRelativeUrl)
            $obj | Add-Member NoteProperty BaseType($ll.BaseType)
            $obj | Add-Member NoteProperty AllowContenttypes($ll.AllowContenttypes)
            $obj | Add-Member NoteProperty ContentTypesEnabled($ll.ContentTypesEnabled)
            $obj | Add-Member NoteProperty DefaultView.Title($ll.DefaultView.Title)
            $obj | Add-Member NoteProperty Description($ll.Description)
            $obj | Add-Member NoteProperty DocumentTemplateUrl($ll.DocumentTemplateUrl)
            $obj | Add-Member NoteProperty DraftVersionVisibility($ll.DraftVersionVisibility)
            $obj | Add-Member NoteProperty EnableAttachments($ll.EnableAttachments)
            $obj | Add-Member NoteProperty EnableMinorVersions($ll.EnableMinorVersions)
            $obj | Add-Member NoteProperty EnableFolderCreation($ll.EnableFolderCreation)
            $obj | Add-Member NoteProperty EnableVersioning($ll.EnableVersioning)
            $obj | Add-Member NoteProperty EnableModeration($ll.EnableModeration)
            $obj | Add-Member NoteProperty Fields.Count($ll.Fields.Count)
            $obj | Add-Member NoteProperty ForceCheckout($ll.ForceCheckout)
            $obj | Add-Member NoteProperty Hidden($ll.Hidden)
            $obj | Add-Member NoteProperty Id($ll.Id)
            $obj | Add-Member NoteProperty IRMEnabled($ll.IRMEnabled)
            $obj | Add-Member NoteProperty IsApplicationList($ll.IsApplicationList)
            $obj | Add-Member NoteProperty IsCatalog($ll.IsCatalog)
            $obj | Add-Member NoteProperty IsPrivate($ll.IsPrivate)
            $obj | Add-Member NoteProperty IsSiteAssetsLibrary($ll.IsSiteAssetsLibrary)
            $obj | Add-Member NoteProperty ItemCount($ll.ItemCount)
            $obj | Add-Member NoteProperty LastItemDeletedDate($ll.LastItemDeletedDate)
            $obj | Add-Member NoteProperty MultipleDataList($ll.MultipleDataList)
            $obj | Add-Member NoteProperty NoCrawl($ll.NoCrawl)
            $obj | Add-Member NoteProperty OnQuickLaunch($ll.OnQuickLaunch)
            $obj | Add-Member NoteProperty ParentWebUrl($ll.ParentWebUrl)
            $obj | Add-Member NoteProperty TemplateFeatureId($ll.TemplateFeatureId)
            $obj | Add-Member NoteProperty Views.Count($ll.Views.Count)
            $obj | Add-Member NoteProperty WorkflowAssociations.Count($ll.WorkflowAssociations.Count)



                    Write-Output $obj
        }
        else{
                    $obj = New-Object PSObject
            $obj | Add-Member NoteProperty Title($ll.Title)
            $obj | Add-Member NoteProperty Created($ll.Created)
            $obj | Add-Member NoteProperty RootFolder.ServerRelativeUrl($ll.RootFolder.ServerRelativeUrl)
                    
                    
                    Write-Output $obj
        }  
        
    }

    if($ctx.Web.Webs.Count -gt 0 -and $IncludeSubsites){
        for($i=0; $i -lt $ctx.Web.Webs.Count ; $i++){
            Get-SPOList -Url ($ctx.Web.Webs[$i].Url) -Username $Username -AdminPassword $AdminPassword -IncludeSubsites $IncludeSubsites -IncludeAllProperties $IncludeAllProperties
        }
    }
}


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 



Export-ModuleMember "Get-SPOList"
