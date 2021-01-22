The script loads a single view from a list and displays all of its properties as in the screenshot below.


<br/>


### Requirements
 

The following script requires:

SharePoint Online SDK

 <br/>

 

### How to use?
1. Open the following location:

"c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\"

If the location exists and you can see

Microsoft.SharePoint.Client.dll    and

Microsoft.SharePoint.Client.Runtime.dll

Skip the next step and go to Step 3.

 

2. If the dlls are not in this location, find them, open the file with the script and correct the following paths to the locations on your computer:

 

```PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 ```
 
3. Edit the file to add the necessary parameters:

 

```PowerShell
# Insert the credentials and the name of the admin site 
$Username = "ana@etr56.onmicrosoft.com" 
$AdminUrl = "https://etr56.sharepoint.com/sites/testflow" 
$ListTitle = "Customers" 
$ViewGUID = "47FA121F-B26F-4CCD-B785-70DF105597F7"
``` 
