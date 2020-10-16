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

            
        }
    }
}