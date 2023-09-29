using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class Login : System.Web.UI.Page
    {
        private ePostData data = new ePostData();
        private Employee emp;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtID.Text.Equals("") || txtPword.Text.Equals(""))
            {
                errLbl.Visible = true;
                errLbl.Text = "Please Enter Your Login Credentials";
            }
            else
            {
                try
                {
                    emp = data.getEmployee(txtID.Text);
                    
                    if (emp.Password.Trim().Equals(txtPword.Text.Trim()))
                    {                        
                        Session["Employee"] = emp.StaffID;
                        Session["Role"] = emp.Role.Trim();
                        Response.Redirect("AdminIndex.aspx");
                    }
                    else
                    {
                        errLbl.Visible = true;
                        errLbl.Text = "Invalid Staff Code/Password";
                    }
                    
                }
                catch
                {
                    errLbl.Visible = true;
                    errLbl.Text = "Invalid Staff Code/Password";
                }
            }
        }
    }
}