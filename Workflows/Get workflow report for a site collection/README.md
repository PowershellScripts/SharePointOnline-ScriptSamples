Powershell script. Creates a .csv file with a report on all workflows in a site collection.

 

Before you run the script, open .ps1 file and edit all necessary information:

```PowerShell
# Paths to SDK. Please verify location on your computer. 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 
# Insert the credentials and the name of the site collection and the path where the report should be saved. 
$Username="2190@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$Url="https://tenant.sharepoint.com" 
$CSVpath="C:\testpath.csv" 
``` 
 

As the script runs you will see how many workflows each list has:

 

 


<img src="../Get workflow report for a site collection/wf1.png" width="850">
 

 

### Sample report
 

<table>
 
<colgroup><col width="357"><col width="72" span="25"></colgroup>
<tbody>
<tr height="19">
<td colspan="3" width="501" height="19">#TYPE Microsoft.SharePoint.Client.Workflow.WorkflowAssociation</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
<td width="72">&nbsp;</td>
</tr>
<tr height="19">
<td height="19">Site Url</td>
<td>List Title</td>
<td>AllowManual</td>
<td>AssociationData</td>
<td>AutoStartChange</td>
<td>AutoStartCreate</td>
<td>BaseId</td>
<td>Created</td>
<td>Description</td>
<td>Enabled</td>
<td>HistoryListTitle</td>
<td>Id</td>
<td>InstantiationUrl</td>
<td>InternalName</td>
<td>IsDeclarative</td>
<td>ListId</td>
<td>Modified</td>
<td>Name</td>
<td>TaskListTitle</td>
<td>WebId</td>
<td>Context</td>
<td>Tag</td>
<td>Path</td>
<td>ObjectVersion</td>
<td>ServerObjectIsNull</td>
<td>TypedObject</td>
</tr>
<tr height="19">
<td height="19">https://tenant.sharepoint.com</td>
<td>Documents</td>
<td>True</td>
<td>&lt;dfs:myFields xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:dms="http://schemas.microsoft.com/office/2009/documentManagement/types" xmlns:dfs="http://schemas.microsoft.com/office/infopath/2003/dataFormSolution" xmlns:q="http://schemas.microsoft.com/office/infopath/2009/WSSList/queryFields"
 xmlns:d="http://schemas.microsoft.com/office/infopath/2009/WSSList/dataFields" xmlns:ma="http://schemas.microsoft.com/office/2009/metadata/properties/metaAttributes" xmlns:pc="http://schemas.microsoft.com/office/infopath/2007/PartnerControls" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"&gt;&lt;dfs:queryFields&gt;&lt;/dfs:queryFields&gt;&lt;dfs:dataFields&gt;&lt;d:SharePointListItem_RW&gt;&lt;d:Approvers&gt;&lt;d:Assignment&gt;&lt;d:Assignee&gt;&lt;pc:Person&gt;&lt;pc:DisplayName&gt;Arleta
 Wanat&lt;/pc:DisplayName&gt;&lt;pc:AccountId&gt;i:0#.f|membership|2190@tenant.onmicrosoft.com&lt;/pc:AccountId&gt;&lt;pc:AccountType&gt;User&lt;/pc:AccountType&gt;&lt;/pc:Person&gt;&lt;/d:Assignee&gt;&lt;d:Stage xsi:nil="true" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 /&gt;&lt;d:AssignmentType&gt;Serial&lt;/d:AssignmentType&gt;&lt;/d:Assignment&gt;&lt;d:Assignment&gt;&lt;d:Assignee&gt;&lt;pc:Person&gt;&lt;pc:DisplayName&gt;Arleta Wanat&lt;/pc:DisplayName&gt;&lt;pc:AccountId&gt;i:0#.f|membership|2190@tenant.onmicrosoft.com&lt;/pc:AccountId&gt;&lt;pc:AccountType&gt;User&lt;/pc:AccountType&gt;&lt;/pc:Person&gt;&lt;/d:Assignee&gt;&lt;d:Stage
 xsi:nil="true" /&gt;&lt;d:AssignmentType&gt;Serial&lt;/d:AssignmentType&gt;&lt;/d:Assignment&gt;&lt;/d:Approvers&gt;&lt;d:ExpandGroups&gt;true&lt;/d:ExpandGroups&gt;&lt;d:NotificationMessage&gt;hf&lt;/d:NotificationMessage&gt;&lt;d:DueDateforAllTasks xsi:nil="true"
 /&gt;&lt;d:DurationforSerialTasks xsi:nil="true" /&gt;&lt;d:DurationUnits&gt;Day&lt;/d:DurationUnits&gt;&lt;d:CC /&gt;&lt;d:CancelonRejection&gt;false&lt;/d:CancelonRejection&gt;&lt;d:CancelonChange&gt;false&lt;/d:CancelonChange&gt;&lt;d:EnableContentApproval&gt;false&lt;/d:EnableContentApproval&gt;&lt;/d:SharePointListItem_RW&gt;&lt;/dfs:dataFields&gt;&lt;/dfs:myFields&gt;</td>
<td>False</td>
<td>False</td>
<td>8ad4d8f0-93a7-4941-9657-cf3706f00409</td>
<td class="xl65" align="center">########</td>
<td>Routes a document for approval. Approvers can approve or reject the document, reassign the approval task, or request changes to the document.</td>
<td>True</td>
<td>Workflow History</td>
<td>e76e75fe-1622-4c26-a5fa-7e6178c61ae9</td>
<td>_layouts/15/IniWrkflIP.aspx</td>
<td class="xl66" width="72">oo<br>
<br>
&lt;Cfg.d3a8e0e9_03da_4f32_99c9_f778c1d5d560.4.512.&gt;</td>
<td>True</td>
<td>19e3d565-15c5-4a89-b95a-626b48ff0bcc</td>
<td class="xl65" align="center">########</td>
<td>oo</td>
<td>Task List with 14 elements</td>
<td>b05b85f0-c7fe-4646-ac41-4fde2db44f3b</td>
<td colspan="2">Microsoft.SharePoint.Client.ClientContext</td>
<td colspan="2">Microsoft.SharePoint.Client.ObjectPathIdentity</td>
<td>False</td>
<td>Microsoft.SharePoint.Client.Workflow.WorkflowAssociation</td>
</tr>
<tr height="19">
<td height="19">https://tenant.sharepoint.com/nowanowa</td>
<td>Site Pages</td>
<td>True</td>
<td>&nbsp;</td>
<td>True</td>
<td>True</td>
<td>dd19a800-37c1-43c0-816d-f8eb5f4a4145</td>
<td class="xl65" align="center">########</td>
<td>Manages document expiration and retention by allowing participants to decide whether to retain or delete expired documents.</td>
<td>True</td>
<td>Workflow History</td>
<td colspan="2">139a534e-abe6-4862-b19e-895eac1e0cbc</td>
<td>mjyf</td>
<td>False</td>
<td>c6e865a5-b992-4a51-ba25-9ecd76ba336f</td>
<td class="xl65" align="center">########</td>
<td>mjyf</td>
<td>Tasks</td>
<td>0a2bec62-9fd7-44a4-b1bb-eacc553b3cd2</td>
<td colspan="2">Microsoft.SharePoint.Client.ClientContext</td>
<td colspan="2">Microsoft.SharePoint.Client.ObjectPathIdentity</td>
<td>False</td>
<td>Microsoft.SharePoint.Client.Workflow.WorkflowAssociation</td>
</tr>
<tr height="19">
<td height="19">https://tenant.sharepoint.com/newSiteCollection</td>
<td>Documents</td>
<td>True</td>
<td>&nbsp;</td>
<td>True</td>
<td>True</td>
<td>dd19a800-37c1-43c0-816d-f8eb5f4a4145</td>
<td class="xl65" align="center">########</td>
<td>Manages document expiration and retention by allowing participants to decide whether to retain or delete expired documents.</td>
<td>True</td>
<td>Workflow History</td>
<td colspan="2">e9dd54d1-27db-4ca9-8a84-6266ab3e824f</td>
<td>app2</td>
<td>False</td>
<td>62a23f97-fe21-4142-b485-9805474162b1</td>
<td class="xl65" align="center">########</td>
<td>app2</td>
<td>Tasks</td>
<td>051be499-7633-4837-a3d6-68fc68ca0bcb</td>
<td colspan="2">Microsoft.SharePoint.Client.ClientContext</td>
<td colspan="2">Microsoft.SharePoint.Client.ObjectPathIdentity</td>
<td>False</td>
<td>Microsoft.SharePoint.Client.Workflow.WorkflowAssociation</td>
</tr>
<tr height="19">
<td height="19">https://tenant.sharepoint.com/vs20072153</td>
<td>Site Pages</td>
<td>True</td>
<td>&nbsp;</td>
<td>True</td>
<td>True</td>
<td>dd19a800-37c1-43c0-816d-f8eb5f4a4145</td>
<td class="xl65" align="center">########</td>
<td>Manages document expiration and retention by allowing participants to decide whether to retain or delete expired documents.</td>
<td>True</td>
<td>Workflow History</td>
<td colspan="2">c7cd1221-4dd7-4e0c-953b-aee71519116b</td>
<td>uoiio</td>
<td>False</td>
<td>545e45b7-6c2d-4378-9d23-cd08acf7ce19</td>
<td class="xl65" align="center">########</td>
<td>uoiio</td>
<td>Tasks</td>
<td>d7275f5e-6ec5-4f67-a817-dc3d694027ed</td>
<td colspan="2">Microsoft.SharePoint.Client.ClientContext</td>
<td colspan="2">Microsoft.SharePoint.Client.ObjectPathIdentity</td>
<td>False</td>
<td>Microsoft.SharePoint.Client.Workflow.WorkflowAssociation</td>
</tr>
<tr height="19">
<td height="19">https://tenant.sharepoint.com/TeamsitewithLists</td>
<td>Generic List With GeolocationColumn</td>
<td>False</td>
<td>&nbsp;</td>
<td>True</td>
<td>True</td>
<td>dd19a800-37c1-43c0-816d-f8eb5f4a4145</td>
<td class="xl65" align="center">########</td>
<td>Manages document expiration and retention by allowing participants to decide whether to retain or delete expired documents.</td>
<td>True</td>
<td>Workflow History</td>
<td colspan="2">c0d62395-f5b7-4f90-9d73-b7456017e00c</td>
<td>approval</td>
<td>False</td>
<td>d21515ce-2ec4-43c2-8f43-3150520b32f0</td>
<td class="xl65" align="center">########</td>
<td>approval</td>
<td>Tasks list</td>
<td>9a105d7e-03c9-4561-acbf-5226c71f9bab</td>
<td colspan="2">Microsoft.SharePoint.Client.ClientContext</td>
<td colspan="2">Microsoft.SharePoint.Client.ObjectPathIdentity</td>
<td>False</td>
<td>Microsoft.SharePoint.Client.Workflow.WorkflowAssociation</td>
</tr>
</tbody>

 </table>
