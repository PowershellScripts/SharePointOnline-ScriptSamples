The script is another variation of [Add a library column with file extension (SharePoint Online).](https://gallery.technet.microsoft.com/Add-a-library-column-with-04796e65)

 

It adds a column with file extensions to a SharePoint Online library:



 

 

The script is not an event receiver, so if you add a new item, it may need to be re-applied.

The script is not optimized. Please rewrite before applying to large or multiple lists.

 

Every time it runs, the script creates a new list field (column) through this line:

```PowerShell
New-SPOListColumn -ListTitle $listTitle -FieldDisplayName $newColumnName -FieldType Text -StaticName "FileNameWithExtension" -Name "FileNameWithExtension" -AddToDefaultView $true -AddToView "" 
```
If you do not want to add another column to your list, comment the line out using #.


The script will not run without editing. Remember to enter the correct data:
```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll" 
 
$pasword = Read-Host -Prompt "Password " -AsSecureString 
$uss="2190@tenant.onmicrosoft.com" 
$listTitle="ext3" 
$listID="1979CC10-3E5D-4D99-9BE6-8BE6229E4E13" 
$newColumnName="Extension" 
 
Connect-SPOCSOM -Username $uss  -AdminPassword $pasword -Url "https://tenant.sharepoint.com/sites/powie3"
``` 
 
<br/><br/>
<b>Enjoy and please share feedback!</b>The script is another variation of [Add a library column with file extension (SharePoint Online).](https://gallery.technet.microsoft.com/Add-a-library-column-with-04796e65)

 

It adds a column with file extensions to a SharePoint Online library:



 

 

The script is not an event receiver, so if you add a new item, it may need to be re-applied.

The script is not optimized. Please rewrite before applying to large or multiple lists.

 

Every time it runs, the script creates a new list field (column) through this line:

```PowerShell
New-SPOListColumn -ListTitle $listTitle -FieldDisplayName $newColumnName -FieldType Text -StaticName "FileNameWithExtension" -Name "FileNameWithExtension" -AddToDefaultView $true -AddToView "" 
```
If you do not want to add another column to your list, comment the line out using #.


The script will not run without editing. Remember to enter the correct data:
```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll" 
 
$pasword = Read-Host -Prompt "Password " -AsSecureString 
$uss="2190@tenant.onmicrosoft.com" 
$listTitle="ext3" 
$listID="1979CC10-3E5D-4D99-9BE6-8BE6229E4E13" 
$newColumnName="Extension" 
 
Connect-SPOCSOM -Username $uss  -AdminPassword $pasword -Url "https://tenant.sharepoint.com/sites/powie3"
``` 
 
<br/><br/>
<b>Enjoy and please share feedback!</b>
