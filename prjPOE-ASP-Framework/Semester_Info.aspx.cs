using prjPOE_Lib_Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjPOE_ASP_Framework
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private Student user;
        private Connection db = new Connection();

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (Student)Session["user"];

            if (user == null)
            {

            }
            else
            {
                if (!IsPostBack)
                {
                    edtSemWeeks.Text = Convert.ToString(user.SemWeeks);
                    dateSemStart.SelectedDate = Convert.ToDateTime(user.SemStart);
                }
            }
        }

        protected void btnSemSave_Click(object sender, EventArgs e)
        {
            try
            {
                //Checks if number of weeks is a valid number
                int weeks = Convert.ToInt32(edtSemWeeks.Text);
                DateTime? date = dateSemStart.SelectedDate;

                user.UpdateSemDetails(weeks, date);

                user.Login(user.StudentNumber, user.Password);

                Response.Redirect("Semester.aspx", false);
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