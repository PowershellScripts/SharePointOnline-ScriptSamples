function New-SPOListContentType
{
param(
[Parameter(Mandatory=$false,Position=4)]
		[string]$Description,
[Parameter(Mandatory=$true,Position=5)]
		[string]$Name,
[Parameter(Mandatory=$false,Position=6)]
		[string]$Group,
[Parameter(ParameterSetName="setb", Mandatory=$true)]
[Parameter(ParameterSetName="seta", Mandatory=$true)]
		[string]$ParentContentTypeID,
[Parameter(ParameterSetName="setc", Mandatory=$true)]
[Parameter(ParameterSetName="setd", Mandatory=$true)]
		[string]$ContentTypeID="",
[Parameter(ParameterSetName="setc", Mandatory=$true)]
[Parameter(ParameterSetName="seta", Mandatory=$true)]
		[string]$ListID,
[Parameter(ParameterSetName="setd", Mandatory=$true)]
[Parameter(ParameterSetName="setb", Mandatory=$true)]
		[string]$ListName=""

		)
    


  $lci =New-Object Microsoft.SharePoint.Client.ContentTypeCreationInformation
  if($PSBoundParameters.ContainsKey("Description"))
  {$lci.Description=$Description}
   if($PSBoundParameters.ContainsKey("Group"))
  {$lci.Group=$Group}
  $lci.Name=$Name  
  switch ($PsCmdlet.ParameterSetName) 
    { 
    "seta"  { $lci.ParentContentType=$ctx.Web.ContentTypes.GetById($ParentContentTypeID);
     $ContentType = $ctx.Web.Lists.GetByID($ListID).ContentTypes.Add($lci); break} 
    "setb"  { $lci.ParentContentType=$ctx.Web.ContentTypes.GetById($ParentContentTypeID);
    $ContentType = $ctx.Web.Lists.GetByTitle($ListName).ContentTypes.Add($lci); break} 
    "setc"  { $lci.ID=$ContentTypeID;
    $ContentType = $ctx.Web.Lists.GetByID($ListID).ContentTypes.Add($lci); break} 
    "setd"  { $lci.ID=$ContentTypeID;
    $ContentType = $ctx.Web.Lists.GetByTitle($ListName).ContentTypes.Add($lci); break} 
    } 


  $ctx.Load($contentType)
  try
     {
       
         $ctx.ExecuteQuery()
         Write-Host "Content Type " $Name " has been added to the list"
     }
     catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

     

}




function New-SPOSiteContentType
{
param(
[Parameter(Mandatory=$false,Position=4)]
		[string]$Description,
[Parameter(Mandatory=$true,Position=5)]
		[string]$Name,
[Parameter(Mandatory=$false,Position=6)]
		[string]$Group,
[Parameter(ParameterSetName="seta", Mandatory=$true,Position=7)]
		[string]$ParentContentTypeID,
[Parameter(ParameterSetName="setb", Mandatory=$true,Position=8)]
		[string]$ContentTypeID=""
		)
 

  $lci =New-Object Microsoft.SharePoint.Client.ContentTypeCreationInformation
  $lci.Name=$Name  
  if($PSBoundParameters.ContainsKey("Description"))
  {$lci.Description=$Description}
   if($PSBoundParameters.ContainsKey("Group"))
  {$lci.Group=$Group}
  switch ($PsCmdlet.ParameterSetName) 
    { 
    "seta"  {$lci.ParentContentType=$ctx.Web.ContentTypes.GetById($ParentContentTypeID); break} 
    "setb"  {$lci.ID=$ContentTypeID; break} 
    } 
  $ContentType = $ctx.Web.ContentTypes.Add($lci)
  $ctx.Load($contentType)
  try
     {
       
         $ctx.ExecuteQuery()
         Write-Host "Content Type " $Name " has been added to the site"
     }
     catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

     

}







function New-SPOListContentTypeColumn
{
  
   param (

        [Parameter(Mandatory=$true,Position=0)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=1)]
		[string]$ColumnName,
        [Parameter(Mandatory=$true,Position=2)]
		[string]$ContentTypeID,
        [Parameter(Mandatory=$false,Position=5)]
		[switch]$ListColumn
		)
  

  $ctx.Load($ctx.Web.Lists)
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.Load($ll.ContentTypes)
  $ctType=$ll.ContentTypes.GetByID($ContentTypeID)
  $ctx.Load($ctType)
  $ctx.ExecuteQuery()
  if($ListColumn)
  {
     $field=$ll.Fields.GetByInternalNameOrTitle($ColumnName)
  }
  else{  $field=$ctx.Web.Fields.GetByInternalNameOrTitle($ColumnName) }

    
     $link=new-object Microsoft.SharePoint.Client.FieldLinkCreationInformation
     $link.Field=$field
     $fielsie=$ctType.FieldLinks.Add($link)
     $ctType.Update($false)
     $ctx.ExecuteQuery()
   
  
     
     
} 






function New-SPOSiteContentTypeColumn
{
  
   param (

        [Parameter(Mandatory=$true,Position=0)]
		[string]$ContentTypeID,
        [Parameter(Mandatory=$true,Position=1)]
		[string]$ColumnName,
        [Parameter(Mandatory=$true,Position=3)]
		[bool]$UpdateChildren
		)
  

  $ctType=$ctx.Web.ContentTypes.GetByID($ContentTypeID)
  $ctx.Load($ctType)
  $ctx.ExecuteQuery()
  $field=$ctx.Web.Fields.GetByInternalNameOrTitle($ColumnName)

     $link=new-object Microsoft.SharePoint.Client.FieldLinkCreationInformation
     $link.Field=$field
     $fielsie=$ctType.FieldLinks.Add($link)
     $ctType.Update($UpdateChildren)
     $ctx.ExecuteQuery()
   
     
  
     
}




function Get-SPOContentType
{
  
   param (

        [Parameter(Mandatory=$false,Position=0)]
		[string]$ListTitle,
        [Parameter(Mandatory=$false,Position=1)]
		[switch]$Available
		)
  

  if($PSBoundParameters.ContainsKey("ListTitle"))
  {
  $ctTypes=$ctx.Web.Lists.GetByTitle($ListTitle).ContentTypes
  $ctx.Load($ctTypes)
  $ctx.ExecuteQuery()
  }
  elseif($Available)
  {
  $ctTypes=$ctx.Web.AvailableContentTypes
  $ctx.Load($ctTypes)
  $ctx.ExecuteQuery()

  }
  else
  {
  $ctTypes=$ctx.Web.ContentTypes
  $ctx.Load($ctTypes)
  $ctx.ExecuteQuery()
  }



  foreach($cc in $ctTypes)
  {

       $ctx.Load($cc)
          $ctx.Load($cc.FieldLinks)
     $ctx.Load($cc.Fields)
     $ctx.Load($cc.WorkflowAssociations)
     $ctx.ExecuteQuery()
      foreach($field in $cc.Fields)
     {
      $PropertyName="Field "+$field.ID
      $cc | Add-Member NoteProperty $PropertyName($field.Title)
     }
     foreach($fieldlink in $cc.FieldLinks)
     {
      $PropertyName="Fieldlink "+$fieldlink.ID
      $cc | Add-Member NoteProperty $PropertyName($fieldlink.Name)
     }
     foreach($workflow in $cc.WorkflowAssociations)
     {
      $PropertyName="Workflow "+$workflow.ID
      $cc | Add-Member NoteProperty $PropertyName($workflow.Name)
     }

     Write-Output $cc

  }
  
  
   
     
  
     
}


function Remove-SPOContentType
{
  
   param (

        [Parameter(Mandatory=$false,Position=0)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=1)]
		[string]$ContentTypeID
		)
  

  if($PSBoundParameters.ContainsKey("ListTitle"))
  {
  $ctType=$ctx.Web.Lists.GetByTitle($ListTitle).ContentTypes.GetByID($ContentTypeID)
  $ctx.Load($ctType)
  $ctx.ExecuteQuery()
  $ctType.DeleteObject()
  $ctx.ExecuteQuery()
  }
  else
  {
  $ctType=$ctx.Web.ContentTypes.GetByID($ContentTypeID)
  $ctx.Load($ctType)
  $ctx.ExecuteQuery()
  $ctType.DeleteObject()
  $ctx.ExecuteQuery()

  }


  }



function Set-SPOContentType
{
  
   param (

        [Parameter(Mandatory=$false,Position=0)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=1)]
		[string]$ContentTypeID,
        [Parameter(Mandatory=$false)]
		[string]$Group,
        [Parameter(Mandatory=$false)]
		[string]$DisplayFormUrl,
        [Parameter(Mandatory=$false)]
		[string]$EditFormUrl,
        [Parameter(Mandatory=$false)]
		[bool]$Hidden,
        [Parameter(Mandatory=$false)]
		[string]$JSLink,
        [Parameter(Mandatory=$false)]
		[string]$NewFormUrl,
        [Parameter(Mandatory=$false)]
		[bool]$ReadOnly,
        [Parameter(Mandatory=$false)]
		[bool]$Sealed=$false,
        [Parameter(Mandatory=$true)]
		[bool]$UpdateChildren

		)
  

  if($PSBoundParameters.ContainsKey("ListTitle"))
  {
  $ctType=$ctx.Web.Lists.GetByTitle($ListTitle).ContentTypes.GetByID($ContentTypeID)
  $ctx.Load($ctType)
  $ctx.ExecuteQuery()
  }
  else
  {
  $ctType=$ctx.Web.ContentTypes.GetByID($ContentTypeID)
  $ctx.Load($ctType)
  $ctx.ExecuteQuery()
  }

    if($PSBoundParameters.ContainsKey("Group"))
  {$ctType.Group=$Group}
      if($PSBoundParameters.ContainsKey("DisplayFormUrl"))
  {$ctType.DisplayFormUrl=$DisplayFormUrl}
      if($PSBoundParameters.ContainsKey("EditFormUrl"))
  {$ctType.EditFormUrl=$EditFormUrl}
      if($PSBoundParameters.ContainsKey("Hidden"))
  {$ctType.Hidden=$Hidden}
      if($PSBoundParameters.ContainsKey("JSLink"))
  {$ctType.JSLink=$JSLink}
      if($PSBoundParameters.ContainsKey("NewFormUrl"))
  {$ctType.NewFormUrl=$NewFormUrl}
      if($PSBoundParameters.ContainsKey("ReadOnly"))
  {$ctType.ReadOnly=$ReadOnly}
        if($PSBoundParameters.ContainsKey("Sealed"))
  {$ctType.Sealed=$Sealed}

  $ctType.Update($UpdateChildren)
  $ctx.ExecuteQuery()

  }




function Connect-SPOCSOM
{
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
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 




Export-ModuleMember -Function "New-SPOListContentType","Connect-SPOCSOM","New-SPOSiteContentType","New-SPOSiteContentTypeColumn","New-SPOListContentTypeColumn", "Get-SPOContentType", "Remove-SPOContentType","Set-SPOContentType"

