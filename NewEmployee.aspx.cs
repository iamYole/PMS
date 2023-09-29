using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class NewEmployee : System.Web.UI.Page
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

                
                branchCode.Text = emp.BranchID;
                branchLbl.Text = emp.Branch.Branch_Location.ToString();
                
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
        }
        private void generateID()
        {
            Random num = new Random();
            int id = num.Next();
            string sid = "STF" + id;
            staffCode.Text = sid.Substring(0,8);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Employee employee = new Employee()
                {
                    StaffID=staffCode.Text,
                    Password="password",
                    FirstName=firstName.Text,
                    LastName=lastName.Text,
                    Gender=gender.SelectedItem.Text,
                    Role=role.SelectedItem.Text,
                    BranchID=branchCode.Text
                };
                data.addEmployee(employee);
                data.Save();
                Response.Redirect("EmployePage.aspx");
            }
            catch
            {
                errLbl.Visible = true;
                errLbl.Text = "An Unepected Error Occoured, Data Wasn't Saved";
            }
        }

        protected void txtBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            branchCode.Text = txtBranch.SelectedItem.Value;
        }        
    }
}