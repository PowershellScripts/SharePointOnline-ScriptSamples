Powershell script. Creates a .csv file with a report on all workflows in a site collection.

 

Before you run the script, open .ps1 file and edit all necessary information:

 

```PowerShell
 
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site and the path where the report should be saved. 
$Username="2190@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$Url="https://tenant.sharepoint.com" 
$CSVpath="C:\testpath2.csv"
``` 
As the script runs you will see how many workflows each list has:

 

 
<img src="../Get workflow report for one site/wf1.png" width="850">


 

 
 

 

### Sample report
 

#TYPE Microsoft.SharePoint.Client.Workflow.WorkflowAssociation	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 
Site Url	List Title	AllowManual	AssociationData	AutoStartChange	AutoStartCreate	BaseId	Created	Description	Enabled	HistoryListTitle	Id	InstantiationUrl	InternalName	IsDeclarative	ListId	Modified	Name	TaskListTitle	WebId	Context	Tag	Path	ObjectVersion	ServerObjectIsNull	TypedObject
https://tenant.sharepoint.com	Documents	True	<dfs:myFields xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:dms="http://schemas.microsoft.com/office/2009/documentManagement/types" xmlns:dfs="http://schemas.microsoft.com/office/infopath/2003/dataFormSolution" xmlns:q="http://schemas.microsoft.com/office/infopath/2009/WSSList/queryFields" xmlns:d="http://schemas.microsoft.com/office/infopath/2009/WSSList/dataFields" xmlns:ma="http://schemas.microsoft.com/office/2009/metadata/properties/metaAttributes" xmlns:pc="http://schemas.microsoft.com/office/infopath/2007/PartnerControls" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><dfs:queryFields></dfs:queryFields><dfs:dataFields><d:SharePointListItem_RW><d:Approvers><d:Assignment><d:Assignee><pc:Person><pc:DisplayName>Arleta Wanat</pc:DisplayName><pc:AccountId>i:0#.f|membership|2190@tenant.onmicrosoft.com</pc:AccountId><pc:AccountType>User</pc:AccountType></pc:Person></d:Assignee><d:Stage xsi:nil="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" /><d:AssignmentType>Serial</d:AssignmentType></d:Assignment><d:Assignment><d:Assignee><pc:Person><pc:DisplayName>Arleta Wanat</pc:DisplayName><pc:AccountId>i:0#.f|membership|2190@tenant.onmicrosoft.com</pc:AccountId><pc:AccountType>User</pc:AccountType></pc:Person></d:Assignee><d:Stage xsi:nil="true" /><d:AssignmentType>Serial</d:AssignmentType></d:Assignment></d:Approvers><d:ExpandGroups>true</d:ExpandGroups><d:NotificationMessage>hf</d:NotificationMessage><d:DueDateforAllTasks xsi:nil="true" /><d:DurationforSerialTasks xsi:nil="true" /><d:DurationUnits>Day</d:DurationUnits><d:CC /><d:CancelonRejection>false</d:CancelonRejection><d:CancelonChange>false</d:CancelonChange><d:EnableContentApproval>false</d:EnableContentApproval></d:SharePointListItem_RW></dfs:dataFields></dfs:myFields>	False	False	8ad4d8f0-93a7-4941-9657-cf3706f00409	########	Routes a document for approval. Approvers can approve or reject the document, reassign the approval task, or request changes to the document.	True	Workflow History	e76e75fe-1622-4c26-a5fa-7e6178c61ae9	_layouts/15/IniWrkflIP.aspx	oo

<Cfg.d3a8e0e9_03da_4f32_99c9_f778c1d5d560.4.512.>	True	19e3d565-15c5-4a89-b95a-626b48ff0bcc	########	oo	Task List with 14 elements	b05b85f0-c7fe-4646-ac41-4fde2db44f3b	Microsoft.SharePoint.Client.ClientContext	Microsoft.SharePoint.Client.ObjectPathIdentity	False	Microsoft.SharePoint.Client.Workflow.WorkflowAssociation
https://tenant.sharepoint.com	Site Pages	True	 	True	True	dd19a800-37c1-43c0-816d-f8eb5f4a4145	########	Manages document expiration and retention by allowing participants to decide whether to retain or delete expired documents.	True	Workflow History	139a534e-abe6-4862-b19e-895eac1e0cbc	mjyf	False	c6e865a5-b992-4a51-ba25-9ecd76ba336f	########	mjyf	Tasks	0a2bec62-9fd7-44a4-b1bb-eacc553b3cd2	Microsoft.SharePoint.Client.ClientContext	Microsoft.SharePoint.Client.ObjectPathIdentity	False	Microsoft.SharePoint.Client.Workflow.WorkflowAssociation
https://tenant.sharepoint.com	Documents	True	 	True	True	dd19a800-37c1-43c0-816d-f8eb5f4a4145	########	Manages document expiration and retention by allowing participants to decide whether to retain or delete expired documents.	True	Workflow History	e9dd54d1-27db-4ca9-8a84-6266ab3e824f	app2	False	62a23f97-fe21-4142-b485-9805474162b1	########	app2	Tasks	051be499-7633-4837-a3d6-68fc68ca0bcb	Microsoft.SharePoint.Client.ClientContext	Microsoft.SharePoint.Client.ObjectPathIdentity	False	Microsoft.SharePoint.Client.Workflow.WorkflowAssociation
https://tenant.sharepoint.com	Site Pages	True	 	True	True	dd19a800-37c1-43c0-816d-f8eb5f4a4145	########	Manages document expiration and retention by allowing participants to decide whether to retain or delete expired documents.	True	Workflow History	c7cd1221-4dd7-4e0c-953b-aee71519116b	uoiio	False	545e45b7-6c2d-4378-9d23-cd08acf7ce19	########	uoiio	Tasks	d7275f5e-6ec5-4f67-a817-dc3d694027ed	Microsoft.SharePoint.Client.ClientContext	Microsoft.SharePoint.Client.ObjectPathIdentity	False	Microsoft.SharePoint.Client.Workflow.WorkflowAssociation
https://tenant.sharepoint.com	Generic List With GeolocationColumn	False	 
