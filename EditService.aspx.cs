using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class EditService : System.Web.UI.Page
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
    }
}