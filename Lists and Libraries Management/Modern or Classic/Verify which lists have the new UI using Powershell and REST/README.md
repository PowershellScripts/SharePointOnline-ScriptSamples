Short Powershell that checks which SharePoint Online list has what experience setting.

 

Old UI (ClassicExperience):

<img src="../Verify which lists have the new UI using Powershell and REST/images/Capture471.PNG">

Modern UI (NewExperience):

<img src="../Verify which lists have the new UI using Powershell and REST/images/Capture472.PNG">

In order to run the script, download, open the file and edit the 2 lines below:

 

```PowerShell
$username="t@testova365.onmicrosoft.com" 
$Url="https://testova365.sharepoint.com/sites/STS"
```
The script loops through ALL existing lists on the site (including default and hidden lists). 


Expected results:

<img src="../Verify which lists have the new UI using Powershell and REST/images/Capture473.PNG">

 1 - NewExperience

2 - Classic Experience

0 - Auto

 

You can also export the results to a .csv file:

 

```PowerShell
E:\technet\ListExperiences\GetExperienceWithREST.ps1  | export-csv c:\ListExperiences.csv
 ```
