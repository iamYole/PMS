using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class EditProfile : System.Web.UI.Page
    {
        private Employee emp;
        private string staffID;
        private ePostData data = new ePostData();
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

        protected void btnSave_Click(object sender, EventArgs e)
        {            
            emp = data.getEmployee(staffID);
            if (emp.Password.Equals(txtOldPword.Text))
            {
                if (txtNPword.Text.Equals(txtRNPword.Text))
                {
                    try
                    {
                        emp.Password = txtRNPword.Text;
                        data.Save();
                        errLbl.Visible = true;
                        errLbl.Text = "Password Changed Sucessfully";
                    }
                    catch
                    {
                        errLbl.Visible = true;
                        errLbl.Text = "An Unexpected Error Occoured. Password, Not Saved";
                    }
                }
                else
                {
                    errLbl.Visible = true;
                    errLbl.Text = "Password MUST BE THE SAME";
                }
            }
            else
            {
                errLbl.Visible = true;
                errLbl.Text = "Invalid Password";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Employee"] = emp.StaffID;
            Session["Role"] = emp.Role;
            Response.Redirect("AdminIndex.aspx");
        }
    }
}