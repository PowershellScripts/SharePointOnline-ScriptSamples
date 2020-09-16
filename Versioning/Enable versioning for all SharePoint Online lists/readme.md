A short script that enables versioning for all the libraries and lists in the whole tenant.

It requires SharePoint Online Management Shell and SharePoint SDK installed:

http://technet.microsoft.com/en-us/library/fp161372(v=office.15).aspx

http://www.microsoft.com/en-us/download/details.aspx?id=30722

 

It uses recurrence to find all sites in all site collections and then goes through all the lists.
For some lists, enabling version may not be possible and you will receive a notification of that.

At the end, a csv file is generated with the lists' urls and the status whether enabling was successful or not.

 

As the script runs you will see green lists' titles for which the enabling succeeded and red for those which failed (not all lists support versioning).


 <img src="../Enable versioning for all SharePoint Online lists/versioningPS2.png" width="850">

 <img src="../Enable versioning for all SharePoint Online lists/versioningPS.png" width="850">

<img src="../Enable versioning for all SharePoint Online lists/versioningPS3.png" width="850">

You can customize the script by using the commented out tips.

 <br/><br/>
<b>Enjoy and please share feedback!</b>
