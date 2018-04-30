using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace EVerify
{
    class DataAccess
    {

        public string[] checkForPDF(string hourlyapplicationid)
        {
            string[] result = new string[2];
            
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_everify"]);
            string txtSQL = "SELECT * FROM FormI9 where AppID = '" + hourlyapplicationid + "'";
            SqlCommand myCommand = new SqlCommand(txtSQL, myConnection);
            myCommand.CommandType = CommandType.Text;
            myConnection.Open();
            SqlDataReader dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
            if (!dr.HasRows) result[0] =  "";
            else
            {
                dr.Read();
                result[0] = dr["status"].ToString();
                result[1] = "PDF";
            }
            return result;
        }

        public void DeletePDF(string hourlyapplicationid)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_everify"]);
            string txtSQL = "DELETE FROM FormI9 where AppID = '" + hourlyapplicationid + "'";
            SqlCommand myCommand = new SqlCommand(txtSQL, myConnection);
            myCommand.CommandType = CommandType.Text;
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            //return dr;
        }

        public SqlDataReader GetApplication(int prss)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_applications"]);
            string txtSQL = "select * from emp_applications where ssn = " + prss;
            SqlCommand myCommand = new SqlCommand(txtSQL, myConnection);
            myCommand.CommandType = CommandType.Text;
            myConnection.Open();
            SqlDataReader dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
            return dr;

        }

        public SqlDataReader GetApplication(string horulyapplicationid)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_applications"]);
            string txtSQL = "select * from emp_applications where AppID = '" + horulyapplicationid + "'";
            SqlCommand myCommand = new SqlCommand(txtSQL, myConnection);
            myCommand.CommandType = CommandType.Text;
            myConnection.Open();
            SqlDataReader dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
            return dr;

        }

        public SqlDataReader GetEmailData(int id)
        {
            SqlConnection myConnection = new SqlConnection((ConfigurationManager.AppSettings["ConnectionStringOPSExpress"]));
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            cmd.CommandText = "select * from [Portal].[dbo].[Portal_EmailFormat] where ID = '" + id + "' ";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = myConnection;
            myConnection.Open();
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return reader;
        }

        public SqlDataReader GetPDF(string hourlyapplicationid)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_everify"]);
            string txtSQL = "SELECT * FROM FormI9 where AppID = '" + hourlyapplicationid + "'";
            SqlCommand myCommand = new SqlCommand(txtSQL, myConnection);
            myCommand.CommandType = CommandType.Text;
            myConnection.Open();
            SqlDataReader dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
            return dr;
        }

        public SqlDataReader GetPRSS(int prssid)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_whi50"]);
            string txtSQL = "select * from whi50_HRPF100 where prssid = " + prssid;
            SqlCommand myCommand = new SqlCommand(txtSQL, myConnection);

            // Mark the Command as a SPROC
            myCommand.CommandType = CommandType.Text;
            myConnection.Open();
            SqlDataReader dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

            // Return the datareader
            return dr;
        }

        public SqlDataReader GetPRSSID(int prss)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_whi50"]);
            string txtSQL = "select * from whi50_HRPF100 where prss = " + prss;
            SqlCommand myCommand = new SqlCommand(txtSQL, myConnection);

            // Mark the Command as a SPROC
            myCommand.CommandType = CommandType.Text;
            myConnection.Open();
            SqlDataReader dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

            // Return the datareader
            return dr;
        }

        public SqlDataReader GetSingleUser(String loginName)
        {
            // Create Instance of Connection and Command Object

            //SqlConnection myConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            //SqlCommand myCommand = new SqlCommand("EmpPortal_GetSingleUser", myConnection);

            SqlConnection myConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

            SqlCommand myCommand = new SqlCommand();

            myCommand.Connection = myConnection;

            string databasename = myConnection.Database;

            if (databasename.ToUpper() == "PORTAL") myCommand.CommandText = "Portal_GetSingleUserByID";
            else myCommand.CommandText = "EmpPortal_GetSingleUserByID";
            
            // Mark the Command as a SPROC
            myCommand.CommandType = CommandType.StoredProcedure;

            // Add Parameters to SPROC
            SqlParameter parameterLoginName = new SqlParameter("@LoginName", SqlDbType.NVarChar, 50);
            parameterLoginName.Value = loginName;
            myCommand.Parameters.Add(parameterLoginName);

            // Open the database connection and execute the command
            myConnection.Open();
            SqlDataReader dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

            // Return the datareader
            return dr;
        }

        public SqlDataReader GetSingleUserByID(int userid)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

            SqlCommand myCommand = new SqlCommand();

            myCommand.Connection = myConnection;

            string databasename = myConnection.Database;

            if (databasename.ToUpper() == "PORTAL") myCommand.CommandText = "Portal_GetSingleUserByID";
            else myCommand.CommandText = "EmpPortal_GetSingleUserByID"; 

            // Mark the Command as a SPROC
            myCommand.CommandType = CommandType.StoredProcedure;

            // Add Parameters to SPROC
            SqlParameter parameterUserID = new SqlParameter("@UserID", SqlDbType.Int);
            parameterUserID.Value = userid;
            myCommand.Parameters.Add(parameterUserID);

            // Open the database connection and execute the command
            myConnection.Open();
            SqlDataReader dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

            // Return the datareader
            return dr;

        }

        public SqlDataReader GetStates()
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_Everify"]);
            string txtSQL = "SELECT distinct StateID FROM States order by StateID";
            SqlCommand myCommand = new SqlCommand(txtSQL, myConnection);
            myCommand.CommandType = CommandType.Text;
            myConnection.Open();
            SqlDataReader dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
            return dr;

        }

        public void SendEmail(SqlDataReader reader, string name)
        {
            while (reader.Read())
            {
                try
                {
                    string emailSubject = reader["Subject"].ToString();
                    string emailBodyStart = reader["Body"].ToString();
                    string emailPolicy = reader["Policy"].ToString();
                    //string linkI9 = "https://my.wafflehouse.com/DesktopDefault.aspx";
                    string linkI9 = "";
                    //string ip = Request.UserHostAddress;
                    string inlineCSS = "<style type=\"text/css\" media=\"screen\"> a:hover { background-color: #0096AA; text-decoration:none; text-shadow: 1px 3px 2px #6A6A6A; } a:visited { color: white; } a:active { color: white }</style>";
                    StringBuilder sb = new StringBuilder();
                    sb.Append("<head>");
                    
                    sb.Append("<style type=\"text/css\" media=\"screen\">");
                    sb.Append("a:hover {background - color: #0096AA; text-decoration:none; text-shadow: 1px 3px 2px #6A6A6A; }");
                    sb.Append("a:visited { color: white; }");
                    sb.Append("a:active { color: white }</style>");
                    sb.Append("</head><body style=\"font-family:arial; font-size: 16px; \"><p>");
                    sb.Append("Dear Form I-9 Processor,");
                    sb.Append("<p>");
                    sb.Append(emailBodyStart);
                    //sb.Append("</p ><div style=\"width:100%; text-align:center;\">");
                    sb.Append("<div style=\"width:100%; text-align:center;\">");
                    sb.Append("</div><p>");
                    sb.Append("Thank you,");
                    sb.Append("</p><p style = \"color: #366691; text-shadow:2px 5px 4px #888;\" >");
                    sb.Append("Human Resouces Dept.");
                    sb.Append("<br>Waffle House, Corporate Office");
                    //sb.Append("</p><img src = \"https://mapp.wafflehouse.com/images/whlogo.gif\" alt = \"waffle house logo\" width = \"85\" height = \"35\" />");
                    //sb.Append("</p><img src = \"https://wafflehouse.com/wp-content/uploads/2016/09/WHlogoYellowBlack-2-e1423522739708.png\" alt = \"waffle house logo\" width = \"85\" height = \"35\" />");
                    
                    sb.Append("<div style=\"text-align: center;\">");
                    sb.Append(emailPolicy);
                    sb.Append("</ div ></body >");
                    sb.Replace("{1}", name);
                    
                    string emailBody = sb.ToString();
                    MailMessage message = new MailMessage();
                    SmtpClient smtp = new System.Net.Mail.SmtpClient();
                    MailAddress mailTo = new MailAddress("roblandow@wafflehouse.com");
                    message.To.Add(mailTo);
                    mailTo = new MailAddress("robertlandow@gmail.com");
                    message.To.Add(mailTo);
                    //MailAddress mailTo = new MailAddress(AppEmail);
                    //message.To.Add(mailTo);
                    MailAddress mailFrom = new MailAddress("donotreply@wafflehouse.com");

                    message.From = mailFrom;
                    message.Subject = emailSubject;
                    message.Body = emailBody;
                    message.IsBodyHtml = true;
                    message.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");

                    smtp.Port = 25;
                    smtp.Host = "smtp.wafflehouse.com";
                    smtp.EnableSsl = false;
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["email_username"], ConfigurationManager.AppSettings["email_pass"]);
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Send(message);

                    //connections.SaveSentEmail(AppEmail, emailSubject, emailBody);

                }
                catch (Exception ex)
                {
                    //connections.WriteToPortalErrorLog(UserLogin, "Send Mail Error" + ex.Message.ToString());
                }


            }
            reader.Close();

        }

        public void UpdateApplication(string hourlyapplicationid, string status)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_applications"]);
            string txtSQL = "";
            if (status == "Page 1 Complete") txtSQL = "update emp_applications set FormSts = 'I' where appid = '" + hourlyapplicationid + "'";
            else txtSQL = "update emp_applications set FormSts = 'H' where appid = '" + hourlyapplicationid + "'";
            SqlCommand myCommand = new SqlCommand(txtSQL, myConnection);
            myCommand.CommandType = CommandType.Text;
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

            if (status != "") {
                SqlConnection myConnection2 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString_everify"]);
                txtSQL = "update FormI9 set status = '" + status + "' where appid = '" + hourlyapplicationid + "'";
                myCommand = new SqlCommand(txtSQL, myConnection2);
                myCommand.CommandType = CommandType.Text;
                myConnection2.Open();    
                myCommand.ExecuteNonQuery();
            }
            
        }

    }
}
