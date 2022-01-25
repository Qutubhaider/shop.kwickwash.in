using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class lost_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

   

    protected void btnsend_Click(object sender, EventArgs e)
    {
        try
        {
            string query = "select * from tbl.login where email='" + txtemailid.Text + "'";
            DataSet ds = Database.get_DataSet(query);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string Email_Body = "";
                string path = "~/EmailTemplate/contact.html";
                Email_Body = Function.ReadMailBody(path);
                Email_Body = Email_Body.Replace("##Name##", ds.Tables[0].Rows[0]["NAME"].ToString());
                Email_Body = Email_Body.Replace("##Username##", ds.Tables[0].Rows[0]["USERNAME"].ToString());
                Email_Body = Email_Body.Replace("##Password##", ds.Tables[0].Rows[0]["PASSWORD"].ToString());
                SendEmail(Email_Body, "", txtemailid.Text);               
                Page.ClientScript.RegisterStartupScript(GetType(), "Hello", "alert('Please check your mail box!');", true);
                txtemailid.Text = "";
            }
        }
        catch (Exception ex)
        {

        }
    }

    public void SendEmail(string emailbody, string test, string emailrp)
    {
        //--- Mail code start here ----//

      

        string eid = ConfigurationManager.AppSettings["eid"].ToString();
        string epass = ConfigurationManager.AppSettings["epass"].ToString();

        MailMessage message = new MailMessage();
        SmtpClient smtpClient = new SmtpClient();
        string msg = string.Empty;
        try
        {
            MailAddress fromAddress = new MailAddress(eid);
            message.From = fromAddress;
            message.To.Add(txtemailid.Text);
            message.Subject = "Changed Your Password";
            message.IsBodyHtml = true;
            message.Body = emailbody;
            smtpClient.Host = "smtpout.secureserver.net";  
            smtpClient.Port = 587; 
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = true;
            smtpClient.Credentials = new System.Net.NetworkCredential(eid, epass);
            smtpClient.Timeout = 20000;
            smtpClient.Send(message);
        }
        catch (Exception ex)
        {
            msg = ex.Message;
        }


    }
}