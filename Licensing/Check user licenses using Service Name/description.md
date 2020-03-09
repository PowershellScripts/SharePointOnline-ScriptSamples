Powershell script to check user licenses by the service name.

Possible service names:
```
PROJECTWORKMANAGEMENT

SWAY

INTUNE_O365

OFFICE_BUSINESS

YAMMER_ENTERPRISE

MCOSTANDARD

RMS_S_ENTERPRISE

OFFICESUBSCRIPTION

SHAREPOINTSTANDARD

SHAREPOINTWAC

SHAREPOINTENTERPRISE

EXCHANGE_S_STANDARD

EXCHANGE_S_ENTERPRISE
```
 

 

<hr>

## **How to use?**

1. Make sure you have installed Azure AD module available [here](https://msdn.microsoft.com/en-us/library/azure/jj151815(v=azure.98).aspx).

2. Download the script and open it (in Notepad, ISE, whatever you prefer).

3. In the first lines you see:

```PowerShell
<#  Possible serviceNames: 
PROJECTWORKMANAGEMENT 
SWAY 
INTUNE_O365 
OFFICE_BUSINESS 
YAMMER_ENTERPRISE 
EXCHANGE_S_STANDARD 
MCOSTANDARD 
SHAREPOINTSTANDARD 
RMS_S_ENTERPRISE 
OFFICESUBSCRIPTION 
MCOSTANDARD 
SHAREPOINTWAC 
SHAREPOINTENTERPRISE 
EXCHANGE_S_ENTERPRISE 
#> 
 
<#  
If you think a service name is missing from the list above, you can use the following cmdlet on a user with ASSIGNED license to check for the internal servicename  
((Get-Msoluser -UserPrincipalName test2@trial765.onmicrosoft.com).licenses.servicestatus.serviceplan.servicename) 
 
#> 
 
$PlanToCheck="Exchange_S_ENTERPRISE" 
$CSVPath=""      #Enter only if you want to export to csv, e.g. E:\technet\UsersWithDisabledEXO.csv  
$ChecksWhetherThePlanIs="Disabled"  #Disabled, Success or PendingActivation 
``` 
In $PlanToCheck="Enter the name of the plan you want to check"

In $CSVPath leave it as it is if you don't want a csv report, or if you do want a report, enter the path in inverted commas like in the example below:

```PowerShell
$CSVPath="E:\technet\UsersWithDisabledEXO.csv"
 ```
``` $ChecksWhetherThePlanIs ``` if set to "Disable" (as it is) will check for all disabled plans. If you want to check successfully provisioned or pending activation, enter "Success" or "PendingActivation".

Important!  Disabled are only the services where you assigned the license but not all services are active (e.g. E3 is assigned, but Exchange Online is unmarked). See example below:

Here the license is disabled:

<img src="../Check user licenses using Service Name/Capture14.PNG" width="850">

Here it is NOT:

 <img src="../Check user licenses using Service Name/Capture15.PNG" width="850">

4. Save the script and drag&drop it to Powershell. It will ask you for credentials and display a list of users on the screen.

 <br/><br/>
<b>Enjoy and please share feedback!</b>
