using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class CustomerPage : System.Web.UI.Page
    {
        private ePostData data = new ePostData();
        private string staffID;
        private Employee emp;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                staffID = (string)Session["Employee"];
                emp = data.getEmployee(staffID);
                user.Text = emp.FirstName + " " + emp.LastName;
                Label1.Text = (string)Session["Role"];
                Label1.Visible = false;
                generateID();
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Customer customer = new Customer()
                {
                    CustomerID=cCode.Text,
                    FullName=cTitle.SelectedItem.Text+" "+cName.Text,
                    Gender=cGender.SelectedItem.Text,
                    MobileNo=Convert.ToDecimal(cContact.Text),
                    Address=cAddress.Text,
                    Email=cMail.Text
                };
                data.addCustomer(customer);
                data.Save();
                errLbl.Visible = true;
                errLbl.Text = "Customer Added Sucessfully";
                clear();
                Session["Customer"] = customer;
                Response.Redirect("Confirmation.aspx");
            }
            catch            
            {
                errLbl.Visible = true;
                errLbl.Text = "An Error Occoured. Customer Not Created!!!";
            }
        }
        private void clear()
        {
            cCode.Text = "";
            cGender.Text = "";
            cName.Text = "";
            cContact.Text = "";
            cAddress.Text = "";
            cMail.Text = "";
        }
        private void generateID()
        {
            Random num = new Random();
            int id = num.Next();
            string sid = "CUST" + id;
            cCode.Text = sid.Substring(0, 8);
        }
    }
}