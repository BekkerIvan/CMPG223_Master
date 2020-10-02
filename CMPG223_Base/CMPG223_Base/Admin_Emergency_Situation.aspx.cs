using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CMPG223_Base
{
    public partial class Admin_Emergency_Situation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                HttpCookie _Type = Request.Cookies["ET"];
                if (_Type != null)
                {
                    tbCoordinates.Text = "index: " + _Type["index"];
                    tbDescription.Text = "item: " + _Type["item"];
                    ddlEmergencyType.SelectedIndex = int.Parse(_Type["index"]);
                    _Type.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(_Type);

                }
            }
            else
            {
                string mainconn = ConfigurationManager.ConnectionStrings["myCnn"].ConnectionString;
                SqlConnection cnn = new SqlConnection(mainconn);
                string sql = "SELECT DISTINCT Emergency_Type FROM Emergency_Situation";
                SqlDataAdapter adapter = new SqlDataAdapter(sql, cnn);
                cnn.Open();
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                ddlEmergencyType.DataSource = dt;
                ddlEmergencyType.DataTextField = "Emergency_Type";
                ddlEmergencyType.DataValueField = "Emergency_Type";
                ddlEmergencyType.DataBind();
                cnn.Close();
            }  
        }

        protected void btnCoordinates_Click(object sender, EventArgs e)
        {
            string address;
            //Session["E_Type"] = ddlEmergencyType.SelectedIndex;
            HttpCookie _Type = new HttpCookie("ET");
            _Type["index"] = ddlEmergencyType.SelectedIndex.ToString();
            _Type["item"] = ddlEmergencyType.SelectedItem.Text;
            Response.Cookies.Add(_Type);
        }
    }
}