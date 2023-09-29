using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class SearchEmp : System.Web.UI.Page
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (!byId.Text.Equals(""))
            {
                byName.Text = "";
                idView.Visible = true;
                nameView.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!byName.Text.Equals(""))
            {
                byId.Text = "";
                idView.Visible = false;
                nameView.Visible = true;
            }
        }
    }
}