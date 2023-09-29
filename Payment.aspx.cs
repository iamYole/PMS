using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class Payment : System.Web.UI.Page
    {
        private ePostData data = new ePostData();
        private Customer customer = null;
        private Employee employee = null;
        private Price price = null;
        private string sid;
        private int rid;
        private string weight;
        private string office;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                price = (Price)(Session["price"]);
                sid= (string)Session["sid"];
                rid= Convert.ToInt32((string)Session["rid"]);
                weight=(string)Session["weight"];
                office = (string)Session["Destination"];
                customer=data.getCustomer((string)Session["customer"]);
                employee = data.getEmployee((string)Session["Employee"]);

                name.Text = customer.FullName;
                amt.Text = price.Price1.ToString("N");

                if (sid.Trim().Equals("VPP"))
                {
                    vppMail();
                    PayPal.Visible = false;
                    confirmations.Visible = true;
                }
            }
            catch
            {
                Response.Redirect("MailsPage.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Mail newMail = new Mail()
                {
                    DeliveryNo=generateCode(),
                    DateRecieved=DateTime.Now,
                    WeightRange=this.rid,
                    ActualWeight=this.weight,
                    PrefferedService=this.sid,
                    DeliverySource=this.employee.BranchID,
                    DeliveryDestination=this.office,
                    Customer=this.customer.CustomerID,
                    Price=this.price.Price1,
                    SecretPin=generateCode().Substring(1,4),
                    StaffID=this.employee.StaffID,
                    Remarks="PENDING",
                    Status="NO"
                };
                data.newMail(newMail);
                data.Save();
                PayPal.Visible = false;
                confimed(newMail.DeliveryNo);
                confirmations.Visible = true;
            }
            catch
            {
                errLbl.Visible = true;
                errLbl.Text = "An Error Occoured";
            }
        }
        private void vppMail()
        {
            try
            {
                Mail newMail = new Mail()
                {
                    DeliveryNo=generateCode(),
                    DateRecieved=DateTime.Now,
                    WeightRange=this.rid,
                    ActualWeight=this.weight,
                    PrefferedService=this.sid,
                    DeliverySource=this.employee.BranchID,
                    DeliveryDestination=this.office,
                    Customer=this.customer.CustomerID,
                    Price=this.price.Price1,
                    SecretPin=generateCode().Substring(1,4),
                    StaffID=this.employee.StaffID,
                    Remarks="PENDING"
                };
                data.newMail(newMail);
                data.Save();
                //PayPal.Visible = false;
                confimed(newMail.DeliveryNo);
                //confirmations.Visible = true;
            }
            catch
            {
                errLbl.Visible = true;
                errLbl.Text = "An Error Occoured";
            }
        }
        private string generateCode()
        {
            Random num = new Random();
            int id = num.Next();
            string dn = id.ToString();
            return dn.Substring(0, 6);
        }
        private void confimed(string newMail)
        {
            Mail mail = data.getMail(newMail);
            num.Text = mail.DeliveryNo;
            code.Text = this.customer.CustomerID;
            cname.Text = this.customer.FullName;
            source.Text = this.employee.Branch.Branch_Location;
            destination.Text = this.office;
            service.Text = this.sid;
            spin.Text = mail.SecretPin;
            staff.Text = mail.Employee.FirstName+" "+mail.Employee.LastName;
        }
    }
}