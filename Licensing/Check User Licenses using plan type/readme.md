A script to check user licenses by the plan type.

 

The plan type is the same for multiple subscriptions, e.g.

EXCHANGE_S_STANDARD   available in Office 365 Business and EXCHANGE_S_ENTERPRISE available in Enterprise 3 are of the same type - Exchange.

 

If you have multiple subscriptions in your tenant and would like to check a particular service, e.g. only Exchange_S_Enterprise, use the Check user licenses using Service Name script [here](https://gallery.technet.microsoft.com/Check-user-licenses-using-461b317c).

<hr>

## **How to use?**

1. Make sure you have installed Azure AD module available [here](https://msdn.microsoft.com/en-us/library/azure/jj151815(v=azure.98).aspx)

2. Download the script and open it (in Notepad, ISE, whatever you prefer).

3. In the first lines you see:


```PowerShell
$PlanToCheck="Exchange" 
$CSVPath=""  #E:\technet\UsersWithDisabledEXO.csv Enter only if you want to export to csv 
$ChecksWhetherThePlanIs="Disabled"  #Disabled, Success or PendingActivation 
``` 
 
Plans to choose from. Please enter only one value above  
* ProjectWorkManagement 
* Sway 
* SCO 
* YammerEnterprise 
* RMSOnline 
* MicrosoftOffice 
* MicrosoftCommunicationsOnline 
* Exchange 
 
In $PlanToCheck="Enter the name of the plan you want to check"

In $CSVPath leave as it is if you don't want a csv report, or if you do, enter path in inverted commas like in the example below:
 

```PowerShell
$CSVPath="E:\technet\UsersWithDisabledEXO.csv"
``` 
 
```$ChecksWhetherThePlanIs ``` if set to "Disable" (as it is) will check for all disabled plans. If you want to check successfully provisioned or pending activation, enter "Success" or "PendingActivation". Important!  Disabled are only the services where you assigned the license but not all services are active (e.g. E3 is assigned, but Exchange Online is unmarked). See example below:

Here the license is disabled:

<img src="../Check User Licenses using plan type/Capture14.PNG" width="850">

Here it is NOT:

<img src="../Check User Licenses using plan type/Capture15.PNG" width="850">

4. Save the script and drag&drop it to Powershell. It will ask you for credentials and display a list of users on the screen.


 <br/><br/>
<b>Enjoy and please share feedback!</b>
