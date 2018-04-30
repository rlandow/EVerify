using System;
using System.Collections.Generic;
using System.Data.SqlClient;  
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;

    

namespace EVerify
{
    public partial class PRPFTest : System.Web.UI.Page
    {
        int prssid;
        int prss;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataAccess da = new DataAccess();

            SqlDataReader dr = da.GetSingleUser(txtLoignName.Text);

            

            while (dr.Read()) {
                prssid = Convert.ToInt32(dr["prss"]);
            }

            Response.Redirect("FormI9.aspx?id=" + prssid + "&name=" + txtLoignName.Text);

            SqlDataReader dr2 = da.GetPRSS(prssid);

            while (dr2.Read())
            {
                prss = Convert.ToInt32(dr2["prss"]);

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

            if (Employee != null)
            Response.Write(Employee.PRLAST + " " + Employee.PRFIRST + " " + Employee.PRMI + "<BR />" + Employee.PRADDR1 + "<BR />" + Employee.PRCITY +
                ", " + Employee.PRSTABBR + " " + Employee.PRZIP);




        }


    }
}