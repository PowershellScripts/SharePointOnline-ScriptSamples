## Acknowledegement
The script uses [Vadim Gremyachev's](https://sharepoint.stackexchange.com/users/10610/vadim-gremyachev) Invoke-LoadMethod published [here](https://sharepoint.stackexchange.com/questions/126221/spo-retrieve-hasuniqueroleassignements-property-using-powershell)

 

 

## Description
The script updates locale id in regional settings of all personal sites to which you have access. The locale id can later be verified by going to Site Settings>Regional Settings.

 

The script requires the following libraries:

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll" 
``` 
 

 

 

Enter the correct data and specify the locale id you'd like to set:

 

```PowerShell
# Insert the credentials and the name of the admin site 
$Username="admin@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
Connect-SPOService https://tenant-admin.sharepoint.com -Credential $Username 
$myhost="https://tenant-my.sharepoint.com" 
$LocaleID=1033
``` 
 

 

 

If you are not currently an Administrator of the user's personal site, you can gain access using:

```PowerShell
Set-SPOUser -Site $urelek -LoginName $username -IsSiteCollectionAdmin $true
``` 
 

In order to use the cmdlet, you can either modify the ```.ps1``` file or write a separate script.

 

 
