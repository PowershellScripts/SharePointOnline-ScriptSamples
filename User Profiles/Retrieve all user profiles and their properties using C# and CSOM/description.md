Console application creates a .csv report with all SharePoint Online user profiles.

The application is designed to create an Excel report on SharePoint user profiles. It loops through all the site collections, and iterates recursively through their subsites to find all subsites and pulls all users associated with those sites and their properties.

That means that users having access to more than one site will appear more than once!

 

The ```.zip``` contains:

```.exe``` file  with a console application. Install to run. Enter global administrator credentials, the the admin Center url, and the report's path.
sample report
 

 

The application is in Beta Testing  - works - won't do harm, but I don't know yet what are the prerequisites or which systems support it :)

The application does NOT change any settings. It merely retrieves the existing ones.

 

The following properties are retrieved:

 

 
```
"SPS-UserPrincipalName","UserProfile_GUID","SID","ADGuid","AccountName","FirstName","SPS-PhoneticFirstName",

  

"LastName",
"SPS-PhoneticLastName",
"PreferredName",
"SPS-PhoneticDisplayName",
"WorkPhone",
"Department",
"Title",
"SPS-JobTitle",
"SPS-Department",
"Manager",
"AboutMe",
"PersonalSpace",
"PictureURL",
"UserName",
"QuickLinks",
"WebSite",
"SPS-DataSource",
"SPS-MemberOf",
"SPS-Dotted-line",
"SPS-Peers",
"SPS-Responsibility",
"SPS-SipAddress",
"SPS-MySiteUpgrade",
"SPS-DontSuggestList",
"SPS-ProxyAddresses",
"SPS-HireDate",
"SPS-DisplayOrder",
"SPS-ClaimID",
"SPS-ClaimProviderID",
"SPS-ClaimProviderType",
"SPS-LastColleagueAdded",
"SPS-OWAUrl",
"SPS-SavedAccountName",
"SPS-SavedSID",
"SPS-ResourceSID",
"SPS-ResourceAccountName",
"SPS-ObjectExists",
"SPS-MasterAccountName",
"SPS-UserPrincipalName",
"SPS-PersonalSiteCapabilities",
"SPS-O15FirstRunExperience",
"SPS-PersonalSiteFirstCreationTime",
"SPS-PersonalSiteLastCreationTime",
"SPS-PersonalSiteNumberOfRetries",
"SPS-PersonalSiteFirstCreationError",
"SPS-LastKeywordAdded",
"SPS-FeedIdentifier",
"SPS-PersonalSiteInstantiationState",
"WorkEmail",
"CellPhone",
"Fax",
"HomePhone",
"Office",
"SPS-Location",
"Assistant",
"SPS-PastProjects",
"SPS-Skills",
"SPS-School",
"SPS-Birthday",
"SPS-StatusNotes",
"SPS-Interests",
"SPS-HashTags",
"SPS-PictureTimestamp",
"SPS-EmailOptin",
"SPS-PicturePlaceholderState",
"SPS-PrivacyPeople",
"SPS-PrivacyActivity",
"SPS-PictureExchangeSyncState",
"SPS-MUILanguages",
"SPS-ContentLanguages",
"SPS-TimeZone",
"SPS-RegionalSettings-FollowWeb",
"SPS-Locale",
"SPS-CalendarType",
"SPS-AltCalendarType",
"SPS-AdjustHijriDays",
"SPS-ShowWeeks",
"SPS-WorkDays",
"SPS-WorkDayStartHour",
"SPS-WorkDayEndHour",
"SPS-Time24",
"SPS-FirstDayOfWeek",
"SPS-FirstWeekOfYear",
"SPS-RegionalSettings-Initialized",
"OfficeGraphEnabled"
```

```C#
static void Main(string[] args) 
        { 
            Console.Title = "Check User Profiles"; 
            Credentials(); 
            items.Append("SiteUrl,"); 
            Console.WriteLine(); 
            Console.WriteLine(@"Where should the report be generated? e.g. C:\Users\Me\Desktop\KillPeopleWhoSaveFilesOnDesktop.csv"); 
            filepath = Console.ReadLine(); 
            foreach (string propertyKey in userProfileProperties) 
            { 
                items.Append(propertyKey); 
                items.Append(","); 
            } 
            items.AppendLine(); 
            IterateThroughAll(); 
            Console.ForegroundColor = ConsoleColor.Green; 
            Console.WriteLine("\n\nDone. Press key to exit."); 
            Console.ReadKey(); 
        }
``` 
It would not exist without Geetanjali's inspiring [article](http://social.technet.microsoft.com/wiki/contents/articles/24627.sharepoint-online-export-user-profile-properties-using-csom.aspx).


<br/><br/>
<b>Enjoy and please share feedback!</b>
