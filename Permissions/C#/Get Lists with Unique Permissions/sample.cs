static void Uniki(string urelek) { 
            ClientContext ctx = new ClientContext(urelek); 
            foreach (char a in password.ToCharArray()) { ss.AppendChar(a); } 
            ctx.Credentials = new SharePointOnlineCredentials(userName, ss); 
            ctx.ExecuteQuery(); 
            ctx.Load(ctx.Web.Lists); 
            ctx.Load(ctx.Web.Lists, wc => wc.Include(w => w.HasUniqueRoleAssignments, w => w.DefaultViewUrl)); 
            ctx.ExecuteQuery(); 
            Console.WriteLine("\n\n"); 
            Console.BackgroundColor = ConsoleColor.White; 
            Console.ForegroundColor = ConsoleColor.Green; 
            Console.WriteLine(urelek); 
            Console.BackgroundColor = ConsoleColor.Black; 
            
        for (int i = 0; i < ctx.Web.Lists.Count; i++) { 
                if (ctx.Web.Lists[i].HasUniqueRoleAssignments) { 
                    Console.ForegroundColor = ConsoleColor.Red; 
                    Console.WriteLine(ctx.Web.Lists[i].DefaultViewUrl); 
                    unique += ctx.Web.Lists[i].DefaultViewUrl+"\n"; 
                    Console.ForegroundColor = ConsoleColor.White; 
                } 
                else { 
                    Console.ForegroundColor = ConsoleColor.Green; 
                    Console.WriteLine(ctx.Web.Lists[i].DefaultViewUrl); 
                    Console.ForegroundColor = ConsoleColor.White; 
                } 
        } 
 
            ctx.Load(ctx.Web.Webs); 
            ctx.ExecuteQuery(); 
            
        if (ctx.Web.Webs.Count > 0){ 
                for(int i=0;i<ctx.Web.Webs.Count;i++) { 
                    Uniki(ctx.Web.Webs[i].Url); 
                } 
        } 
}
