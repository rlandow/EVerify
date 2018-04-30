using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using EVerify.Models;
using System.IO;
using System.Text.RegularExpressions;
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
    public partial class i92 : System.Web.UI.Page
    {
        int prss;
        int userid;
        string cit;
        string citizenship;
        Page1 page1 = new Page1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int prssid = Convert.ToInt32(Request["id"]);
                getData(prssid);
                chkCitizen.Checked = true;
            }
        }

        protected void getData(int prssid)
        {
            DataAccess da = new DataAccess();

            SqlDataReader dr2 = da.GetPRSS(prssid);

            while (dr2.Read())
            {
                prss = Convert.ToInt32(dr2["prss"]);
                //email = dr2["email"].ToString();

            }

            SqlDataReader dr = da.GetSingleUser(Request["name"]);

            while (dr.Read())
            {
                txtEmail.Text = dr["email"].ToString();
                txtEmailH.Value = dr["email"].ToString();
                if (dr["UserTxt"].ToString() != "")
                txtPhone.Text = dr["UserTxt"].ToString().Substring(0, 3) + "-" + dr["UserTxt"].ToString().Substring(3, 3) + "-" + dr["UserTxt"].ToString().Substring(6, 4);
                if (dr["UserTxt"].ToString() != "" ) txtPhoneH.Value = dr["UserTxt"].ToString().Substring(0, 3) + "-" + dr["UserTxt"].ToString().Substring(3, 3) + "-" + dr["UserTxt"].ToString().Substring(6, 4);
                userid = Convert.ToInt32(dr["userid"].ToString());

            }



            while (dr.Read())
            {
                prssid = Convert.ToInt32(dr["prss"]);
            }

            SqlDataReader dr3 = da.GetApplication(prss);

            while (dr3.Read())
            {
                txtLastName.Text = dr3["LastName"].ToString();
                txtLastNameH.Value = dr3["LastName"].ToString();
                txtFirstName.Text = dr3["FirstName"].ToString();
                txtFirstNameH.Value = dr3["FirstName"].ToString();
                txtMiddle.Text = dr3["MI"].ToString();
                txtMiddleH.Value = dr3["MI"].ToString();
                txtAddress.Text = dr3["StreetAddress"].ToString();
                txtAddressH.Value = dr3["StreetAddress"].ToString();
                txtCity.Text = dr3["City"].ToString();
                txtCityH.Value = dr3["City"].ToString();
                txtState.Text = dr3["State"].ToString();
                txtStateH.Value = dr3["State"].ToString();
                txtZip.Text = dr3["ZIP"].ToString().Substring(0,5);
                txtZipH.Value = dr3["ZIP"].ToString().Substring(0, 5);
                if (dr3["ZIP"].ToString().Length == 10)
                {
                    txtZip4.Text = dr3["ZIP"].ToString().Substring(6, 4);
                    txtZip4H.Value = dr3["ZIP"].ToString().Substring(6, 4);
                }
                //txtBirth.Text = formatDate(dr3["DOB"].ToString());
                //txtBirth.Text = formatDate(Employee.PRBRTHDT.ToString());
                //txtSSN1.Text = Employee.PRSS.ToString().Substring(0, 3);
                //txtSSN2.Text = Employee.PRSS.ToString().Substring(3, 2);
                //txtSSN3.Text = Employee.PRSS.ToString().Substring(5, 4);
                //txtEmail.Text = Request["em"];

                prpf001Date();

            }

            SqlDataReader dr4 = da.GetStates();

            while (dr4.Read())
            {
                System.Web.UI.WebControls.ListItem temp = new System.Web.UI.WebControls.ListItem();
                temp.Value = dr4["code"].ToString();
                temp.Text = dr4["code"].ToString();
                ddlStates.Items.Add(temp);
            }

            ddlStates.SelectedValue = "GA";
            ddlStates.BackColor = System.Drawing.Color.LightBlue;

        }

        protected string formatDate(string date)
        {
            
            DateTime date2 = DateTime.ParseExact(date, "yyyyMMdd", CultureInfo.InvariantCulture);

            StringBuilder date3 = new StringBuilder();

            System.DateTime.Today.Day.ToString().PadLeft(2, '0');

            date3.Append(date2.Month.ToString().PadLeft(2, '0'));
            date3.Append("/");
            date3.Append(date2.Day.ToString().PadLeft(2, '0'));
            date3.Append("/");
            date3.Append(date2.Year);

            return date3.ToString();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

            page1.LastName = txtLastName.Text;
            page1.FirstName = txtFirstName.Text;
            page1.Middle = txtMiddle.Text;
            page1.otherName = txtOtherName.Text;
            page1.Address = txtAddress.Text;
            page1.AptNum = txtAptNum.Text;
            page1.City = txtCity.Text;
            page1.State = txtState.Text;
            page1.Zip = Convert.ToInt32(txtZip.Text);
            page1.Zip4 = txtZip4.Text == "" ? Convert.ToInt32(null) : Convert.ToInt32(txtZip4.Text);
            page1.Birth = Convert.ToInt32(txtBirth.Text.Substring(6,4) + txtBirth.Text.Substring(0,2) + txtBirth.Text.Substring(3, 2));
            page1.SSN = Convert.ToInt32(Convert.ToString(txtSSN1.Text) + Convert.ToString(txtSSN2.Text) + Convert.ToString(txtSSN3.Text));
            page1.Email = txtEmail.Text;
            page1.Phone = txtPhone.Text == "" ? Convert.ToInt32(null) : Convert.ToInt64(txtPhone.Text.Replace("-", ""));
            page1.Change = chkChange.Checked ? true : false;
            if (chkCitizen.Checked) citizenship = "4";
            else if (chkNonCitizen.Checked) citizenship = "5";
            else if (chkPerm.Checked) citizenship = "6";
            else if (chkAlien.Checked) citizenship = "7";
            page1.Citizenship = citizenship;
            DataTable tbl = ModelToTable(page1);

            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_everify"]);
            conn.Open();
            SqlBulkCopy bulkCopy = new SqlBulkCopy(conn);
            
            bulkCopy.DestinationTableName = "FormI9";
            bulkCopy.WriteToServer(tbl);
            conn.Close();




            if (chkCitizen.Checked) { cit = "4"; }
            else if (chkNonCitizen.Checked) { cit = "5"; }
            else if (chkPerm.Checked) { cit = "6"; }
            else if (chkAlien.Checked) { cit = "7"; }

            CreatePDF();

            Response.Redirect("second.aspx?id=" + prss + "&cit=" + cit); ;
        }

        protected void prpf001Date()
        {

            DataContext masterContext = new DataContext(false);
            masterContext.Settings.Server = "10.1.1.20";
            masterContext.Settings.Partition = "DEV";
            masterContext.Settings.PortNumber = 4745;

            masterContext.Connect("languest01", "usr5979x01");

            masterContext.Clear();

            var Condition = PRPF001Exprs.PRSS == prss;



            PRPF001 Employee = masterContext.PRPF001.RetrieveItem(Condition);

            masterContext.Disconnect();

            //txtLastName.Text = Employee.PRLAST;
            //txtFirstName.Text = Employee.PRFIRST;
            //txtMiddle.Text = Employee.PRMI;
            //txtAddress.Text = Employee.PRADDR1;
            //txtCity.Text = Employee.PRCITY;
            //txtState.Text = Employee.PRSTABBR;
            //txtZip.Text = Employee.PRZIP.ToString();
            txtBirth.Text = formatDate(Employee.PRBRTHDT.ToString());
            txtBirthH.Value = formatDate(Employee.PRBRTHDT.ToString());
            txtSSN1.Text = Employee.PRSS.ToString().Substring(0, 3);
            txtSSN1H.Value = Employee.PRSS.ToString().Substring(0, 3);
            txtSSN2.Text = Employee.PRSS.ToString().Substring(3, 2);
            txtSSN2H.Value = Employee.PRSS.ToString().Substring(3, 2);
            txtSSN3.Text = Employee.PRSS.ToString().Substring(5, 4);
            txtSSN3H.Value = Employee.PRSS.ToString().Substring(5, 4);
 

        }

        public DataTable ModelToTable(Page1 tempModel)
        {
            DataTable tbl = new DataTable();

            foreach (var foo in typeof(Page1).GetProperties())
            {
                tbl.Columns.Add(foo.Name);
            }

            DataRow newRow = tbl.NewRow();
            newRow["LastName"] = tempModel.LastName;
            newRow["FirstName"] = tempModel.FirstName;
            newRow["Middle"] = tempModel.Middle;
            newRow["otherName"] = tempModel.otherName;
            newRow["Address"] = tempModel.Address;
            newRow["AptNum"] = tempModel.AptNum;
            newRow["City"] = tempModel.City;
            newRow["State"] = tempModel.State;
            newRow["Zip"] = tempModel.Zip;
            newRow["Zip4"] = tempModel.Zip4;
            newRow["Birth"] = tempModel.Birth;
            newRow["SSN"] = tempModel.SSN;
            newRow["Email"] = tempModel.Email;
            newRow["Phone"] = tempModel.Phone;
            newRow["Change"] = tempModel.Change;
            newRow["Citizenship"] = tempModel.Citizenship;
            tbl.Rows.Add(newRow);
            
            return tbl;
        }

        public void CreatePDF()
        {
            string src = HttpContext.Current.Server.MapPath("/Forms/I9Template.PDF");
            string dest = HttpContext.Current.Server.MapPath("/Forms/" + txtLastName.Text + ".pdf");

            PdfDocument pdf = new PdfDocument(new PdfReader(src), new PdfWriter(dest));

            PdfAcroForm form = PdfAcroForm.GetAcroForm(pdf, true);

            System.Collections.Generic.IDictionary<string, iText.Forms.Fields.PdfFormField> fields = form.GetFormFields();

            var font = iText.Kernel.Font.PdfFontFactory.CreateFont(iText.IO.Font.FontConstants.HELVETICA);
            foreach (KeyValuePair<string, iText.Forms.Fields.PdfFormField> item in fields)
            {
                //if (item.Key == "State") item.Value.SetValue("GA");
                item.Value.SetFont(font);

            }

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Last = fields.First(k => k.Key == "LastName");
            Last.Value.SetValue(txtLastName.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> First = fields.First(k => k.Key == "FirstName");
            First.Value.SetValue(txtFirstName.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Middle = fields.First(k => k.Key == "Middle");
            Middle.Value.SetValue(txtMiddle.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> OtherName = fields.First(k => k.Key == "OtherName");
            OtherName.Value.SetValue(txtOtherName.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Address = fields.First(k => k.Key == "Address");
            Address.Value.SetValue(txtAddress.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Apt = fields.First(k => k.Key == "Apt");
            Apt.Value.SetValue(txtAptNum.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> City = fields.First(k => k.Key == "City");
            City.Value.SetValue(txtCity.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> State = fields.First(k => k.Key == "State");
            State.Value.SetValue(txtState.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Zip = fields.First(k => k.Key == "ZIP");
            Zip.Value.SetValue(txtZip.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Birth = fields.First(k => k.Key == "Birth");
            Birth.Value.SetValue(txtBirth.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> SSN1 = fields.First(k => k.Key == "SSN1");
            SSN1.Value.SetValue(txtSSN1.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> SSN2 = fields.First(k => k.Key == "SSN2");
            SSN2.Value.SetValue(txtSSN2.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> SSN3 = fields.First(k => k.Key == "SSN3");
            SSN3.Value.SetValue(txtSSN3.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Email= fields.First(k => k.Key == "Email");
            Email.Value.SetValue(txtEmail.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Phone = fields.First(k => k.Key == "Phone");
            Phone.Value.SetValue(txtPhone.Text);

            pdf.Close();



            //BaseFont font = BaseFont.CreateFont(BaseFont.HELVETICA, "Cp1252", true);
            //
            //
            //string src = HttpContext.Current.Server.MapPath("/Forms/i9newpaper.PDF");
            //
            //string destFile = HttpContext.Current.Server.MapPath("/Forms/") + txtLastName.Text + ".pdf";
            //
            //PdfReader reader = new PdfReader(src);
            //PdfStamper stamper = new PdfStamper(reader, new FileStream(destFile, FileMode.Create));
            //System.Text.Encoding encoding = System.Text.Encoding.UTF8;
            //
            //byte[] password = encoding.GetBytes("secret");
            //
            //stamper.SetEncryption(password, null, PdfWriter.ALLOW_PRINTING, PdfWriter.ENCRYPTION_AES_128 | PdfWriter.DO_NOT_ENCRYPT_METADATA);
            //
            //AcroFields pdfFormFields = stamper.AcroFields;
            //
            //foreach (string key in reader.AcroFields.Fields.Keys)
            //{
            //    string foo = key;
            //    pdfFormFields.SetFieldProperty(foo, "textfont", font, null);
            //    pdfFormFields.SetFieldProperty(foo, "textsize", 11f, null);
            //}
            //
            //pdfFormFields.SetField("LastName", page1.LastName);
            //pdfFormFields.SetField("FirstName", page1.FirstName);
            //pdfFormFields.SetField("Middle", page1.Middle);
            //pdfFormFields.SetField("Address", page1.Address);
            //pdfFormFields.SetField("City", page1.City);
            //pdfFormFields.SetField("State", page1.State);
            //pdfFormFields.SetField("Zip Code", page1.Zip.ToString());
            //pdfFormFields.SetField("SSN1", Convert.ToString(txtSSN1.Text));
            //pdfFormFields.SetField("SSN2", Convert.ToString(txtSSN2.Text));
            //pdfFormFields.SetField("SSN3", Convert.ToString(txtSSN3.Text));
            //pdfFormFields.SetField("Email", page1.Email);
            //pdfFormFields.SetField("Phone", page1.Phone.ToString());
            //
            //
            //stamper.FormFlattening = false;
            //
            //stamper.Close();

            return;
        }
    }
}