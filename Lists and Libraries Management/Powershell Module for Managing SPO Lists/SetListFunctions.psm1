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
            
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }
          
  

}

function Set-ListVersioning
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
		[bool]$Enabled=$true
		)
  
  $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()  
  $ll=$ctx.Web.Lists.GetByTitle($ListName)
    $ll.EnableVersioning=$Enabled
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
            
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }
          
  

}


function Set-ListMinorVersioning
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
		[bool]$Enabled=$true
		)
  
  $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()  
  $ll=$ctx.Web.Lists.GetByTitle($ListName)
    $ll.EnableMinorVersions=$Enabled
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
            
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }
          
  

}


function Remove-ListInheritance
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
		[bool]$KeepPermissions=$true
		)
  
  $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()  
  $ll=$ctx.Web.Lists.GetByTitle($ListName)
    $ll.BreakRoleInheritance($KeepPermissions, $false)
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
            
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }
          
  

}


function Restore-ListInheritance
{
  param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$ListName,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$AdminPassword
		)
  
  $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()  
  $ll=$ctx.Web.Lists.GetByTitle($ListName)
    $ll.ResetRoleInheritance()
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
            
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }
          
  

}


function Set-ListContentTypesEnabled
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
		[bool]$Enabled=$true
		)
  
  $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()  
  $ll=$ctx.Web.Lists.GetByTitle($ListName)
    $ll.ContentTypesEnabled=$Enabled
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
            
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }
          
  

}


function Remove-SPOList
{
  param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
		[Parameter(Mandatory=$true,Position=3)]
		[string]$ListName,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$AdminPassword
		)
  
  $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()  
  $ll=$ctx.Web.Lists.GetByTitle($ListName)
    $ll.DeleteObject();
        try
        {
        #$ErrorActionPreference="Stop"
        $ctx.ExecuteQuery() 
        Write-Host "Done!" -ForegroundColor DarkGreen             
        }

        catch [Net.WebException] 
        {
            
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }
          
  

}


function Set-ListFolderCreationEnabled
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
		[bool]$Enabled=$true
		)
  
  $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()  
  $ll=$ctx.Web.Lists.GetByTitle($ListName)
    $ll.EnableFolderCreation=$Enabled
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
            
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }
          
  

}


function Set-ListIRMEnabled
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
		[bool]$Enabled=$true
		)
  
  $password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web.Lists)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()  
  $ll=$ctx.Web.Lists.GetByTitle($ListName)
    $ll.IrmEnabled=$Enabled
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
            
            Write-Host "Failed" $_.Exception.ToString() -ForegroundColor Red
        }
          
  

}




# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 




Export-ModuleMember -Function "Set-ListCheckout", "Set-ListVersioning", "Set-ListMinorVersioning", "Remove-ListInheritance", "Restore-ListInheritance", "Set-ListContentTypesEnabled", "Remove-SPOList", "Set-ListFolderCreationEnabled", "Set-ListIRMEnabled"

