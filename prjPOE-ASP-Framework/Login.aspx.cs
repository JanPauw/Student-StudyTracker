using prjPOE_Lib_Framework;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjPOE_ASP_Framework
{
    public partial class Login : System.Web.UI.Page
    {
        private Student user = null;
        private Connection db = new Connection();
        private string EncryptionKey = "eSgVkYp3s6v9y$B&E)H@McQfTjWmZq4t";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            LoginClick();

            if (user != null)
            {
                Session["user"] = user;

                if (user.SemWeeks <= 0)
                {
                    Response.Redirect("Semester_Info.aspx", false);
                }
                else
                {
                    Response.Redirect("Semester.aspx");
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            RegisterClick();

            if (user != null)
            {
                Session["user"] = user;

                if (user.SemWeeks <= 0)
                {
                    Response.Redirect("Semester_Info.aspx", false);
                }
                else
                {
                    Response.Redirect("Semester.aspx");
                }
            }
        }

        #region Encryption
        public static string EncryptString(string key, string plainText)
        {
            byte[] iv = new byte[16];
            byte[] array;

            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(key);
                aes.IV = iv;

                ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);

                using (MemoryStream memoryStream = new MemoryStream())
                {
                    using (CryptoStream cryptoStream = new CryptoStream((Stream)memoryStream, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter streamWriter = new StreamWriter((Stream)cryptoStream))
                        {
                            streamWriter.Write(plainText);
                        }

                        array = memoryStream.ToArray();
                    }
                }
            }

            return Convert.ToBase64String(array);
        }
        #endregion

        #region Login and Register
        private void LoginClick()
        {
            string empNum = edtUsername.Text;
            string empPassword = EncryptString(EncryptionKey, edtPassword.Text);

            db.cs.Close();
            Student attempt = new Student();
            attempt = attempt.Login(empNum, empPassword);

            switch (attempt)
            {
                case null:
                    alert("Invalid Login Details! Please try again.");
                    break;
                default:
                    user = attempt;
                    break;
            }
        }

        private void RegisterClick()
        {
            string empNum = edtUsername.Text;
            string empPassword = edtPassword.Text;
            string encPassword = EncryptString(EncryptionKey, empPassword);

            db.cs.Close();
            Student attempt = new Student();
            attempt = attempt.Register(empNum, encPassword);

            switch (attempt)
            {
                case null:
                    alert("Invalid Input. Please choose different details.");
                    break;
                default:
                    user = attempt;
                    break;
            }
        }
        #endregion

        //Browser Alert Method - To Display "MessageBox" type content.
        public void alert(string message)
        {
            Response.Write($"<script>alert('{message}')</script>");
        }
    }
}

