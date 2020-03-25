Short Powershell script to send bcc copies to all sharing invitations send from users' OneDrives for Business. The script uses CSOM with December 2015 update.

## How to use?

- Download and open the .ps1 file.
- Add correct SharePoint Online SDK libraries:
 

```PowerShell
#Paths to SDK 
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "C:\Program Files\SharePoint Client Components\16.0\Assemblies\Microsoft.Online.SharePoint.Client.Tenant.dll" 
```
- Enter the correct url, and admin login. Under InvitationsList, enter the email addresses that you want to add in BCC to every sharing invitation in your users' OneDrive for Business. You will be additionally prompted for the password. Do not enter it in the file: 
```PowerShell
 $spoTenant.BccExternalSharingInvitationsList={arleta.wanat@SomeFakeAdresse.com} 
 
 
 
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="admin@TENANT.onmicrosoft.com" 
$Url="https://TENANT-admin.sharepoint.com"
 ```
-  Run the script
 
After the setting takes place, the BCC emails will start receiving copies of the sharing invitations with Invited person's email in the "TO" field and inviter's in "CC":

<img src="../Add BCC to all sharing invitations in OneDrive for Business/Untitled099.png">
