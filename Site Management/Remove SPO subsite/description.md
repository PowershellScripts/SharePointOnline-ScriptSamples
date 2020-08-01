It requires SharePoint Online Management Shell and SharePoint SDK installed:

http://technet.microsoft.com/en-us/library/fp161372(v=office.15).aspx

http://www.microsoft.com/en-us/download/details.aspx?id=30722

 

The script removes a single subsite from a site collection.

A prerequisite for removing a subsite is to remove all its subsites (sub-subsites), so before it deletes the actual subsite, it checks for all sub-subsites in a recurring function and deletes them all. It works on different levels so you can also delete sub-sub-sub-subsite of a sub-sub-subsite.

I find it often works when the subsite "refuses" to be deleted from GUI. How often?

Please let me know in Q and A! For which situation you used it, whether it worked as expected and how I can make it better!