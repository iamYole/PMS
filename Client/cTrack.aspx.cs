using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.Client
{
    public partial class cTrack : System.Web.UI.Page
    {
         private Mail mail;
        private ePostData data = new ePostData();

        protected void Page_Load(object sender, EventArgs e)
        {

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