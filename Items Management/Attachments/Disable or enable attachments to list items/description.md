Want to keep your lists tidy? Saving space?? This is a solution for you! Looking for a quick way to restore the option for all lists? This is also a solution for you! :)


Want to keep your lists tidy? Saving space? Do you want to prevent users from adding unnecessary attachments to the list because their place belongs elsewhere?
This is a solution for you!
Or maybe you already disabled the feature? For some of the lists - for some not, and now you are looking for a quick way to restore the option for all lists?
This is also a solution for you! :)

 

 
 
 
 
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and the desired setting: $true or $false 
$Username="trial@trialtrial123.onmicrosoft.com" 
$AdminPassword="Pass" 
$Url="https://trialtrial123.sharepoint.com/sites/teamsitewithlists" 
$Attachments=$false 
 
 
 
 
Set-SPOListsAttachments -Username $Username -AdminPassword $AdminPassword -Url $Url -Attachments $Attachments
 
 

For full description please refer here to the Wiki Article

 

 

Related scripts
Set direction of the reading order for a single list

Set-SPOList properties (module)

Allow or disallow your users to create folders in SPO lists
