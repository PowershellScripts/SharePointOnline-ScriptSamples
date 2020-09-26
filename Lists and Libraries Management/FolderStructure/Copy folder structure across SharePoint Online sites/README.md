A script to copy folder structure from a library in one site collection/subsite to a library in a different site collection/subsite.

 

### *How to use?*

1. Download the script and open the file (you can use Powershell ISE or e.g. NotePad).

2. Edit the following lines, entering your values (# means comment, changing these lines won't bring any effect):

 

```PowerShell
# Enter the username of a user who has enough permissions to run the operation for both site collections 
$admin="t@trial890.onmicrosoft.com" 
 
# Where you want to copy the folder structure FROM  
$Sourcesite="https://trial890.sharepoint.com/sites/TeamsitewithLibraries" 
$sourceLibrary="tescik2" 
 
# Where you want to copy the folder structure TO 
$destinationSite="https://trial890.sharepoint.com/sites/teamsitewithlists" 
$destLibr="docLib3"
```
$admin - user </br> 
$Sourcesite  - url of the site where the source library is; it's the url of the site where you want to copy FROM </br>
$destinationSite - url of the site where the target library is; it's the url of the site where you want to copy TO </br>
 
</br></br>

$sourceLibrary - title of the original library where you want to copy the structure FROM </br>
$destLibr - title of the destination library where you want to copy the structure TO </br>

For all the data please stick to the formats as in the example.
 
3. Save and run the script. During execution it will ask you for a password and later on display relative urls of all the newly created folders. 

<img src="../Copy folder structure across SharePoint Online sites/CopyListFolderStruAcross.PNG">

<hr>

## Technicalities

The scripts works with libraries, not lists.

I tested it with several scenarios and it worked. However, testing went only as far as my imagination and limited time resources would go, so if you encounter a scenario where the script does not work or throws errors, please let me know in the Q&A section, and I will fix it.

<hr>

## Error handling

Upper/lower case shouldn't cause any issues. That means whether you enter "DocLibrary" or "docliBRARY" they should be treated the same. If you notice otherwise, please report.

Folders keep their casing. That means that "Big InvestMent" will remain "Big InvestMent" in the new library.



<br/><br/>
<b>Enjoy and please share feedback!</b>
