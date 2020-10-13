using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using CMPG223_Base;
using System.Windows;

namespace CMPG223_Base
{
    
    public partial class LoginPage : System.Web.UI.Page
    {
        protected MethodClasses MethodObj = new MethodClasses();
        public SqlCommand sqlCommandObj;
        public SqlDataReader sqlDataReader;
        public string sqlStatementStr;
        protected void Page_Load(object sender, EventArgs e) {
            if (Page.IsPostBack) {
                int TotalLoginAttemptsInt = Convert.ToInt32(Session["TotalLoginAttemptsInt"]);
                if (TotalLoginAttemptsInt < 3) {

                } else {   
                    btnLogin.Enabled = false;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text != "" && txtPassword.Text != "") {
                if(MethodObj.openDatabaseConnection()) {
                    sqlCommandObj = new SqlCommand(null, MethodObj.sqlConnectionObj);
                    sqlCommandObj.CommandText = "SELECT * FROM EMPLOYEE WHERE EMPLOYEE_USERNAME = @Username";
                    SqlParameter UsernameParameterObj = new SqlParameter("@Username", System.Data.SqlDbType.VarChar, 255);
                    UsernameParameterObj.Value = txtUsername.Text;
                    sqlCommandObj.Parameters.Add(UsernameParameterObj);

                    sqlCommandObj.Prepare();
                    sqlDataReader = sqlCommandObj.ExecuteReader();
                    if (sqlDataReader != null) {
                        while (sqlDataReader.Read())
                        {
                            if (txtUsername.Text == sqlDataReader.GetString(3) &&
                                txtPassword.Text == sqlDataReader.GetString(6))
                            {
                                MessageBox.Show("Login Success.");
                            } else
                            {
                                MessageBox.Show("Login Failed.");
                            }
                        }
                    }
                    MethodObj.closeDatabaseConnection();
                } else {
                    
                }
                
            } else {
                if (Session["TotalLoginAttemptsInt"] != null) {
                    Session["TotalLoginAttemptsInt"] = int.Parse(Session["TotalLoginAttemptsInt"].ToString()) + 1;
                } else {
                    Session["TotalLoginAttemptsInt"] = 0;
                }

            }
        }


    }
}