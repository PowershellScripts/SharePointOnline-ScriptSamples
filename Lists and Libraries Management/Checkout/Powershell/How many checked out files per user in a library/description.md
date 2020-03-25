Powershell script shows how many checked out files there are per user in a library. Goes through whole site. Works with libraries larger than 5000 items.  Works for other users (not only the user running the script)

Powershell script using CSOM.  It shows how many checked out files there are per user in a library. It loops through all the libraries in a site collection. It skips lists (BaseTemplate 100). 

 

Key features
Works with libraries larger than 5000 items. 
Works for other users (not only the user running the script - please see sample results) but you need permissions for those files. Please make sure you have appropriate access
Should not work with more than 5000 CHECKED OUT files PER LIBRARY. Haven't tested though - let me know
Loops through all libraries so at the end you will also see how many checked out files there are per site. 
 

 

The idea behind
You may want to remind your users to check in their files. Theoretically you can send a reminder email for each checked out file, but if someone has 1000 checked out files, they are gonna scream at you for spamming their mailbox. You may feel like screaming at them too for checking out so many files, but that's a different story.

SO that's why all the file links are grouped together. You can also see the "most guilty" users in the csv file. Maybe you don't want to remind everyone to check in their files - just those users that checked out half of your repository. This script will show you that.

You can also expand it. You can create a SP list where you keep all this data and use Flow/Workflow functionality to send automatic email reminder to the user on item creation with all the links to his checked out files. Your fantasy is your limit.

 

The output on the console
The magenta entries are lists it currently is looping through.

White parts List  MicroFeed 544  unsupported Exception calling "ExecuteQuery" with "0" argument(s): "Mindestens ein Feld ist nicht richtig installiert. Wechseln Sie zur Listeneinstellungsseite, um diese Felder zu löschen. mean that the list may not support checkout.

Green are paths to checked out files.

The colors are weird because it's 2 am in the morning.



 

Sample results in csv file


 
