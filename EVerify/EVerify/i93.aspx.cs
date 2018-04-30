using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;

namespace EVerify
{
    public partial class i93 : System.Web.UI.Page
    {
        int prss;

        protected void Page_Load(object sender, EventArgs e)
        {
            int prssid = Convert.ToInt32(Request["id"]);
            //getData(prssid);

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

            DataContext masterContext = new DataContext(false);
            masterContext.Settings.Server = "10.1.1.20";
            masterContext.Settings.Partition = "DEV";
            masterContext.Settings.PortNumber = 4745;

            masterContext.Connect("languest01", "usr5979x01");

            masterContext.Clear();

            var Condition = PRPF001Exprs.PRSS == prss;



            PRPF001 Employee = masterContext.PRPF001.RetrieveItem(Condition);

            masterContext.Disconnect();

            txtLastName.Text = Employee.PRLAST;
            txtFirstName.Text = Employee.PRFIRST;
            txtMiddle.Text = Employee.PRMI;
            txtAddress.Text = Employee.PRADDR1;
            txtCity.Text = Employee.PRCITY;
            txtState.Text = Employee.PRSTABBR;
            txtZip.Text = Employee.PRZIP.ToString();
            txtBirth.Text = formatDate(Employee.PRBRTHDT.ToString());
            txtSSN1.Text = Employee.PRSS.ToString().Substring(0, 3);
            txtSSN2.Text = Employee.PRSS.ToString().Substring(3, 2);
            txtSSN3.Text = Employee.PRSS.ToString().Substring(5, 4);
            txtEmail.Text = Request["em"];



            SqlDataReader dr = da.GetSingleUser(Request["name"]);

            while (dr.Read())
            {
                txtEmail.Text = dr["email"].ToString();
                if (dr["UserTxt"].ToString() != "")
                txtPhone.Text = dr["UserTxt"].ToString().Substring(0, 3) + "-" + dr["UserTxt"].ToString().Substring(3, 3) + "-" + dr["UserTxt"].ToString().Substring(6, 4);


            }



            while (dr.Read())
            {
                prssid = Convert.ToInt32(dr["prss"]);
            }

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
    }
}