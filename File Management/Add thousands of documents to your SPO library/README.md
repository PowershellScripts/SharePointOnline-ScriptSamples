The application is mainly for SharePoint Online test environments. 

It creates mock data for a library of your choice so that you can test synchronization and SharePoint Online performance.

It creates:

-Word Documents with random content from Latin texts

-Excel Spreadsheets with random number of Sheets but no content

-PowerPoint presentations

-files that will be corrupt (as said above, for testing purposes)

 

You can create unlimited* number of items. Of course the more items you choose, the longer it will run. Depending on your environment, it creates 100 documents per 20seconds. 

 

Works for OneDrive for Business as well.




 The code wouldn't exist without:

http://msdn.microsoft.com/en-us/library/office/cc850834(v=office.15).aspx

http://sharepoint.stackexchange.com/questions/121904/create-a-document-in-sharepoint-online-using-csom

 

 

 *SPO view threshold 5000 items
SPO sync limit : 20 000 items
Feel free to create more if you want to test the errrors.
EDIT
It seems like the application is not completely stable. In a given environment, a given tenant may give an error. Another tenant will not. The error tenant will run in a different environment. It seems to be connected to mapped network drives. I will add some error handling and will upload a more stable version. 
EDIT2
Uploaded a corrected version. Will remove the edits when I have confirmation that the version is stable on all tenants.

 









<br/><br/>
<b>Enjoy and please share feedback!</b>
