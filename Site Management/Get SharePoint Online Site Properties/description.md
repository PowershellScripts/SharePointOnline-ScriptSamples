The script retrieves all properties for a Web.

 <img src="../Get SharePoint Online Site Properties/GetSiteProperties.PNG">

## *Requirements*

The following script requires:

[SharePoint Online SDK](https://www.microsoft.com/en-us/download/details.aspx?id=42038)

## *How to use?*

**1.** Open the following location:

```"c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\"```

If the location exists and you can see

Microsoft.SharePoint.Client.dll    and

Microsoft.SharePoint.Client.Runtime.dll

Skip the next step and go to Step 3.

**2.** If the dlls are not in this location, find them, open the file with the script and correct the following paths to the locations on your computer:

```PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 ```
 
**3.** Enter the credentials. You will be asked for password during the script's execution: 

```PowerShell
$Username="t@trial345.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$SiteUrl="https://trial345.sharepoint.com/sites/teamsitewithlibraries"
```

**4.** Open Powershell as Administrator. Run the script. If execution of the scripts is forbidden, you can use the cmdlet:
      
```PowerShell
Set-ExecutionPolicy remotesigned
```

**5.** The results will display in a 2-column table as in the screenshot above.

The script works for one site collection only. If you want to get properties of more sites, please check other Technet Gallery scripts. 
