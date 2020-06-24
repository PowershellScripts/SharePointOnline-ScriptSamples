Short Powershell script to export user licenses and services' provisioning status.

## How to use?

1. Download and run the script.

2. During execution it will ask you for Office 365 Admin credentials

3. If you want to create a report on the users (apart from seeing the info on the screen also export data to a csv), there is a built-in function in the script, and you just need to update the following line:

 

```PowerShell
$CSVPath="C:\Users\Arletka\Documents\usss34.csv" 
```
## Expected results
 
During script execution:

<img src="../Get user licenses and services provisioning statuses/Capture73.PNG">

In a csv file:

<img src="../Get user licenses and services provisioning statuses/Capture72.PNG"> 
