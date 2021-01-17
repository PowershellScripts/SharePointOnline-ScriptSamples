A short script for SharePoint Online tenants to retrieve all terms from the termstore.

The script iterates through Groups, TermSets and Terms, loading properties of each and displaying them.

Before running the script, open the file and enter your tenant's data:

```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="t@trial456.onmicrosoft.com" 
$Url="https://trial456-admin.sharepoint.com" 
 ```
 

The script requires SharePoint Online SDK. Download and install the libraries and refer them in the script. In the most common scenario all that is required is changing **15\ISAPI** value to **16\ISAPI**:

 

```PowerShell
  #Paths to SDK 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Taxonomy.dll"   
 ```
 
 

Expected results:

<img src="../Pull all groups, termsets, terms from your default SharePoint Online termstore/PullAll2.PNG">
 
