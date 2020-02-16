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
  [Parameter(Position=6)]
        [ValidateSet('AllDayEvent','Attachments','Boolean', 'Calculate', 'Choice', 'Computed', 'ContenttypeID', 'Counter', 'CrossProjectLink', 'Currency', 'DateTime', 'Error', 'File', 'Geolocation', 'GridChoice', 'Guid', 'Integer', 'Invalid', 'Lookup', 'MaxItems', 'ModStat', 'MultiChoice', 'Note', 'Number', 'OutcomeChoice', 'PageSeparator', 'Recurrence', 'Text', 'ThreadIndex', 'Threading', 'Url','User', 'WorkflowEventType', 'WorkflowStatus')]
        [System.String]$FieldType
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
   $xml="<Field Type='"+ $FieldType+"' DisplayName='"+$FieldDisplayName+"'/>"
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
        Write-Host $_.Exception.ToString()
     }

     



}

Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 




 Export-ModuleMember -Function "New-SPOListColumn"
