using prjPOE_Lib_Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjPOE_ASP_Framework
{
    public partial class Module_Add : System.Web.UI.Page
    {
        Student user;
        private Connection db = new Connection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                user = (Student)Session["user"];
            }
            else
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Semester.aspx");
            return;
        }

        //Browser Alert Method - To Display "MessageBox" type content.
        public void alert(string message)
        {
            Response.Write($"<script>alert('{message}')</script>");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            #region Input testing
            if (String.IsNullOrWhiteSpace(edtModuleCode.Text) || user.FindModule(edtModuleCode.Text) != null)
            {
                alert("Invalid Module Code! Please try again. It might already be in use.");
                return;
            } //Valid Code

            if (String.IsNullOrWhiteSpace(edtModuleName.Text))
            {
                alert("Invalid Module Name! Please retry.");
                return;
            } //Valid Name

            try
            {
                int CreditTest = Convert.ToInt32(edtCredits.Text);
            }
            catch (Exception)
            {
                alert("Module Credits is invalid! Please only enter whole numbers.");
                return;
            } //Valid Credits

            try
            {
                int CreditTest = Convert.ToInt32(edtClassHours.Text);
            }
            catch (Exception)
            {
                alert("Module Hours is invalid! Please only enter whole numbers.");
                return;
            } //Valid Hours
            #endregion

            string sNumber = user.StudentNumber;
            string code = edtModuleCode.Text;
            string name = edtModuleName.Text;
            int credits = Convert.ToInt32(edtCredits.Text);
            int hours = Convert.ToInt32(edtClassHours.Text);
            Module m = new Module(sNumber, code, name, credits, hours);

            user.AddToDB(user.StudentNumber, db.cs, m);

            Response.Redirect("Semester.aspx");
        }
    }
}