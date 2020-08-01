Powershell module which enables or disables Checkout Requirement for all lists in a given site collection.

It corresponds to the following GUI option:

<img src="../Force your users to checkout documents using Powershell/RequireCheckout.png">

After import you can use Set-Checkout cmdlet with the following parameters:

```powershell
 [string]$Username
```

The string specifies admin of a given site collection where you want to enforce Checkout Requirement or disable the enforcement

```powershell
[string]$Url
```

Specifies the url of a site where you want to enable or disable Checkout Requirement for all lists

```powershell
 [bool]$IncludeSubsites=$false,
```

Specifies whether the cmdlet should also change the Checkout Requirement in the subsites

```powershell
[string]$AdminPassword,
```

Admin' password

```powershell
[bool]$ForceCheckout=$true
```

Specifies whether the documents should be checked out ($true) or disables the Checkout Requirement ($false).

<hr>

## **_Example:_**

**PS C:\Windows\system32**> **Import-Module d:\Powershell\CheckOutModule2.psm1**

PS C:\Windows\system32> Set-Checkout -Username trial@trialtrial123.onmicrosoft.com -Url https://trialtrial123.sharepoint.com/sites/teamsitewithlibraries -IncludeSubsites $true -AdminPassword Password -ForceCheckout $true

It uses the following prerequisites. If those libraries are in different location on your computer, please edit the `.psm1` file!

```PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
```

### Results:

<img src="../Force your users to checkout documents using Powershell/RequireCheckoutResults.png">

<br/><br/>
<b>Enjoy and please share feedback!</b>
