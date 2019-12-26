function Set-SPOFileCheckout
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ServerRelativeUrl     
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()


  $file =
        $ctx.Web.GetFileByServerRelativeUrl($ServerRelativeUrl);
        $ctx.Load($file)
        $ctx.ExecuteQuery()

  $file.CheckOut()
  $ctx.Load($file)
  $ctx.ExecuteQuery()        
        
       Write-Host $file.Name " has been checked out"    -ForegroundColor DarkGreen


}



function Approve-SPOFile
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ServerRelativeUrl,
        [Parameter(Mandatory=$false,Position=5)]
		[string]$ApprovalComment=""    
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()


  $file =
        $ctx.Web.GetFileByServerRelativeUrl($ServerRelativeUrl);
        $ctx.Load($file)
        $ctx.ExecuteQuery()

  $file.Approve($ApprovalComment)
  $ctx.Load($file)
  $ctx.ExecuteQuery()        
        

        Write-Host $file.Name " has been approved"   -ForegroundColor DarkGreen

}



function Set-SPOFileCheckin
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ServerRelativeUrl,
        [Parameter(Position=5)]
        [ValidateSet('MajorCheckIn','MinorCheckIn','OverwriteCheckIn')]
        [System.String]$CheckInType,
        [Parameter(Mandatory=$false,Position=6)]
		[string]$CheckinComment=""     
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()


  $file =
        $ctx.Web.GetFileByServerRelativeUrl($ServerRelativeUrl);
        $ctx.Load($file)
        $ctx.ExecuteQuery()

  $file.CheckIn($CheckInComment, $CheckInType)
  $ctx.Load($file)
  $ctx.ExecuteQuery()        
  Write-Host $file.Name " has been checked in"      -ForegroundColor DarkGreen



}







Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 




 Export-ModuleMember -Function "Approve-SPOFile", "Set-SPOFileCheckin", "Set-SPOFileCheckout"