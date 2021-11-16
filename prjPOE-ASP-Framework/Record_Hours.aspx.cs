using prjPOE_Lib_Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjPOE_ASP_Framework
{
    public partial class Record_Hours : System.Web.UI.Page
    {
        Student user;
        Connection db = new Connection();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (Student)Session["user"];

            if (user == null)
            {
                Response.Redirect("Login.aspx", false);
                return;
            }
            else
            {
                if (!IsPostBack)
                {
                    loadDropdown();
                }
            }
        }

        public void loadDropdown()
        {
            List<Module> temp = user.GetList(user.StudentNumber, db.cs);

            dropModules.Items.Clear();
            dropModules.Items.Add("Select Module");

            for (int i = 0; i < temp.Count; i++)
            {
                dropModules.Items.Add(temp[i].ModuleCode);
            }
        }

        protected void btnSemSave_Click(object sender, EventArgs e)
        {
            try
            {
                string selected = dropModules.SelectedItem.ToString();
                if (user.FindModule(selected) == null)
                {
                    alert("Inavlid module selection! Please choose a valid module.");
                    return;
                }

                if (dateSemStart.SelectedDate == DateTime.MinValue)
                {
                    alert("Inavlid date selection! Please choose a valid date.");
                    return;
                }

                Student logged_in = (Student)Session["user"];

                string sNumber = logged_in.StudentNumber;
                string code = dropModules.SelectedValue;
                int hours = Convert.ToInt32(edtHours.Text);
                DateTime? day = dateSemStart.SelectedDate;

                user.FindModule(selected).AddSelfStudy(code, sNumber, hours, day);
                user.UpdateModule(user.StudentNumber, db.cs, user.FindModule(selected));

                Response.Redirect("Semester");
                return;
            }
            catch (Exception)
            {
                alert("Please check your inputs and try again.");
            }
        }

        //Browser Alert Method - To Display "MessageBox" type content.
        public void alert(string message)
        {
            Response.Write($"<script>alert('{message}')</script>");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Semester.aspx");
        }
    }
}