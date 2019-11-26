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
  try
  {
  $ctx.ExecuteQuery()        
        
       Write-Host $file.Name " has been checked out"   -ForegroundColor DarkGreen 
       }
       catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

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

  try
  {
  $ctx.ExecuteQuery()        
        

        Write-Host $file.Name " has been approved"  -ForegroundColor DarkGreen 
        }
        catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }
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
  try
  {
  $ctx.ExecuteQuery()        
  Write-Host $file.Name " has been checked in"     -ForegroundColor DarkGreen 
  }
        catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }


}




function Copy-SPOFile
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
        [Parameter(Mandatory=$true,Position=5)]
		[string]$DestinationLibrary,
        [Parameter(Mandatory=$false,Position=6)]
		[bool]$Overwrite=$true,
        [Parameter(Mandatory=$false,Position=7)]
		[string]$NewName=""
    
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

        if($NewName -eq "")
        {
           $NewName=$file.Name

        }

$file.CopyTo($DestinationLibrary+$NewName, $Overwrite)
  try
  {
  $ctx.ExecuteQuery()        
        
       Write-Host $file.Name " has been copied to" $DestinationLibrary   -ForegroundColor DarkGreen 
       }
        catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }
}



function Remove-SPOFile
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

  $file.DeleteObject()
  try
  {
  $ctx.ExecuteQuery()        
        
       Write-Host $file.Name " has been deleted"   -ForegroundColor DarkGreen 
       }
        catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }
}




function Deny-SPOFileApproval
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

  $file.Deny($ApprovalComment)
  $ctx.Load($file)

  try
  {
  $ctx.ExecuteQuery()        
        

        Write-Host $file.Name " has been denied"  -ForegroundColor DarkGreen 
        }
        catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }
}



function Get-SPOFileIsPropertyAvailable
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
[Parameter(Mandatory=$true,Position=5)]
		[string]$propertyName    
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

  if($file.IsPropertyAvailable($propertyName))
  {
  Write-Host "True"
  }
  else
  {
  Write-Host "False"
  }
  

}


function Move-SPOFile
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
        [Parameter(Mandatory=$true,Position=5)]
		[string]$DestinationLibrary,
        [Parameter(Mandatory=$false,Position=6)]
		[bool]$Overwrite=$false,
        [Parameter(Mandatory=$false,Position=7)]
		[string]$NewName=""     
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

        if($NewName -ne "")
        {
         $DestinationLibrary+=$NewName

        }
        else
        {
        $DestinationLibrary+=$file.Name

        }

        if($Overwrite)
        {

  $file.MoveTo($DestinationLibrary,"Overwrite")
  }
  else
  {
  $file.MoveTo($DestinationLibrary,"none")
  }
  
  try
  {
  $ctx.ExecuteQuery()        
        
       Write-Host $file.Name " has been moved to "  $DestinationLibrary -ForegroundColor DarkGreen 
       }
        catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

}



function Publish-SPOFile
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
		[string]$Comment=""    
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

  $file.Publish($Comment)
  $ctx.Load($file)

  try
  {
  $ctx.ExecuteQuery()        
        

        Write-Host $file.Name " has been published"  -ForegroundColor DarkGreen 
        }
        catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }
}



function Undo-SPOFileCheckout
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

  $file.UndoCheckOut()
  $ctx.Load($file)
  try
  {
  $ctx.ExecuteQuery()        
        
       Write-Host "Checkout for " $file.Name " has been undone"   -ForegroundColor DarkGreen 
       }
        catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

}


function Undo-SPOFilePublish
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
		[string]$Comment     
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

  $file.Unpublish($Comment)
  $ctx.Load($file)
  try
  {
  $ctx.ExecuteQuery()        
        
       Write-Host $file.Name " has been unpublished"   -ForegroundColor DarkGreen 
       }
        catch [Net.WebException]
     { 
        Write-Host $_.Exception.ToString()
     }

}

Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 




 Export-ModuleMember -Function "Approve-SPOFile", "Set-SPOFileCheckin", "Set-SPOFileCheckout", "Copy-SPOFile", "Set-SPOFile", "Remove-SPOFile", "Deny-SPOFileApproval", "Get-SPOFileIsPropertyAvailable", "Move-SPOFile", "Publish-SPOFile", "Undo-SPOFileCheckout", "Undo-SPOFilePublish"