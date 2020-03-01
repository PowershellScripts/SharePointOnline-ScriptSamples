static void Uniki(string urelek) { 
            ClientContext ctx = new ClientContext(urelek); 
            ctx.Credentials = new SharePointOnlineCredentials(userName, ss); 
            ctx.ExecuteQuery(); 
            ctx.Load(ctx.Web, w => w.HasUniqueRoleAssignments, w => w.Url); 
            ctx.Load(ctx.Web.Lists); 
            ctx.Load(ctx.Web.Lists, wc => wc.Include(w => w.HasUniqueRoleAssignments, w => w.DefaultViewUrl)); 
            ctx.ExecuteQuery(); 
            Console.WriteLine("\n\n"); 
            Console.BackgroundColor = ConsoleColor.White; 
            Console.ForegroundColor = ConsoleColor.Green; 
            Console.WriteLine(urelek); 
            Console.BackgroundColor = ConsoleColor.Black; 
            
        if (!ctx.Web.HasUniqueRoleAssignments) { 
                Console.ForegroundColor = ConsoleColor.Red; 
                Console.WriteLine(ctx.Web.Url); 
 
                ctx.Web.BreakRoleInheritance(true,false); 
                
                try { 
                    ctx.ExecuteQuery(); 
                    unique += ctx.Web.Url + "\n"; 
                } 
                catch (Exception e) { 
                    Console.WriteLine(e.Message); 
                } 
                Console.ForegroundColor = ConsoleColor.White; 
        } 
            
        for (int i = 0; i < ctx.Web.Lists.Count; i++) { 
                if (!ctx.Web.Lists[i].HasUniqueRoleAssignments) { 
                    Console.ForegroundColor = ConsoleColor.Red; 
                    Console.WriteLine(ctx.Web.Lists[i].DefaultViewUrl); 
 
                    ctx.Web.Lists[i].BreakRoleInheritance(true,false); 
                    try { 
                        ctx.ExecuteQuery(); 
                        unique += ctx.Web.Lists[i].DefaultViewUrl + "\n\n"; 
                    } 
                    catch (Exception e) { 
                        Console.WriteLine(e.Message); 
                    } 
                    Console.ForegroundColor = ConsoleColor.White; 
                } 
 
                CamlQuery caml = new CamlQuery(); 
                caml.ViewXml = @"<View Scope='RecursiveAll' />"; 
                ListItemCollection spListItems = null; 
                spListItems = ctx.Web.Lists[i].GetItems(caml); 
                ctx.Load<ListItemCollection>(spListItems, wc => wc.Include(w => w.HasUniqueRoleAssignments, w => w.DisplayName)); 
                try{ 
                        ctx.ExecuteQuery(); 
                
                        for (int j = 0; j < spListItems.Count; j++) { 
                                if (!spListItems[j].HasUniqueRoleAssignments) { 
                                    Console.ForegroundColor = ConsoleColor.DarkRed; 
                                    Console.WriteLine("-- " + spListItems[j].DisplayName); 

                                    spListItems[j].BreakRoleInheritance(true, false); 
                                    try { 
                                        ctx.ExecuteQuery(); 
                                        unique += "-- " + spListItems[j].DisplayName + "\n"; 
                                    } 
                                    catch (Exception e) { 
                                        Console.WriteLine(e.Message); 
                                    } 
                                    Console.ForegroundColor = ConsoleColor.White; 
                               } 
                        } 
                } 
                catch (Exception e) { 
                    Console.WriteLine(e.Message); 
                    unique += "!! Didn't verify items in " + ctx.Web.Lists[i].Title.ToString() + " . " + e.Message + "\n\n"; 
                } 
        } 
 
            ctx.Load(ctx.Web.Webs); 
            ctx.ExecuteQuery(); 
            
        if (ctx.Web.Webs.Count > 0) { 
                for (int i = 0; i < ctx.Web.Webs.Count; i++) { 
                    Uniki(ctx.Web.Webs[i].Url); 
                } 
        } 
}
