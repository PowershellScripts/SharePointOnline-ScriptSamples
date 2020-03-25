### *What does it do?*

The program has 2 basic functions: creation and destruction. 

**Godly Creation:**

<blockqoute>
  - it creates the following site collections, all named after the templates they have been created from:
</blockqoute> 

- TeamsiteWithLibraries
- TeamsiteWithLists
- Empty Teamsite
- "WikiSite"
- "BlogSite"
- "CommunitySite"
- "PublishingPortal"

<blockqoute>
- it creates 2 subsites : subsite1 and subsite2 to the TeamsiteWithLibraries
</blockqoute>
</br>
<blockqoute>
- it creates  2 document libraries, 2 picture libraries, Wiki Page library, XML Form library and Data Connection library to the TeamsiteWithLibraries
</blockqoute>
</br>
<blockqoute>
- it creates 3 Custom lists in the TeamsiteWithLists: one empty, one with sample data, one with over 5000 items
</blockqoute>
</br>
<blockqoute>
- it creates a default view limited to 70 items for 5000 items list. You can switch between the views using GUI
</blockqoute>
</br>
<blockqoute>
- it creates Links list, Anouncements list, Contacts list, Events list, Tasks list  to the TeamsiteWithLists
</blockqoute>
</br>
<blockqoute>
- it populates Custom, Anouncements list, Contacts list, Events list, and Tasks list with sample data (ca. 50 items - if you need more please look https://gallery.technet.microsoft.com/scriptcenter/Create-various-lists-with-0e714f70 </br>and </br> https://gallery.technet.microsoft.com/scriptcenter/Create-a-list-with-3f19ba11 )
</blockqoute>
</br>
<blockqoute>
- it adds all the available lists and libraries to the Quick Launch Menu. Also added are the lists that were previously accessible only via direct links, like Workflow History.
</blockqoute>
</br>
Watch out!  The process of creating 5000 items in a list takes time. You will be informed on the progress as the application runs. 

### Total Destruction:
<blockqoute>
- it retrieves all your site collections and deletes them, apart from the search, mysite (which cannot be recreated in SharePoint Online) and rootsite
</blockqoute>
</br>
<blockqoute>
- it checks the recycle bin for the deleted sites and removes them from the recycle bin 
</blockqoute>
</br>

Watch out! Deleting a site collection takes a while and depends on SharePoint Online backend processes. The application waits for the site collections to be deleted and informs you about its attempts with status updates "Trying to delete site XYZ". However, after 6 unsuccessful attempts it may mean that SharePoint is not going to be very cooperative at the moment and the application will ask you whether it should close or keep trying.

### Only Recycle Bin:
<blockqoute>
- as the name suggests, permanently removes the content of the recycle bin
<blockqoute>
</br>
<blockqoute>
- cannot be reversed 
</blockqoute>
</br>
<blockqoute>
- can be used instead of Powershell Get-SpoDeletedSite | Remove-SpoDeletedSite
</blockqoute>

### Only Created
<blockqoute>
- removes only the site collections created by the program 
</blockqoute>

- TeamsiteWithLibraries
- TeamsiteWithLists
- Empty Teamsite
- "WikiSite"
- "BlogSite"
- "CommunitySite"
- "PublishingPortal"

Watch out! If you added some of your own data to those site collections (other libraries, site mailbox or items) it will also be deleted!

### *What doesn't it do?*
<blockqoute>
-Despite the name Non-Empty libraries are still empty
</blockqoute>
</br>
<blockqoute>
-The list with Geolocation column doesn't contain Geolocation column
</blockqoute>
</br>
<blockqoute>
-It doesn't verify your credentials. Change the examples in the fields into your own credentials, following the same pattern (don't put in a teamsite domain.sharepoint.com where it asks you to type admin site url preceded by https://). If you make a mistake, you will get an error at an early stage of the application.
</blockqoute>
</br>
<blockqoute>
- It's not perfect. I have made it as failsafe as the time allowed with a lot of try and catches and bugs handled. However, if it still stops at some point, just run it again. The program will detect the work already done and simply continue. 
</blockqoute>

### *How do I use it?*

The zip file contains an .exe which installs the program. You can open it like any other program from Start Menu or a Desktop shortcut. Type in your user credentials in the three available fields following the given example.

After that, choose one of the buttons to create or delete data in your tenant. You can perform multiple operations during one run, so if you find it to your liking, you can alternate between creating and destroying content just to test SharePoint Online's behaviour.

When you have finished working with the program, a **log will be created at C:\Users\Public\**  where you can analyze what has been done. 

If you need to uninstall the program you can find it in Control Panel>Programs and Features.

### *Technicalities*

The program relies on static classes.

It works on very few threads, which may be the reason for its slowness. One of them is responsible for creating 5000 items list. I didn't create a threadpool for fear of overloading SPO, maybe unjustly. 

During its full run, the Godly Creation queries SharePoint Online ca 1500 times!

CheckForIllegalCrossThreadCalls is set to false, which may generate some random errors in a given environment. 

Updating the status window may slow down or even temporarily hang the execution. Just let it run its course and it should fix itself. This part also forced me to set CheckForIllegalCrossThreadCalls = false; so if anyone knows how to fix it, please post a comment. That part of the code is available in the snippet. 

