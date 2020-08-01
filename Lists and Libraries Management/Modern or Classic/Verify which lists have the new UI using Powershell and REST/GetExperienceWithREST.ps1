function Get-ExperienceOptions
{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$password,
		[Parameter(Mandatory=$true,Position=3)]
		[string] $url
	)


 
  $Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $RestUrl=$url+"/_api/web/lists"


  
        $request = [System.Net.WebRequest]::Create($RESTUrl) 
        $request.Credentials = $Credentials 
        $request.Headers.Add("X-FORMS_BASED_AUTH_ACCEPTED", "f") 
        $request.Accept = "application/json;odata=verbose" 
        [Microsoft.PowerShell.Commands.WebRequestMethod]$Method = [Microsoft.PowerShell.Commands.WebRequestMethod]::Get
        $request.Method=$Method 
        $response = $request.GetResponse() 
        $requestStream = $response.GetResponseStream() 
        $read = New-Object System.IO.StreamReader $requestStream 
        $data=$read.ReadToEnd() 
        $results = $data | ConvertFrom-Json 
        $listy=$results.d.results 


  foreach($ll in $listy){
    $obj = New-Object PSObject
    $obj | Add-Member NoteProperty "Title" ($ll.Title) -Force
    $obj | Add-Member NoteProperty "Experience" ($ll.ListExperienceOptions) -Force
    Write-Output ($obj)
  }   
}



        
        

 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="t@testova365.onmicrosoft.com"
$Url="https://testova365.sharepoint.com/sites/STS"




Get-ExperienceOptions -Username $username -Url $Url -password $AdminPassword
