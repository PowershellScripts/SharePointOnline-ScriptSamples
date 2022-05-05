function Get-SPOObject
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
        [Parameter(Mandatory=$true,Position=2)]
		[SecureString] $password = (Read-Host -AsSecureString),
        [Parameter(Mandatory=$true,Position=3)]
		[string] $url,
        [Parameter(Mandatory=$false,Position=4)]
        	[string] $object=""
		)

	  $Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
	  $RestUrl=$url+"/_api/"
	   
	  if($object -ne "")
	  {
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
	
 # Because the string contains duplicate 'ID' keys.
        $results = $data.ToString().Replace("ID", "_ID") | ConvertFrom-Json 
        $objekty=$results.d.results 

        if($objekty -ne $null)
        {
            Write-Output $objekty
        }
        else
        {
            Write-Output $results.d

        }
        
  }



Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"               

 
#Enter the data
#$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
#$username="t@t321.onmicrosoft.com"
#$Url="https://t321.sharepoint.com/standard"


Export-ModuleMember "Get-SPOObject"

