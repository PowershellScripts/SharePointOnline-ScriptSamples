Powershell script that enables versioning for all the libraries and lists in personal sites (OneDrive for Business). 

It requires SharePoint Online Management Shell and SharePoint SDK installed:

http://technet.microsoft.com/en-us/library/fp161372(v=office.15).aspx

http://www.microsoft.com/en-us/download/details.aspx?id=30722

 

For some lists, enabling version may not be possible and you will receive a notification of that.

At the end, a csv file is generated with the lists' urls and the status whether enabling was successful or not.

 

As the script runs you will see green lists' titles for which the enabling succeeded and red for those which failed (not all lists support versioning).



 

 

You need to enter the appropriate data:

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll" 
 
# Insert the credentials and the name of the admin site inthe next 3 lines 
$Username="ana@etr56.onmicrosoft.com" 
Connect-SPOService https://etr56-admin.sharepoint.com -Credential $Username 
$myhost="https://etr56-my.sharepoint.com"
 ```
 The user list is imported from a csv file that should look like this:



 

 

There is another version of this script that enables versioning for ALL users: https://gallery.technet.microsoft.com/office/Enable-versioning-for-all-83548eb6
