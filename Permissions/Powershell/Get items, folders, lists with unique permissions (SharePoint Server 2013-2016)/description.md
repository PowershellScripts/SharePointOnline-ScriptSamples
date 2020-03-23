Short script to get the number of items and folders with unique permissions per list. The scripts loops through all the lists in a single web and displays whether the list has unique permissions, the number of folders with unique permissions and the number of items with unique permissions. The items, folders, and their properties also get exported to a csv file.

 

 

 

Before running the script, you need to open the file and enter correct information:

```PowerShell
$webUrl="Enter here the url of your site, e.g. https://intra.Company.com"  
$pathToExportReport="c:\MyCSV.csv"
```


End result:
 
 <img src="../Get items, folders, lists with unique permissions (SharePoint Server 2013-2016)/Capture209.PNG">

The script requires SharePoint Management Shell.
