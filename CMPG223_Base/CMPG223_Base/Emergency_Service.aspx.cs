using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CMPG223_Base
{
    public partial class Emergency_Service : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        int archive;
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //toggle the username drop down list
            int i = rblAction.SelectedIndex;
            if (i == 1)
            {
                lblSelectService.Visible = true;
                drlServiceName.Visible = true;
                btnSubmit.Text = "Update";
            }
            else
            {
                lblSelectService.Visible = false;
                drlServiceName.Visible = false;
                //clear form
                lblServiceID2.Text = "";
                txbName.Text = "";
                txbType.Text = "";
                txbContact.Text = "";
                txbLat.Text = "";
                txbLng.Text = "";
                btnSubmit.Text = "Submit";
            }
        }

        protected void drlServiceName_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get user name to search
            string userName;
            userName = drlServiceName.SelectedValue;

            //retrieve information and display relevant fields
            SqlCommand command;

            string sql;
            SqlConnection conn;
            string constr;
            constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\LazyEspresso\Documents\GitHub\CMPG223_Master\CMPG223_Base\CMPG223_Base\App_Data\CBOX_DB.mdf;Integrated Security=True";
            conn = new SqlConnection(constr);
            conn.Open();

            //read data from database

            sql = "Select * From EMPLOYEE WHERE EMPLOYEE_USERNAME = '" + @userName + "';";
            command = new SqlCommand(sql, conn);
            SqlDataReader dr = command.ExecuteReader();

            if (dr.Read())
            {
                lblServiceID2.Text = dr["EMERGENCY_SERVICE_ID"].ToString();
                txbName.Text = dr["EMERGENCY_SERVICE_NAME"].ToString();
                txbType.Text = dr["EMERGENCY_SERVICE_TYPE"].ToString();
                txbContact.Text = dr["EMERGENCY_SERVICE_CONTACT"].ToString();
                if (CheckBox1.Checked)
                {
                    archive = 1;
                }
                else
                {
                    archive = 0;
                }
                txbLat.Text = dr["LOCATION_LATITUDE"].ToString();
                txbLng.Text = dr["LOCATION_LONGITUDE"].ToString();
            }
            dr.Close();
            conn.Close();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name, type, contact, lng, lat, aType;


            //get values from form            
            name = txbName.Text;
            type = txbType.Text;
            contact = txbContact.Text;
            lng = txbLng.Text;
            lat = txbLat.Text;
            aType = btnSubmit.Text;

            //test if username exists and add record
            if (aType == "Submit")
            {

            }else if (aType == "Update")
            {

            }
        }
    }
}