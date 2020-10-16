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

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
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
                CheckBox1.Checked = false;
                btnSubmit.Text = "Submit";
            }
        }

        protected void drlServiceName_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get service name to search
            string name;
            name = drlServiceName.SelectedValue;

            //retrieve information and display relevant fields
            SqlCommand command;

            string sql;
            SqlConnection conn;
            string constr;
            constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\LazyEspresso\Documents\GitHub\CMPG223_Master\CMPG223_Base\CMPG223_Base\App_Data\CBOX_DB.mdf;Integrated Security=True";
            conn = new SqlConnection(constr);
            conn.Open();

            //read data from database
            archive = -1;
            string test1;
            int test2 = 0;

            sql = "Select * From EMERGENCY_SERVICE WHERE EMERGENCY_SERVICE_NAME = '" + @name + "';";
            command = new SqlCommand(sql, conn);
            SqlDataReader dr = command.ExecuteReader();

            if (dr.Read())
            {
                lblServiceID2.Text = dr["EMERGENCY_SERVICE_ID"].ToString();
                txbName.Text = dr["EMERGENCY_SERVICE_NAME"].ToString();
                txbType.Text = dr["EMERGENCY_SERVICE_TYPE"].ToString();
                txbContact.Text = dr["EMERGENCY_SERVICE_CONTACT"].ToString();
                test1 = dr["EMERGENCY_SERVICE_CONTACT"].ToString();
                test2 = int.Parse(test1);
                if (test2 == 1)
                {
                    CheckBox1.Checked = true;
                }
                else
                {
                    CheckBox1.Checked = false;
                }

            }
            dr.Close();
            conn.Close();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name, type, contact, lng, lat, aType;
            int ServiceID;


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
                //retrieve information and display relevant fields
                SqlCommand command;
                Boolean pause = false;
                string sql;
                SqlConnection conn;
                string constr;
                constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\LazyEspresso\Documents\GitHub\CMPG223_Master\CMPG223_Base\CMPG223_Base\App_Data\CBOX_DB.mdf;Integrated Security=True";
                conn = new SqlConnection(constr);
                conn.Open();

                //read data from database
                sql = "Select EMERGENCY_SERVICE_NAME From EMERGENCY_SERVICE;";
                command = new SqlCommand(sql, conn);
                SqlDataReader dr = command.ExecuteReader();
                while (dr.Read())
                {
                    if (dr["EMERGENCY_SERVICE_NAME"].ToString() == name)
                    {
                        txbName.Text = "";
                        lblInvalid.Visible = true;
                        pause = true;
                        break;
                    }

                }
                dr.Close();

                //stops method if duplicate username appears
                if (pause)
                {
                    return;
                }

                //add new record
                SqlDataAdapter adapter = new SqlDataAdapter();
                sql = "Insert into EMERGENCY_SERVICE(EMERGENCY_SERVICE_NAME,EMERGENCY_SERVICE_TYPE, EMERGENCY_SERVICE_CONTACT, EMERGENCY_SERVICE_ARCHIVE, LOCATION_LATITUDE, LOCATION_LONGITUDE) values('" + @name + "','" + @type + "','" + @contact + "','" + @archive + "','" + @lat + "','" + @lng + "');";
                command = new SqlCommand(sql, conn);
                adapter.InsertCommand = new SqlCommand(sql, conn);
                adapter.InsertCommand.ExecuteNonQuery();
                command.Dispose();

                lblInvalid.Visible = false;
                conn.Close();

                //clear form
                lblServiceID2.Text = "";
                txbName.Text = "";
                txbType.Text = "";
                txbContact.Text = "";
                txbLat.Text = "";
                txbLng.Text = "";
                CheckBox1.Checked = false;

            }
            else if (aType == "Update")
            {// update record

                ServiceID = int.Parse(lblServiceID2.Text);

                if (name == drlServiceName.SelectedValue)
                {
                    name = drlServiceName.SelectedValue;
                    txbName.Text = name;
                }
                SqlCommand command;

                string sql;
                SqlConnection conn;
                string constr;
                constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\LazyEspresso\Documents\GitHub\CMPG223_Master\CMPG223_Base\CMPG223_Base\App_Data\CBOX_DB.mdf;Integrated Security=True";
                conn = new SqlConnection(constr);
                conn.Open();

                SqlDataAdapter adapter = new SqlDataAdapter();
                sql = "Update EMERGENCY_SERVICE set EMERGENCY_SERVICE_NAME='" + @name + "',EMERGENCY_SERVICE_TYPE='" + @type + "',EMERGENCY_SERVICE_CONTACT='" + @contact + "',EMERGENCY_SERVICE_ARCHIVE='" + @archive + "',LOCATION_LATITUDE='" + @lat + "', LOCATION_LONGITUDE" +lng + "' where EMERGENCY_SERVICE_ID =" + ServiceID + ";";
                command = new SqlCommand(sql, conn);
                adapter.UpdateCommand = new SqlCommand(sql, conn);
                adapter.UpdateCommand.ExecuteNonQuery();
                command.Dispose();
                conn.Close();

                //clear form
                lblServiceID2.Text = "";
                txbName.Text = "";
                txbType.Text = "";
                txbContact.Text = "";
                txbLat.Text = "";
                txbLng.Text = "";
                CheckBox1.Checked = false;

            }
        }

        
    }
}