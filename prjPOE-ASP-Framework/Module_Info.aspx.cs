using prjPOE_Lib_Framework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace prjPOE_ASP_Framework
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        Student user = null;
        Module temp = null;
        private Connection db = new Connection();
        string qString;

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
                    if (Request.QueryString["Code"] == null)
                    {
                        Response.Redirect("Semester.aspx");
                        return;
                    }
                    else
                    {
                        qString = Request.QueryString["Code"];
                        temp = user.GetList(user.StudentNumber, db.cs).SingleOrDefault(u => u.ModuleCode == qString);

                        edtModuleCode.Text = temp.ModuleCode;
                        edtModuleName.Text = temp.ModuleName;
                        edtCredits.Text = temp.ModuleCredits.ToString();
                        edtClassHours.Text = temp.ModuleHours.ToString();
                    }
                }
            }

            LoadGraph();
        }

        public void LoadGraph()
        {
            int count = 0;
            List<StudyDay> sdList = new List<StudyDay>();

            //Get Data from SQL DB
            using (SqlConnection conn = db.cs)
            {
                string sNumber = user.StudentNumber;

                conn.Open();
                String sql =
                    "SELECT * " +
                    "FROM StudyDay " +
                    "WHERE S_Number = '" + sNumber + "' " +
                    "AND M_Code = '" + qString + "' " +
                    "ORDER BY Study_Date DESC; ";
                SqlCommand command = new SqlCommand(sql, conn);
                SqlDataReader r = command.ExecuteReader();

                while (r.Read() && count < 7)
                {
                    string modCode = r.GetString(1);
                    string stdNumber = r.GetString(2);
                    int studyHours = r.GetInt32(3);
                    DateTime? studyDate = r.GetDateTime(4);

                    StudyDay sd = new StudyDay(modCode, stdNumber, studyHours, studyDate);

                    sdList.Add(sd);

                    count++;
                }

                conn.Close();
            }

            //Flip Descending List Around
            sdList.Reverse();

            Series series = StudyGraph.Series["series1"];

            for (int i = 0; i < count; i++)
            {
                StudyDay s = sdList[i];

                DateTime date = Convert.ToDateTime(s.Study_Date);
                var dateOnlyString = date.ToShortDateString();

                series.Points.AddXY(dateOnlyString, Convert.ToDouble(s.M_Studied));
            }
        }

        //Browser Alert Method - To Display "MessageBox" type content.
        public void alert(string message)
        {
            Response.Write($"<script>alert('{message}')</script>");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            #region Input testing
            if (String.IsNullOrWhiteSpace(edtModuleCode.Text))
            {
                alert("Invalid Module Code! Please retry.");
                return;
            } //Valid Code

            if (String.IsNullOrWhiteSpace(edtModuleName.Text))
            {
                alert("Invalid Module Name! Please retry.");
                return;
            }

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

            user.UpdateModule(user.StudentNumber, db.cs,
                new Module(
                    user.StudentNumber,
                    edtModuleCode.Text,
                    edtModuleName.Text,
                    Convert.ToInt32(edtCredits.Text),
                    Convert.ToInt32(edtClassHours.Text)
                    ));

            Response.Redirect("Semester");
            return;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            user.DeleteModule(user.StudentNumber, db.cs, edtModuleCode.Text);

            Response.Redirect("Semester");
            return;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Semester.aspx");
        }
    }
}