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

  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
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


function Get-SPOListItems{
  <#
	.link
	http://social.technet.microsoft.com/wiki/contents/articles/32334.sharepoint-online-spomod-cmdlets-resources.aspx
  #>

  param (
	[Parameter(Mandatory=$true,Position=1)]
	[string]$ListTitle,
 	[Parameter(Mandatory=$false,Position=2)]
	[bool]$IncludeAllProperties=$false,
	[switch]$Recursive,
	[Parameter(Mandatory=$false,Position=4)]
	$DestinationLibrary,
	[Parameter(Mandatory=$false,Position=5)]
	[bool]$Overwrite
  )
  
  
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.Load($ll.Fields)
  $ctx.ExecuteQuery()
  $i=0

  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
  # $spqQuery.ViewAttributes = "Scope='Recursive'"
  $spqQuery.ViewXml = "<Where><Eq><FieldRef Name='Attachments' /><Value Type='Boolean'>1</Value></Eq></Where>";

  if($Recursive){
    $spqQuery.ViewXml +="<View Scope='RecursiveAll' />";
  }
   
  $bobo=Get-SPOListFields -ListTitle $ListTitle 


  $itemki=$ll.GetItems($spqQuery)
  $ctx.Load($itemki)
  $ctx.ExecuteQuery()

 $objArray=@()

  for($j=0;$j -lt $itemki.Count ;$j++){
        
        $attache=$itemki[$j].AttachmentFiles
        $ctx.Load($attache)
        $ctx.ExecuteQuery()
        Write-Host $itemki[$j]["Title"] -BackgroundColor DarkCyan
        
	foreach($att in $attache){
           #Write-Output $att
           $file =
          $ctx.Web.GetFileByServerRelativeUrl($att.ServerRelativeUrl);
          $ctx.Load($file)
          $ctx.ExecuteQuery()

           $NewName=$file.Name

          if($DestinationLibrary.EndsWith("/")){}
          else {$DestinationLibrary=$DestinationLibrary+"/"}
        
          Write-Host "Processing " $file.Name
          $file.CopyTo($DestinationLibrary+$NewName, $Overwrite)
          
          try{
            $ctx.ExecuteQuery()        
            Write-Host $file.Name " has been copied to" $DestinationLibrary   -ForegroundColor DarkGreen 
          }
          catch [Net.WebException]{ 
            Write-Host $_.Exception.ToString()
          }
        }
  }
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


Connect-SPOCSOM -Username "user@tenant.onmicrosoft.com" -Url "https://tenant.sharepoint.com/sites/powie4" 

  Get-SPOListItems -ListTitle withatt -IncludeAllProperties $true -Recursive -DestinationLibrary "/sites/powie4/Destiny2/" -Overwrite $true
