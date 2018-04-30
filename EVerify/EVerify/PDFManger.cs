using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using EVerify.Models;
using iText.Barcodes;
using iText.IO;
using iText.IO.Image;
using iText.Forms;
using iText.Kernel;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using iText.Pdfa;
using iText.Signatures;

namespace EVerify
{
    class PDFManger
    {
        bool? assistTemp = null;
        DataAccess dataacess = new DataAccess();
        static string FormI9_PDF;
        Page1 page1 = new Page1();
        public string CreatePDFFromDatabase(string hourlyApplicationID)
        {
            SqlDataReader dr = dataacess.GetPDF(hourlyApplicationID);

            if (dr.HasRows == false ) return "/EVerify/I9Template.pdf";
            Page1 page1 = Page1FromDataReader(dr);

            
            string src = HttpContext.Current.Server.MapPath("/EVerify/I9Template.PDF");
            string dest = HttpContext.Current.Server.MapPath("/EVerify/" + page1.LastName + ".pdf");

            string FormI9_PDF = "/EVerify/" + page1.LastName + ".pdf";

            PdfDocument pdf = new PdfDocument(new PdfReader(src), new PdfWriter(dest));

            PdfAcroForm form = PdfAcroForm.GetAcroForm(pdf, true);

            System.Collections.Generic.IDictionary<string, iText.Forms.Fields.PdfFormField> fields = form.GetFormFields();

            var font = iText.Kernel.Font.PdfFontFactory.CreateFont(iText.IO.Font.FontConstants.HELVETICA);
            var font2 = iText.Kernel.Font.PdfFontFactory.CreateFont(iText.IO.Font.FontConstants.ZAPFDINGBATS);
            var font3 = iText.Kernel.Font.PdfFontFactory.CreateFont(iText.IO.Font.FontConstants.HELVETICA_BOLD );

            foreach (KeyValuePair<string, iText.Forms.Fields.PdfFormField> item in fields)
            {
                //if (item.Key == "State") item.Value.SetValue("GA");
                item.Value.SetFont(font3);

            }

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Last = fields.First(k => k.Key == "LastName");
            Last.Value.SetValue(page1.LastName);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> First = fields.First(k => k.Key == "FirstName");
            First.Value.SetValue(page1.FirstName);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Middle = fields.First(k => k.Key == "Middle");
            Middle.Value.SetValue(page1.Middle);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> OtherName = fields.First(k => k.Key == "OtherName");
            OtherName.Value.SetValue(page1.otherName);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Address = fields.First(k => k.Key == "Address");
            Address.Value.SetValue(page1.Address);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Apt = fields.First(k => k.Key == "Apt");
            Apt.Value.SetValue(page1.AptNum);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> City = fields.First(k => k.Key == "City");
            City.Value.SetValue(page1.City);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> State = fields.First(k => k.Key == "State");
            State.Value.SetValue(page1.State);

            if (page1.Zip > 0)
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> Zip = fields.First(k => k.Key == "ZIP");
                Zip.Value.SetValue(page1.Zip.ToString());
            }

            if (page1.Birth > 0)
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> Birth = fields.First(k => k.Key == "Birth");
                Birth.Value.SetValue(formatIntToDateString(page1.Birth));
            }
            KeyValuePair<string, iText.Forms.Fields.PdfFormField> SSN1 = fields.First(k => k.Key == "SSN1");
            SSN1.Value.SetValue(page1.SSN.ToString().Substring(0, 3));

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> SSN2 = fields.First(k => k.Key == "SSN2");
            SSN2.Value.SetValue(page1.SSN.ToString().Substring(3, 2));

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> SSN3 = fields.First(k => k.Key == "SSN3");
            SSN3.Value.SetValue(page1.SSN.ToString().Substring(5, 4));

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Email = fields.First(k => k.Key == "Email");
            Email.Value.SetValue(page1.Email);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Phone = fields.First(k => k.Key == "Phone");
            Phone.Value.SetValue(page1.Phone.ToString());

            if (page1.Citizenship == "4")
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> Citizen = fields.First(k => k.Key == "chkCitizen");
                //float foo = 18;
                Citizen.Value.SetValue("X");
                //Citizen.Value.SetValue("3", font2, 18) ;

            }
            else if (page1.Citizenship == "5")
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> NonCitizen = fields.First(k => k.Key == "chkNonCitizen");
                NonCitizen.Value.SetValue("X");
            }
            else if (page1.Citizenship == "6")
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> Perm = fields.First(k => k.Key == "chkPerm");
                Perm.Value.SetValue("X");
            }
            else if (page1.Citizenship == "7")
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> Alien = fields.First(k => k.Key == "chkAlien");
                Alien.Value.SetValue("X");
            }

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> AlienNum1 = fields.First(k => k.Key == "AlienNum1");
            AlienNum1.Value.SetValue(page1.AlienNum1);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> AuthorizationExpDate = fields.First(k => k.Key == "AuthorizationExpDate");
            AuthorizationExpDate.Value.SetValue(formatIntToDateString(page1.AuthorizationExpDate));

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> AlienNum2 = fields.First(k => k.Key == "AlienNum2");
            AlienNum2.Value.SetValue(page1.AlienNum2);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> I94Num = fields.First(k => k.Key == "I94Num");
            I94Num.Value.SetValue(page1.I94Num);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> ForeignPPNum = fields.First(k => k.Key == "ForeignPPNum");
            ForeignPPNum.Value.SetValue(page1.ForeignPPNum);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> ForeignPPCountry = fields.First(k => k.Key == "ForeignPPCountry");
            ForeignPPCountry.Value.SetValue(page1.ForeignPPCountry);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Signature = fields.First(k => k.Key == "Signature");
            Signature.Value.SetValue(page1.Signature);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> SignatureDate = fields.First(k => k.Key == "SignatureDate");
            //SignatureDate.Value.SetValue(formatIntToDateString(page1.SignatureDate));
            SignatureDate.Value.SetValue(DateTime.Now.ToShortDateString());
            if (assistTemp == true)
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> chkAssistYes = fields.First(k => k.Key == "AssistYes");
                chkAssistYes.Value.SetValue("X");

            }

            else if (assistTemp == false)
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> chkAssistNo = fields.First(k => k.Key == "AssistNo");
                chkAssistNo.Value.SetValue("X");
            }

            if (page1.SignatureCertifyEmp == true)
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> chkSignatureEmployee = fields.First(k => k.Key == "chkSignatureEmployee");
                chkSignatureEmployee.Value.SetValue("X");
                //chkSignatureEmployee.Value.SetValue("3", font2, 18);
            }

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> SignaturePrep = fields.First(k => k.Key == "SignaturePrep");
            SignaturePrep.Value.SetValue(page1.SignaturePrep);

            if (page1.SignatureCertifyPrep == true)
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> chkSignaturePrep = fields.First(k => k.Key == "chkSignaturePrep");
                chkSignaturePrep.Value.SetValue("X");
                //chkSignatureEmployee.Value.SetValue("3", font2, 18);
            }

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> SignaturePrepDate = fields.First(k => k.Key == "SignaturePrepDate");
            SignaturePrepDate.Value.SetValue(formatIntToDateString(page1.SignaturePrepDate));

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> PrepLastName = fields.First(k => k.Key == "PrepLastName");
            PrepLastName.Value.SetValue( page1.PrepLastName ?? "");

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> PrepFirstName = fields.First(k => k.Key == "PrepFirstName");
            PrepFirstName.Value.SetValue(page1.PrepFirstName ?? "");

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> PrepAddress = fields.First(k => k.Key == "PrepAddress");
            PrepAddress.Value.SetValue(page1.PrepAddress);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> PrepCity = fields.First(k => k.Key == "PrepCity");
            PrepCity.Value.SetValue(page1.PrepCity);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> PrepState = fields.First(k => k.Key == "PrepState");
            PrepState.Value.SetValue(page1.PrepState);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> PrepZip = fields.First(k => k.Key == "PrepZip");
            PrepZip.Value.SetValue(page1.PrepZip.ToString());

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Barcode = fields.First(k => k.Key == "Barcode");
            Barcode.Value.SetValue(page1.AppID);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> IPEmployee = fields.First(k => k.Key == "IPEmployee");
            IPEmployee.Value.SetValue("1) " + page1.SignatureCertifyEmpIP);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> IPEmployer = fields.First(k => k.Key == "IPEmployer");
            IPEmployer.Value.SetValue("2) " + page1.CertifyCertifySignatureIP);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> LastName2 = fields.First(k => k.Key == "LastName2");
            LastName2.Value.SetValue(page1.LastName);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> FirstName2 = fields.First(k => k.Key == "FirstName2");
            FirstName2.Value.SetValue(page1.FirstName);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Middle2 = fields.First(k => k.Key == "Middle2");
            Middle2.Value.SetValue(page1.Middle);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Citizenship2 = fields.First(k => k.Key == "Citizenship2");
            if (page1.Citizenship == "4") Citizenship2.Value.SetValue("Citizen");
            else if (page1.Citizenship == "5") Citizenship2.Value.SetValue("Non-citizen national");
            else if (page1.Citizenship == "6") Citizenship2.Value.SetValue("Permanent Resident");
            else if (page1.Citizenship == "7") Citizenship2.Value.SetValue("Authorized Alien");

            //string tempDocTitle = "";
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocA1Title = fields.First(k => k.Key == "DocA1Title");
            //if (page1.DocA1Title == "11") tempDocTitle = "Arrival / Departure Record(Form I - 94)";
            //else if (page1.DocA1Title == "13") tempDocTitle = "Permanent Resident Card or Alien Registration Receipt";
            //else if (page1.DocA1Title == "17") tempDocTitle = "Employment Authorization Document";
            //else if (page1.DocA1Title == "24") tempDocTitle = "Foreign Passport with I - 94";
            //else if (page1.DocA1Title == "25") tempDocTitle = "Foreign Passport with I - 551";
            //else if (page1.DocA1Title == "29") tempDocTitle = "U.S.Passport or Passport Card";
            //DocA1Title.Value.SetValue(tempDocTitle);

            //tempDocTitle = "";
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocA2Title = fields.First(k => k.Key == "DocA2Title");
            //if (page1.DocA2Title == "11") tempDocTitle = "Arrival / Departure Record(Form I - 94)";
            //else if (page1.DocA2Title == "13") tempDocTitle = "Permanent Resident Card or Alien Registration Receipt";
            //else if (page1.DocA2Title == "17") tempDocTitle = "Employment Authorization Document";
            //else if (page1.DocA2Title == "24") tempDocTitle = "Foreign Passport with I - 94";
            //else if (page1.DocA2Title == "25") tempDocTitle = "Foreign Passport with I - 551";
            //else if (page1.DocA2Title == "29") tempDocTitle = "U.S.Passport or Passport Card";
            //DocA2Title.Value.SetValue(tempDocTitle);

            //tempDocTitle = "";
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocA3Title = fields.First(k => k.Key == "DocA3Title");
            //if (page1.DocA3Title == "11") tempDocTitle = "Arrival / Departure Record(Form I - 94)";
            //else if (page1.DocA3Title == "13") tempDocTitle = "Permanent Resident Card or Alien Registration Receipt";
            //else if (page1.DocA3Title == "17") tempDocTitle = "Employment Authorization Document";
            //else if (page1.DocA3Title == "24") tempDocTitle = "Foreign Passport with I - 94";
            //else if (page1.DocA3Title == "25") tempDocTitle = "Foreign Passport with I - 551";
            //else if (page1.DocA3Title == "29") tempDocTitle = "U.S.Passport or Passport Card";
            //DocA3Title.Value.SetValue(tempDocTitle);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocA1Issuer= fields.First(k => k.Key == "DocA1Issuer");
            //DocA1Issuer.Value.SetValue(page1.DocA1Issuer);
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocA2Issuer = fields.First(k => k.Key == "DocA2Issuer");
            //DocA2Issuer.Value.SetValue(page1.DocA2Issuer);
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocA3Issuer = fields.First(k => k.Key == "DocA3Issuer");
            //DocA3Issuer.Value.SetValue(page1.DocA3Issuer);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocA1Num = fields.First(k => k.Key == "DocA1Num");
            //DocA1Num.Value.SetValue(page1.DocA1Num);
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocA2Num = fields.First(k => k.Key == "DocA2Num");
            //DocA2Num.Value.SetValue(page1.DocA2Num);
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocA3Num = fields.First(k => k.Key == "DocA3Num");
            //DocA3Num.Value.SetValue(page1.DocA3Num);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocA1Date = fields.First(k => k.Key == "DocA1Date");
            //DocA1Date.Value.SetValue(formatIntToDateString(page1.DocA1Date));
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocA2Date = fields.First(k => k.Key == "DocA2Date");
            //DocA2Date.Value.SetValue(formatIntToDateString(page1.DocA2Date));
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocA3Date = fields.First(k => k.Key == "DocA3Date");
            //DocA3Date.Value.SetValue(formatIntToDateString(page1.DocA3Date));

            //tempDocTitle = "";
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocBTitle = fields.First(k => k.Key == "DocBTitle");
            //if (page1.DocBTitle == "1") tempDocTitle = "Driver's license";
            //else if (page1.DocBTitle == "2") tempDocTitle = "ID Card";
            //else if (page1.DocBTitle == "3") tempDocTitle = "School ID card";
            //else if (page1.DocBTitle == "4") tempDocTitle = "Voter registration card";
            //else if (page1.DocBTitle == "5") tempDocTitle = "U.S. military card";
            //else if (page1.DocBTitle == "6") tempDocTitle = "Military dependent's ID card";
            //else if (page1.DocBTitle == "7") tempDocTitle = "U.S. Coast Guard Merchant Mariner Card";
            //else if (page1.DocBTitle == "8") tempDocTitle = "Native American tribal document";
            //else if (page1.DocBTitle == "9") tempDocTitle = "Canadian Driver's license";
            //else if (page1.DocBTitle == "10") tempDocTitle = "School record or report card";
            //else if (page1.DocBTitle == "11") tempDocTitle = "Doctor or hospital record";
            //else if (page1.DocBTitle == "12") tempDocTitle = "Day-care or nursery school record";
            //DocBTitle.Value.SetValue(tempDocTitle);

            //tempDocTitle = "";
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocCTitle = fields.First(k => k.Key == "DocCTitle");
            //if (page1.DocCTitle == "13") tempDocTitle = "Social Security Card";
            //else if (page1.DocCTitle == "14") tempDocTitle = "Certification of Birth Abroad (Form FS-545)";
            //else if (page1.DocCTitle == "15") tempDocTitle = "Certification of Report of Birth (Form DS-1350)";
            //else if (page1.DocCTitle == "16") tempDocTitle = "U.S. birth certificate (original or certified copy)";
            //else if (page1.DocCTitle == "17") tempDocTitle = "Native American tribal document";
            //else if (page1.DocCTitle == "18") tempDocTitle = "U.S. Citizen ID Card (Form I-197)";
            //else if (page1.DocCTitle == "19") tempDocTitle = "ID Card for Use of Resident Citizen in the United States (Form I-179)";
            //else if (page1.DocCTitle == "20") tempDocTitle = "Employment authorization document issued by the U.S. Department of Homeland Security";
            //DocCTitle.Value.SetValue(tempDocTitle);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocBIssuer = fields.First(k => k.Key == "DocBIssuer");
            //DocBIssuer.Value.SetValue(page1.DocBIssuer);
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocCIssuer = fields.First(k => k.Key == "DocCIssuer");
            //DocCIssuer.Value.SetValue(page1.DocCIssuer);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocBNum = fields.First(k => k.Key == "DocBNum");
            //DocBNum.Value.SetValue(page1.DocBNum);
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocCNum = fields.First(k => k.Key == "DocCNum");
            //DocCNum.Value.SetValue(page1.DocCNum);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocBDate = fields.First(k => k.Key == "DocBDate");
            //DocBDate.Value.SetValue(formatIntToDateString(page1.DocBDate));
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocCDate = fields.First(k => k.Key == "DocCDate");
            //DocCDate.Value.SetValue(formatIntToDateString(page1.DocCDate));

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> DocsAdditional = fields.First(k => k.Key == "DocsAdditional");
            //DocsAdditional.Value.SetValue(page1.DocsAdditional);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> FirstWorkDate = fields.First(k => k.Key == "FirstWorkDate");
            FirstWorkDate.Value.SetValue(formatIntToDateString(page1.FirstWorkDate));

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> CertifySignature = fields.First(k => k.Key == "CertifySignature");
            //CertifySignature.Value.SetValue(page1.CertifySignature);

            //if (page1.CertifyCertifySignature == true)
            //{
            //    KeyValuePair<string, iText.Forms.Fields.PdfFormField> chkCertifySignature = fields.First(k => k.Key == "chkCertifySignature");
            //    chkCertifySignature.Value.SetValue("X");
            //    //chkSignatureEmployee.Value.SetValue("3", font2, 18);
            //}

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> CertifyDate = fields.First(k => k.Key == "CertifyDate");
            //CertifyDate.Value.SetValue(formatIntToDateString(page1.CertifyDate));

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> CertifyTitle = fields.First(k => k.Key == "CertifyTitle");
            //CertifyTitle.Value.SetValue(page1.CertifyTitle);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> CertifyLastName = fields.First(k => k.Key == "CertifyLastName");
            //CertifyLastName.Value.SetValue(page1.CertifyLastName);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> CertifyFirstName = fields.First(k => k.Key == "CertifyFirstName");
            //CertifyFirstName.Value.SetValue(page1.CertifyFirstName);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> CertifyCompany = fields.First(k => k.Key == "CertifyCompany");
            //CertifyCompany.Value.SetValue(page1.CertifyCompany);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> CertifyAddress = fields.First(k => k.Key == "CertifyAddress");
            //CertifyAddress.Value.SetValue(page1.CertifyAddress);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> CertifyCity = fields.First(k => k.Key == "CertifyCity");
            //CertifyCity.Value.SetValue(page1.CertifyCity);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> CertifyState = fields.First(k => k.Key == "CertifyState");
            //CertifyState.Value.SetValue(page1.CertifyState);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> CertifyZip = fields.First(k => k.Key == "CertifyZip");
            //CertifyZip.Value.SetValue(page1.CertifyZip.ToString());

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> ReverifyLastName = fields.First(k => k.Key == "ReverifyLastName");
            //ReverifyLastName.Value.SetValue(page1.ReverifyLastName);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> ReverifyFirstName = fields.First(k => k.Key == "ReverifyFirstName");
            //ReverifyFirstName.Value.SetValue(page1.ReverifyFirstName);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> ReverifyMiddle = fields.First(k => k.Key == "ReverifyMiddle");
            //ReverifyMiddle.Value.SetValue(page1.ReverifyMiddle);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> ReverifyRehireDate = fields.First(k => k.Key == "ReverifyRehireDate");
            //ReverifyRehireDate.Value.SetValue(formatIntToDateString(page1.ReverifyRehireDate));

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> ReverifyDocTitle = fields.First(k => k.Key == "ReverifyDocTitle");
            //ReverifyDocTitle.Value.SetValue(page1.ReverifyDocTitle);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> ReverifyDocNum = fields.First(k => k.Key == "ReverifyDocNum");
            //ReverifyDocNum.Value.SetValue(page1.ReverifyDocNum);

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> ReverifyDocDate = fields.First(k => k.Key == "ReverifyDocDate");
            //ReverifyDocDate.Value.SetValue(formatIntToDateString(page1.ReverifyDocDate));

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> ReverifySignature = fields.First(k => k.Key == "ReverifySignature");
            //ReverifySignature.Value.SetValue(page1.ReverifySignature);

            //if (page1.ReverifySignatureCertify == true)
            //{
            //    KeyValuePair<string, iText.Forms.Fields.PdfFormField> chkReverifySignature = fields.First(k => k.Key == "chkReverifySignature");
            //    chkReverifySignature.Value.SetValue("X");
            //    //chkSignatureEmployee.Value.SetValue("3", font2, 18);
            //}
            ////chkReverifySignature
            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> ReverifyDate = fields.First(k => k.Key == "ReverifyDate");
            //ReverifyDate.Value.SetValue(formatIntToDateString(page1.ReverifyDate));

            //KeyValuePair<string, iText.Forms.Fields.PdfFormField> ReverifyName = fields.First(k => k.Key == "ReverifyName");
            //ReverifyName.Value.SetValue(page1.ReverifyName);

            form.FlattenFields();

            pdf.Close();

            return "/EVerify/" + page1.LastName + ".pdf";

        }

        public Page1 Page1FromDataReader(SqlDataReader dr)
        {

            Page1 page1 = new Page1();

            while (dr.Read())
            {
                page1.Status = dr["status"].ToString();
                page1.Address = dr["Address"].ToString();
                page1.AlienNum1 = dr["AlienNum1"].ToString();
                page1.AlienNum2 = dr["AlienNum2"].ToString();
                page1.AppID = dr["AppID"].ToString();
                page1.AptNum = dr["AptNum"].ToString();

                if (dr["Assist"].ToString() == "") { assistTemp = null; }
                else if (dr["Assist"].ToString() == "False") { assistTemp = false; }
                else assistTemp = true;

                page1.Assist = assistTemp;
                //page1.Assist = dr["Assist"].ToString() == "" ? false : true;
                page1.AuthorizationExpDate = dr["AuthorizationExpDate"].ToString() == "" ? (int?)null : formatDateToInt(dr["AuthorizationExpDate"].ToString());
                if (dr["Birth"] == DBNull.Value) page1.Birth = Convert.ToInt32("0");
                else page1.Birth = Convert.ToInt32(dr["Birth"]);
                if (dr["Change"].ToString() == "") page1.Change = null;
                else page1.Change = true;
                //page1.Citizenship = Convert.ToInt32(dr["Citizenship"]);
                page1.Citizenship =dr["Citizenship"].ToString();
                page1.City = dr["City"].ToString();
                page1.Email = dr["Email"].ToString();
                page1.FirstName = dr["FirstName"].ToString();
                page1.ForeignPPCountry = dr["ForeignPPCountry"].ToString();
                page1.ForeignPPNum = dr["ForeignPPNum"].ToString();
                //page1.FormID = Convert.ToInt32(dr["FormID"]);
                page1.I94Num = dr["I94Num"].ToString();
                page1.LastName = dr["LastName"].ToString();
                page1.Middle = dr["Middle"].ToString();
                page1.otherName = dr["otherName"].ToString();
                page1.Phone = dr["Phone"].ToString() == "" ? (long?)null : Convert.ToInt64(dr["Phone"].ToString().Replace("-", ""));
                page1.Signature = dr["Signature"].ToString();
                page1.SignatureCertifyEmp = dr["SignatureCertifyEmp"].ToString() == "" ? true : false; 
                //page1.SignatureCertifyEmp = (bool)dr["SignatureCertifyEmp"] ? true : false;
                page1.SignatureCertifyEmp = dr["SignatureCertifyEmp"].ToString() == "" ? false : true;
                //page1.SignatureCertifyEmpDate = dr["SignatureCertifyEmpDate"].ToString() == "" ? (DateTime?)null : Convert.ToDateTime(dr["SignatureCertifyEmpDate"]);
                //page1.SignatureCertifyEmpIP = dr["SignatureCertifyEmpIP"].ToString();
                //page1.SignatureCertifyEmpLogin = dr["SignatureCertifyEmpLogin"].ToString();
                page1.SignatureDate = dr["SignatureDate"].ToString() == "" ? (int?)null : Convert.ToInt32(dr["SignatureDate"]);
                page1.SSN = Convert.ToInt32(dr["SSN"]);
                page1.State = dr["State"].ToString();
                page1.Zip = Convert.ToInt32(dr["Zip"]);
                page1.Zip4 = Convert.ToInt32(dr["Zip4"]);
                page1.SignaturePrep = dr["SignaturePrep"].ToString();
                if (String.IsNullOrEmpty(dr["SignatureCertifyPrep"].ToString())) page1.SignatureCertifyPrep = false;
                else if ((bool)dr["SignatureCertifyPrep"] == false) page1.SignatureCertifyPrep = false;
                else page1.SignatureCertifyPrep = true;
                // page1.SignatureCertifyPrep = (bool)dr["SignatureCertifyPrep"] ? true : false;
                page1.SignaturePrepDate = dr["SignaturePrepDate"].ToString() == "" ? (int?)null : Convert.ToInt32(dr["SignaturePrepDate"]);
                page1.PrepLastName = dr["PrepLastName"].ToString();
                page1.PrepFirstName = dr["PrepFirstName"].ToString();
                page1.PrepAddress = dr["PrepAddress"].ToString();
                page1.PrepCity = dr["PrepCity"].ToString();
                page1.PrepState = dr["PrepState"].ToString();
                page1.PrepZip = dr["PrepZip"].ToString() == "" ? (int?)null : (int?)dr["PrepZip"];

                //page1.DocA1Title = dr["DocA1Title"].ToString();
                //page1.DocA1Issuer = dr["DocA1Issuer"].ToString();
                //page1.DocA1Num = dr["DocA1Num"].ToString();
                //page1.DocA1Date = dr["DocA1Date"].ToString() == "" ? (int?)null : Convert.ToInt32(dr["DocA1Date"]);

                //page1.DocA2Title = dr["DocA2Title"].ToString();
                //page1.DocA2Issuer = dr["DocA2Issuer"].ToString();
                //page1.DocA2Num = dr["DocA2Num"].ToString();
                //page1.DocA2Date = dr["DocA2Date"].ToString() == "" ? (int?)null : Convert.ToInt32(dr["DocA2Date"]);

                //page1.DocA3Title = dr["DocA3Title"].ToString();
                //page1.DocA3Issuer = dr["DocA3Issuer"].ToString();
                //page1.DocA3Num = dr["DocA3Num"].ToString();
                //page1.DocA3Date = dr["DocA3Date"].ToString() == "" ? (int?)null : Convert.ToInt32(dr["DocA3Date"]);

                //page1.DocBTitle = dr["DocBTitle"].ToString().Replace(" ", "");
                //page1.DocBIssuer = dr["DocBIssuer"].ToString();
                //page1.DocBNum = dr["DocBNum"].ToString();
                //page1.DocBDate = dr["DocBDate"].ToString() == "" ? (int?)null : Convert.ToInt32(dr["DocBDate"]);

                //page1.DocCTitle = dr["DocCTitle"].ToString();
                //page1.DocCIssuer = dr["DocCIssuer"].ToString();
                //page1.DocCNum = dr["DocCNum"].ToString();
                //page1.DocCDate = dr["DocCDate"].ToString() == "" ? (int?)null : Convert.ToInt32(dr["DocCDate"]);
                //page1.DocsAdditional = dr["DocsAdditional"].ToString();
                //page1.FirstWorkDate = dr["FirstWorkDate"].ToString() == "" ? (int?)null : Convert.ToInt32(dr["FirstWorkDate"]);

                //page1.CertifySignature = dr["CertifySignature"].ToString();

                //if (String.IsNullOrEmpty(dr["CertifyCertifySignature"].ToString())) page1.CertifyCertifySignature = false;
                //else if ((bool)dr["CertifyCertifySignature"] == false) page1.CertifyCertifySignature = false;
                //else page1.CertifyCertifySignature = true;

                //page1.CertifyCertifySignatureIP = dr["CertifyCertifySignatureIP"].ToString();

                //page1.CertifyDate = dr["CertifyDate"].ToString() == "" ? (int?)null : Convert.ToInt32(dr["CertifyDate"]);
                //page1.CertifyTitle = dr["CertifyTitle"].ToString();
                //page1.CertifyLastName = dr["CertifyLastName"].ToString();
                //page1.CertifyFirstName = dr["CertifyFirstName"].ToString();
                //page1.CertifyCompany = dr["CertifyCompany"].ToString();
                //page1.CertifyAddress = dr["CertifyAddress"].ToString();
                //page1.CertifyCity = dr["CertifyCity"].ToString();
                //page1.CertifyState = dr["CertifyState"].ToString();
                //page1.CertifyZip = dr["CertifyZip"].ToString() == "" ? (int?)null : (int?)dr["CertifyZip"];

                //page1.ReverifyLastName = dr["ReverifyLastName"].ToString();
                //page1.ReverifyFirstName = dr["ReverifyFirstName"].ToString();
                //page1.ReverifyMiddle = dr["ReverifyMiddle"].ToString();
                //page1.ReverifyRehireDate = dr["ReverifyRehireDate"].ToString() == "" ? (int?)null : Convert.ToInt32(dr["ReverifyRehireDate"]);
                //page1.ReverifyDocTitle = dr["ReverifyDocTitle"].ToString();
                //page1.ReverifyDocNum = dr["ReverifyDocNum"].ToString();
                //page1.ReverifyDocDate = dr["ReverifyDocDate"].ToString() == "" ? (int?)null : Convert.ToInt32(dr["ReverifyDocDate"]);

                //page1.ReverifySignature = dr["ReverifySignature"].ToString();

                //if (String.IsNullOrEmpty(dr["ReverifySignatureCertify"].ToString())) page1.ReverifySignatureCertify = false;
                //else if ((bool)dr["ReverifySignatureCertify"] == false) page1.ReverifySignatureCertify = false;
                //else page1.ReverifySignatureCertify = true;
                
                //page1.ReverifyDate = dr["ReverifyDate"].ToString() == "" ? (int?)null : Convert.ToInt32(dr["ReverifyDate"]);
                //page1.ReverifyName = dr["ReverifyName"].ToString();

            }

            return page1;
        }

        public Page1 Page2FromDataReader(SqlDataReader dr)
        {
            Page1 page1 = new Page1();
            return page1;

        }
        protected int formatDateToInt(string date)
        {
            DateTime dateObject = Convert.ToDateTime(date);

            DateTime date2 = DateTime.ParseExact(date, "d", CultureInfo.InvariantCulture);

            StringBuilder date1 = new StringBuilder();

            //System.DateTime.Today.Day.ToString().PadLeft(2, '0');

            date1.Append(dateObject.Year);

            if (dateObject.Month < 10) date1.Append("0" + dateObject.Month);
            else date1.Append(dateObject.Month);

            if (dateObject.Day < 10) date1.Append("0" + dateObject.Day);
            else date1.Append(dateObject.Day);

            //
            //return date3.ToString();
            //return date1.ToString();
            return Convert.ToInt32(date1.ToString());
        }

        public string formatIntToDateString(int? date)
        {
            if (date == null) return "";
            string dateObject = Convert.ToString(date);

            //DateTime date2 = DateTime.ParseExact(dateObject, "yyyyMMdd", CultureInfo.InvariantCulture);

            StringBuilder date1 = new StringBuilder();
            date1.Append(dateObject.Substring(4, 2));
            date1.Append("/");
            date1.Append(dateObject.Substring(6, 2));
            date1.Append("/");
            date1.Append(dateObject.Substring(0, 4));

            return date1.ToString();
        }
    }
}