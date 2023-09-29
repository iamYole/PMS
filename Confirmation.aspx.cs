using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class Confirmation : System.Web.UI.Page
    {
        private ePostData data = new ePostData();
        private Customer customer;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                customer = (Customer)Session["Customer"];
                codeLbl.Text = customer.CustomerID;
                nameLbl.Text = customer.FullName;
                mailLbl.Text = customer.Email;
                numLbl.Text = customer.MobileNo.ToString();
            }
            catch 
            {
                Response.Redirect("CustomerPage.aspx");
            }
        }
    }
}