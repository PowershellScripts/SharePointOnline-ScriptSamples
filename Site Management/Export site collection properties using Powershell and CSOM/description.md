Short Powershell script to export properties of all site collections.

Sample properties include AllowSelfServiceUpgrade, FalseAverageResourceUsage, CompatibilityLevel, CurrentResourceUsage, DenyAddAndCustomizePages, DisableAppViews, DisableCompanyWideSharingLinks, DisableFlows, PWAEnabled, SandboxedCodeActivationCapability, SharingAllowedDomainList, ShowPeoplePickerSuggestionsForGuestUsers, SiteDefinedSharingCapability

Expected results:

<img src="../Export site collection properties using Powershell and CSOM/Capture405.PNG">

### How to use?

- Download and open the ```.ps1``` file.
- Add correct libraries:
 

```PowerShell
#Paths to SDK 
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.Online.SharePoint.Client.Tenant.dll"   
``` 
- Enter the correct url and admin login: 
 

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="admin@TENANT.onmicrosoft.com" 
$Url="https://TENANT-admin.sharepoint.com"
``` 
-  Run the script
