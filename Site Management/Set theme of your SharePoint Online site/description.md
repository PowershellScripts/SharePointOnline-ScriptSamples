Powershell script to set theme for your site.

The script chooses one of the default font and color palettes available from Designer Gallery:

<img src="../Set theme of your SharePoint Online site/Capture.PNG">

The font and colors are applied to existing site. The current settings (they can be modified) change the look of the page into:

<img src="../Set theme of your SharePoint Online site/Capture2-1.PNG">

**1.** Install SharePoint Online SDK.

**2.** Open the script (e.g. in Notepad) and enter your data in the following lines:

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$AdminUrl="https://tenant.sharepoint.com/sites/powie1" 
 ```
 
a) Find paths to SDK libraries SharePoint.Client.Runtime.dll and SharePoint.Client.dll on your local computer and replace the ones in the file (they may be very similar or exactly the same!)

b) Insert the username and the url of the site where you want to change the theme. You will be prmopted for the password during the script execution so do not enter it here.

**3.** Run the script in any Powershell Module.

**4.** Verify the results on the site.

#### If you have any questions, do not hesitate to post them in the Q&A section!
