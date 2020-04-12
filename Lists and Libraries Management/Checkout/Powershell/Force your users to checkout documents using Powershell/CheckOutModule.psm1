<#
This is a Powershell module with a single function. Not very useful, it would make more sense as a function, 2019-me may say to 2014-me, but it was one of the first steps to create SPOMod and I keep it out of sentiment.
>#

function Set-Checkout{
    param (
        [Parameter(Mandatory=$true,Position=1)]
	[string]$Username,
	[Parameter(Mandatory=$true,Position=2)]
	[string]$Url,
	[Parameter(Mandatory=$false,Position=3)]
	[bool]$IncludeSubsites=$false,
        [Parameter(Mandatory=$true,Position=4)]
	[string]$AdminPassword,
        [Parameter(Mandatory=$false,Position=5)]
	[bool]$ForceCheckout=$true
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
    $ll.ForceCheckout = $ForceCheckout
    $ll.Update()
    
        $listurl=$null
        
	if($ctx.Url.EndsWith("/")) {
		$listurl= $ctx.Url+$ll.Title
	}
    	else{
		$listurl=$ctx.Url+"/"+$ll.Title
	}
        
	try{
		#$ErrorActionPreference="Stop"
		$ctx.ExecuteQuery() 
		Write-Host $listurl -ForegroundColor DarkGreen             
   	}
    	catch{   
        	Write-Host $listurl -ForegroundColor Red
    	}
    	finally{
		#$ErrorActionPreference="Continue"
    	}    
  }

  if($ctx.Web.Webs.Count -gt 0 -and $includesubsites){
	    for($i=0; $i -lt $ctx.Web.Webs.Count ; $i++)
	    {
		Set-Checkout -Url $ctx.Web.Webs[$i].Url -AdminPassword $AdminPassword -Username $username -IncludeSubsites $true -ForceCheckout $ForceCheckout
	    }
  }
}

# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 




Export-ModuleMember -Function "Set-Checkout"

