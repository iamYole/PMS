using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class Query : System.Web.UI.Page
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
                fView.Visible = false;
                tView.Visible = false;
                sourceView.Visible = false;
                stView.Visible = false;               
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void fromList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fView.Visible = true;
            tView.Visible = false;
            sourceView.Visible = false;
            stView.Visible = false;
        }

        protected void tList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fView.Visible = false;
            tView.Visible = true;
            sourceView.Visible = false;
            stView.Visible = false;
        }

        protected void svList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fView.Visible = false;
            tView.Visible = false;
            sourceView.Visible = true;
            stView.Visible = false;
        }

        protected void stsList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fView.Visible = false;
            tView.Visible = false;
            sourceView.Visible = false;
            stView.Visible = true;
        }
    }
}