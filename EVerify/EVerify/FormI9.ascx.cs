using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
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
using WHInfo.Portal;


namespace EVerify
{
    public partial class FormI9 : WHInfo.Portal.PortalModuleControl
    {
        static string[] checkforpdf;
        static string cit = "";
        static string editColor = "lighblue";
        string citizenship;
        static string firstName;
        static string FormI9_PDF;
        string hourlyApplicationID;
        static string lastName;
        static string LoginName;
        static Page1 page1 = new Page1();
        PDFManger pdfmanager = new PDFManger();
        static int prss;
        int prssID = 0;
        static string url = "";
        int userid;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["appID"] == null) Response.Redirect("~/Admin/AccessDenied.aspx");
            //hourlyApplicationID = Session["appID"].ToString();

            //if ((object)Request.Params["__EVENTTARGET"] != null) {
            //    string eTarget = Request.Params["__EVENTTARGET"].ToString();
            //
            //    if (eTarget == "I9$chkCitizenYes") test();
            //}
            divEmpSignatureDate.Visible = false;

            if (!IsPostBack)
            {

                //btnSubmit.Visible = true;
                //chkCitizen.Checked = true;
                //btnSubmit.Visible = false;
                if ((object)Request.UrlReferrer != null)
                {
                    if (url == "") url = Request.UrlReferrer.PathAndQuery;
                }

                HttpCookie cookName = new HttpCookie("Done");
                cookName.Value = url;
                //if (url == "") url = Request.UrlReferrer.PathAndQuery;
                //if (btnCancel.PostBackUrl == "") btnCancel.PostBackUrl = url;
                Session["page1URL"] = Request.RawUrl;
                Session["referrer"] = url;
                //int prssid = Convert.ToInt32(Request["id"]);

                //if (Session["appID"] == null) Response.Redirect("~/Admin/AccessDenied.aspx");
                //hourlyApplicationID = Session["appID"].ToString();
                getData();
                getStates();
                //chkCitizen.Checked = true;


                if (checkforpdf[0] == "") // New Associate 
                //if (checkforpdf == null) // New Associate 
                //if (Request["type"] == "n") // New Associate 
                {
                    disableControls(divPreparer);
                    divSigCertifyPreparer.Attributes.Add("Class", "col20 SigCertifyDisabled");
                    if (page1.Change == true) chkChange.Visible = false;
                    else chkChange.Enabled = false;
                    chkChange.Visible = false;
                    chkCitizen.Enabled = false;
                    chkNonCitizen.Enabled = false;
                    chkPerm.Enabled = false;
                    chkAlien.Enabled = false;
                    chkSignature.Enabled = false;
                    chkSignaturePreparer.Enabled = false;
                    chkAssistNo.Enabled = true;
                    chkAssistYes.Enabled = true;
                    //ddlStates.Enabled = false;
                    //ddlStates.CssClass = "readonly";
                    //ddlStates.Attributes.Add("color", "black");
                    ddlStates.Enabled = true;
                    ddlStates.CssClass = "readwrite";
                    //ddlStates.Attributes.Add("color", "black");
                    enableControls(divEmployee);
                    txtBirth.CssClass = "datepicker2";
                    txtBirth.Style.Add("background-color", editColor);
                    //btnPage2.Visible = false;
                    //btnSave.Visible = false;
                    //btnEdit.Visible = true;
                    //btnCancel.Visible = false;
                    //if (checkforpdf[1] == "PDF") btnViewPDF.Visible = true;
                    //btnViewPDF.Visible = true;
                }
                else
                //if (Request["type"] == "d") // DHT
                {
                    disableControls(divEmployeeAttestation);
                    disableControls(divEmployeeAttestation2);
                    disableControls(divEmpSignature);
                    disableControls(divPreparer);
                    //enableControls(divPreparer);
                    chkChange.Enabled = false;
                    txtOtherName.CssClass = "readonly";
                    txtPrepDate.CssClass = "datepicker2";
                    disableControls(divPreparerCertification);
                    divSigCertifyEmp.Attributes.Add("class", "col20 SigCertifyDisabled");
                    divSigCertifyPreparer.Attributes.Add("class", "col20 SigCertifyDisabled");
                    chkSignature.Enabled = false;
                    chkSignaturePreparer.Enabled = false;
                    txtPrepDate.CssClass = "readonly";
                }
                buttonManagement();
            }

            btnEdit.Visible = false;
            chkAssistNo.Enabled = true;
            chkAssistYes.Enabled = true;
            //if (IsPostBack)
            //{
            //    btnEdit.Visible = true;
            //}
        }

        protected void getData()
        {
            //string foo = "";
            //foo = Context.User.Identity.Name;
            //if (foo == "") Response.Redirect("~/Admin/AccessDenied.aspx");

            DataAccess da = new DataAccess();

            //UsersDB users = new UsersDB();
            //SqlDataReader drUser = users.GetSingleUser(Context.User.Identity.Name);

            //if (drUser.HasRows)
            //{
            //    drUser.Read();
            //    //prssID = (int)drUser["PRSS"];
            //    prssID = drUser["PRSS"] == DBNull.Value ? 0 : (int)drUser["PRSS"];
            //    userid = (int)drUser["UserId"];
            //    firstName = drUser["FirstName"].ToString();
            //    lastName = drUser["LastName"].ToString();
            //}

            checkforpdf = da.checkForPDF(Request.QueryString["loginname"]);

            if (checkforpdf[0] == "")
            // if (Request["type"] == "n") // New Associate 

            {

                //bool checkforpdf = da.checkForPDF(hourlyApplicationID);
                if (checkforpdf[1] == "PDF")
                {
                    SqlDataReader drFromDatabase = da.GetPDF(Request.QueryString["loginname"]);
                    fillPageFromDataReader(drFromDatabase);
                }
                //else
                //{
                //    SqlDataReader drApp = da.GetApplication(hourlyApplicationID);
                //    fillPageFromApplication(drApp);
                //}

                //if (chkSignature.Checked) btnSubmit.Visible = true;

                //SqlDataReader dr = da.GetSingleUserByID(this.userid);

                //while (dr.Read())
                //{
                //    //txtEmail.Text = dr["email"].ToString();
                //    //txtEmailH.Value = dr["email"].ToString();
                //    //if (dr["UserTxt"].ToString() != "")
                //    //    txtPhone.Text = dr["UserTxt"].ToString().Substring(0, 3) + "-" + dr["UserTxt"].ToString().Substring(3, 3) + "-" + dr["UserTxt"].ToString().Substring(6, 4);
                //    //if (dr["UserTxt"].ToString() != "") txtPhoneH.Value = dr["UserTxt"].ToString().Substring(0, 3) + "-" + dr["UserTxt"].ToString().Substring(3, 3) + "-" + dr["UserTxt"].ToString().Substring(6, 4);
                //    //userid = Convert.ToInt32(dr["userid"].ToString());
                //    LoginName = dr["LoginName"].ToString();
                //}

            }

            else
            {

                SqlDataReader drFromDatabase = da.GetPDF(hourlyApplicationID);
                //SqlDataReader dr3 = da.GetApplication(hourlyApplicationID);
                if (!drFromDatabase.HasRows) return;
                fillPageFromDataReader(drFromDatabase);

                SqlDataReader dr2 = da.GetPRSSID(prss);

                while (dr2.Read())
                {
                    this.prssID = Convert.ToInt32(dr2["prssid"]);
                    //email = dr2["email"].ToString();

                }

                SqlDataReader dr = da.GetSingleUserByID(this.userid);

                while (dr.Read())
                {
                    txtEmail.Text = dr["email"].ToString();
                    txtEmailH.Value = dr["email"].ToString();
                    if (dr["UserTxt"].ToString() != "")
                        txtPhone.Text = dr["UserTxt"].ToString().Substring(0, 3) + "-" + dr["UserTxt"].ToString().Substring(3, 3) + "-" + dr["UserTxt"].ToString().Substring(6, 4);
                    if (dr["UserTxt"].ToString() != "") txtPhoneH.Value = dr["UserTxt"].ToString().Substring(0, 3) + "-" + dr["UserTxt"].ToString().Substring(3, 3) + "-" + dr["UserTxt"].ToString().Substring(6, 4);
                    userid = Convert.ToInt32(dr["userid"].ToString());
                    LoginName = dr["LoginName"].ToString();
                }

                while (dr.Read())
                {
                    this.prssID = Convert.ToInt32(dr["prss"]);
                }

            }

            System.Web.UI.WebControls.ListItem temp1 = new System.Web.UI.WebControls.ListItem();
            temp1.Value = "";
            temp1.Text = "";
            ddlStates.Items.Add(temp1);

            SqlDataReader dr4 = da.GetStates();


            while (dr4.Read())
            {
                System.Web.UI.WebControls.ListItem temp = new System.Web.UI.WebControls.ListItem();
                temp.Value = dr4["StateID"].ToString();
                temp.Text = dr4["StateID"].ToString();
                ddlStates.Items.Add(temp);
            }

            ddlStates.SelectedValue = txtState.Text;

            //ddlStates.BackColor = System.Drawing.Color.LightBlue;

        }

        public void getStates()
        {
            DataAccess da = new DataAccess();

            SqlDataReader dr = da.GetStates();

            System.Web.UI.WebControls.ListItem temp1 = new System.Web.UI.WebControls.ListItem();
            temp1.Value = "";
            temp1.Text = "";
            ddlStates.Items.Add(temp1);

            while (dr.Read())
            {
                System.Web.UI.WebControls.ListItem temp = new System.Web.UI.WebControls.ListItem();
                temp.Value = dr["StateID"].ToString();
                temp.Text = dr["StateID"].ToString();
                ddlStates.Items.Add(temp);
            }


        }
        protected string formatDateToString(string date)
        {
            DateTime dateObject = Convert.ToDateTime(date);

            //DateTime date2 = DateTime.ParseExact(dateObject, "yyyyMMdd", CultureInfo.InvariantCulture);

            StringBuilder date1 = new StringBuilder();

            //System.DateTime.Today.Day.ToString().PadLeft(2, '0');

            if (dateObject.Month < 10) date1.Append("0" + dateObject.Month);
            else date1.Append(dateObject.Month);
            date1.Append("/");
            if (dateObject.Day < 10) date1.Append("0" + dateObject.Day);
            else date1.Append(dateObject.Day);
            date1.Append("/");
            date1.Append(dateObject.Year);

            //return date3.ToString();
            return date1.ToString();
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //return;
            Button btnLocal = (Button)sender;

            //if (checkforpdf[0] == "") // New Associate 
            if (true)
            //if (Request["type"] == "n")
            {
                page1.Status = null;
                page1.AppID = Request.QueryString["loginname"];
                page1.LastName = txtLastName.Text;
                page1.FirstName = txtFirstName.Text;
                page1.Middle = txtMiddle.Text;
                page1.otherName = txtOtherName.Text == "" ? null : txtOtherName.Text; ;
                page1.Address = txtAddress.Text;
                page1.AptNum = txtAptNum.Text == "" ? null : txtAptNum.Text;
                page1.City = txtCity.Text;
                page1.State = ddlStates.SelectedValue;
                page1.Zip = txtZip.Text == "" ? Convert.ToInt32(null) : Convert.ToInt32(txtZip.Text);
                page1.Zip4 = txtZip4.Text == "" ? Convert.ToInt32(null) : Convert.ToInt32(txtZip4.Text);
                if (txtBirth.Text.Trim() != "") page1.Birth = Convert.ToInt32(txtBirth.Text.Substring(6, 4) + txtBirth.Text.Substring(0, 2) + txtBirth.Text.Substring(3, 2));
                else page1.Birth = null;
                string tempSSN = Convert.ToString(txtSSN1.Text) + Convert.ToString(txtSSN2.Text) + Convert.ToString(txtSSN3.Text);
                if (tempSSN == "") page1.SSN = 0;
                else page1.SSN = Convert.ToInt32(tempSSN);
                //page1.SSN = Convert.ToInt32(Convert.ToString(txtSSN1.Text) + Convert.ToString(txtSSN2.Text) + Convert.ToString(txtSSN3.Text));
                page1.Email = txtEmail.Text == "" ? null : txtEmail.Text;
                page1.Phone = txtPhone.Text == "" ? (long?)null : Convert.ToInt64(txtPhone.Text.Replace("-", "").Replace(" ", "").Replace(".", ""));
                page1.Change = chkChange.Checked ? true : false;
                if (rblCitizen.SelectedIndex == 0) citizenship = "4";
                else if (rblNonCitizen.SelectedIndex == 0) citizenship = "5";
                else if (rblPerm.SelectedIndex == 0) citizenship = "6";
                else if (rblAlien.SelectedIndex == 0) citizenship = "7";
                page1.Citizenship = citizenship;
                page1.AlienNum1 = txtAlienNum1.Text == "" ? null : txtAlienNum1.Text;
                page1.AuthorizationExpDate = txtAuthorizationExpDate.Text == "" ? (int?)null : formatDateToInt(txtAuthorizationExpDate.Text);
                page1.AlienNum2 = txtAlienNum2.Text == "" ? null : txtAlienNum2.Text;
                page1.I94Num = txtI94Num.Text == "" ? null : txtI94Num.Text;
                page1.ForeignPPNum = txtForeignPPNum.Text == "" ? null : txtForeignPPNum.Text;
                page1.ForeignPPCountry = txtForeignPPCountry.Text == "" ? null : txtForeignPPCountry.Text;
                page1.Signature = txtSig.Text == "" ? null : txtSig.Text;
                page1.SignatureDate = txtSigDate.Text == "" ? (int?)null : formatDateToInt(txtSigDate.Text); ;
                if (chkSignature.Checked)
                {
                    page1.SignatureCertifyEmp = true;
                    //var date = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddMilliseconds(Convert.ToInt64(txtSignatureCertifyEmpDateH.Value)).ToLocalTime();
                    //page1.SignatureCertifyEmpDate = date;
                    //page1.SignatureCertifyEmpLogin = LoginName;
                    //page1.SignatureCertifyEmpIP = HttpContext.Current.Request.UserHostAddress;
                    //page1.SignatureDate = txtSigDate.Text == "" ? (int?)null : formatDateToInt(txtSigDate.Text); ;
                }
                else
                {
                    page1.SignatureCertifyEmp = null;
                    page1.SignatureCertifyEmpDate = null;
                    page1.SignatureCertifyEmpLogin = null;
                    page1.SignatureCertifyEmpIP = null;
                }
                //var time = TimeSpan.FromMilliseconds()

                //else page1.SignatureCertifyEmp = false;
                if (chkAssistNo.Checked) page1.Assist = false;
                if (chkAssistYes.Checked) page1.Assist = true;
                if (!chkAssistNo.Checked && !chkAssistYes.Checked) page1.Assist = null;

                page1.SignatureCertifyPrep = null;

                DataTable tbl = ModelToTable(page1);

                DataAccess da = new DataAccess();
                da.DeletePDF(Request.QueryString["loginname"]);

                SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_everify"]);
                conn.Open();
                SqlBulkCopy bulkCopy = new SqlBulkCopy(conn);

                bulkCopy.DestinationTableName = "FormI9";
                bulkCopy.WriteToServer(tbl);
                conn.Close();

                //if (chkSignature.Checked)
                //{
                //    btnSubmit.Visible = true; // da.UpdateApplication(hourlyApplicationID);
                //}

                if (chkCitizen.Checked) { cit = "4"; }
                else if (chkNonCitizen.Checked) { cit = "5"; }
                else if (chkPerm.Checked) { cit = "6"; }
                else if (chkAlien.Checked) { cit = "7"; }

                checkforpdf = da.checkForPDF(hourlyApplicationID);
                //CreatePDF();



                //btnSave.Text = "View PDF";
                //btnViewPDF.Visible = true;
                //btnSave.Visible = false;
                //btnCancel.Text = "Done";

                //Page.ClientScript.RegisterStartupScript(this.GetType(), "DisplayMessage", "saveSuccessful()", true);

                //Response.Redirect("second.aspx?id=" + prss + "&cit=" + cit); ;
            }
            else
            {
                DataAccess da = new DataAccess();
                //SqlDataReader drFromDatabase = da.GetPDF(hourlyApplicationID);
                //page1 = pdfmanager.Page1FromDataReader(drFromDatabase);
                page1.Email = page1.Email == "" ? null : page1.Email;
                page1.otherName = page1.otherName == "" ? null : page1.otherName;
                page1.AptNum = page1.AptNum == "" ? null : page1.AptNum;
                page1.AlienNum1 = page1.AlienNum1 == "" ? null : page1.AlienNum1;
                page1.AlienNum2 = page1.AlienNum2 == "" ? null : page1.AlienNum2;
                page1.I94Num = page1.I94Num == "" ? null : page1.I94Num;
                page1.ForeignPPNum = page1.ForeignPPNum == "" ? null : page1.ForeignPPNum;
                page1.ForeignPPCountry = page1.ForeignPPCountry == "" ? null : page1.ForeignPPCountry;
                page1.Signature = page1.Signature == "" ? null : page1.Signature;
                page1.SignatureCertifyEmpLogin = page1.SignatureCertifyEmpLogin == "" ? null : page1.SignatureCertifyEmpLogin;
                page1.SignatureCertifyEmpIP = page1.SignatureCertifyEmpIP == "" ? null : page1.SignatureCertifyEmpIP;

                page1.SignaturePrep = txtPrepSig.Text == "" ? null : txtPrepSig.Text;
                if (chkSignaturePreparer.Checked)
                {
                    page1.SignatureCertifyPrep = true;
                    var date = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddMilliseconds(Convert.ToInt64(txtSignatureCertifyEmpDateH.Value)).ToLocalTime();
                    page1.SignatureCertifyPrepDate = date;
                    page1.SignatureCertifyPrepLogin = LoginName;
                    page1.SignatureCertifyPrepIP = HttpContext.Current.Request.UserHostAddress;
                    divSigCertifyPreparer.Style.Add("background-color", "lightgreen");
                    //page1.SignatureDate = txtSigDate.Text == "" ? (int?)null : formatDateToInt(txtSigDate.Text); ;
                }
                else
                {
                    page1.SignatureCertifyPrep = false;
                    divSigCertifyPreparer.Style.Add("background-color", "lightsalmon");
                }
                page1.SignaturePrepDate = txtPrepDate.Text == "" ? (int?)null : formatDateToInt(txtPrepDate.Text);
                page1.PrepLastName = txtPrepLastName.Text == "" ? null : txtPrepLastName.Text;
                page1.PrepFirstName = txtPrepFirstName.Text == "" ? null : txtPrepFirstName.Text;
                page1.PrepAddress = txtPrepAddress.Text == "" ? null : txtPrepAddress.Text;
                page1.PrepCity = txtPrepCity.Text == "" ? null : txtPrepCity.Text;
                page1.PrepState = txtPrepState.Text == "" ? null : txtPrepState.Text;
                page1.PrepZip = txtPrepZip.Text == "" ? (int?)null : Convert.ToInt32(txtPrepZip.Text);
                //page1.PrepZip = txtPrepZip.Text == "" ? Convert.ToInt32(null) : Convert.ToInt32(txtPrepZip.Text);
                ///////////////////////////
                DataTable tbl = ModelToTable(page1);

                da.DeletePDF(hourlyApplicationID);

                SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_everify"]);
                conn.Open();
                SqlBulkCopy bulkCopy = new SqlBulkCopy(conn);

                bulkCopy.DestinationTableName = "FormI9";
                bulkCopy.WriteToServer(tbl);
                conn.Close();
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "DisplayMessage", "saveSuccessfulPrep()", true);

            }
            disableControls(divEmployee);
            disableControls(divEmployeeAttestation);
            disableControls(divEmployeeAttestation2);
            //disableControls(divEmpSignature);
            disableControls(divPreparerCertification);


            buttonManagement();
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

            Model.PRPF001 Employee = masterContext.PRPF001.RetrieveItem(Condition);

            masterContext.Disconnect();

            //txtLastName.Text = Employee.PRLAST;
            //txtFirstName.Text = Employee.PRFIRST;
            //txtMiddle.Text = Employee.PRMI;
            //txtAddress.Text = Employee.PRADDR1;
            //txtCity.Text = Employee.PRCITY;
            //txtState.Text = Employee.PRSTABBR;
            //txtZip.Text = Employee.PRZIP.ToString();
            txtBirth.Text = formatDateToString(Employee.PRBRTHDT.ToString());
            txtBirthH.Value = formatDateToString(Employee.PRBRTHDT.ToString());
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

            //foreach (var foo in typeof(Page1).GetProperties())
            //{
            //    tbl.Columns.Add(foo.Name);
            //}
            tbl.Columns.Add("Status");
            tbl.Columns.Add("AppID");
            tbl.Columns.Add("LastName");
            tbl.Columns.Add("FirstName");
            tbl.Columns.Add("Middle");
            tbl.Columns.Add("OtherName");
            tbl.Columns.Add("Address");
            tbl.Columns.Add("AptNum");
            tbl.Columns.Add("City");
            tbl.Columns.Add("State");
            tbl.Columns.Add("Zip");
            tbl.Columns.Add("Zip4");
            tbl.Columns.Add("Birth");
            tbl.Columns.Add("SSN");
            tbl.Columns.Add("Email");
            tbl.Columns.Add("Phone");
            tbl.Columns.Add("Change");
            tbl.Columns.Add("Citizenship");
            tbl.Columns.Add("Signature");
            tbl.Columns.Add("SignatureCertifyEmp");
            tbl.Columns.Add("Assist");

            DataRow newRow = tbl.NewRow();
            //newRow["status"] = tempModel.Status;
            newRow["AppID"] = tempModel.AppID;
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
            //newRow["AlienNum1"] = tempModel.AlienNum1;
            //newRow["AuthorizationExpDate"] = tempModel.AuthorizationExpDate;
            //newRow["AlienNum2"] = tempModel.AlienNum2;
            //newRow["I94Num"] = tempModel.I94Num;
            //newRow["ForeignPPNum"] = tempModel.ForeignPPNum;
            //newRow["ForeignPPCountry"] = tempModel.ForeignPPCountry;
            newRow["Signature"] = tempModel.Signature;
            newRow["SignatureCertifyEmp"] = tempModel.SignatureCertifyEmp;
            //newRow["SignatureCertifyEmpLogin"] = tempModel.SignatureCertifyEmpLogin;
            //newRow["SignatureCertifyEmpDate"] = tempModel.SignatureCertifyEmpDate;
            //newRow["SignatureCertifyEmpIP"] = tempModel.SignatureCertifyEmpIP;
            //newRow["SignatureDate"] = tempModel.SignatureDate;
            newRow["Assist"] = tempModel.Assist;
            //newRow["SignaturePrep"] = tempModel.SignaturePrep;
            //newRow["SignatureCertifyPrep"] = tempModel.SignatureCertifyPrep;
            //newRow["SignatureCertifyPrepLogin"] = tempModel.SignatureCertifyPrepLogin;
            //newRow["SignatureCertifyPrepDate"] = tempModel.SignatureCertifyPrepDate;
            //newRow["SignatureCertifyPrepIP"] = tempModel.SignatureCertifyPrepIP;
            //newRow["SignaturePrepDate"] = tempModel.SignaturePrepDate;
            //newRow["PrepLastName"] = tempModel.PrepLastName;
            //newRow["PrepFirstName"] = tempModel.PrepFirstName;
            //newRow["PrepAddress"] = tempModel.PrepAddress;
            //newRow["PrepCity"] = tempModel.PrepCity;
            //newRow["PrepState"] = tempModel.PrepState;
            //newRow["PrepZip"] = tempModel.PrepZip;

            tbl.Rows.Add(newRow);

            return tbl;
        }

        public void CreatePDF()
        {
            string src = HttpContext.Current.Server.MapPath("/Everify/I9Template.PDF");
            string dest = HttpContext.Current.Server.MapPath("/Everify/" + txtLastName.Text + ".pdf");
            FormI9_PDF = "/EVerify/" + txtLastName.Text + ".pdf";

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
            State.Value.SetValue(ddlStates.SelectedValue);

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

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Email = fields.First(k => k.Key == "Email");
            Email.Value.SetValue(txtEmail.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Phone = fields.First(k => k.Key == "Phone");
            Phone.Value.SetValue(txtPhone.Text);

            if (chkCitizen.Checked)
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> Citizen = fields.First(k => k.Key == "chkCitizen");
                Citizen.Value.SetValue("X");
            }
            else if (chkNonCitizen.Checked)
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> NonCitizen = fields.First(k => k.Key == "chkNonCitizen");
                NonCitizen.Value.SetValue("X");
            }
            else if (chkPerm.Checked)
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> Perm = fields.First(k => k.Key == "chkPerm");
                Perm.Value.SetValue("X");
            }
            else if (chkAlien.Checked)
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> Alien = fields.First(k => k.Key == "chkAlien");
                Alien.Value.SetValue("X");
            }

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> AlienNum1 = fields.First(k => k.Key == "AlienNum1");
            AlienNum1.Value.SetValue(txtAlienNum1.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> AuthorizationExpDate = fields.First(k => k.Key == "AuthorizationExpDate");
            AuthorizationExpDate.Value.SetValue(txtAuthorizationExpDate.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> AlienNum2 = fields.First(k => k.Key == "AlienNum2");
            AlienNum2.Value.SetValue(txtAlienNum2.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> I94Num = fields.First(k => k.Key == "I94Num");
            I94Num.Value.SetValue(txtI94Num.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> ForeignPPNum = fields.First(k => k.Key == "ForeignPPNum");
            ForeignPPNum.Value.SetValue(txtForeignPPNum.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> ForeignPPCountry = fields.First(k => k.Key == "ForeignPPCountry");
            ForeignPPCountry.Value.SetValue(txtForeignPPCountry.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> Signature = fields.First(k => k.Key == "Signature");
            Signature.Value.SetValue(txtSig.Text);

            KeyValuePair<string, iText.Forms.Fields.PdfFormField> SignatureDate = fields.First(k => k.Key == "SignatureDate");
            SignatureDate.Value.SetValue(txtSigDate.Text);

            if (chkAssistNo.Checked)
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> chkAssistNo = fields.First(k => k.Key == "AssistNo");
                chkAssistNo.Value.SetValue("X");
            }

            if (chkAssistYes.Checked)
            {
                KeyValuePair<string, iText.Forms.Fields.PdfFormField> chkAssistYes = fields.First(k => k.Key == "AssistYes");
                chkAssistYes.Value.SetValue("X");
            }

            form.FlattenFields();

            pdf.Close();

            return;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

            if (checkforpdf[0] == "") // New Associate 
            //if (Request["type"] == "n")
            {
                ddlStates.Enabled = true;
                ddlStates.CssClass = "readwrite";

                txtSig.Text = "";
                chkSignature.Checked = false;
                txtSigDate.Text = "";
                if (page1.Change == true)
                {
                    chkChange.Visible = false;
                    enableControls(divEmployee);
                    txtBirth.CssClass = "datepicker2";
                }
                else chkChange.Enabled = true;
                //if (chkChange.Checked)
                //{
                //txtLastName.CssClass = "readwrite";
                //txtFirstName.CssClass = "readwrite";
                //txtMiddle.CssClass = "readwrite";
                //txtOtherName.CssClass = "readwrite";
                //txtAddress.CssClass = "readwrite";
                //txtAptNum.CssClass = "readwrite";
                //txtCity.CssClass = "readwrite";
                //txtState.CssClass = "readwrite";
                //txtZip.CssClass = "readwrite";
                //txtZip4.CssClass = "readwrite";
                //txtBirth.CssClass = "datepicker";
                //txtSSN1.CssClass = "readwrite";
                //txtSSN2.CssClass = "readwrite";
                //txtSSN3.CssClass = "readwrite";
                //txtEmail.CssClass = "readwrite";
                //txtPhone.CssClass = "readwrite";
                chkCitizen.Enabled = true;
                chkNonCitizen.Enabled = true;
                chkPerm.Enabled = true;
                chkAlien.Enabled = true;

                if (page1.Citizenship == "7")
                {
                    //txtAuthorizationExpDate.CssClass = "readwrite";
                    txtAuthorizationExpDate.CssClass = "datepicker";
                    txtAlienNum2.CssClass = "readwrite";
                    txtI94Num.CssClass = "readwrite";
                    txtForeignPPNum.CssClass = "readwrite";
                    txtForeignPPCountry.CssClass = "readwrite";
                }

                if (page1.Citizenship == "6") txtAlienNum1.CssClass = "readwrite";

                txtSig.CssClass = "readwrite";
                chkSignature.Enabled = true;
                txtSigDate.CssClass = "datepicker2";

                //}

                chkAssistNo.Enabled = true;
                chkAssistYes.Enabled = true;
                //var foo = Request.Url.PathAndQuery;
                //Response.Redirect(foo);
            }
            else
            {
                //btnEdit.Visible = false;
                //btnViewPDF.Visible = false;
                //btnSubmit.Visible = false;
                enableControls(divPreparer);
                chkSignaturePreparer.Enabled = true;

                if (chkSignaturePreparer.Checked) divSigCertifyPreparer.Style.Add("background-color", "lightgreen");
                else divSigCertifyPreparer.Style.Add("background-color", "lightsalmon");

                //btnEdit.Visible = false;
                //btnSave.Visible = true;
                txtPrepDate.CssClass = "datepicker2";
                //ddlStates.SelectedValue = page1.State;
            }
            buttonManagement();
        }

        protected void btnViewPDF_Click(object sender, EventArgs e)
        {
            FormI9_PDF = pdfmanager.CreatePDFFromDatabase(Request.QueryString["loginname"]);
            //string strUrl = "/some/url/path" + myvar;

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + FormI9_PDF + "')", true);
            btnDone.Visible = true;
            btnViewPDF.Visible = true;
            if (SubmittedH.Value == "True") btnSubmit.Visible = false;

            // Response.Redirect(FormI9_PDF);
        }

        protected void setControls(Control tempDiv)
        {
            //LiteralControl foo0 = (LiteralControl)tempDiv.Controls[0];
            //TextBox foo1 = (TextBox)tempDiv.Controls[1];
            //LiteralControl foo2 = (LiteralControl)tempDiv.Controls[2];
            //CheckBox foo3 = (CheckBox)tempDiv.Controls[3];
            //LiteralControl foo4 = (LiteralControl)tempDiv.Controls[4];
            //TextBox foo5 = (TextBox)tempDiv.Controls[5];
            //LiteralControl foo6 = (LiteralControl)tempDiv.Controls[6];

        }

        protected void disableControls(Control tempDiv)
        {
            foreach (Control control in tempDiv.Controls)
            {
                if (control is TextBox)
                {
                    TextBox temp = (TextBox)control;
                    temp.CssClass = "readonly";
                    //temp.Enabled = false;
                }

                if (control is CheckBox)
                {
                    CheckBox temp = (CheckBox)control;
                    temp.Enabled = false;
                }

                if (control is DropDownList)
                {
                    DropDownList temp = (DropDownList)control;
                    temp.Enabled = false;
                    temp.Style.Add("backgroun-color", "lightgray");

                }
            }
        }

        protected void enableControls(Control tempDiv)
        {
            foreach (Control control in tempDiv.Controls)
            {
                if (control is TextBox)
                {
                    TextBox temp = (TextBox)control;

                    temp.CssClass = "readwrite";
                }
            }
        }

        protected void btnPage2_Click(object sender, EventArgs e)
        {
            if (Session["appID"] == null) Response.Redirect("~/Admin/AccessDenied.aspx");

            Response.Cookies.Add(new HttpCookie("Done"));
            Response.Cookies["Done"].Value = url;


            //Response.Redirect("second.aspx?id=" + hourlyApplicationID + "&cit=" + cit); ;
            Response.Redirect("second.aspx"); ;
        }

        protected void fillPageFromDataReader(SqlDataReader dr)
        {
            //Page1 page1 = pdfmanager.Page1FromDataReader(dr);
            page1 = pdfmanager.Page1FromDataReader(dr);
            txtLastName.Text = page1.LastName;
            txtFirstName.Text = page1.FirstName;
            txtMiddle.Text = page1.Middle;
            txtOtherName.Text = page1.otherName;
            txtAddress.Text = page1.Address;
            txtAptNum.Text = page1.AptNum;
            txtCity.Text = page1.City;
            txtState.Text = page1.State;

            if (page1.Zip == 0) txtZip.Text = "";
            else txtZip.Text = page1.Zip.ToString();

            if (page1.Zip4 == 0) txtZip4.Text = "";
            else txtZip4.Text = page1.Zip4.ToString();

            if (page1.Birth == 0) txtBirth.Text = "";
            else txtBirth.Text = pdfmanager.formatIntToDateString(page1.Birth ?? 0);
            if (page1.SSN.ToString().Length >= 3) txtSSN1.Text = page1.SSN.ToString().Substring(0, 3);
            if (page1.SSN.ToString().Length >= 5) txtSSN2.Text = page1.SSN.ToString().Substring(3, 2);
            if (page1.SSN.ToString().Length == 9) txtSSN3.Text = page1.SSN.ToString().Substring(5, 4);
            txtEmail.Text = page1.Email;
            txtPhone.Text = page1.Phone.ToString();
            if (page1.Change == true) chkChange.Checked = true;
            if (page1.Citizenship != null)
            {
                if (page1.Citizenship == "4") rblCitizen.SelectedIndex = 0; // chkCitizen.Checked = true
                else chkCitizen.Checked = false;

                if (page1.Citizenship == "5")
                {
                    rblCitizen.SelectedIndex = 1;
                    rblNonCitizen.SelectedIndex = 0;
                    //chkNonCitizen.Checked = true;
                    //else chkNonCitizen.Checked = false;
                }

                if (page1.Citizenship == "6")
                {
                    rblCitizen.SelectedIndex = 1;
                    rblNonCitizen.SelectedIndex = 1;
                    rblPerm.SelectedIndex = 0;
                    //chkPerm.Checked = true;
                    //else chkPerm.Checked = false;
                }

                if (page1.Citizenship == "7")
                {
                    rblCitizen.SelectedIndex = 1;
                    rblNonCitizen.SelectedIndex = 1;
                    rblPerm.SelectedIndex = 1;
                    rblAlien.SelectedIndex = 0;
                    //chkAlien.Checked = true;
                    //else chkAlien.Checked = false;
                }
            }
            cit = page1.Citizenship;
            txtAlienNum1.Text = page1.AlienNum1;
            txtAuthorizationExpDate.Text = pdfmanager.formatIntToDateString(page1.AuthorizationExpDate);
            txtAlienNum2.Text = page1.AlienNum2;
            txtI94Num.Text = page1.I94Num;
            txtForeignPPNum.Text = page1.ForeignPPNum;
            txtForeignPPCountry.Text = page1.ForeignPPCountry;
            txtSig.Text = page1.Signature;
            if (page1.SignatureCertifyEmp == true) chkSignature.Checked = true;
            txtSigDate.Text = pdfmanager.formatIntToDateString(page1.SignatureDate);
            if (page1.Assist == false) chkAssistNo.Checked = true;
            if (page1.Assist == true) chkAssistYes.Checked = true;
            txtPrepSig.Text = page1.SignaturePrep;
            if (page1.SignatureCertifyPrep == true)
            {
                chkSignaturePreparer.Checked = true;
                divSigCertifyPreparer.Attributes.Add("background-color", "lightgray");
            }
            txtPrepDate.Text = pdfmanager.formatIntToDateString(page1.SignaturePrepDate);
            txtPrepLastName.Text = page1.PrepLastName;
            txtPrepFirstName.Text = page1.PrepFirstName;
            txtPrepAddress.Text = page1.PrepAddress;
            txtPrepCity.Text = page1.PrepCity;
            txtPrepState.Text = page1.PrepState;
            txtPrepZip.Text = page1.PrepZip.ToString();
            
        }

        protected void fillPageFromApplication(SqlDataReader dr)
        {
            while (dr.Read())
            {
                this.userid = (int)dr["userid"];
                txtLastName.Text = dr["LastName"].ToString();
                txtLastNameH.Value = dr["LastName"].ToString();
                txtFirstName.Text = dr["FirstName"].ToString();
                txtFirstNameH.Value = dr["FirstName"].ToString();
                txtMiddle.Text = dr["MI"].ToString();
                txtMiddleH.Value = dr["MI"].ToString();
                txtOtherName.Text = txtOtherName.Attributes["prompt"];
                txtAddress.Text = dr["StreetAddress"].ToString();
                txtAddressH.Value = dr["StreetAddress"].ToString();
                txtAptNum.Text = txtAptNum.Attributes["prompt"];
                txtCity.Text = dr["City"].ToString();
                txtCityH.Value = dr["City"].ToString();
                txtState.Text = dr["State"].ToString();
                txtStateH.Value = dr["State"].ToString();
                txtZip.Text = dr["ZIP"].ToString().Substring(0, 5);
                txtZipH.Value = dr["ZIP"].ToString().Substring(0, 5);
                if (dr["ZIP"].ToString().Length == 10)
                {
                    txtZip4.Text = dr["ZIP"].ToString().Substring(6, 4);
                    txtZip4H.Value = dr["ZIP"].ToString().Substring(6, 4);
                }
                txtSSN1.Text = (string)dr["ssn"].ToString().Substring(0, 3);
                txtSSN1H.Value = (string)dr["ssn"].ToString().Substring(0, 3);
                txtSSN2.Text = (string)dr["ssn"].ToString().Substring(3, 2);
                txtSSN2H.Value = (string)dr["ssn"].ToString().Substring(3, 2);
                txtSSN3.Text = (string)dr["ssn"].ToString().Substring(5, 4);
                txtSSN3H.Value = (string)dr["ssn"].ToString().Substring(5, 4);
                txtEmail.Text = txtEmail.Attributes["prompt"];
                txtPhone.Text = txtPhone.Attributes["prompt"];
                prss = Convert.ToInt32(txtSSN1.Text + txtSSN2.Text + txtSSN3.Text);
                txtBirth.Text = formatDateToString(dr["DOB"].ToString());
                txtBirthH.Value = formatDateToString(dr["DOB"].ToString());
            }

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (btnSave.Visible) Response.Redirect(this.Request.Url.ToString());
            else Response.Redirect(url);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //DataAccess da = new DataAccess();
            //string status = "";
            //if (chkSignature.Checked) status = "Page 1 Complete";
            //if (chkSignature.Checked) da.UpdateApplication(hourlyApplicationID, status);

            //SqlDataReader EmailData = da.GetEmailData(4);
            //da.SendEmail(EmailData, firstName + " " + lastName);

            //btnSubmit.Visible = false;
            //btnEdit.Visible = false;
            //btnViewPDF.Visible = true;

            //buttonManagement();

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "DisplayMessage2", "submitSuccessful()", true);

            Response.Redirect("login.aspx");

        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {

            DataAccess da = new DataAccess();
            SqlDataReader EmailData = da.GetEmailData(4);
            da.SendEmail(EmailData, firstName + " " + lastName);

        }

        protected void buttonManagement()
        {
            //StackFrame stack = new StackFrame(1, true);
            StackTrace trace = new StackTrace();

            btnEdit.Visible = false;
            btnEmail.Visible = false;

            if (txtLastName.Text.Trim() != "")
            {
                   btnViewPDF.Visible = true;
            }

            //if (checkforpdf[0] == "" && checkforpdf[1] == "PDF")
            //{
            //    btnViewPDF.Visible = true;
            //}
            //else {
            //    btnViewPDF.Visible = false;
            //    
            //}

            if (page1.SignatureCertifyEmp == null) btnSubmit.Visible = false;

            if (page1.Status == "Page 1 Complete")
            {
                btnSave.Visible = false;
                if (page1.CertifyCertifySignature == true) btnSubmit.Visible = true;
                else btnSubmit.Visible = false;
            }

            if (page1.Status == "Page 2 Complete")
            {
                btnEdit.Visible = false;
                btnSave.Visible = false;
                btnSubmit.Visible = false;
                btnViewPDF.Visible = true;

            }
            //else btnEdit.Visible = true;

            string methodname = trace.GetFrame(1).GetMethod().Name;

            if (methodname == "Page_Load")
            {
                btnCancel.Visible = false;
                if (checkforpdf[0] == "") // New Associate 
                //if (checkforpdf == null) // New Associate 
                {
                    btnPage2.Visible = false;
                    btnSave.Visible = false;
                    btnSubmit.Visible = false;
                    btnEdit.Visible = true;
                    btnCancel.Visible = false;
                    //if (checkforpdf[1] == "PDF") btnViewPDF.Visible = true;
                    if (checkforpdf != null) btnViewPDF.Visible = true;
                    else btnViewPDF.Visible = false;
                }

                //if (page1.Status == "Page 1 Complete" || page1.Status == "Page 2 Complete")
                //{
                else btnViewPDF.Visible = true;
                //}

                if (page1.SignatureCertifyEmp == true && page1.Status == null) btnSubmit.Visible = true;
                if (page1.Status == "Page 1 Complete") btnSubmit.Visible = false;

            } //End Page_Load

            if (methodname == "btnSave_Click")
            {
                btnCancel.Visible = false;
                btnDone.Visible = true;
                btnSave.Visible = false;
                btnViewPDF.Visible = true;
                if (page1.SignatureCertifyEmp == true && page1.Status == null) btnSubmit.Visible = true;
            }

            if (methodname == "btnSubmit_Click") btnDone.Visible = true;

            if (methodname == "btnEdit_Click")
            {
                if (checkforpdf[0] == "") // New Associate 
                                          //if (Request["type"] == "n")
                {

                    btnEdit.Visible = false;
                    btnSubmit.Visible = false;
                    btnViewPDF.Visible = false;
                    btnCancel.Visible = true;
                    btnDone.Visible = false;
                    btnSave.Visible = true;
                }

                else
                {
                    btnCancel.Visible = true;
                    btnDone.Visible = false;
                    btnEdit.Visible = false;
                    btnViewPDF.Visible = false;
                    btnSubmit.Visible = false;
                    btnSave.Visible = true;

                }
            }

            if (methodname == "btnSave_Click")
            {
                btnSave.Visible = false;
                btnEdit.Visible = true;
                if (page1.SignatureCertifyEmp == true && page1.Status == null) btnSubmit.Visible = true;
                else btnSubmit.Visible = false;

            }

            if (methodname == "btnSubmit_Click")
            {
                btnSubmit.Visible = false;
                btnEdit.Visible = false;
                btnViewPDF.Visible = true;

            }

            if (chkSignature.Checked == true) btnSubmit.Visible = true;
            else btnSubmit.Visible = false;


            //btnEmail.Visible = true; 
            //btnViewPDF.Visible = true;
            //btnEdit.Visible = true;
            //btnSave.Visible = true;
            //btnSubmit.Visible = true;
            //btnCancel.Visible = true;
            //btnDone.Visible = true;
            //btnPage2.Visible = true;
        }


        protected void btnDone_Click(object sender, EventArgs e)

        {
            //if (btnSave.Visible) Response.Redirect(this.Request.Url.ToString());
            //else 
            Response.Redirect("login.aspx");
        }

        protected void btnContinueEmployee_Click(object sender, EventArgs e)
        {
            bool runScript = true;
            Button btnLocal = (Button)sender;
            chkAssistNo.Enabled = true;
            chkAssistYes.Enabled = true;

            btnSave_Click(sender, e);

            divCitizenhipQuestions.Style.Remove("display");
            divCitizenhipQuestions.Style.Add("display", "flex");
            btnContinueEmployee.Visible = false;

            enableControls(divEmployee);
            ddlStates.CssClass = "readwrite";

            enableControls(divEmployeeAttestation);
            ddlStates.Enabled = true;
            if (rblCitizen.SelectedIndex == 1)
            {
                divChkNonCitizen.Style.Add("display", "block");
                //divEmpSignature.Style.Add("display", "none");
            }
            else if (rblCitizen.SelectedIndex == 0)
            {
                divChkNonCitizen.Style.Add("display", "none");
                divChkPerm.Style.Add("display", "none");
                divChkAlien.Style.Add("display", "none");
                divEmployeeAttestation.Style.Add("display", "none");
                //divEmpSignature.Style.Add("display", "flex");
            }

            if (rblNonCitizen.SelectedIndex == 0)
            {
                divChkNonCitizen.Style.Add("display", "block");
                divChkPerm.Style.Add("display", "none");
                divChkAlien.Style.Add("display", "none");
                divEmployeeAttestation.Style.Add("display", "none");
                //divEmpSignature.Style.Add("display", "flex");

            }
            else if (rblNonCitizen.SelectedIndex == 1)
            {
                divChkPerm.Style.Add("display", "block");
                divEmployeeAttestation.Style.Add("display", "none");
            }

            if (rblPerm.SelectedIndex == 0)
            {
                divChkAlien.Style.Add("display", "none");
                divNoncitizen.Style.Add("display", "block");

                divEmployeeAttestation.Style.Add("display", "block");
                divPerm.Style.Add("display", "block");
                divCitizen.Style.Add("display", "none");
                divNoncitizen.Style.Add("display", "none");
                divAlien.Style.Add("display", "none");
            }
            else if (rblPerm.SelectedIndex == 1)
            {
                divChkAlien.Style.Add("display", "block");
            }

            if (rblAlien.SelectedIndex == 0)
            {
                divEmployeeAttestation.Style.Add("display", "block");
                divPerm.Style.Add("display", "none");
                divCitizen.Style.Add("display", "none");
                divNoncitizen.Style.Add("display", "none");
                divAlien.Style.Add("display", "block");


            }

            if (rblCitizen.SelectedIndex == 0 || rblNonCitizen.SelectedIndex == 0 || rblPerm.SelectedIndex == 0 || rblAlien.SelectedIndex == 0)
            {
                divPreparerCertification.Style.Remove("display");
                divPreparerCertification.Style.Add("display", "block");

            }

            //if (chkAssistNo.Checked == true || chkAssistYes.Checked == true)
            //{
            //    divPreparer.Style.Remove("display");
            //    divPreparer.Style.Add("display", "block");
            //}

            if (btnLocal.ID == "btnContinueEmployee")
            {
                if (cit != "")
                {
                    chkAssistNo.Enabled = true;
                    chkAssistYes.Enabled = true;
                }
            }

            if (btnLocal.ID == "btnContinueEmployeeAttestation") { }

            if (btnLocal.ID == "btnContinuePreparerCertification")
            {
                if (chkAssistNo.Checked == true || chkAssistYes.Checked == true)
                {
                    enableControls(divEmpSignature);
                    divEmpSignature.Style.Remove("display");
                    divEmpSignature.Style.Add("display", "block");
                    btnContinuePreparerCertification.Visible = false;
                    txtSigDate.CssClass = "datepicker2";
                    chkSignature.Enabled = true;

                }

                else runScript = false;
                btnEdit.Visible = true;
                btnViewPDF.Visible = true;
            }

            if (chkSignature.Checked == true) btnContinueEmployeeSignature.Visible = false;
            //if (runScript == true)
            //{
            //    string call = "setContinueButtons(" + btnLocal.ID + ")";
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "foo1", call, true);
            //}
        }

        protected void test()
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "foo1", "alert('fired!')", true);
        }
    }

}
