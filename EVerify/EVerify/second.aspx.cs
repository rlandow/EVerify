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
using EVerify.Models;
using WHInfo.Portal;

namespace EVerify
{
    public partial class second : System.Web.UI.Page
    {
        static string FormI9_PDF;
        string hourlyApplicationID;
        static string LoginName;
        static Page1 page1 = new Page1();
        PDFManger pdfmanager = new PDFManger();
        int? prssID = 0;
        static string url = "";
        int userid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["appID"] == null) Response.Redirect("~/Admin/AccessDenied.aspx");
            hourlyApplicationID = Session["appID"].ToString();
            string foo = "";
            foo = Context.User.Identity.Name;
            if (foo == "") Response.Redirect("~/Admin/AccessDenied.aspx");

            if (Session["appID"] == null) Response.Redirect("~/Admin/AccessDenied.aspx");
            hourlyApplicationID = Session["appID"].ToString();

            if (!IsPostBack)
            {
                //hourlyApplicationID = Request["id"].ToString();

                //getData();
                disableControls(divListA);
                disableControls(divDocAB);
                txtDocsAdditional.CssClass = "readonly";
                txtFirstWorkDate.CssClass = "readonly";
                disableControls(divCertify);
                disableControls(divReverifyName);
                disableControls(divReveirfyDoc);
                disableControls(divReverifySignature);
                if (url == "") url = Request.UrlReferrer.ToString(); // Session["referrer"].ToString();
                                                                     //if (btnCancel.PostBackUrl == "") btnCancel.PostBackUrl = url;

                string done = Request.Cookies["Done"].Value;

                btnSave.Visible = false;
                btnSubmit.Visible = false;
                chkSignature.Enabled = false;
                chkSignatureReverify.Enabled = false;

                DataAccess da = new DataAccess();
                //int prss = Convert.ToInt32(Request["id"]);
                if (Session["appID"] == null) Response.Redirect("~/Admin/AccessDenied.aspx");
                hourlyApplicationID = Session["appID"].ToString();

                SqlDataReader dr = da.GetApplication(hourlyApplicationID);
                //SqlDataReader dr = da.GetApplication(Request["id"].ToString());
                while (dr.Read())
                {
                    lblLastName.Text = dr["LastName"].ToString();
                    lblFirstName.Text = dr["FirstName"].ToString();
                    lblMiddle.Text = dr["MI"].ToString();

                    //txtName.Text = Request["name"];
                }

                string cit = Request["cit"];

                if (cit == "4") { lblCit.Text = "Citizen"; }
                else if (cit == "5") { lblCit.Text = "Non-citizen"; }
                else if (cit == "6") { lblCit.Text = "Permanent Resident"; }
                else if (cit == "7") { lblCit.Text = "Alien"; }

                GetStates(ddlDocA1Issuer);
                GetStates(ddlDocA2Issuer);
                GetStates(ddlDocA3Issuer);
                GetStates(ddlDocBIssuer);
                GetStates(ddlDocCIssuer);

                getData();

                if (page1.CertifyCertifySignature == true && page1.Status != "Page 2 Complete") btnSubmit.Visible = true;
                btnDone.Visible = true;
                btnCancel.Visible = false;
            }
            
        }

        protected void getData()
        {
            DataAccess da = new DataAccess();

            UsersDB users = new UsersDB();
            SqlDataReader drUser = users.GetSingleUser(Context.User.Identity.Name);

            if (drUser.HasRows)
            {
                drUser.Read();
                //prssID =  (int)drUser["PRSS"];
                userid = (int)drUser["UserId"];
                LoginName = drUser["LoginName"].ToString();
            }

            SqlDataReader drFromDatabase = da.GetPDF(hourlyApplicationID);

            if (!drFromDatabase.HasRows) return;
            fillPageFromDataReader(drFromDatabase);

        }
        protected void btnPage1_Click(object sender, EventArgs e)
        {
            Response.Redirect(Session["page1URL"].ToString());
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (btnSave.Visible)
            {
                DataAccess da = new DataAccess();
                SqlDataReader drFromDatabase = da.GetPDF(hourlyApplicationID);
                fillPageFromDataReader(drFromDatabase);

                disableControls(divListA);
                disableControls(divDocAB);
                txtDocsAdditional.CssClass = "readonly";
                txtFirstWorkDate.CssClass = "readonly";
                disableControls(divCertify);
                disableControls(divReverifyName);
                disableControls(divReveirfyDoc);
                disableControls(divReverifySignature);
                if (url == "") url = Request.UrlReferrer.ToString(); // Session["referrer"].ToString();
                                                                     //if (btnCancel.PostBackUrl == "") btnCancel.PostBackUrl = url;
                btnSave.Visible = false;
                btnEdit.Visible = true;
                btnCancel.Visible = false;
                btnViewPDF.Visible = true;
                chkSignature.Enabled = false;
                if (page1.CertifyCertifySignature == true)
                {
                    chkSignature.Checked = true;
                    divSignatureCertified.Style.Add("background-color", "lightgreen");
                    btnSubmit.Visible = true;

                }
                else
                {
                    chkSignature.Checked = false;
                    divSignatureCertified.Style.Add("background-color", "lightsalmon");
                }
                chkSignatureReverify.Enabled = false;

            }
            else Response.Redirect(url);
            //if (btnSave.Visible) Response.Redirect(this.Request.Url.ToString());
            //else Response.Redirect(url2);
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
                    temp.CssClass = "readonly";
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

                    temp.CssClass = "";

                    temp.CssClass = "readwrite";
                }

                if (control is CheckBox)
                {
                    CheckBox temp = (CheckBox)control;
                    temp.Enabled = true;
                }

                if (control is DropDownList)
                {
                    DropDownList temp = (DropDownList)control;
                    temp.Enabled = true;
                    temp.CssClass = "readwrite";
                }
            }
        }

        protected void btnViewPDF_Click(object sender, EventArgs e)
        {
            FormI9_PDF = pdfmanager.CreatePDFFromDatabase(hourlyApplicationID);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + FormI9_PDF + "#zoom=75','_blank')", true);
            //Response.Redirect(FormI9_PDF);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            btnViewPDF.Visible = false;
            enableControls(divListA);
            enableControls(divDocAB);
            enableControls(divCertify);
            enableControls(divReverifyName);
            enableControls(divReveirfyDoc);
            enableControls(divReverifySignature);

            txtDocsAdditional.CssClass = "readwrite";
            txtFirstWorkDate.CssClass = "readwrite";

            btnEdit.Visible = false;
            btnDone.Visible = false;
            btnCancel.Visible = true;
            btnSave.Visible = true;
            btnSubmit.Visible = false;

            txtDocA1Date.CssClass = "datepicker";
            txtDocA2Date.CssClass = "datepicker";
            txtDocA2Date.CssClass = "datepicker";
            txtDocBDate.CssClass = "datepicker";
            txtDocCDate.CssClass = "datepicker";
            txtCertifyDate.CssClass = "datepicker2";
            txtReverifyDocDate.CssClass = "datepicker";
            txtReverifyDate.CssClass = "datepicker2";
            txtDocA3Date.CssClass = "datepicker";
            txtFirstWorkDate.CssClass = "datepicker2";
            txtReverifyRehireDate.CssClass = "datepicker2";

            chkSignature.Enabled = true;
            chkSignature.Checked = false;
            
            divSignatureCertified.Style.Add("background-color", "lightsalmon");

            chkSignatureReverify.Enabled = true;
            chkSignatureReverify.Checked = false;

            divSignatureCertifiedReverify.Style.Add("background-color", "lightsalmon");

            if (ddlDocA1Title.SelectedItem.Text == "None")
            {
                ddlDocA2Title.Enabled = false;
                ddlDocA2Title.CssClass = "readonly";
                ddlDocA2Issuer.Enabled = false;
                ddlDocA2Issuer.CssClass = "readonly";
                txtDocA2Issuer.CssClass = "readonly";
                txtDocA2Number.CssClass = "readonly";
                txtDocA2Date.CssClass = "readonly";
                ddlDocA3Title.Enabled = false;
                ddlDocA3Title.CssClass = "readonly";
                ddlDocA3Issuer.Enabled = false;
                txtDocA3Issuer.CssClass = "readonly";
                ddlDocA3Issuer.CssClass = "readonly";
                txtDocA3Number.CssClass = "readonly";
                txtDocA3Date.CssClass = "readonly";

            }

            if (ddlDocA2Title.SelectedItem.Text == "None")
            {
                ddlDocA3Title.Enabled = false;
                ddlDocA3Title.CssClass = "readonly";
                ddlDocA3Issuer.Enabled = false;
                ddlDocA3Issuer.CssClass = "readonly";
                txtDocA3Issuer.CssClass = "readonly";
                txtDocA3Number.CssClass = "readonly";
                txtDocA3Date.CssClass = "readonly";
            }

            if (page1.DocA2Title != "") Page.ClientScript.RegisterStartupScript(this.GetType(), "func", "none1();", true);
            if (page1.DocA3Title != "") Page.ClientScript.RegisterStartupScript(this.GetType(), "func2", "none2();", true);
        }

        protected void fillPageFromDataReader(SqlDataReader dr)
        {
            page1 = pdfmanager.Page1FromDataReader(dr);
            if (page1.DocA1Title != "28") ddlDocA1Title.SelectedValue = page1.DocA1Title.Replace(" ", ""); 
            txtDocA1Number.Text = page1.DocA1Num.ToString();
            txtDocA1Date.Text = pdfmanager.formatIntToDateString(page1.DocA1Date);
            txtDocA1Issuer.Text = page1.DocA1Issuer;
            //ddlDocA1Issuer.SelectedValue = page1.DocA1Issuer;

            //if (page1.DocA1Title != "28") ddlDocA2Title.SelectedValue = page1.DocA2Title;
            ddlDocA2Title.SelectedValue = page1.DocA2Title.Replace(" ", "");
            txtDocA2Issuer.Text = page1.DocA2Issuer;
            //ddlDocA2Issuer.SelectedValue = page1.DocA2Issuer;
            txtDocA2Number.Text = (object)page1.DocA2Num == null ? "" : page1.DocA2Num.ToString();
            txtDocA2Date.Text = pdfmanager.formatIntToDateString(page1.DocA2Date);


            //if (page1.DocA1Title != "28") ddlDocA3Title.SelectedValue = page1.DocA3Title;
            ddlDocA3Title.SelectedValue = page1.DocA3Title.Replace(" ", "");
            txtDocA3Issuer.Text = page1.DocA3Issuer;
            //ddlDocA3Issuer.SelectedValue = page1.DocA3Issuer;
            txtDocA3Number.Text = (object)page1.DocA3Num == null ? "" : page1.DocA3Num.ToString(); 
            txtDocA3Date.Text = pdfmanager.formatIntToDateString(page1.DocA3Date);


            ddlDocBTitle.SelectedValue = page1.DocBTitle.Replace(" ", "");

            if (ddlDocBTitle.SelectedValue == "1" || ddlDocBTitle.SelectedValue == "2") ddlDocBIssuer.SelectedValue = page1.DocBIssuer;
            else txtDocBIssuer.Text = page1.DocBIssuer;
            //txtDocBIssuer.Text = page1.DocBIssuer;

            txtDocBNumber.Text = (object)page1.DocBNum == null ? "" : page1.DocBNum.ToString();
            txtDocBDate.Text = pdfmanager.formatIntToDateString(page1.DocBDate);

            ddlDocCTitle.SelectedValue = page1.DocCTitle.Replace(" ", "");

            txtDocCIssuer.Text = (object)page1.DocCIssuer == null ? "" : page1.DocCIssuer.ToString();

            //ddlDocCIssuer.SelectedValue = page1.DocCIssuer;
            txtDocCNumber.Text = (object)page1.DocCNum == null ? "" : page1.DocCNum.ToString();
            txtDocCDate.Text = pdfmanager.formatIntToDateString(page1.DocCDate);

            txtDocsAdditional.Text = page1.DocsAdditional.ToString();

            txtFirstWorkDate.Text = pdfmanager.formatIntToDateString(page1.FirstWorkDate);

            txtCertifySignature.Text = page1.CertifySignature;
            if (page1.CertifyCertifySignature == true) {
                chkSignature.Checked = true;
                divSignatureCertified.Style.Add("background-color", "lightgreen");
            }
            else divSignatureCertified.Style.Add("background-color", "lightsalmon");
            txtCertifyDate.Text = pdfmanager.formatIntToDateString(page1.CertifyDate);
            txtCertifyTitle.Text = page1.CertifyTitle;
            txtCertifyLastName.Text = page1.CertifyLastName;
            txtCertifyFirstName.Text = page1.CertifyFirstName;
            //txtCertifyCompany.Text = page1.CertifyCompany;
            //txtCertifyAddress.Text = page1.CertifyAddress;
            //txtCertifyCity.Text = page1.CertifyCity;
            //txtCertifyState.Text = page1.CertifyState;
            //txtCertifyZip.Text = page1.CertifyZip.ToString();

            txtReverifyLastName.Text = page1.ReverifyLastName;
            txtReverifyFirstName.Text = page1.ReverifyFirstName;
            txtReverifyMiddle.Text = page1.ReverifyMiddle;
            txtReverifyRehireDate.Text = pdfmanager.formatIntToDateString(page1.ReverifyRehireDate);
            txtReverifyDocTitle.Text = page1.ReverifyDocTitle;
            txtReverifyDocNumber.Text = page1.ReverifyDocNum;
            txtReverifyDocDate.Text = pdfmanager.formatIntToDateString(page1.ReverifyDocDate);
            txtReverifySignature.Text = page1.ReverifySignature;
            if (page1.ReverifySignatureCertify == true)
            {
                chkSignatureReverify.Checked = true;
                divSignatureCertifiedReverify.Style.Add("background-color", "lightgreen");
            }


            txtReverifyDate.Text = pdfmanager.formatIntToDateString(page1.ReverifyDate);
            txtReverifyName.Text = page1.ReverifyName;

            if (page1.Status.Trim() == "Page 2 Complete")
            {
                btnEdit.Visible = false;
                btnSubmit.Visible = false;
            }
            else btnEdit.Visible = true;

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            page1.otherName = page1.otherName == "" ? null : page1.otherName;
            page1.AptNum = page1.AptNum == "" ? null : page1.AptNum;
            page1.Email = page1.Email == "" ? null : page1.Email;
            page1.AlienNum1 = page1.AlienNum1 == "" ? null : page1.AlienNum1;
            page1.AlienNum2 = page1.AlienNum2 == "" ? null : page1.AlienNum2;
            page1.I94Num = page1.I94Num == "" ? null : page1.I94Num;
            page1.ForeignPPNum = page1.ForeignPPNum == "" ? null : page1.ForeignPPNum;
            page1.ForeignPPCountry = page1.ForeignPPCountry == "" ? null : page1.ForeignPPCountry;
            page1.Signature = page1.Signature == "" ? null : page1.Signature;
            page1.SignatureCertifyEmpLogin = page1.SignatureCertifyEmpLogin == "" ? null : page1.SignatureCertifyEmpLogin;
            page1.SignatureCertifyEmpIP = page1.SignatureCertifyEmpIP == "" ? null : page1.SignatureCertifyEmpIP;
            page1.PrepLastName = page1.PrepLastName == "" ? null : page1.PrepLastName;
            page1.PrepFirstName = page1.PrepFirstName == "" ? null : page1.PrepFirstName;
            page1.PrepAddress = page1.PrepAddress == "" ? null : page1.PrepAddress;
            page1.PrepCity = page1.PrepCity == "" ? null : page1.PrepCity;
            page1.PrepState = page1.PrepState == "" ? null : page1.PrepState;
            page1.SignaturePrep = page1.SignaturePrep == "" ? null : page1.SignaturePrep;

            page1.DocA1Title = ddlDocA1Title.SelectedValue == "" ? null : ddlDocA1Title.SelectedValue;
            page1.DocA1Issuer = txtDocA1Issuer.Text.Trim() == "" ? null : txtDocA1Issuer.Text;
            //page1.DocA1Issuer = ddlDocA1Issuer.SelectedValue == "" ? null : ddlDocA1Issuer.SelectedValue;
            page1.DocA1Num = txtDocA1Number.Text;
            page1.DocA1Date = txtDocA1Date.Text == "" ? (int?)null : formatDateToInt(txtDocA1Date.Text);

            page1.DocA2Title = ddlDocA2Title.SelectedValue == "" ? null : ddlDocA2Title.SelectedValue;
            page1.DocA2Issuer = txtDocA2Issuer.Text.Trim() == "" ? null : txtDocA2Issuer.Text;
            //page1.DocA2Issuer = ddlDocA2Issuer.SelectedValue == "" ? null : ddlDocA2Issuer.SelectedValue;
            page1.DocA2Num = txtDocA2Number.Text;
            page1.DocA2Date = txtDocA2Date.Text == "" ? (int?)null : formatDateToInt(txtDocA2Date.Text);

            page1.DocA3Title = ddlDocA3Title.SelectedValue == "" ? null : ddlDocA3Title.SelectedValue;
            page1.DocA3Issuer = txtDocA3Issuer.Text.Trim() == "" ? null : txtDocA3Issuer.Text;
            //page1.DocA3Issuer = ddlDocA3Issuer.SelectedValue == "" ? null : ddlDocA3Issuer.SelectedValue;
            page1.DocA3Num = txtDocA3Number.Text;
            page1.DocA3Date = txtDocA3Date.Text == "" ? (int?)null : formatDateToInt(txtDocA3Date.Text);

            page1.DocBTitle = ddlDocBTitle.SelectedValue == "" ? null : ddlDocBTitle.SelectedValue;

            if (ddlDocBTitle.SelectedValue == "") page1.DocBIssuer = null;
            else if (ddlDocBTitle.SelectedValue == "1" || ddlDocBTitle.SelectedValue == "2") 
                page1.DocBIssuer = ddlDocBIssuer.SelectedValue == "" ? null : ddlDocBIssuer.SelectedValue;
            else page1.DocBIssuer = txtDocBIssuer.Text == "" ? null : txtDocBIssuer.Text;

            page1.DocBNum = txtDocBNumber.Text;
            page1.DocBDate = txtDocBDate.Text == "" ? (int?)null : formatDateToInt(txtDocBDate.Text);

            page1.DocCTitle = ddlDocCTitle.SelectedValue == "" ? null : ddlDocCTitle.SelectedValue;

            if (ddlDocCTitle.SelectedValue == "") page1.DocCIssuer = null;
            else page1.DocCIssuer = txtDocCIssuer.Text == "" ? null : txtDocCIssuer.Text;
            //page1.DocCIssuer = ddlDocCIssuer.SelectedValue == "" ? null : ddlDocCIssuer.SelectedValue;

            page1.DocCNum = txtDocCNumber.Text;
            page1.DocCDate = txtDocCDate.Text == "" ? (int?)null : formatDateToInt(txtDocCDate.Text);

            page1.DocsAdditional = txtDocsAdditional.Text == "" ? null : txtDocsAdditional.Text;

            page1.FirstWorkDate = txtFirstWorkDate.Text == "" ? (int?)null : formatDateToInt(txtFirstWorkDate.Text);

            page1.CertifySignature = txtCertifySignature.Text == "" ? null : txtCertifySignature.Text;
            if (chkSignature.Checked)
            {
                page1.CertifyCertifySignature = true;
                var date = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddMilliseconds(Convert.ToInt64(txtCertifyCertifySignatureDateH.Value)).ToLocalTime();
                page1.CertifyCertifySignatureDate = date;
                page1.CertifyCertifySignatureLogin = LoginName;
                page1.CertifyCertifySignatureIP = HttpContext.Current.Request.UserHostAddress;

            }
            else
            {
                page1.CertifyCertifySignature = null;
                page1.CertifyCertifySignatureDate = null;
                page1.CertifyCertifySignatureLogin = null;
                page1.CertifyCertifySignatureIP = null;
            }
            page1.CertifyDate = txtCertifyDate.Text == "" ? (int?)null : formatDateToInt(txtCertifyDate.Text);
            page1.CertifyTitle = txtCertifyTitle.Text == "" ? null : txtCertifyTitle.Text;
            page1.CertifyLastName = txtCertifyLastName.Text == "" ? null : txtCertifyLastName.Text;
            page1.CertifyFirstName = txtCertifyFirstName.Text == "" ? null : txtCertifyFirstName.Text;
            //page1.CertifyCompany = txtCertifyCompany.Text == "" ? null : txtCertifyCompany.Text;
            //page1.CertifyAddress = txtCertifyAddress.Text == "" ? null : txtCertifyAddress.Text;
            //page1.CertifyCity = txtCertifyCity.Text == "" ? null : txtCertifyCity.Text;
            //page1.CertifyState = txtCertifyState.Text == "" ? null : txtCertifyState.Text;
            //page1.CertifyZip = txtCertifyZip.Text == "" ? (int?)null : Convert.ToInt32(txtCertifyZip.Text);

            page1.CertifyCompany = "Waffle House";
            page1.CertifyAddress = "5986 Financial Drive";
            page1.CertifyCity = "Norcross";
            page1.CertifyState = "GA";
            page1.CertifyZip = 30071;
            page1.ReverifyLastName = txtReverifyLastName.Text == "" ? null : txtReverifyLastName.Text ;
            page1.ReverifyFirstName = txtReverifyFirstName.Text == "" ? null : txtReverifyFirstName.Text ;
            page1.ReverifyMiddle = txtReverifyMiddle.Text == "" ? null : txtReverifyMiddle.Text ;
            page1.ReverifyRehireDate = txtReverifyRehireDate.Text == "" ? (int?)null : formatDateToInt(txtReverifyRehireDate.Text);
            page1.ReverifyDocTitle = txtReverifyDocTitle.Text == "" ? null : txtReverifyDocTitle.Text ;
            page1.ReverifyDocNum = txtReverifyDocNumber.Text == "" ? null : txtReverifyDocNumber.Text ;
            page1.ReverifyDocDate = txtReverifyDocDate.Text == "" ? (int?)null : formatDateToInt(txtReverifyDocDate.Text);
            page1.ReverifySignature = txtReverifySignature.Text == "" ? null : txtReverifySignature.Text;

            if (chkSignatureReverify.Checked)
            {
                page1.ReverifySignatureCertify = true;
                var date = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddMilliseconds(Convert.ToInt64(txtReverifySignatureCertifyDateH.Value)).ToLocalTime();
                page1.ReverifySignatureCertifyDate = date;
                page1.ReverifySignatureCertifyLogin = LoginName;
                page1.ReverifySignatureCertifyIP = HttpContext.Current.Request.UserHostAddress;
            }
            else page1.ReverifySignatureCertify = null;


            page1.ReverifyDate = txtReverifyDate.Text == "" ? (int?)null : formatDateToInt(txtReverifyDate.Text);
            page1.ReverifyName = txtReverifyName.Text == "" ? null : txtReverifyName.Text;
            
            DataTable tbl = ModelToTable(page1);

            DataAccess da = new DataAccess();
            da.DeletePDF(hourlyApplicationID);

            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_everify"]);
            conn.Open();
            SqlBulkCopy bulkCopy = new SqlBulkCopy(conn);

            bulkCopy.DestinationTableName = "FormI9";
            bulkCopy.WriteToServer(tbl);
            conn.Close();

            SqlDataReader drFromDatabase = da.GetPDF(hourlyApplicationID);
            fillPageFromDataReader(drFromDatabase);

            btnSave.Visible = false;
            btnEdit.Visible = true;
            btnSubmit.Visible = true;
            btnViewPDF.Visible = true;
            btnDone.Visible = true;

            disableControls(divListA);
            disableControls(divDocAB);
            txtDocsAdditional.CssClass = "readonly";
            txtFirstWorkDate.CssClass = "readonly";
            disableControls(divCertify);
            disableControls(divReverifyName);
            disableControls(divReveirfyDoc);
            disableControls(divReverifySignature);
            if (chkSignature.Checked)
            {
                divSignatureCertified.Style.Add("background-color", "lightgreen");
                btnSubmit.Visible = true; // da.UpdateApplication(hourlyApplicationID);
            }
            else
            {
                divSignatureCertified.Style.Add("background-color", "lightsalmon");
                btnSubmit.Visible = false;
            }
            btnCancel.Visible = false;
            chkSignature.Enabled = false;

            Page.ClientScript.RegisterStartupScript(this.GetType(), "DisplayMessage", "saveSuccessful()", true);
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

        public DataTable ModelToTable(Page1 tempModel)
        {
            DataTable tbl = new DataTable();

            foreach (var foo in typeof(Page1).GetProperties())
            {
                tbl.Columns.Add(foo.Name);
            }

            DataRow newRow = tbl.NewRow();

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
            newRow["AlienNum1"] = tempModel.AlienNum1;
            newRow["AuthorizationExpDate"] = tempModel.AuthorizationExpDate;
            newRow["AlienNum2"] = tempModel.AlienNum2;
            newRow["I94Num"] = tempModel.I94Num;
            newRow["ForeignPPNum"] = tempModel.ForeignPPNum;
            newRow["ForeignPPCountry"] = tempModel.ForeignPPCountry;
            newRow["Signature"] = tempModel.Signature;
            newRow["SignatureCertifyEmp"] = tempModel.SignatureCertifyEmp;
            newRow["SignatureCertifyEmpLogin"] = tempModel.SignatureCertifyEmpLogin;
            newRow["SignatureCertifyEmpDate"] = tempModel.SignatureCertifyEmpDate;
            newRow["SignatureCertifyEmpIP"] = tempModel.SignatureCertifyEmpIP;
            newRow["SignatureDate"] = tempModel.SignatureDate;
            newRow["Assist"] = tempModel.Assist;
            newRow["SignaturePrep"] = tempModel.SignaturePrep;
            newRow["SignatureCertifyPrep"] = tempModel.SignatureCertifyPrep;
            newRow["SignatureCertifyPrepLogin"] = tempModel.SignatureCertifyPrepLogin;
            newRow["SignatureCertifyPrepDate"] = tempModel.SignatureCertifyPrepDate;
            newRow["SignatureCertifyPrepIP"] = tempModel.SignatureCertifyPrepIP;
            newRow["SignaturePrepDate"] = tempModel.SignaturePrepDate;
            newRow["PrepLastName"] = tempModel.PrepLastName;
            newRow["PrepFirstName"] = tempModel.PrepFirstName;
            newRow["PrepAddress"] = tempModel.PrepAddress;
            newRow["PrepCity"] = tempModel.PrepCity;
            newRow["PrepState"] = tempModel.PrepState;
            newRow["PrepZip"] = tempModel.PrepZip;

            newRow["DocA1Title"] = tempModel.DocA1Title;
            newRow["DocA1Issuer"] = tempModel.DocA1Issuer;
            newRow["DocA1Num"] = tempModel.DocA1Num.Replace(" ", "") == "" ? null : tempModel.DocA1Num;
            newRow["DocA1Date"] = tempModel.DocA1Date;

            newRow["DocA2Title"] = tempModel.DocA2Title;
            newRow["DocA2Issuer"] = tempModel.DocA2Issuer;
            newRow["DocA2Num"] = tempModel.DocA2Num.Replace(" ", "") == "" ? null : tempModel.DocA2Num;
            newRow["DocA2Date"] = tempModel.DocA2Date;

            newRow["DocA3Title"] = tempModel.DocA3Title;
            newRow["DocA3Issuer"] = tempModel.DocA3Issuer;
            newRow["DocA3Num"] = tempModel.DocA3Num.Replace(" ", "") == "" ? null : tempModel.DocA3Num;
            newRow["DocA3Date"] = tempModel.DocA3Date;

            newRow["DocBTitle"] = tempModel.DocBTitle;
            newRow["DocBIssuer"] = tempModel.DocBIssuer;
            newRow["DocBNum"] = tempModel.DocBNum.Replace(" ", "") == "" ? null : tempModel.DocBNum;
            newRow["DocBDate"] = tempModel.DocBDate;

            newRow["DocCTitle"] = tempModel.DocCTitle;
            newRow["DocCIssuer"] = tempModel.DocCIssuer;
            newRow["DocCNum"] = tempModel.DocCNum.Replace(" ", "") == "" ? null : tempModel.DocCNum;
            newRow["DocCDate"] = tempModel.DocCDate;

            newRow["DocsAdditional"] = tempModel.DocsAdditional;

            newRow["FirstWorkDate"] = tempModel.FirstWorkDate;
            newRow["CertifySignature"] = tempModel.CertifySignature;
            newRow["CertifyCertifySignature"] = tempModel.CertifyCertifySignature;
            newRow["CertifyCertifySignatureLogin"] = tempModel.CertifyCertifySignatureLogin;
            newRow["CertifyCertifySignatureDate"] = tempModel.CertifyCertifySignatureDate;
            newRow["CertifyCertifySignatureIP"] = tempModel.CertifyCertifySignatureIP;
            newRow["CertifyDate"] = tempModel.CertifyDate;
            newRow["CertifyTitle"] = tempModel.CertifyTitle;
            newRow["CertifyLastName"] = tempModel.CertifyLastName;
            newRow["CertifyFirstName"] = tempModel.CertifyFirstName;
            newRow["CertifyCompany"] = tempModel.CertifyCompany;
            newRow["CertifyAddress"] = tempModel.CertifyAddress;
            newRow["CertifyCity"] = tempModel.CertifyCity;
            newRow["CertifyState"] = tempModel.CertifyState;
            newRow["CertifyZip"] = tempModel.CertifyZip;

            newRow["ReverifyLastName"] = tempModel.ReverifyLastName;
            newRow["ReverifyFirstName"] = tempModel.ReverifyFirstName;
            newRow["ReverifyMiddle"] = tempModel.ReverifyMiddle;
            newRow["ReverifyRehireDate"] = tempModel.ReverifyRehireDate;
            newRow["ReverifyDocTitle"] = tempModel.ReverifyDocTitle;
            newRow["ReverifyDocNum"] = tempModel.ReverifyDocNum;
            newRow["ReverifyDocDate"] = tempModel.ReverifyDocDate;

            newRow["ReverifySignature"] = tempModel.ReverifySignature;
            newRow["ReverifySignatureCertify"] = tempModel.ReverifySignatureCertify;
            newRow["ReverifySignatureCertifyLogin"] = tempModel.ReverifySignatureCertifyLogin;
            newRow["ReverifySignatureCertifyDate"] = tempModel.ReverifySignatureCertifyDate;
            newRow["ReverifySignatureCertifyIP"] = tempModel.ReverifySignatureCertifyIP;

            newRow["ReverifyDate"] = tempModel.ReverifyDate;
            newRow["ReverifyName"] = tempModel.ReverifyName;

            newRow["Status"] = tempModel.Status;

            tbl.Rows.Add(newRow);

            return tbl;
        }

        protected void GetStates(DropDownList ddlTemp)
        {
            DataAccess da = new DataAccess();

            SqlDataReader dr2 = da.GetStates();

            ListItem temp = new ListItem();
            temp.Value = "";
            temp.Text = "";
            ddlTemp.Items.Add(temp);

            while (dr2.Read())
            {
                ListItem temp2 = new ListItem();
                temp2.Value = dr2["code"].ToString();
                temp2.Text = dr2["code"].ToString();
                ddlTemp.Items.Add(temp2);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataAccess da = new DataAccess();
            string status = "";
            if (chkSignature.Checked) status = "Page 2 Complete";
            if (chkSignature.Checked) da.UpdateApplication(hourlyApplicationID, status);
            btnSubmit.Visible = false;
            btnEdit.Visible = false;
            btnViewPDF.Visible = true;
            btnCancel.Visible = false;
            btnDone.Visible = true;

        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Cookies["Done"].Value);
            
        }
    }

}