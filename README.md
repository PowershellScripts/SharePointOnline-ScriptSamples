# SharePointOnline-ScriptSamples

Over 200 SharePoint Online scripts 
* fixing issues
* generating reports 
* extra settings not available via UI
* bulk updates
* provide automation script samples to address IT Pros' frequently asked IT tasks.

The scripts use Powershell, C#, CSOM and REST. They include copies of existing scripts from Technet Gallery years 2013-2019 - the transfer is in progress and the documentation/description is still taking shape.

Most of them were tested and verified by hundreds and thousands of users of [Technet Gallery, where you can still find these scripts](https://gallery.technet.microsoft.com/office/site/search?f%5B0%5D.Type=User&f%5B0%5D.Value=Arleta%20Wanat) 

Their new home at GitHub is still relatively recent, so if you find any issues, please do let me know. I appreciate every comment and every feedback.
 

## Full index

<details>
<summary>Content Types </summary>
 
 <br/>
 

  * Create
    * Add Content Type to Lists with Workflows
    * Add Content Type to Task Lists
    * Add existing content type directly to SPO list
    * Create a content type
    * Create and add content type to a content type hub
    * Create content type and add directly to SPO list
    * Create content type and add it to all lists in one site
  * Get
    * All Content Types from a Content Type Hub and their DisplayFormTemplate
    * Compare Web.AvailableContentTypes vs Web.ContentTypes
    * Find content types added to your lists (recursive)
    * Find content types added to your lists
    * Get All Detailed Properties of All Content Types
    * Get All Hidden Content Types added to the site
    * Get All Properties of All Content Types in All Lists (Detailed) across one site
    * Get Content Types Derived From One Parent 2
    * Get Content Types Derived From One Parent
    *
  * Set
    * Add column (fieldlink) to a content type
    * Assign your Content Types back to their default Groups
    * Modify the description of a list content type
    * Modify the description of a site content type
    * Reset default content types
    * Unseal sealed content types in site
 
 <br/>
 
 </details>
 
 
 <details>
<summary>File Management </summary>
 
 <br/>

  * Add thousands of documents to your SPO library
  * Audit folder structure
    * Audit folder structure to XML
    * Audit Sharepoint folder structure to XML
    * Audit SharePoint Online folder structure to XML
    * Get the structure of your SharePoint library (folders and files) to XML
  * Create sample folder and file structure for testing
  * Get SPO Files from a folder
  * Get SPO Folder and File
  * Module for checking in and checking out the files
  * Module for easy file management
  * Powershell cmdlet for getting the number of files in a folder
  * Records Management
    * Declare files as records
    * Undeclare files as records
  * Restore previous versions in selected files the entire library
  
 
 </details>
 
  
  
 <details>
<summary>Getting SPO objects with REST </summary>
 
 <br/>
 
 
  * Module for getting SharePoint objects with Powershell (limited)
  * Module for getting SharePoint Online objects with Powershell
  * Script to get SharePoint objects with REST
  * Unrestricted Module
  
  <br/>
 
 </details>
 
 <br/>   
 
 
 <details>
<summary>Items Management</summary>
 
 <br/> 
 
  * Attachments
    * Add size of SharePoint item attachments to list view
    * Copy all SharePoint Online list item attachments
    * Copy list attachments to a separate library
    * Delete all your list attachments (data loss involved)
    * Disable or enable attachments to list items
    * Enable or disable attachments to items of a chosen list
    * Get size of attachments per SharePoint Online list item
    * Get the size of all attachments in a list
    * List all attachments from SharePoint Online list to CSV file
    * List all SharePoint Online list items with attachments
  * Bulk update all items in a list
  * Create new list item using Powershell
  * Get
    * Get the number of items in a list
    * GetSpoListItems and GetSPOListFields
    * List 10 latest items a user has modified
    * List 10 latest items a user has modified in SharePoint Server list
    * List 5 latest items a user has created in list
  * Module for item management
  * Remove permissions from SharePoint Online items

  <br/>
 
 </details>
 
 <br/>  

 <details>
<summary>Licensing </summary>
 <br/> 
 
  * Check User Licenses using plan type
  * Check user licenses using Service Name
  * Export all assigned licenses and services provisioning statuses
  * Get user licenses and services provisioning statuses
  * Remove SharePoint Online licenses for all users

  <br/>
 </details>
 <br/> 

 <details>
<summary>Lists and Libraries Management </summary>
 
 <br/> 

  * Allow list to be deleted
  * Allow or disallow list items to appear in search
  * Allow or disallow users to create folders
  * Break inheritance for all SPO lists in a site
  * Change search setting for all lists in a site
  * Checkout
    * Powershell
      * Find all checked out files in SharePoint library and check them in
      * Find all checked out files in SharePoint Online library and check them in
      * Find all files in library checked out by a specific user and check them in
      * Force checkout on a list
      * Force document checkout on the whole tenant
      * Force your users to checkout documents using Powershell
      * Get the number of checked out files per list
      * How many checked out files per user in a library
    * SPServer
      * Find all checked out files in SharePoint library and check them in
  * Column Management
    * Add a geolocation column
    * Add a library column with file extension
    * Add a library column with file name and extension
    * Create a new choice column
    * Create a new column in list
    * Create new column with properties
    * Get all columns associated to a SINGLE content type in a list
    * Module for list column management
    * Remove list column
  * Create SPO list with a Powershell cmdlet
  * Delete unique permissions for all lists in a site collection
  * Delete unique permissions in all items in a large list (5000+ items)
  * FolderStructure
    * Copy folder structure across SharePoint Online sites
    * Copy folder structure across SharePoint Online tenants
    * Copy folder structure from one library to another
    * Copy folder structure from one library to another (SharePoint Online) 2
  * Get all event receivers on your lists in a site
  * Get all lists not used since
  * Get large SharePoint Online lists
  * Get large SharePoint Online lists v2
  * Get the number of files and folders in library
  * Get-SPOListTemplates to retrieve list templates on a SharePoint Online site
  * GetSPOList Module to view and filter SPO list properties
  * GetSPOListCount cmdlet
  * Modern or Classic
    * Set all lists to New or Classic Experience
    * Set single list to New or Classic Experience
    * Verify which lists have the new UI
    * Verify which lists have the new UI using Powershell and REST
  * MultipleListsC#
  * Powershell Module for Managing SPO Lists
  * Set the direction of the reading order
    * For a single list
    * For All Lists
  * Set the major version limit for all the lists and libraries (data loss involved)
  * Versioning
    * Create a report on all file versions in the library
    * Create a report on file versions in library or folder
    * Delete all previous file versions in a library
    * Enable minor and major versions for all lists in one site
    * Enable minor versions using Powershell and CSOM
    * Enable versioning for all lists in one site
    * Enable versioning for one list
    * Get versioning settings for all lists
  * Views
    * Get all list view properties using view GUID
    * Get all list view properties using view name
    * Get all views from a single list and their properties
    * Remove view from SharePoint Online list

  <br/>
 </details>
 <br/> 

 <details>
<summary>Managed Metadata </summary>
 <br/> 
 
  * Create a new SharePoint Online taxonomy term
  * Pull all groups, termsets, terms from your default SharePoint Online termstore
  * Taxonomy cmdlets module to manage your term store in SharePoint Online

  <br/>
 </details>
 <br/> 

 <details>
<summary>OneDrive for Business </summary>
 <br/> 

  * Add BCC to all sharing invitations in OneDrive for Business
  * Create a report on all file versions in OneDrive for Business
  * Create OneDrive for Business usage report for all users
  * Enable versioning for all lists in OneDrive sites
  * Enable versioning for all lists in selected OneDrive sites
  * Globally set OneDrive for Business Access Requests and Members Can Share
  * Hide OneDrive for Business Sync button using PS and CSOM
  * Notify OneDrive for Business owner if anonymous link to their content is created
  * Notify OneDrive for Business owner if their content is reshared
  * Set the version limit for OneDrive for Business lists (data loss involved)
  * Set the version limit for OneDrive for Business lists (data loss involved) for all users
  * Update locale id for all personal sites

  <br/>
 </details>
 <br/>

 <details>
<summary>OTHER </summary>
 <br/> 

  * C# Create a contact list with internal user data
  * Change the default language for all the SharePoint Online users
  * CreativeDestruction
  * Get all event receivers on your lists in a site
  * Remove a single event receiver
  * Unified Groups Storage Report
  * Uninstall unwanted app from your site using Powershell

  <br/>
 </details>
 <br/>
 
 
  <details>
<summary>Pages </summary>
 <br/> 
 
  * ClassicWebparts
    * Delete all web parts from a single page
    * Delete single web part
    * Get all web parts and their details from a single page
    * Report on all web parts in all site pages
  * Remove comments on modern pages in entire SharePoint site
  
  <br/>
 </details>
 <br/>
 
 
  <details>
<summary>Permissions </summary>
 <br/>  
  
  * C#
    * Break Inheritance for all items in site
    * Delete all unique permissions in site
    * Get Items with Unique Permissions in site collection
    * Get Lists with Unique Permissions
  * Powershell
    * Break role inheritance for a single list
    * Delete unique permissions in all items in a large list (5000+ items)
    * Get items with unique permissions SharePoint Server
    * Get items, folders, lists with unique permissions (SharePoint Server 2013-2016)
    * Remove permission groups from personal files
    * Report on what permission group the user belongs to
  
  <br/>
 </details>
 <br/>  
  
  
  <details>
<summary>Power Automate </summary>
 <br/>   
  
* Disable Flows in all lists on SharePoint site
* Enable Microsoft Flow in all lists on SharePoint modern site
* Get FlowsPolicy using REST API

  <br/>
 </details>
 <br/>  


  <details>
<summary>Site Management </summary>
 <br/> 

  * Access Requests
    * Get SharePoint Online Access Requests Settings with REST API
    * Get SharePoint Online Access Requests with REST API
    * Get SharePoint Server 2013-2016 Access Requests with REST API
    * Set RequestAccessEmail for all subsites in one site collection
  * Add Supported Language for multiple site collections
  * Add-SPOWeb & Remove-SPOWeb
  * ChangeLog
    * Create a report on all changes for all your site collections
    * Create a report on all changes for one site collection
  * Enable page editing when master page editing has been disabled for this site
  * Export site collection properties using Powershell and CSOM
  * Features
    * Activate or deactivate a feature for a site and its subsites
    * Activate or deactivate a site collection feature
    * Activate or deactivate a SPO feature for a single site
    * Activate or deactivate a SPO feature for direct subsites in site collection
    * Add or Remove Site Features from all Personal Sites
    * Get all features from a site
    * Get all features from a site collection
  * Get all quick launch nodes
  * Get all site collections and their subsites
  * Get all time zones from a site
  * Get SharePoint Online Site Properties
  * Get site groups from root and subsites
  * Get unused SharePoint Online webs
  * Get-SPOWeb to retrieve subsites and their properties
  * Modify Web Inherited Permissions
  * Powershell cmdlet Set-SpoWeb to manage site properties
  * Recycle Bin
    * Detailed report on all recycle bin items across all site collections
    * Move items from first to second stage recycle bin
    * Remove all items from second stage recycle bin (involves data loss)
    * Remove permanently all items from recycle bins (data loss involved)
    * Report on all deleted items across all site collections
    * Report on deleted files within one site
    * Restore All Files from a Given Site
    * Restore all files, items, lists deleted by a single employee
    * Restore all reycle bin items across all site collections
    * Restore deleted items from a single subsite
    * Restore one file from a Given Site
    * Retrieve all reycle bin items across all site collections
    * Retrieve all reycle bin items across all sites incl group sites
  * SPServer
  * Restore all files items lists deleted by a single employee
  * Remove SPO subsite
  * Set theme of your SharePoint Online site
  * Site designs
  * Verify where a site design is applied
  * Update locale id for all personal sites
  * Update the time zones in all personal sites
  
   <br/>
 </details>
 <br/>   
  
  
  <details>
<summary>SiteMailboxes </summary>
 <br/>   
   <br/>
 </details>
 <br/>  
 
 
  <details>
<summary>Tenant Settings </summary>
 <br/>  
 
 
  * Add BCC to all sharing invitations in OneDrive for Business
  * Allow external sharing only with specific domains
  * Block download of all files for guests in SharePoint with Powershell and CSOM
  * Force external users to accept sharing invitations with the same account
  * Get SharePoint Online tenant properties using Powershell and CSOM
  * Globally set OneDrive for Business Access Requests and Members Can Share
  * Hide OneDrive for Business Sync button using PS and CSOM
  * Modify external sharing setting
  * Notify OneDrive for Business owner if anonymous link to their content is created
  * Notify OneDrive for Business owner if their content is reshared
  * Prevent external users from resharing
  * Report on SharePoint Online tenant properties
  * Set Anonymous access for SPO tenant using PS and CSOM
  * Set anonymous link access level for SPO tenant
  * Set default link type for SharePoint Online tenant sharing settings
  * Set expiration for anonymous links in SPO

   <br/>
 </details>
 <br/>  

  <details>
<summary>User Profiles </summary>
 <br/>  
 
  * Export all user profiles using Powershell
  * Get all user profile properties using Powershell and REST
  * Get MUI Languages for multiple users using REST
  * Get user work email using Powershell and REST
  * Retrieve all user profiles and their properties using C# and CSOM
  
   <br/>
 </details>
 <br/>  


<details>
<summary>Versioning </summary>
 <br/>
 
* Create a report on all file versions in OneDrive for Business
* Enable minor versions for all lists
* Enable versioning for all lists in OneDrive sites
* Enable versioning for all SharePoint Online lists
* Get versioning settings for all lists
* Restore previous versions in selected files the entire library
* Restore previous versions in the entire library
* Set the major version limit for all the lists and libraries (data loss involved)
   <br/>
 </details>
 <br/> 


<details>
<summary>Workflows </summary>
 <br/>
 
* Get workflow report for a site collection
* Get workflow report for all site collections
* Get workflow report for one site

   <br/>
 </details>
 <br/> 
