# The script gets all columns associated to a SINGLE content type in a list. You can either display the column name or all of its properties. 
# If you want to display all proeprties, uncomment line: # Write-Output $fieldlink
# Created by: Arleta Wanat

function Get-SPOContentType
{
  
   param (
   [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ListTitle,
        [Parameter(Mandatory=$true,Position=5)]
		[string]$CTName
		)
  
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.ExecuteQuery() 

  $list = $ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ctx.Web)
  $ctx.Load($list)
  $ctx.ExecuteQuery()

  $listCC = $list.ContentTypes
  $ctx.Load($listCC)
  $ctx.ExecuteQuery()

    foreach($cc in $listCC)
    {
        
        if($cc.Name -match $CTName)
        {
            $ctx.Load($cc.FieldLinks)
            $ctx.ExecuteQuery()

            Write-Host $cc.Name -ForegroundColor Green

            foreach($fieldlink in $cc.FieldLinks)
            {            
                # Write-Output $fieldlink
                    Write-Host $fieldlink.Name
            }
        }

    }
        
  }
        


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="ana@etr56.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$AdminUrl="https://etr56.sharepoint.com/sites/commsite"
$ListTitle = "Site Pages"
$CTName = "Repost Page"  # name of the content type, e.g. Item, Folder, Site Page
        

Get-SPOContentType -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -ListTitle $ListTitle -CTName $CTName

