Short script to get the number of items with unique permissions per list. The scripts loops through all the lists in a single web and finds items with unique permissions. The items and their properties also get exported to a csv file.

 

 

 

Before running the script, you need to open the file and enter correct information:

 

```PowerShell
$webUrl="Enter here the url of your site, e.g. https://intra.Company.com" 
$pathToExportReport="c:\MyCSV.csv"
``` 
 

End results:


<img src="../Get items with unique permissions SharePoint Server/Capture211.PNG">
 

The script requires SharePoint Management Shell.
