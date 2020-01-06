### Acknowledegement

The following script would never exist without Vesa Juvonen, his amazing blog and his kind help.

 

 

### Description

The script updates time zone in regional settings of all personal sites to which you have access. The time zone can be verified by going to Site Settings>Regional Settings.

 

The script requires the following libraries:

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll" 
``` 
 

Enter the correct data and specify the time zone you'd like to set. If unsure about the options, you can verify the time zones using Get all time zones from a site in SharePoint Online script:

 

```PowerShell
# Insert the credentials and the name of the admin site 
$Username="user@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
Connect-SPOService https://tenant-admin.sharepoint.com -Credential $Username 
$myhost="https://tenant-my.sharepoint.com" 
$users=get-SPOUser -Site $myhost 
$TimeZoneID=63
``` 
 

If you are not currently an Administrator of the user's personal site, you can gain access using:
```PowerShell
    Set-SPOUser -Site $urelek -LoginName $username -IsSiteCollectionAdmin $true
```
 

In order to use the cmdlet, you can either modify the.ps1 file or write a separate script.

 

```PowerShell
if($user.LoginName.Contains('@')) 
  { 
    $persweb=$user.LoginName.Replace(".","_").Replace("@","_") 
    $persweb=$myhost+"/personal/"+$persweb 
    Write-Host $persweb 
Set-SPOUser -Site $persweb -LoginName $username -IsSiteCollectionAdmin $true 
    $AdminUrl=$persweb 
 
 
   Set-SPoUserRegionalSetings -Username $Username -AdminPassword $AdminPassword -Url $AdminUrl -TimeZoneID $TimeZoneID 
  }
 ```
 
