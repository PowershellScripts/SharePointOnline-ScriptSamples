function Get-AllTerms
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
	[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		$password
		)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()

  $session = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)
        $ctx.Load($session)
        $ctx.ExecuteQuery()

         $termstore = $session.GetDefaultSiteCollectionTermStore();
         $ctx.Load($termstore)
         $ctx.Load($termstore.Groups)
         $ctx.ExecuteQuery()

  Write-Host "Termstore" -ForegroundColor Green
  Write-Output $termstore



  foreach ($gruppo in $termstore.Groups)
  {
    $ctx.Load($gruppo)
    $ctx.Load($gruppo.TermSets)
    $ctx.ExecuteQuery()
    
    Write-Host "--------------- Group --------------------" -ForegroundColor Yellow
    Write-Output $gruppo 


              foreach($termset in $gruppo.Termsets)
              {
                $ctx.Load($termset)
                $ctx.Load($termset.Terms)
                $ctx.ExecuteQuery()

                Write-Host "--------------- Term Set --------------------" -ForegroundColor Magenta
                Write-Output $termset


                             foreach($term in $termset.Terms)
                             {
                               $ctx.Load($term)
                               $ctx.Load($term.Labels)
                               $ctx.Load($term.Terms)
                               $ctx.Load($term.TermSets)
                               $ctx.Load($term.ReusedTerms)
                               $ctx.ExecuteQuery()

                               Write-Host "--------------- Term --------------------" -ForegroundColor Blue
                               Write-Output $term
                             }

              }
  }





  }

  #Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Taxonomy.dll"  
 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="t@trial456.onmicrosoft.com"
$Url="https://trial456-admin.sharepoint.com"


Get-AllTerms -Username $Username -Url $Url -password $AdminPassword
