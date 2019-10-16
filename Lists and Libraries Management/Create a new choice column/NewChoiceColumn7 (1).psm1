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
[ValidateSet('Dropdown','Radiobuttons', 'Checkboxes')]
		[string]$Format="Dropdown",
[Parameter(Mandatory=$false,Position=10)]
		[string]$Group="",
[Parameter(Mandatory=$true,Position=11)]
		[string]$StaticName,
[Parameter(Mandatory=$true,Position=12)]
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
   $FieldOptions=[Microsoft.SharePoint.Client.AddFieldOptions]::AddToAllContentTypes 
   $xml="<Field Type='Choice' Description='"+$Description+"' Required='"+$Required+"' FillInChoice='FALSE'  Format='"+$Format+"' Group='"+$Group+"' StaticName='"+$StaticName+"' Name='"+$Name+"' DisplayName='"+$FieldDisplayName+"' Version='"+$Version+"'>
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
 




 Export-ModuleMember -Function "New-SPOListChoiceColumn"
