function Get-SPOFlowSetting{
	param (
		[Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$false,Position=2)]
		[SecureString] $password = (Read-Host -AsSecureString),
		[Parameter(Mandatory=$true,Position=3)]
		[string] $url,
		[Parameter(Mandatory=$false,Position=4)]
		[string] $object=""
	)
 
	  $Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
	  $RestUrl=$url+"/_api/site/"
  
	  if($object -ne ""){
	    $RestUrl+=$object
	  }
  
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
        Write-Output $results.d
}



Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"               

 
#Enter the data
#$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="admin@TENANT.onmicrosoft.com"
$Url="https://TENANT.sharepoint.com"


Get-SPOFlowSetting -Username $username -url $Url

