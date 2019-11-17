function Get-Workflows
{
param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$CSVPath
)

  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
  $ctx.ExecuteQuery() 

$Lists=$ctx.Web.Lists
 $ctx.Load($ctx.Web)
$ctx.Load($Lists)
$ctx.ExecuteQuery()

foreach ( $ll in $Lists)
            {

                
                $workflo = $ll.WorkflowAssociations;
                $ctx.Load($workflo);
                try
                {
                    $ctx.ExecuteQuery();
                    Write-host $ll.Title $workflo.Count -ForegroundColor Green 
                    
                }
                catch [Net.WebException] 
                {
                   Write-Host "Failed for " $ll.Title -ForegroundColor Red
                }


                    foreach ($workfloek in $workflo)
                    {
                        $workfloek | Add-Member NoteProperty "SiteUrl"($ctx.Web.Url)
                        $workfloek | Add-Member NoteProperty "ListTitle"($ll.Title)
                        Write-Output $workfloek

                     $workfloek | export-csv -Path $CSVPath -Append
                     
                    }
                

}



}




# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the site and the path where the report should be saved.
$Username="2190@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$Url="https://tenant.sharepoint.com"
$CSVpath="C:\testpath2.csv"

Get-Workflows -Username $Username -AdminPassword $AdminPassword -Url $Url -CSVPath $CSVpath

