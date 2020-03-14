function Get-SPOListFields{
  param (
    [Parameter(Mandatory=$true,Position=1)]
    [string]$Username,
    [Parameter(Mandatory=$true,Position=2)]
    [string]$Url,
    [Parameter(Mandatory=$true,Position=3)]
    [string]$AdminPassword,
    [Parameter(Mandatory=$true,Position=3)]
    [string]$ListTitle,
    [Parameter(Mandatory=$false,Position=4)]
    [bool]$IncludeSubsites=$false
  )

  $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()
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
        $array+="Tag"
        $array+="Title"

    $obj = New-Object PSObject
    $obj | Add-Member NoteProperty $array[0]($fiel.InternalName)
    $obj | Add-Member NoteProperty $array[1]($fiel.StaticName)
    $obj | Add-Member NoteProperty $array[2]($fiel.Tag)
    $obj | Add-Member NoteProperty $array[3]($fiel.Title)

    $fieldsArray+=$obj
    $fieldslist+=$fiel.InternalName
    Write-Output $obj
  }
 

 $ctx.Dispose()
  return $fieldsArray
}



function Get-SPOListItems{ 
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
	[bool]$IncludeAllProperties=$false,
	[switch]$Recursive
  )
  
  
  
   $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.Load($ctx.Web.Webs)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.Load($ll.Fields)
  $ctx.ExecuteQuery()
  $i=0



  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery
  # $spqQuery.ViewAttributes = "Scope='Recursive'"

  if($Recursive){
    $spqQuery.ViewXml ="<View Scope='RecursiveAll' />";
  }
   
   $bobo=Get-SPOListFields -Username $Username -Url $Url -AdminPassword $AdminPassword -ListTitle $ListTitle 

  $itemki=$ll.GetItems($spqQuery)
  $ctx.Load($itemki)
  $ctx.ExecuteQuery()
 
 $objArray=@()

  for($j=0;$j -lt $itemki.Count ;$j++){
        $obj = New-Object PSObject
        
    if($IncludeAllProperties){
        for($k=0;$k -lt $bobo.Count ; $k++){ 
         # Write-Host $k
         $name=$bobo[$k].InternalName
         $value=$itemki[$j][$name]
          $obj | Add-Member NoteProperty $name($value) -Force
        }

    }
    else{
          $obj | Add-Member NoteProperty ID($itemki[$j]["ID"])
          $obj | Add-Member NoteProperty Title($itemki[$j]["Title"])
    }
      #  Write-Host $obj.ID `t $obj.Title
        $objArray+=$obj
  }
  
  return $objArray
}


# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"





Export-ModuleMember -Function "Get-SPOListItems", "Get-SPOListFields"
