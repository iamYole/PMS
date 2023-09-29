using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class Mail1 : System.Web.UI.Page
    {
        private ePostData data = new ePostData();
        private Mail mail = null;

        protected void Page_Load(object sender, EventArgs e)
        {            
            try
            {
                mail = (Mail)Session["Mail"];
                dn.Text = mail.DeliveryNo;
                rDate.Text = mail.DateRecieved.ToShortDateString();
                weight.Text = mail.ActualWeight;
                source.Text = mail.DeliverySource;
                destination.Text = mail.DeliveryDestination;
                customer.Text = mail.Customer1.FullName;
                price.Text = mail.Price.ToString("N");
                staff.Text = mail.Employee.FirstName + " " + mail.Employee.LastName;
                status.Text = mail.Remarks;

                if (status.Text.Trim().Equals("PENDING"))
                    btnAction.Visible = true;
            }
            catch
            {
                Response.Redirect("PendingMails.aspx");
            }
        }

        protected void btnAction_Click(object sender, EventArgs e)
        {
            try
            {
                Mail mailed = data.getMail(this.mail.DeliveryNo);
                mailed.DeliveryDate = DateTime.Now;
                mailed.Remarks = "DELIVERED";
                data.Save();
                Response.Redirect("TrackMail.aspx");
            }
            catch
            { 
            
            }
        }
    }
}