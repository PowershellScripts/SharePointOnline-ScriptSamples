Powershell script to get web parts and all their details from all pages. The script exports the results to a csv file.

 

The script requires the following libraries from [SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038). Please confirm that the files are in the same location on your PC.

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.Runtime.dll" 
``` 
You need to enter your credentials and specify search whether it should be recursive:

```PowerShell
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="t@trial567.onmicrosoft.com" 
$Url="https://trial567.sharepoint.com/sites/powie64" 
 
 
Get-SPOWebParts -Username $username -Url $Url -password $AdminPassword -Recursive $true
``` 
 

The script displays the webparts in the console window and exports them to a csv file.

**Expected results:**

<img src="../Report on all web parts in all site pages/ReportAll.PNG">

<img src="../Report on all web parts in all site pages/ReportAll2.PNG">
