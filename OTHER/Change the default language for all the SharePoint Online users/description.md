An awesome, amazing, long-awaited console application for changing default language.

 <br/><br/>

Have you ever created your tenant in the wrong language? Need to change it for the users?

You know that the steps are:

**Newsfeed** > **About me** > **Edit my profile** > **... (three dots)** > **Language and region>Add the display language**

**OneDrive** > **Gear icon** > **Site settings** > **Language settings** > **Mark alternate language**

  <br/><br/>

It's cool and awesome and flexible. But what if you have a thousand users? Are you going to perform those steps for all of them? There is no out-of-the-box solution. Neither via User Interface or Powershell.

  <br/><br/>

Here it is:

<img src="../Change the default language for all the SharePoint Online users/changedeflg.PNG">

The red errors for system accounts are by design. I am expecting to get it better in the next version. The green users indicate for which users the language has been changed and into what.

At the end the report will contain all users who did not get their language changed.

[List of language ids](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-lcid/a9eac961-e77d-41a6-90a5-ce1a8b0cdb9c?redirectedfrom=MSDN)

 
 <br/><br/>
 

## *Instructions*

1. Download the .zip file

2. Extract the file.

3. Run setup.exe

4. You can run the app from setup or ugly desktop icon.

5. If you want to uninstall the app go to Control Panel>Programs and Features>Choose the app>Uninstall

 

  <br/><br/>

Acknowledgements:

The app is using the [new updates and nuggets.](https://docs.microsoft.com/pl-pl/archive/blogs/)

The app is prone to the [known bug](https://docs.microsoft.com/pl-pl/archive/blogs/), which means it will not add desired alternate language for personal site unless there is one (any) added there already. 

**Update on 20th of Dec  - Adding additional language to web has unfortunately a bug and it does not work unless site has already one or more additional languages set, which means that this API does not really usable until this bug is fixed. This will be fixed for future releases and to redistributable version of the CSOM package.**

 

The app is in BetaTesting. It works across several systems and tenant and we did not encounter any issues. If - however - you experience any problem, please let me know in the Q&A section.

I am looking forward to it!
