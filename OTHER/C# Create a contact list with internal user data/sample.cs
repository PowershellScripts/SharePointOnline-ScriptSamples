static void PopulateProperties() { 
            ClientContext ctx = new ClientContext(adminsite); 
            ctx.Credentials = new SharePointOnlineCredentials(userName, ss); 
 
            PeopleManager peopleManager = new PeopleManager(ctx); 
            string[] userProfileProperties = { "LastName", "FirstName", "WorkEmail", "WorkPhone","CellPhone", "AboutMe"  }; 
             
            propertiesforList=new string [userzy.Count, userProfileProperties.Length];            
            for (int i = 0; i < userzy.Count;i++ ) { 
                try{ 
                    Console.WriteLine("Retrieving properties for " + userzy[i].LoginName); 
                    UserProfilePropertiesForUser userProfilePropertiesForUser = new UserProfilePropertiesForUser(ctx, userzy[i].LoginName, userProfileProperties); 
                    IEnumerable<string> profileProperties = peopleManager.GetUserProfilePropertiesFor(userProfilePropertiesForUser); 
                    ctx.Load(userProfilePropertiesForUser); 
                    ctx.ExecuteQuery(); 
                    int j = 0; 
                    
                    foreach (string property in profileProperties) { 
                        propertiesforList[i, j] = property;                        
                        j++; 
                    } 
                     
                } 
                catch (Exception ex) { 
                } 
            } 
           
        ctx.Dispose();           
} 
 
static void CreateList() { 
            ClientContext ctx = new ClientContext(webUri); 
            ctx.Credentials = new SharePointOnlineCredentials(userName,ss); 
            ctx.ExecuteQuery(); 
            ctx.Load(ctx.Web.Lists); 
            ctx.ExecuteQuery(); 
            ListCreationInformation lci = new ListCreationInformation(); 
            lci.Title = "Internal Contacts"; 
            lci.Url = "InternalContacts"; 
            lci.TemplateType = 105; 
            ctx.Web.Lists.Add(lci); 
            ctx.ExecuteQuery();
