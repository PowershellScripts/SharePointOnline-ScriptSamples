Short Powershell that sets a single SharePoint Online list to a chosen look: ClassicExperience (old UI), NewExperience (modern look) or Auto Setting.

 

Old UI (ClassicExperience):

<img src="../Set all lists to New or Classic Experience/Capture465.PNG">

Modern UI (NewExperience):

<img src="../Set all lists to New or Classic Experience/Capture466.PNG">
 

 

In order to run the script, download, open the file and edit the 2 lines below:

 

PowerShell
$username="t@testova365.onmicrosoft.com" 
$Url="https://testova365.sharepoint.com/sites/STS"
 
 

Choose the experience you want to set for your lists:
NewExperience - modern UI
ClassicExperience - old UI
Auto
PowerShell
Set-ExperienceOptions -Username $username -Url $Url -password $AdminPassword -ExperienceOption  NewExperience
 
 

 

The script and several of its variations are also available on GitHub: https://github.com/PowershellScripts/SharePoint-Online-Modern-or-Classic-Experience

 

Don't hesitate to report issues or request new features/scenarios!
