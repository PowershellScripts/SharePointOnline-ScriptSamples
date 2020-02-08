Short Powershell that checks which SharePoint Online list has what experience setting.

 

Old UI (ClassicExperience):



Modern UI (NewExperience):



 

 

 

In order to run the script, download, open the file and edit the 2 lines below:

 

PowerShell
$username="t@testova365.onmicrosoft.com" 
$Url="https://testova365.sharepoint.com/sites/STS"
The script loops through ALL existing lists on the site (including default and hidden lists). 
 

Expected results:



 

 1 - NewExperience

2 - Classic Experience

0 - Auto

 

You can also export the results to a .csv file:

 

PowerShell
E:\technet\ListExperiences\GetExperienceWithREST.ps1  | export-csv c:\ListExperiences.csv
 
