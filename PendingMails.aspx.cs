using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class PendingMails : System.Web.UI.Page
    {
        private ePostData data = new ePostData();
        private string staffID;
        private Employee emp;        

        protected void Page_Load(object sender, EventArgs e)
        {
            staffID = (string)Session["Employee"];
            emp = data.getEmployee(staffID);
            user.Text = emp.FirstName + " " + emp.LastName;
            Label1.Text = (string)Session["Role"];
            Label1.Visible = false;
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            if (!dn.Equals(""))
            {
                try
                {
                    Mail mail = data.getMail(dn.Text.Trim());
                    Session["Mail"] = mail;
                    Response.Redirect("Mail.aspx");
                }
                catch 
                {
                    dnLbl.Visible = true;
                    dnLbl.Text = "Not Found";
                }
            }
        }
    }
}