A short console application that disables minor and major versioning for all the libraries and lists in the whole SharePoint Online tenant.

 

It uses recurrence to find all sites in all site collections and then goes through all the lists.

At the end, the application generates a report, which enumerates all the lists for which versioning has been disabled. The report can be viewed in Excel. 

The code includes basic error handling and credential verification.
