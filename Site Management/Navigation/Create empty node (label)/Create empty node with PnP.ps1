# It's way easier than with CSOM :)
$NavNodeTitle = "Header"

Connect-PnPOnline


## SharePoint Online

# add an empty link (header) to quick launch on SharePoint Online site 
Add-PnPNavigationNode -Title $NavNodeTitle -Location QuickLaunch -Url "http://linkless.header/"

# add an empty link (header) to top navigation on SharePoint Online site 
Add-PnPNavigationNode -Title $NavNodeTitle -Location TopNavigationBar -Url "http://linkless.header/"



## SharePoint Server 2016

# add an empty link (header) to quick launch on SharePoint Server 2016 site
Add-PnPNavigationNode -Title $NavNodeTitle -Location QuickLaunch -Url ""

# add an empty link (header) to top navigation on SharePoint Server 2016 site
Add-PnPNavigationNode -Title $NavNodeTitle -Location TopNavigationBar -Url ""
