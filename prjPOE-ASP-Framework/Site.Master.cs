using prjPOE_Lib_Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjPOE_ASP_Framework
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = HttpContext.Current.Request.Url.AbsolutePath;
            liLogin.InnerHtml = "<a runat=\"server\" href=\"/Login\">LOG IN</a>";

            if (path != "/Login")
            {
                if ((Student)Session["user"] == null)
                {
                    Response.Redirect("Login.aspx", false);
                    return;
                }
                else
                {
                    liLogin.InnerHtml = "<a runat=\"server\" href=\"/Logout\">LOG OUT</a>";
                }
            }

            if (path == "/Login")
            {
                if ((Student)Session["user"] != null)
                {
                    Response.Redirect("Semester.aspx", false);
                    return;
                }
            }
        }

        //Browser Alert Method - To Display "MessageBox" type content.
        public void alert(string message)
        {
            Response.Write($"<script>alert('{message}')</script>");
        }
    }
}