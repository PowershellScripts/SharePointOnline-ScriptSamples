Short Powershell that sets all lists to a chosen look: ClassicExperience (old UI), NewExperience (modern look) or Auto Setting.

 

Old UI (ClassicExperience):



Modern UI (NewExperience):



 

 

 

In order to run the script, download, open the file and edit the 2 lines below:

```PowerShell
$username="t@testova365.onmicrosoft.com" 
$Url="https://testova365.sharepoint.com/sites/STS"
``` 
Choose the experience you want to set for your lists:
NewExperience - modern UI
ClassicExperience - old UI
Auto
PowerShell
Set-ExperienceOptions -Username $username -Url $Url -password $AdminPassword -ExperienceOption  NewExperience
 
The script loops through ALL existing lists on the site and updates ALL of them (including default and hidden lists). 
 
