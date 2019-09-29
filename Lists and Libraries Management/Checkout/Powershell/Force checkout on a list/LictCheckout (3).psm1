function Set-ListCheckout
{
  param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$ListName,
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
  $ctx.ExecuteQuery()  
  $ll=$ctx.Web.Lists.GetByTitle($ListName)
    $ll.ForceCheckout = $ForceCheckout
    $ll.Update()
    
        $listurl=$null
        if($ctx.Url.EndsWith("/")) {$listurl= $ctx.Url+$ll.Title}
        else {$listurl=$ctx.Url+"/"+$ll.Title}
        try
        {
        #$ErrorActionPreference="Stop"
        $ctx.ExecuteQuery() 
        Write-Host "Done!" -ForegroundColor DarkGreen             
        }

        catch [Net.WebException]
        {
            
            Write-Host "Failed" $_.Exception -ForegroundColor Red
        }
          
  

}

# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 




Export-ModuleMember -Function "Set-ListCheckout"

