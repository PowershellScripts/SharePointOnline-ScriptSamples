public Form1() { 
        InitializeComponent(); 
        CheckForIllegalCrossThreadCalls = false; 

        label4.Text = Status.StatusText;             
        RefreshStatusThread = new Thread(RefreshStupidStatus); 
        RefreshStatusThread.Start(); 
} 
 
private void RefreshStupidStatus() { 
        label4.Text = Status.StatusText; 
        Thread.Sleep(1000); 
        RefreshStupidStatus(); 
} 
 
private void button1_Click(object sender, EventArgs e) { 
        if (CredentialVerificationForAllButtons()) { 
                TotalDestructionFunction.TotalThem(); 
                TotalDestructionFunction.RemoveRecycleBinContent(); 
        } 
} 
 
private void myshitbtn_Click(object sender, EventArgs e) { 
        if (CredentialVerificationForAllButtons()) { 
                TotalDestructionFunction.JustMyShit(); 
                TotalDestructionFunction.RemoveRecycleBinContent(); 
        } 
} 
 
public static void CreateSiteColls(string siteurll, string root, string credUsername, SecureString password) { 
        ClientContext tenantContext = new ClientContext(siteurll); 
        tenantContext.Credentials = new SharePointOnlineCredentials(credUsername, password); 
        var tenant = new Tenant(tenantContext); 
        tenantContext.Load(tenant); 
        Status.StatusText = DateTime.Now.ToString() + " Sending request to create site collections. This may take a while...\r\n" + Status.StatusText; 
        string[] TeamSiteColls = { "TeamsiteWithLibraries", "TeamsiteWithLists", "Empty Teamsite" }; 

        foreach (string tsc in TeamSiteColls) { 
                var siteCreationProperties = CreateSite(tsc, tsc, credUsername, root); 
                SpoOperation spo = tenant.CreateSite(siteCreationProperties); 
                tenantContext.Load(spo, i => i.IsComplete); 

                try{ 
                        tenantContext.ExecuteQuery(); 
                } 
                catch (Exception e){ 
                        Status.StatusText = DateTime.Now.ToString() + " " + e.Message + "\r\n" + Status.StatusText; 
                } 
        } 
} 
 
public static void CreateLis(string rootsite, string credUsername, SecureString password) { 
        string strona = rootsite + "Sites/TeamsiteWithLists"; 
        var context = new ClientContext(strona); 
        context.Credentials = new SharePointOnlineCredentials(credUsername, password); 
        context.Load(context.Web.Webs, wc => wc.Include(w => w.Url, w => w.Lists)); 
        SiteProperties collprops = new SiteProperties(context, strona); 
        collprops.StorageMaximumLevel = 700; 
        context.Web.Lists.Add(CreateList("Generic List", 100)); 
        context.Web.Lists.Add(CreateList("Empty Generic List", 100)); 
        context.Web.Lists.Add(CreateList("Custom List With 5005items", 100)); 
        context.Web.Lists.Add(CreateList("Generic List With GeolocationColumn", 100)); 
        context.Web.Lists.Add(CreateList("Links list", 103)); 
        context.Web.Lists.Add(CreateList("Announcements list", 104)); 
        context.Web.Lists.Add(CreateList("Contacts list", 105)); 
        context.Web.Lists.Add(CreateList("Events list", 106)); 
        context.Web.Lists.Add(CreateList("Tasks list", 107)); 
        //context.Web.Lists.Add(CreateList("User Information list", 112)); 
        context.Web.QuickLaunchEnabled = true; 

        try { 
                context.ExecuteQuery(); 
        } 
        catch(Exception e) { 
                Status.StatusText = DateTime.Now + " Couldn't create list. " + e.Message + Environment.NewLine + Status.StatusText; 
        } 

        context.Dispose(); 

        Status.StatusText = DateTime.Now + " Lists are created. Proceeding to fill them with content" + Environment.NewLine + Status.StatusText; 
        } 
}
