function Get-SPOListColumn
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
[Parameter(Mandatory=$true,Position=5)]
		[string]$FieldTitle

		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()
  $List=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.ExecuteQuery()
  $Field=$List.Fields.GetByInternalNameOrTitle($FieldTitle)
  $ctx.Load($Field)

  try
  {
   $ctx.ExecuteQuery()
   

   $obj = New-Object PSObject
   $obj | Add-Member NoteProperty CanBeDeleted($Field.CanBeDeleted)
   $obj | Add-Member NoteProperty DefaultValue($Field.DefaultValue)
        $obj | Add-Member NoteProperty Description($Field.Description)
        $obj | Add-Member NoteProperty Direction($Field.Direction)
        $obj | Add-Member NoteProperty EnforceUniqueValues($Field.EnforceUniqueValues)
        $obj | Add-Member NoteProperty EntityPropertyName($Field.EntityPropertyName)
        $obj | Add-Member NoteProperty Filterable($Field.Filterable)
        $obj | Add-Member NoteProperty FromBaseType($Field.FromBaseType)
        $obj | Add-Member NoteProperty Group($Field.Group)
        $obj | Add-Member NoteProperty Hidden($Field.Hidden)
        $obj | Add-Member NoteProperty ID($Field.Id)
        $obj | Add-Member NoteProperty Indexed($Field.Indexed)
        $obj | Add-Member NoteProperty InternalName($Field.InternalName)
        $obj | Add-Member NoteProperty JSLink($Field.JSLink)
        $obj | Add-Member NoteProperty ReadOnlyField($Field.ReadOnlyField)
        $obj | Add-Member NoteProperty Required($Field.Required)
        $obj | Add-Member NoteProperty SchemaXML($Field.SchemaXML)
        $obj | Add-Member NoteProperty Scope($Field.Scope)
        $obj | Add-Member NoteProperty Sealed($Field.Sealed)
        $obj | Add-Member NoteProperty StaticName($Field.StaticName)
        $obj | Add-Member NoteProperty Sortable($Field.Sortable)
        $obj | Add-Member NoteProperty Tag($Field.Tag)
        $obj | Add-Member NoteProperty Title($Field.Title)
        $obj | Add-Member NoteProperty FieldType($Field.FieldType)
        $obj | Add-Member NoteProperty TypeAsString($Field.UIVersionLabel)
        $obj | Add-Member NoteProperty TypeDisplayName($Field.UIVersionLabel)
        $obj | Add-Member NoteProperty TypeShortDescription($Field.UIVersionLabel)
        $obj | Add-Member NoteProperty ValidationFormula($Field.UIVersionLabel)
        $obj | Add-Member NoteProperty ValidationMessage($Field.UIVersionLabel)
        

        Write-Output $obj
  }
  catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }
  
 



}





function New-SPOListColumn
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
[Parameter(Mandatory=$true,Position=5)]
		[string]$FieldDisplayName,
  [Parameter(Mandatory=$true, Position=6)]
        [ValidateSet('AllDayEvent','Attachments','Boolean', 'Calculate', 'Choice', 'Computed', 'ContenttypeID', 'Counter', 'CrossProjectLink', 'Currency', 'DateTime', 'Error', 'File', 'Geolocation', 'GridChoice', 'Guid', 'Integer', 'Invalid', 'Lookup', 'MaxItems', 'ModStat', 'MultiChoice', 'Note', 'Number', 'OutcomeChoice', 'PageSeparator', 'Recurrence', 'Text', 'ThreadIndex', 'Threading', 'Url','User', 'WorkflowEventType', 'WorkflowStatus')]
        [System.String]$FieldType,
[Parameter(Mandatory=$false,Position=7)]
		[string]$Description="",
[Parameter(Mandatory=$false,Position=8)]
		[string]$Required="false",
[Parameter(Mandatory=$false,Position=10)]
		[string]$Group="",
[Parameter(Mandatory=$false,Position=11)]
		[string]$StaticName,
[Parameter(Mandatory=$false,Position=12)]
		[string]$Name,
[Parameter(Mandatory=$false,Position=13)]
		[string]$Version="1"
          
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()

  $List=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.ExecuteQuery()

  if($PSBoundParameters.ContainsKey("StaticName")) {$StaticName=$StaticName}
  else {$StaticName=$FieldDisplayName}
  if($PSBoundParameters.ContainsKey("Name")) {$Name=$Name}
  else {$Name=$FieldDisplayName}

   $FieldOptions=[Microsoft.SharePoint.Client.AddFieldOptions]::AddToAllContentTypes 
   $xml="<Field Type='"+$FieldType+"' Description='"+$Description+"' Required='"+$Required+"' Group='"+$Group+"' StaticName='"+$StaticName+"' Name='"+$Name+"' DisplayName='"+$FieldDisplayName+"' Version='"+$Version+"'></Field>"    
   Write-Host $xml
$List.Fields.AddFieldAsXml($xml,$true,$FieldOptions) 
$List.Update() 
 
  try
     {
       
         $ctx.ExecuteQuery()
         Write-Host "Field " $FieldDisplayName " has been added to " $ListTitle
     }
     catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()-ForegroundColor Red
     }

     



}






function Set-SPOListColumn
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
        [Parameter(Mandatory=$false,Position=5)]
		[string]$DefaultValue,
        [Parameter(Mandatory=$false,Position=6)]
		[string]$Description="",
        [Parameter(Mandatory=$false,Position=7)]
        [ValidateSet('LTR','RTL','none')]
		[string]$Direction,
        [Parameter(Mandatory=$false,Position=8)]
		[bool]$EnforceUniqueValues,
[Parameter(Mandatory=$false,Position=9)]
		[string]$Group="",
[Parameter(Mandatory=$false,Position=10)]
		[bool]$Hidden,
[Parameter(Mandatory=$false,Position=11)]
		[bool]$Indexed,
[Parameter(Mandatory=$false,Position=12)]
		[string]$JSLink="",
[Parameter(Mandatory=$false,Position=13)]
		[bool]$ReadOnlyField,
[Parameter(Mandatory=$false,Position=14)]
		[bool]$Required,
[Parameter(Mandatory=$false,Position=15)]
		[string]$SchemaXML,
[Parameter(Mandatory=$false,Position=16)]
		[string]$StaticName,
[Parameter(Mandatory=$false,Position=17)]
		[string]$Tag,
[Parameter(Mandatory=$false,Position=18)]
		[string]$FieldTitle
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()
  $List=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.ExecuteQuery()
  $lci=$List.Fields.GetByTitle($FieldTitle)
   $ctx.ExecuteQuery()
  if($PSBoundParameters.ContainsKey("Description"))
  {
  $lci.Description=$Description
  }
  if($PSBoundParameters.ContainsKey("DefaultValue"))
  {
  $lci.DefaultValue=$DefaultValue
  }

  if($PSBoundParameters.ContainsKey("Direction"))
  {
  $lci.Direction=$Direction
  }
  if($PSBoundParameters.ContainsKey("EnforceUniqueValues"))
  {
  $lci.EnforceUniqueValues=$EnforceUniqueValues
  }
  
  if($PSBoundParameters.ContainsKey("Group"))
  {
  $lci.Group=$Group
  }
  if($PSBoundParameters.ContainsKey("Hidden")){
  $lci.Hidden=$Hidden
  }
  if($PSBoundParameters.ContainsKey("Indexed"))
  {
  $lci.Indexed=$Indexed
  }
  
  if($PSBoundParameters.ContainsKey("JSLink"))
  {
  $lci.JSLink=$JSLink
  }
  if($PSBoundParameters.ContainsKey("ReadOnlyField"))
  {
  $lci.ReadOnlyField=$ReadOnlyField
  }
  if($PSBoundParameters.ContainsKey("Required"))
  {
  $lci.Required=$Required
  }
  if($PSBoundParameters.ContainsKey("SchemaXML"))
  {
  $lci.SchemaXML=$SchemaXML
  }
 
  
  if($PSBoundParameters.ContainsKey("StaticName"))
  {
  $lci.StaticName=$StaticName
  }
 
  if($PSBoundParameters.ContainsKey("Tag"))
  {
  $lci.Tag=$Tag
  }


  $lci.Update()
  $ctx.load($lci)
  try
     {
       
         $ctx.ExecuteQuery()
         Write-Host $FieldTitle " has been updated"
     }
     catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

     



}



function Remove-SPOListColumn
{

param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
[Parameter(Mandatory=$false,Position=5)]
		[string]$FieldTitle

		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()
  $List=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.ExecuteQuery()
  $Field=$List.Fields.GetByTitle($FieldTitle)
   $ctx.ExecuteQuery()
   $Field.DeleteObject()
   $ctx.ExecuteQuery()

}


function Get-SPOListColumnFieldIsObjectPropertyInstantiated
{

param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
[Parameter(Mandatory=$false,Position=5)]
		[string]$FieldTitle,
[Parameter(Mandatory=$false,Position=6)]
		[string]$FieldID,
[Parameter(Mandatory=$false,Position=7)]
		[string]$ObjectPropertyName

		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()
  $List=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.ExecuteQuery()
  if($PSBoundParameters.ContainsKey("FieldTitle"))
  {
  $Field=$List.Fields.GetByInternalNameorTitle($FieldTitle)
  }
  if($PSBoundParameters.ContainsKey("FieldID"))
  {
  $Field=$List.Fields.GetById($FieldID)
  }
   $ctx.ExecuteQuery()
   $Field.IsObjectPropertyInstantiated($ObjectPropertyName)
   $ctx.ExecuteQuery()

}



function Get-SPOListColumnFieldIsPropertyAvailable
{

param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
[Parameter(Mandatory=$false,Position=5)]
		[string]$FieldTitle,
[Parameter(Mandatory=$false,Position=6)]
		[string]$FieldID,
[Parameter(Mandatory=$false,Position=7)]
		[string]$PropertyName

		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()
  $List=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.ExecuteQuery()
  if($PSBoundParameters.ContainsKey("FieldTitle"))
  {
  $Field=$List.Fields.GetByInternalNameorTitle($FieldTitle)
  }
  if($PSBoundParameters.ContainsKey("FieldID"))
  {
  $Field=$List.Fields.GetById($FieldID)
  }
   $ctx.ExecuteQuery()
   $Field.IsPropertyAvailable($PropertyName)
   $ctx.ExecuteQuery()

}



function New-SPOListChoiceColumn
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
[Parameter(Mandatory=$true,Position=5)]
		[string]$FieldDisplayName,
[parameter(Mandatory=$true, ValueFromPipeline=$true)]
            [String[]]
            $ChoiceNames,
            [Parameter(Mandatory=$false,Position=7)]
		[string]$Description="",
[Parameter(Mandatory=$false,Position=8)]
		[string]$Required="false",
[Parameter(Mandatory=$false,Position=9)]
[ValidateSet('Dropdown','RadioButtons')]
		[string]$Format="Dropdown",
[Parameter(Mandatory=$false,Position=10)]
		[string]$Group="",
[Parameter(Mandatory=$true,Position=11)]
		[string]$StaticName,
[Parameter(Mandatory=$true,Position=12)]
		[string]$Name,
[Parameter(Mandatory=$false,Position=13)]
		[string]$Version="1",
[Parameter(Mandatory=$false,Position=14)]
[ValidateSet('MultiChoice')]
		[string]$Type
          
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Lists)
  $ctx.ExecuteQuery()
  $List=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.ExecuteQuery()
   $FieldOptions=[Microsoft.SharePoint.Client.AddFieldOptions]::AddToAllContentTypes 
    if($PSBoundParameters.ContainsKey("Type"))
   {
    $xml="<Field Type='MultiChoice' Description='"+$Description+"' Required='"+$Required+"' FillInChoice='FALSE' "
   }
   else
   {
   $xml="<Field Type='Choice' Description='"+$Description+"' Required='"+$Required+"' FillInChoice='FALSE' "
   }
   if($PSBoundParameters.ContainsKey("Format"))
   {
     $xml+="Format='"+$Format+"' "
     }
     
     $xml+="Group='"+$Group+"' StaticName='"+$StaticName+"' Name='"+$Name+"' DisplayName='"+$FieldDisplayName+"' Version='"+$Version+"'>
   <CHOICES>"
     
   foreach($choice in $ChoiceNames)
   {
   $xml+="<CHOICE>"+$choice+"</CHOICE>
   "
   
   }
   
   $xml+="</CHOICES>
   </Field>"
   
   
   Write-Host $xml
$List.Fields.AddFieldAsXml($xml,$true,$FieldOptions) 
$List.Update() 
 
  try
     {
       
         $ctx.ExecuteQuery()
         Write-Host "Field " $FieldDisplayName " has been added to " $ListTitle
     }
     catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString() -ForegroundColor
     }

     



}


Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 




 Export-ModuleMember -Function "New-SPOListColumn", "New-SPOListChoiceColumn", "Set-SPOListColumn", "Get-SPOListColumn", "Remove-SPOListColumn", "Get-SPOListColumnFieldIsObjectPropertyInstantiated", "Get-SPOListColumnFieldIsPropertyAvailable"





