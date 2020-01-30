

function Get-SPOContentType{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$Url
	)

	  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
	  $ctx.ExecuteQuery() 

	  $ctx.Load($ctx.Web.Lists)
	  $ctx.Load($ctx.Web.Webs)
	  $ctx.ExecuteQuery()
	  Write-Host 
	  Write-Host $ctx.Url -BackgroundColor White -ForegroundColor DarkGreen
	foreach( $ll in $ctx.Web.Lists){    
	   $ctx.Load($ll.ContentTypes)

		try{
		   $ctx.ExecuteQuery()
		}
		catch{}

		Write-Host $ll.Title

		foreach($cc in $ll.ContentTypes){
		     $ctx.Load($cc)
		     $ctx.Load($cc.FieldLinks)
		     $ctx.Load($cc.Fields)
		     $ctx.Load($cc.WorkflowAssociations)
		     $ctx.ExecuteQuery()
		     $obj = New-Object PSObject
		     $obj | Add-Member NoteProperty Title($cc.Name)
		     $obj | Add-Member NoteProperty  List($ll.Title)
		     $obj | Add-Member NoteProperty Web($url)
		     $obj | Add-Member NoteProperty Description($cc.Description)
		     $obj | Add-Member NoteProperty DisplayFormTemplateName($cc.DisplayFormTemplateName)
		     $obj | Add-Member NoteProperty DisplayFormUrl($cc.DisplayFormUrl)
		     $obj | Add-Member NoteProperty DocumentTemplate($cc.DocumentTemplate)
		     $obj | Add-Member NoteProperty DocumentTemplateUrl($cc.DocumentTemplateUrl)
		     $obj | Add-Member NoteProperty EditFormTemplateName($cc.EditFormTemplateName)
		     $obj | Add-Member NoteProperty EditFormUrl($cc.EditFormUrl)

			foreach($field in $cc.Fields){
			      $PropertyName="Field"+$field.ID
			      $obj | Add-Member NoteProperty $PropertyName($field.Title)
			}

			foreach($fieldlink in $cc.FieldLinks){
			      $PropertyName="Fieldlink"+$fieldlink.ID
			      $obj | Add-Member NoteProperty $PropertyName($fieldlink.Name)
			}

			     $obj | Add-Member NoteProperty Group($cc.Group)
			     $obj | Add-Member NoteProperty Hidden($cc.Hidden)
			     $obj | Add-Member NoteProperty ID($cc.ID)
			     $obj | Add-Member NoteProperty JSLink($cc.JSLink)
			     $obj | Add-Member NoteProperty NewFormTemplateName($cc.NewFormTemplateName)
			     $obj | Add-Member NoteProperty NewFormUrl($cc.NewFormUrl)
			     $obj | Add-Member NoteProperty Parent($cc.Parent)
			     $obj | Add-Member NoteProperty ReadOnly($cc.ReadOnly)
			     $obj | Add-Member NoteProperty SchemaXML($cc.SchemaXML)
			     $obj | Add-Member NoteProperty SchemaXmlWithResourceTokens($cc.SchemaXmlWithResourceTokens)
			     $obj | Add-Member NoteProperty Scope($cc.Scope)
			     $obj | Add-Member NoteProperty Sealed($cc.Sealed)
			     $obj | Add-Member NoteProperty ServerObjectIsNull($cc.ServerObjectIsNull)
			     $obj | Add-Member NoteProperty StringID($cc.StringID)
			     $obj | Add-Member NoteProperty Tag($cc.Tag)
			     $obj | Add-Member NoteProperty TypedObject($cc.TypedObject)

		     foreach($workflow in $cc.WorkflowAssociations){
			      $PropertyName="Workflow"+$workflow.ID
			      $obj | Add-Member NoteProperty $PropertyName($workflow.Name)
		     }

	    	   Write-Output $obj
		} 
	}

	if($ctx.Web.Webs.Count -gt 0){
		foreach ($web in $ctx.Web.Webs){
		   Get-SPOContentType -Username $Username -Url $web.Url -AdminPassword $AdminPassword
		}
	}  
}


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="admin@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://tenant.sharepoint.com/sites/teamsitewithlibraries"



Get-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl
