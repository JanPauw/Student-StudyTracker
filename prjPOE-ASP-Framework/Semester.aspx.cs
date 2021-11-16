using prjPOE_Lib_Framework;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjPOE_ASP_Framework
{
    public partial class Semester : System.Web.UI.Page
    {
        private Student user;
        private Connection db = new Connection();

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
                lblSemLengthValue.Text = user.SemWeeks.ToString();
                lblSemStartValue.Text = user.SemStart.ToString();

                LoadModules();
            }
        }

        protected void btnEditInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Semester_Info.aspx");
        }

        //Display all Modules in an HTML Table
        public void LoadModules()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("<table style=\"width:100%\">" +
                "<tr>" +
                "<th>Module Code</th>" +
                "<th>Module Name</th>" +
                "<th>Credits</th>" +
                "<th>Hours per week</th>" +
                "<th>Remaining Study Hours</th>" +
                "<th></th>" +
                "</tr>");

            foreach (var m in user.GetList(user.StudentNumber, db.cs))
            {
                sb.Append($"<tr>");
                sb.Append($"<td>{m.ModuleCode}</td>");
                sb.Append($"<td>{m.ModuleName}</td>");
                sb.Append($"<td>{m.ModuleCredits}</td>");
                sb.Append($"<td>{m.ModuleHours}</td>");

                if ((m.SelfStudy(user.SemWeeks) - m.getTotalHours()) <= 0)
                {
                    sb.Append($"<td style=\"color: #green; font-weight: bold;\" >0</td>");
                }
                else
                {
                    sb.Append($"<td style=\"color: #EA3F5F; font-weight: bold;\" >{Convert.ToInt32(m.SelfStudy(user.SemWeeks) - m.getTotalHours())}</td>");
                }

                sb.Append($"<td><a href=\"Module_Info?Code={m.ModuleCode}\">Module Info ><a/></td>");
                sb.Append($"</tr>");
            }

            sb.Append("</table>");

            divModules.InnerHtml = sb.ToString();
        }

        //Browser Alert Method - To Display "MessageBox" type content.
        public void alert(string message)
        {
            Response.Write($"<script>alert('{message}')</script>");
        }

        protected void btnAddModule_Click(object sender, EventArgs e)
        {
            Response.Redirect("Module_Add", false);
            return;
        }

        protected void btnRecordHours_Click(object sender, EventArgs e)
        {
            Response.Redirect("Record_Hours", false);
            return;
        }
    }
}