switch(listtype) 
            { 
                case 1: 
                    CreateContactList(siteurl, admin, password, itemsno); 
                    break; 
                case 2: 
                    CreateAnnouncementsList(siteurl, admin, password, itemsno); 
                    break; 
                case 3: 
                    CreateTaskList(siteurl, admin, password, itemsno, useusers); 
                    break; 
                case 4: 
                    CreateEventsList(siteurl, admin, password, itemsno); 
                    break; 
                default: 
                    Console.WriteLine("Didn't recognize the list type."); 
                    break; 
            } 
 
            Console.WriteLine("Done!\nPress key to exit."); 
            Console.ReadKey(); 
        } 
 
 
         
 
        public static void CreateTaskList(string site, string credUsername, SecureString password, int itemsno, bool useusers) 
        { 
            string strona = site; 
            var context = new ClientContext(strona); 
            context.Credentials = new SharePointOnlineCredentials(credUsername, password); 
            context.Load(context.Web.Webs, wc => wc.Include(w => w.Url, w => w.Lists)); 
            context.ExecuteQuery(); 
            context.Web.Lists.Add(CreateList("Task List with " + itemsno.ToString() + " elements", 107)); 
            context.ExecuteQuery(); 
            context.Load(context.Web.Webs, wc => wc.Include(w => w.Url, w => w.Lists)); 
            UserCollection usercoll = context.Web.SiteUsers; 
            System.Collections.Generic.List<string> userzy = new System.Collections.Generic.List<string>(); 
            if(useusers) 
            { 
                 
                context.Load(usercoll); 
                context.ExecuteQuery(); 
 
                foreach (User uss in usercoll) 
                { 
                    if (uss.LoginName.Contains("i:0#.f|membership|")) 
                    {                         
                        userzy.Add(uss.LoginName); 
                    } 
                } 
            } 
             
             
            Microsoft.SharePoint.Client.List taski = context.Web.Lists.GetByTitle("Task List with " + itemsno.ToString() + " elements"); 
            context.ExecuteQuery(); 
            
 
            Random rand = new Random(); 
            double loopno = Math.Floor((double)itemsno / 3); 
            for (int i = 0; i < itemsno; i++)
