using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class WeightRange : System.Web.UI.Page
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
                Price price = new Price()
                {
                    rangeID=Convert.ToInt32(range.SelectedItem.Value),
                    serviceID=service.SelectedItem.Value,
                    Price1=Convert.ToDouble(txtPrice.Text)
                };
                data.addPrice(price);
                data.Save();
                errLbl1.Visible = true;
                errLbl1.Text = "Recored Saved Sucessfully";
                clear();
            }
            catch
            {
                errLbl1.Visible = true;
                errLbl1.Text = "An Error Occoured";
            }
        }
        private void clear()
        {
            txtPrice.Text = "";
        }
    }
}