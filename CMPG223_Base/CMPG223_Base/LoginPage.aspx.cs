﻿using System;
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
        protected HttpCookie CookieObj = new HttpCookie("LoginCookies");

        protected void Page_Load(object sender, EventArgs e) {
            CookieObj = Request.Cookies["LoginCookies"];
            if (CookieObj != null) {
                txtUsername.Text = CookieObj["Username"].ToString();
                //txtPassword.Text = rememberMeCookieObj["Password"].ToString();
                cbRememberMe.Checked = true;
                txtPassword.Attributes["type"] = "text";
                txtPassword.Text = CookieObj["Password"].ToString();
                txtPassword.Attributes["type"] = "password";
            }
            if (Page.IsPostBack) {
                int TotalLoginAttemptsInt = Convert.ToInt32(Session["TotalLoginAttemptsInt"]);
                if (TotalLoginAttemptsInt >= 3) {
                    btnLogin.Enabled = false;
                }
            } else {
                //this.Page.ClientScript.RegisterObjectAsVariable(typeof(MyPage), "myVariable", new { myProperty = 123 });

                Session["TotalLoginAttemptsInt"] = 0;
                if (CookieObj != null) {
                    txtUsername.Text = CookieObj["Username"].ToString();
                    //txtPassword.Text = rememberMeCookieObj["Password"].ToString();
                    cbRememberMe.Checked = true;
                    txtPassword.Attributes["TextMode"] = "singleline";
                    txtPassword.Text = CookieObj["Password"].ToString();
                    txtPassword.Attributes["TextMode"] = "password";
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text != "" && txtPassword.Text != "") {
                if (CookieObj != null) {
                    CookieObj["Username"] = txtUsername.Text;
                    CookieObj["Password"] = txtPassword.Text;
                    CookieObj.Expires = DateTime.Now.AddDays(7);
                    Response.Cookies.Add(CookieObj);
                }
                if(MethodObj.openDatabaseConnection()) {
                    sqlCommandObj = new SqlCommand(null, MethodObj.sqlConnectionObj);
                    sqlCommandObj.CommandText = "SELECT * FROM EMPLOYEE WHERE EMPLOYEE_USERNAME = @Username";
                    SqlParameter UsernameParameterObj = new SqlParameter("@Username", System.Data.SqlDbType.VarChar, 255);
                    UsernameParameterObj.Value = txtUsername.Text;
                    sqlCommandObj.Parameters.Add(UsernameParameterObj);

                    sqlCommandObj.Prepare();
                    sqlDataReader = sqlCommandObj.ExecuteReader();
                    while (sqlDataReader.Read()) {
                        if (txtUsername.Text == sqlDataReader.GetString(3)) {
                                if (txtPassword.Text == sqlDataReader.GetString(4)) {
                                sqlCommandObj.Parameters.Clear();
                                Session["EMPLOYEE_ID"] = sqlDataReader.GetInt32(0);
                                Session["EMPLOYEE_USERROLE"] = sqlDataReader.GetInt32(6);
                                sqlCommandObj.CommandText ="INSERT INTO EMPLOYEE_LOG (DATE, LOG_IN_TIME, EMPLOYEE_ID) VALUES ('"+DateTime.Today+"', '"+DateTime.Now+"', '"+ sqlDataReader.GetInt32(0) + "')";
                                sqlDataReader.Close();
                                sqlCommandObj.ExecuteNonQuery();
                                Response.Redirect("Admin_Emergency_Situation.aspx");
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

        protected void cbRememberMe_CheckedChanged(object sender, EventArgs e)
        {
            if (!cbRememberMe.Checked) {
                CookieObj.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(CookieObj);
            }
        }
    }
}