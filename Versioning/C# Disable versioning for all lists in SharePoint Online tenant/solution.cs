static private void getall(string url) 
        { 
 
            ClientContext ctx = new ClientContext(url); 
            ctx.Credentials = new SharePointOnlineCredentials(userName, ss); 
            ctx.Load(ctx.Web); 
            ctx.Load(ctx.Web.Lists); 
            ctx.ExecuteQuery(); 
            success += "\n" + ctx.Web.Url + "\n" + Environment.NewLine; 
            failed += "\n" + ctx.Web.Url + "\n"; 
            Console.WriteLine("\n" + ctx.Web.Url + "\n"); 
            foreach (List ll in ctx.Web.Lists) 
            { 
 
                ll.EnableVersioning = versioning; 
                ll.Update(); 
                try 
                { 
                    ctx.ExecuteQuery(); 
                    success += ll.Title + "\n" + Environment.NewLine; 
                    Console.WriteLine("Disabled versioning for " + ll.Title); 
                } 
                catch (Exception e) 
                { 
                    Console.WriteLine("Couldn't for " + ll.Title + "\n" + e.Message); 
                    failed += ll.Title + "\n"; 
                } 
 
 
            } 
 
 
            ctx.Load(ctx.Web.Webs); 
            try 
            { 
                ctx.ExecuteQuery(); 
            } 
            catch (Exception e) 
            { 
                Console.WriteLine("Couldn't open " + url + ".\n" + e.Message); 
            } 
 
 
            for (int i = 0; i < ctx.Web.Webs.Count; i++) 
            { 
                ctx.Load(ctx.Web.Webs[i].Lists); 
                ctx.Load(ctx.Web.Webs[i].Webs); 
                ctx.ExecuteQuery(); 
                success += "\n" + ctx.Web.Webs[i].Url + "\n"; 
                failed += "\n" + ctx.Web.Webs[i].Url + "\n"; 
                Console.WriteLine("\n" + ctx.Web.Webs[i].Url + "\n"); 
 
                foreach (List l in ctx.Web.Webs[i].Lists) 
                { 
                    l.EnableVersioning = versioning; 
                    l.Update(); 
                    try 
                    { 
                        ctx.ExecuteQuery(); 
                        Console.WriteLine("Disabled versioning for " + l.Title); 
                        success += l.Title + "\n"; 
                    } 
                    catch (Exception e) 
                    { 
                        Console.WriteLine("Couldn't disable for " + l.Title + "\n" + e.Message); 
                        failed += l.Title + "\n"; 
                    } 
 
                } 
 
                if (ctx.Web.Webs[i].Webs.Count > 0) 
                { 
                    Console.WriteLine("Discovered " + ctx.Web.Webs[i].Webs.Count.ToString() + " webs for " + ctx.Web.Webs[i].Url.ToString()); 
                    for (int j = 0; j < ctx.Web.Webs[i].Webs.Count; j++) 
                    { 
                        getall(ctx.Web.Webs[i].Webs[j].Url); 
                    } 
                } 
            } 
        }
