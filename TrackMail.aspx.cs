using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class TrackMail : System.Web.UI.Page
    {
        private ePostData data = new ePostData();
        private string staffID;
        private Employee emp;
        private Mail mail;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                staffID = (string)Session["Employee"];
                emp = data.getEmployee(staffID);
                user.Text = emp.FirstName + " " + emp.LastName;
                Label1.Text = (string)Session["Role"];
                Label1.Visible = false;
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!trackNo.Text.Equals(""))
            {
                Panel1.Visible = false;
                try
                {
                    mail = data.getMail(trackNo.Text);
                    dn.Text = mail.DeliveryNo;
                    rdate.Text = mail.DateRecieved.ToShortDateString();
                    service.Text = mail.Service.ServiceName;
                    source.Text = mail.DeliverySource;
                    destination.Text = mail.DeliveryDestination;
                    customer.Text = mail.Customer1.FullName;
                    status.Text = mail.Remarks;
                    lbl.Visible = false;
                    Panel1.Visible = true;
                }
                catch
                {
                    lbl.Visible = true;
                    lbl.Text = "Not Found. Please cheack Your Delivery No.";
                }
            }
        }
    }
}