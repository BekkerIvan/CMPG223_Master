using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMPG223_Base;
using System.Data.SqlClient;
using System.Windows;
using System.Windows.Forms;

namespace CMPG223_Base
{
    public partial class Logout : System.Web.UI.Page
    {
        public SqlCommand sqlCommandObj;
        public SqlDataReader sqlDataReader;
        MethodClasses method = new MethodClasses();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (method.openDatabaseConnection())
            {
                sqlCommandObj = new SqlCommand(null, method.sqlConnectionObj);
                sqlCommandObj.CommandText = "UPDATE EMPLOYEE_LOG SET LOG_OUT_TIME = '"+ DateTime.Now + "'  WHERE LOG_ID = '"+Session["LOG_ID"]+"'";
                sqlCommandObj.ExecuteNonQuery();
                method.closeDatabaseConnection();
            }
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }

        protected void Unnamed_Load(object sender, EventArgs e)
        {

        }
    }
}