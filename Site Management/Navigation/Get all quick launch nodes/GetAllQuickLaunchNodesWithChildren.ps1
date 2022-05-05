<#
.SYNOPSIS 

Gets all quick launch nodes.
#>



function Get-SPOQuickLaunchNavigationNode
{
  
   param (
   [Parameter(Mandatory=$true,Position=1)]
		$Context
		)

  #test connection
  $Context.ExecuteQuery() 
  
  $quickLaunch = $Context.Web.Navigation.QuickLaunch
  $Context.Load($Context.Web)
  $Context.Load($quickLaunch)
  $Context.ExecuteQuery()


    Write-Host  $quickLaunch.Count

#  Write-Host $ctx.Url -BackgroundColor White -ForegroundColor DarkGreen
  $i=0
  foreach( $node in $quickLaunch)
  {
        $kiddies = $node.Children
        $Context.Load($kiddies)
        $Context.ExecuteQuery()
        Show-Results -Title $node.Title -Url $node.Url -NoofChildren $kiddies.Count
       <# [pscustomobject]@{
            Title = $node.Title
            Url = $node.Url
            NumberOfChildren = $node.Children.Count
            } | Export-Csv -Path $CSVPath -Append #>

        if($kiddies.Count -gt 0)
        {
            
            Get-SPOChildNode -ctx $Context -nodeChildrenCollection $kiddies


        }

   } 
           

}

function Get-SPOChildNode ($ctx, $nodeChildrenCollection)
{       
        $script:separator+= "---"
        foreach($child in $nodeChildrenCollection)
            {    
                             
                $children = $child.Children
                $ctx.Load($children)
                $ctx.ExecuteQuery()
                Show-Results -Title $child.Title -Url $child.Url -NoofChildren $children.Count
                
                <# [pscustomobject]@{
                    Title = $child.Title
                    Url = $child.Url
                    NumberOfChildren = $children.Count
                    } | Export-Csv -Path $CSVPath -Append #>


                if($children.Count -gt 0)
                {
                    
                    Get-SPOChildNode -ctx $ctx -nodeChildrenCollection $children                   
                }

                
            }
    $script:separator = $script:separator.Remove(0,3)

}
     

function Show-Results($Title, $Url, $NoofChildren)
{
        Write-host $script:separator -NoNewline
        Write-Host $title "  " -ForegroundColor Green -NoNewline
        Write-Host $url "  " -NoNewline
        Write-Host $noofChildren -ForegroundColor DarkRed

}     


function Get-SPOContext
{
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
  
  #test connection
  try
  {
    $ctx.ExecuteQuery() 
  }
  catch
  {
    Write-Host "Couldn't connect" $_
    $PSCmdlet.ThrowTerminatingError()
  }

  return $ctx
}      
        
        
  
        

  
  
  


  # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="ana@etr56.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$Url="https://etr56.sharepoint.com/sites/sitedesign47"


$script:separator=""
$ctx = Get-SPOContext -Username $Username -AdminPassword $AdminPassword -Url $Url
Get-SPOQuickLaunchNavigationNode -Context $ctx