using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class NewBranch : System.Web.UI.Page
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
                Branch branch = new Branch()
                {
                    BranchID=bCode.Text,
                    Branch_Location=bLocation.Text,
                    Contact=txtContact.Text,
                    Address=bAddress.Text
                };
                data.addBranch(branch);
                data.Save();
                errLbl.Visible = true;
                errLbl.Text = "Record Added Sucessfully!!!";
                clear();
            }
            catch
            {
                errLbl.Visible = true;
                errLbl.Text = "An Error Occoured. Record Not Saved !!!";
            }
        }
        private void clear()
        {
            bCode.Text = "";
            bLocation.Text="";
            bAddress.Text="";
            txtContact.Text = "";
        }
    }
}