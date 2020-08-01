function Remove-SPOWebInheritance{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
		[Parameter(Mandatory=$false,Position=4)]
		[bool]$CopyRoleAssignments=$true,
		[Parameter(Mandatory=$false,Position=5)]
		[bool]$clearSubscopes=$false
	)

	$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
	$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
	$ctx.Load($ctx.Web)
	$ctx.ExecuteQuery()

	try{
		$ctx.Web.BreakRoleInheritance($CopyRoleAssignments,$clearSubscopes)
		$ctx.ExecuteQuery()
		Write-Host "Site " $ctx.Web.Url " has unique permissions."
	}
	catch [Net.WebException]{ 
		Write-Host $_.Exception.ToString()
	}
}


function Restore-SPOWebInheritance{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword       
	)

	$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
	$ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
	$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
	$ctx.Load($ctx.Web)
	$ctx.ExecuteQuery()

	try{
		$ctx.Web.ResetRoleInheritance()
		$ctx.ExecuteQuery()
		Write-Host "Site " $ctx.Web.Url " inherits permissions from its parent."
	}
	catch [Net.WebException]{ 
		Write-Host $_.Exception.ToString()
	}
}


Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  

 Export-ModuleMember -Function "Restore-SPOWebInheritance", "Remove-SPOWebInheritance"
