The script is still in testing phase. Please beware of the side effects

 


### Requirements
 
The following script requires [SharePoint Online SDK.](https://www.microsoft.com/en-us/download/details.aspx?id=42038)

 

### How to use?
**1.** Open the following location:

```"c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\"```

If the location exists and you can see

```Microsoft.SharePoint.Client.dll```    and

```Microsoft.SharePoint.Client.Runtime.dll```

Skip the next step and go to Step 3.

 

**2.** If the dlls are not in this location, find them, open the file with the script and correct the following paths to the locations on your computer:

```PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
``` 
 
**3.** Run the script. You will be asked for credentials and the group name during the script execution.

**4.** The script will display all visible groups for the site collection (every personal site)

**5.** For the personal sites where the permission group does not exist you will receive an error:

<img src="../Remove permission groups from personal files/SolutionForPropic.PNG" width="850">

 

 

 

 
