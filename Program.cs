using System;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {

            TextReader reader = new StringReader(@"<html><body><div>Hello World!</div></body></html>");

            // step 1: creation of a document-object
            Document document = new Document(PageSize.A4, 30, 30, 30, 30);

            // step 2:
            // we create a writer that listens to the document
            // and directs a XML-stream to a file
            PdfWriter pdfWriter = PdfWriter.GetInstance(document, new FileStream("output.pdf", FileMode.Create));
            document.Open();

            // step 3: we create a worker parse the document
            XMLWorkerHelper.GetInstance().ParseXHtml(pdfWriter, document, reader);


            document.Close();

        }
    }
}
