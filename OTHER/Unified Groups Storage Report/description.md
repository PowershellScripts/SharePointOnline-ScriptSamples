## Short description

The script retrieves all unified groups in your tenant and the storage quotas for their associated site collections.

Whaaat? (explanation for those whose life doesn't evolve around O365 and who not only believe in but have actually seen the life beyond the firewall)

1. The groups that you see in OWA or OneDrive on the left are called UnifiedGroup. They are an awesome combination of a SharePoint site and a group mailbox to ensure the best collaboration between your workers.

2. The groups themselves do not have storage. The mailbox associated with them and the SharePoint site collection do.

3. Even though you do not see characteristic blue logos, what you put under "Files" in your group is actually placed in a site collection that O365 created for the group and that usually can be found under https://TENANT.sharepoint.com/sites/GROUPNAME

4. This site collection cannot be found in SharePoint Online Admin Center, nor while you try Get-SPOSite in Powershell. 

 

## Prerequisites

- SharePoint Online SDK

 

Make sure the script refers to the library paths on your computer:

 

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
 ```
 

## How to use?
1. Download the file.

2. Open in Powershell ISE or even notepad.

3. Verify the SDK paths.

4. Run the script.  It will ask you for admin's login and password.

 

 

##Expected results

<img src="../Unified Groups Storage Report/UnifiedGroups.PNG">

 

 

 

**I am waiting for your comments in the Q&A section!**
