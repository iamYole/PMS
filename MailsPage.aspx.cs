using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class MailsPage : System.Web.UI.Page
    {
        private ePostData data = new ePostData();
        private string staffID;
        private Employee emp;
        private Price price;
        private Customer customer;

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

        protected void txtWeight_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void txtOffice_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string sid = txtService.SelectedItem.Value;
                string rid = txtRange.SelectedItem.Value;
                this.price = data.getPrice(sid, rid);
                priceLbl.Text = price.Price1.ToString("N");
            }
            catch
            {
                //priceLbl.Text = 0.00.ToString("N");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (fullname.Text.Equals("Customer Not Found") || priceLbl.Text.Equals("0.00 NGN"))
            {

            }
            else if(txtOffice.Text.Equals(emp.BranchID))
            {
                errlbl.Visible = true;
                errlbl.Text = "Delivery Address Can't be the same With Source Address";
            }
            else
            {
                string sid = txtService.SelectedItem.Value;
                string rid = txtRange.SelectedItem.Value;
                this.price = data.getPrice(sid, rid);

                Session["price"] = this.price;
                Session["sid"] = txtService.SelectedItem.Value;
                Session["rid"] = txtRange.SelectedItem.Value;
                Session["weight"] = txtWeight.Text;
                Session["customer"] = txtCust.Text;
                Session["Employee"] = staffID;
                Session["destination"] = txtOffice.Text;
                Response.Redirect("Payment.aspx");
            }
        }

        protected void txtService_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void txtCust_TextChanged(object sender, EventArgs e)
        {
            try
            {
                customer = data.getCustomer(txtCust.Text.Trim());
                fullname.Text = customer.FullName;
            }
            catch
            {
                fullname.Text = "Customer Not Found";
            }
        }
    }
}