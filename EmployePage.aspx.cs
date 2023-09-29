using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class EmployePage : System.Web.UI.Page
    {
        private ePostData data = new ePostData();
        private string staffID;
        private Employee emp;

        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO: just testing
            try
            {
                staffID = (string)Session["Employee"];
                emp = data.getEmployee(staffID);
                user.Text = emp.FirstName + " " + emp.LastName;
                Label1.Text = emp.BranchID.Trim();
                Label1.Visible = false;

                branchLbl.Text = emp.Branch.Branch_Location.ToString();

                if (emp.Role.Trim().Equals("Administrator"))
                {
                    adminView.Visible = true;
                    branchView.Visible = false;
                }
                if (emp.Role.Trim().Equals("Manager"))
                {
                    adminView.Visible = false;
                    branchView.Visible = true;
                }
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            adminView.DataSourceID = "AllEmps";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            adminView.DataSourceID = "FilteredEmps";
        }
    }
}