using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMS
{
    public class ePostData
    {
        private dataStoreDataContext db = new dataStoreDataContext();

        //adds a new Employee
        public void addEmployee(Employee employee)
        {
            db.Employees.InsertOnSubmit(employee);
        }
        //adda a new customer
        public void addCustomer(Customer customer)
        {
            db.Customers.InsertOnSubmit(customer);
        }
        //adds a new branch office
        public void addBranch(Branch branch)
        {
            db.Branches.InsertOnSubmit(branch);
        }
        //add a new service
        public void addService(Service service)
        {
            db.Services.InsertOnSubmit(service);
        }
        //adds a new price
        public void addPrice(Price price)
        {
            db.Prices.InsertOnSubmit(price);
        }
        //adds a new mail order
        public void newMail(Mail mail)
        {
            db.Mails.InsertOnSubmit(mail);
        }


        //get an employee details
        public Employee getEmployee(string code)
        {
            return db.Employees.SingleOrDefault(e => e.StaffID == code);
        }
        //get Price 
        public Price getPrice(string sid,string rid)
        {
            return db.Prices.SingleOrDefault(p => p.rangeID.Equals(rid) && p.serviceID.Equals(sid));
        }
        public Customer getCustomer(string code)
        {
            return db.Customers.SingleOrDefault(s => s.CustomerID.Equals(code));
        }
        //
        public Mail getMail(string num)
        {
            return db.Mails.SingleOrDefault(m => m.DeliveryNo.Equals(num));
        }


        

        //save all changes
        public void Save()
        {
            db.SubmitChanges();
        }
    }
}