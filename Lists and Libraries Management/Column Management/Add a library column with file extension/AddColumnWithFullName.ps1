<#  
.SYNOPSIS  
     Adds a column with file extensions to a SharePoint Online library 
.DESCRIPTION  
	A short script to add a column with file extensions to a SharePoint Online library.
.NOTES  
    Author     : Arleta Wanat @ 2016
.LINK  
http://social.technet.microsoft.com/wiki/contents/articles/32403.sharepoint-online-spomod-new-spolistcolumn.aspx
#>

function New-SPOListColumn{

  <#
	.link
	http://social.technet.microsoft.com/wiki/contents/articles/32403.sharepoint-online-spomod-new-spolistcolumn.aspx

  #>


  param (
    [Parameter(Mandatory=$true,Position=0)]
    [string]$ListTitle,
    [Parameter(Mandatory=$true,Position=1)]
    [string]$FieldDisplayName,
    [Parameter(Mandatory=$true, Position=2)]
    [ValidateSet('AllDayEvent','Attachments','Boolean', 'Calculate', 'Choice', 'Computed', 'ContenttypeID', 'Counter', 'CrossProjectLink', 'Currency', 'DateTime', 'Error', 'File', 'Geolocation', 'GridChoice', 'Guid', 'Integer', 'Invalid', 'Lookup', 'MaxItems', 'ModStat', 'MultiChoice', 'Note', 'Number', 'OutcomeChoice', 'PageSeparator', 'Recurrence', 'Text', 'ThreadIndex', 'Threading', 'Url','User', 'WorkflowEventType', 'WorkflowStatus')]
    [System.String]$FieldType,
    [Parameter(Mandatory=$false,Position=3)]
    [string]$Description="",
    [Parameter(Mandatory=$false,Position=4)]
    [string]$Required="false",
    [Parameter(Mandatory=$false,Position=5)]
    [string]$Group="",
    [Parameter(Mandatory=$false,Position=6)]
    [string]$StaticName,
    [Parameter(Mandatory=$false,Position=7)]
    [string]$Name,
    [Parameter(Mandatory=$false,Position=8)]
    [string]$Version="1",
    [Parameter(Mandatory=$false,Position=9)]
    [bool]$AddToDefaultView=$false,
    [Parameter(Mandatory=$false,Position=10)]
    [string]$AddToView=""         
  )

  $List=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.ExecuteQuery()

  if($PSBoundParameters.ContainsKey("StaticName")) {$StaticName=$StaticName}
  else {$StaticName=$FieldDisplayName}
  
  if($PSBoundParameters.ContainsKey("Name")) {$Name=$Name}
  else {$Name=$FieldDisplayName}

   $FieldOptions=[Microsoft.SharePoint.Client.AddFieldOptions]::AddToAllContentTypes 
   $xml="<Field Type='"+$FieldType+"' Description='"+$Description+"' Required='"+$Required+"' Group='"+$Group+"' StaticName='"+$StaticName+"' Name='"+$Name+"' DisplayName='"+$FieldDisplayName+"' Version='"+$Version+"' RowOrdinal='3'></Field>"    
   Write-Host $xml
  $List.Fields.AddFieldAsXml($xml,$true,$FieldOptions) 
  $List.Update() 
 
  try{  
    $ctx.ExecuteQuery()
    Write-Host "Field " $FieldDisplayName " has been added to " $ListTitle
  }
  catch [Net.WebException]{ 
        Write-Host $_.Exception.ToString()-ForegroundColor Red
  }

   <#  if($AddToDefaultView -eq $true)
     {
      $ctx.Load($List.DefaultView)
      $ctx.ExecuteQuery()
      if($List.DefaultView -eq $null){ Write-Verbose "There is no default view set for this list"}
      $DefaultViewFields=$List.DefaultView.ViewFields
      $ctx.Load($DefaultViewFields)
      $ctx.ExecuteQuery()
      $List.DefaultView.ViewFields.Add($Name)
      $List.DefaultView.Update()
      $ctx.ExecuteQuery()
      Write-Verbose "Adding to the default view"
     }#>
}


function Get-SPOListFields{
  <#
	.link
	http://social.technet.microsoft.com/wiki/contents/articles/32334.sharepoint-online-spomod-cmdlets-resources.aspx

  #>


  param (
    [Parameter(Mandatory=$true,Position=3)]
		[string]$ListTitle,
    [Parameter(Mandatory=$false,Position=4)]
		[bool]$IncludeSubsites=$false
	)

  $ll=$ctx.Web.Lists.GetById("7CB59525-C1C5-4354-82EE-3B3D963B945A")
  $ctx.Load($ll)
  $ctx.Load($ll.Fields)
  $ctx.ExecuteQuery()

  $fieldsArray=@()
  $fieldslist=@()
 foreach ($fiel in $ll.Fields){
    #Write-Host $fiel.Description `t $fiel.EntityPropertyName `t $fiel.Id `t $fiel.InternalName `t $fiel.StaticName `t $fiel.Tag `t $fiel.Title  `t $fiel.TypeDisplayName

    $array=@()
    $array+="InternalName"
      $array+="StaticName"
        $array+="Title"

    $obj = New-Object PSObject
    $obj | Add-Member NoteProperty $array[0]($fiel.InternalName)
    $obj | Add-Member NoteProperty $array[1]($fiel.StaticName)
    $obj | Add-Member NoteProperty $array[2]($fiel.Title)

    $fieldsArray+=$obj
    $fieldslist+=$fiel.InternalName
    Write-Output $obj
  }
 
 $ctx.Dispose()
  return $fieldsArray

}


function Get-SPOFolderFiles{
  param (
    [Parameter(Mandatory=$true,Position=0)]
    [string]$ServerRelativeUrl     
  )

  $fileCollection =
        $ctx.Web.GetFolderByServerRelativeUrl($ServerRelativeUrl).Files;
        $ctx.Load($fileCollection)
        $ctx.ExecuteQuery()

        
        foreach ($file in $fileCollection){
          $ctx.Load($file.ListItemAllFields)
          $Author=$file.Author
          $CheckedOutByUser=$file.CheckedOutByUser
          $LockedByUser=$file.LockedByUser
          $ModifiedBy=$file.ModifiedBy
          $ctx.Load($Author)
          $ctx.Load($CheckedOutByUser)
          $ctx.Load($LockedByUser)
          $ctx.Load($ModifiedBy)
          $ctx.ExecuteQuery()
          $extension=""
          $extension=$file.Name

          $numerek=$extension.LastIndexOf(".")
          $extension=$extension.Substring($numerek)

    
        # Write-Host $extension
          
          <#
          $obj = New-Object PSObject
          $obj | Add-Member NoteProperty Name($file.Name)
          $obj | Add-Member NoteProperty Author.LoginName($file.Author.LoginName)
          $obj | Add-Member NoteProperty CheckedOutByUser.LoginName($file.CheckedOutByUser.LoginName)
          $obj | Add-Member NoteProperty CheckinComment($file.CheckinComment)
          $obj | Add-Member NoteProperty ContentTag($file.ContentTag)
          $obj | Add-Member NoteProperty ETag($file.ETag)
          $obj | Add-Member NoteProperty Exists($file.Exists)
          $obj | Add-Member NoteProperty Length($file.Length)
          $obj | Add-Member NoteProperty LockedByUser.LoginName($file.LockedByUser.LoginName)
          $obj | Add-Member NoteProperty MajorVersion($file.MajorVersion)
          $obj | Add-Member NoteProperty MinorVersion($file.MinorVersion)
          $obj | Add-Member NoteProperty ModifiedBy.LoginName($file.ModifiedBy.LoginName)
          $obj | Add-Member NoteProperty ServerRelativeUrl($file.ServerRelativeUrl)
          $obj | Add-Member NoteProperty Tag($file.Tag)
          $obj | Add-Member NoteProperty TimeCreated($file.TimeCreated)
          $obj | Add-Member NoteProperty TimeLastModified($file.TimeLastModified)
          $obj | Add-Member NoteProperty Title($file.Title)
          $obj | Add-Member NoteProperty UIVersion($file.UIVersion)
          $obj | Add-Member NoteProperty UIVersionLabel($file.UIVersionLabel)
          

          Write-Output $obj #>
        }
}

function Get-SPOListItemy{
  $listtka=$ctx.Web.Lists.GetById($listID)
  $ctx.Load($listtka)
  $ctx.ExecuteQuery()
  #Write-Host $listtka.Title

  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
  # $spqQuery.ViewAttributes = "Scope='Recursive'"


  $spqQuery.ViewXml ="<View Scope='RecursiveAll' />";

   $bobo=Get-SPOListFields -ListTitle $listtka.Title


  $itemki=$listtka.GetItems($spqQuery)
  $ctx.Load($itemki)
  $ctx.ExecuteQuery()

  
 
 $objArray=@()

  for($j=0;$j -lt $itemki.Count ;$j++){  
        $obj = New-Object PSObject
        $extension=""
        $extension=$itemki[$j]["FileRef"]

        $numerek=$extension.LastIndexOf(".")
        $extension=$extension.Substring($numerek)

  
        Write-Host $extension
        $itemki[$j]["Extension"]=$itemki[$j]["File_x0020_Type"]
        $itemki[$j].Update()
        $ctx.ExecuteQuery()
       <# for($k=0;$k -lt $bobo.Count ; $k++)
        {
          
         # Write-Host $k
         $name=$bobo[$k].InternalName
         $value=$itemki[$j][$name]
          $obj | Add-Member NoteProperty $name($value) -Force
          
        }#>



      #  Write-Host $obj.ID `t $obj.Title
        $objArray+=$obj
  }
  #return $objArray  
}


function Connect-SPOCSOM{
  param (
    [Parameter(Mandatory=$true,Position=1)]
    [string]$Username,
    [Parameter(Mandatory=$true,Position=2)]
    $AdminPassword,
    [Parameter(Mandatory=$true,Position=3)]
    [string]$Url
  )

  #$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
    $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
    $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
    $ctx.ExecuteQuery()  
  $global:ctx=$ctx
}


$global:ctx






# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll"

$pasworde = Read-Host -Prompt "Password " -AsSecureString
$uss="2190@tenant.onmicrosoft.com"
$listTitle="ext3"
$listID="1979CC10-3E5D-4D99-9BE6-8BE6229E4E13"
$newColumnName="Extension"

Connect-SPOCSOM -Username $uss  -AdminPassword $pasworde -Url "https://tenant.sharepoint.com/sites/powie3"

function Work(){
  BEGIN{
  New-SPOListColumn -ListTitle $listTitle -FieldDisplayName $newColumnName -FieldType Text -StaticName "FileNameWithExtension" -Name "FileNameWithExtension" -AddToDefaultView $true -AddToView ""
  }

  PROCESS{
    Get-SPOListItemy
  }

  END{}
}

Work
#New-SPOListColumn -ListTitle $listTitle -FieldDisplayName $newColumnName -FieldType Text -StaticName "FileNameWithExtension" -Name "FileNameWithExtension" -AddToDefaultView $true -AddToView ""
# Get-SPOFolderFiles -ServerRelativeUrl "/sites/powie3/Freigegebene Dokumente" 

