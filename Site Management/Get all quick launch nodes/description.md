Powershell script retrieves all quick launch nodes and their children. Uses CSOM and SharePoint Online SDK. The current SharePoint Online quick launch has a limit of 3 levels, but it would work with more.  It should work with SharePoint Server 2013/2016/2019 if you adjust authentication.

 

You can also export the nodes to a csv file if you uncomment the following part:

 

PowerShell
       <# [pscustomobject]@{ 
            Title = $node.Title 
            Url = $node.Url 
            NumberOfChildren = $node.Children.Count 
            } | Export-Csv -Path $CSVPath -Append #>
 
 

Sample results:
 



 

 

In order to run the script, enter your data. DO NOT enter your password!

 

PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="ana@etr56.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$Url="https://etr56.sharepoint.com/sites/sitedesign47" 
 
 
 

 
