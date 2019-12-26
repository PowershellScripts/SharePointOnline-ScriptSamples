using DocumentFormat.OpenXml; 
using DocumentFormat.OpenXml.Drawing; 
using DocumentFormat.OpenXml.Packaging; 
using DocumentFormat.OpenXml.Presentation; 
using DocumentFormat.OpenXml.Wordprocessing; 
using P = DocumentFormat.OpenXml.Presentation; 
using D = DocumentFormat.OpenXml.Drawing; 
using Microsoft.SharePoint.Client; 
using System; 
using System.Collections.Generic; 
using System.IO; 
using System.Linq; 
using System.Net; 
using System.Security; 
using System.Text; 
using System.Threading.Tasks; 
using DocumentFormat.OpenXml.Spreadsheet; 
using System.Threading; 
 
 
            WebClient web = new WebClient(); 
 
            System.IO.Stream fromwebsite = web.OpenRead(firstUrl); 
            using (System.IO.StreamReader reader = new System.IO.StreamReader(fromwebsite)) 
            { 
                text = reader.ReadToEnd(); 
            } 
            text += " " + Environment.NewLine; 
            System.IO.Stream fromwebsite2 = web.OpenRead(secondUrl); 
            using (System.IO.StreamReader reader2 = new System.IO.StreamReader(fromwebsite2)) 
            { 
                text += reader2.ReadToEnd(); 
            } 
 
            for (int i = 0; i < 15; i++) 
            { 
                text = Environment.NewLine + text.Substring(170, 500) + Environment.NewLine + Environment.NewLine + text; 
            } 
            ThreadPool.SetMaxThreads(30, 30); 
            Console.WriteLine("\n\nStarting..."); 
            timestart = DateTime.Now; 
 
            ClientContext ctx = new ClientContext(webUri); 
            ctx.Credentials = new SharePointOnlineCredentials(userName, password); 
            UserCollection usercoll = ctx.Web.SiteUsers; 
            ctx.Load(usercoll); 
            ctx.ExecuteQuery();         
             
             
                foreach (User uss in usercoll) 
                { 
                    if (uss.LoginName.Contains("i:0#.f|membership|")) 
                    { 
                        userzy.Add(uss.LoginName); 
                    } 
                } 
             
 
            for (int jj = 0; jj < runny; jj++) 
            { 
 
 
                ThreadPool.QueueUserWorkItem(Tredka, jj); 
 
 
            } 
 
 
            Console.ReadKey(); 
 
        } 
 
 
        public static void Tredka(Object tredcontext) 
        { 
            int jj = (int)tredcontext; 
            Random randy = new Random(); 
            Console.WriteLine(DateTime.Now.ToString() + " Started " + jj.ToString()); 
            string name = Convert.ToChar(randy.Next(65, 90)).ToString(); 
            for (int i = 0; i < randy.Next(25); i++) 
            { 
                name += Convert.ToChar(randy.Next(97, 122)).ToString(); 
                if (i % 8 == 0) { name += " "; } 
            } 
            var fileName = @name + " " + jj.ToString() + ".docx"; 
            var excelName = @name + " " + jj.ToString() + ".xlsx"; 
            name = Convert.ToChar(randy.Next(65, 90)).ToString(); 
            for (int i = 0; i < randy.Next(7); i++) 
            { 
                name += Convert.ToChar(randy.Next(97, 122)).ToString(); 
            } 
            var powerpName = @name + " PowerPoint Presentation " + jj.ToString() + ".pptx"; 
            var doctempName = @"Weird one that doesnt open" + jj.ToString() + ".doct"; 
 
 
            var stream = new MemoryStream(); 
            var stream2 = new MemoryStream(); 
            var stream3 = new MemoryStream(); 
            var stream4 = new MemoryStream(); 
 
            //1. Create Document 
            using (var document = WordprocessingDocument.Create(stream, WordprocessingDocumentType.Document, true)) 
            { 
                int beginning = randy.Next(text.Length); 
                int length = text.Length - beginning; 
                string content = text.Substring(beginning, randy.Next(length)); 
                document.AddMainDocumentPart(); 
                document.MainDocumentPart.Document = new Document(new Body(new DocumentFormat.OpenXml.Wordprocessing.Paragraph(new DocumentFormat.OpenXml.Wordprocessing.Run(new DocumentFormat.OpenXml.Wordprocessing.Text(content))))); 
 
            } 
 
            using (var excel = DocumentFormat.OpenXml.Packaging.SpreadsheetDocument.Create(stream2, SpreadsheetDocumentType.Workbook, true)) 
            { 
                 
                WorkbookPart workbookpart = excel.AddWorkbookPart(); 
                workbookpart.Workbook = new Workbook(); 
 
                // Add a WorksheetPart to the WorkbookPart. 
                WorksheetPart worksheetPart = workbookpart.AddNewPart<WorksheetPart>(); 
                worksheetPart.Worksheet = new Worksheet(new SheetData()); 
 
                // Add Sheets to the Workbook. 
                Sheets sheets = excel.WorkbookPart.Workbook. 
                    AppendChild<Sheets>(new Sheets()); 
 
                // Append a new worksheet and associate it with the workbook. 
                for (UInt32 i = 1; i < randy.Next(25); i++) 
                { 
                    Sheet sheet = new Sheet() 
                    { 
                        Id = excel.WorkbookPart. 
                            GetIdOfPart(worksheetPart), 
                        SheetId = i, 
                        Name = "mySheet" + i.ToString() 
                    }; 
                    sheets.Append(sheet); 
                } 
 
 
                workbookpart.Workbook.Save(); 
 
                // Close the document. 
                //spreadsheetDocument.Close(); 
            } 
 
