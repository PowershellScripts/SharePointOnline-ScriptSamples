The application finds all items in a given site collection that have unique permissions. 

 

At the end a report/list is created with unique items at ```C:\Users\Public```

 

The code goes through:

- sites and subsites

- lists

- list items

- folders' content

- subfolders, subfolders' content, sub-subfolders, and so on.

 

 

Report's excerpt:

Unique permissions detected in: https://streamsofia2190.sharepoint.com/Access Requests 
</br>/Cache Profiles/AllItems.aspx
</br>/RoutingRules/Group by Content Type.aspx
</br>/Lists/ContentTypeSyncLog/AllItems.aspx
</br>/IWConvertedForms/Forms/AllItems.aspx
</br>!! Didn't verify items in Custom List with 55550 elements . The attempted operation is prohibited because it exceeds the list view threshold enforced by the administrator.
</br>/DeviceChannels/AllItems.aspx
</br>/Shared Documents/Forms/documentlibrary2.aspx
</br>--activex--Office 365 Sharepoint Online Module 7 â€“ MySites--Run_a_custom_report_2014-01-09T064647--PowerShell_transcript.20140121100051

 
 
 Technicalities:

The code checks for .HasUniqueRoleAssignements attribute
