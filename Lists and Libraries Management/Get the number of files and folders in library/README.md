Powershell script for getting the number of items, folders and files in a given SharePoint Online library.

 

The script requires SharePoint Online SDK.

 

In order to use it, download, open and edit the file:

 

```PowerShell
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"   
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"   
  
 
 
 $Username="test@tenant.onmicrosoft.com" 
 $Url = "https://tenant.sharepoint.com/sites/test" 
 $ListTitle = "noci" 
 $Password = Read-Host -Prompt "Enter password" -AsSecureString
``` 
 

If you want to see a division between files and folders, uncomment the following part of the code:

 

```PowerShell
   
<# Uncomment if you want to see the split between files and folders   
   
  $NoOfFiles=0 
  $NoOfFolders=0 
 
  foreach($item in $listItems) 
  { 
    if($item.FileSystemObjectType -eq "File") 
    { 
        $NoOfFiles++; 
    } 
    if($item.FileSystemObjectType -eq "Folder") 
    { 
        $NoOfFolders++; 
    } 
  } 
   
  Write-Host "Total number of items: " $list.ItemCount 
  Write-Host "Number of files:" $NoOfFiles 
  Write-Host "Number of folders:" $NoOfFolders  
        
  #>
``` 
Expected results will display the total number of items, number of files, and number of folders:

 <img src="../Get the number of files and folders in library/Capture30.PNG">
